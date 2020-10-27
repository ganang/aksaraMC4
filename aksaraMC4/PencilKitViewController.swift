//
//  PencilKitViewController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 19/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit

class PencilKitViewController: UIViewController, PKToolPickerObserver, PKCanvasViewDelegate, CALayerDelegate {
    
    var textGenerator = TextGenerator()
    var toolPicker: PKToolPicker!
    var incorrectStrokeCount = 0
    var isUpdatingDrawing = false
    // Animation.
    static let repeatStrokeAnimationTime: TimeInterval = 4
    static let nextStrokeAnimationTime: TimeInterval = 0.5
    var animationSpeed: CGFloat = 1.0
    
    var animatingStroke: PKStroke?
    var animationParametricValue: CGFloat = 0
    var animationLastFrameTime = Date()
    var animationTimer: Timer?
    
    let containerBackgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    lazy var backgroundCanvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        
        return canvasView
    }()
    
    lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 3)
        canvasView.delegate = self
        canvasView.drawingPolicy = .anyInput
        
        return canvasView
    }()
    
    lazy var animationMarkerLayer: CALayer = {
        // Create the animation layers.
        let animationMarkerLayer = CALayer()
        animationMarkerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        animationMarkerLayer.backgroundColor = UIColor.red.cgColor
        animationMarkerLayer.cornerRadius = 5
        animationMarkerLayer.delegate = self
        
        return animationMarkerLayer
    }()
    
    lazy var animationStartMarkerLayer: CALayer = {
        let animationStartMarkerLayer = CALayer()
        animationStartMarkerLayer.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        animationStartMarkerLayer.borderColor = UIColor.gray.cgColor
        animationStartMarkerLayer.borderWidth = 2
        animationStartMarkerLayer.cornerRadius = 8
        animationStartMarkerLayer.delegate = self
        
        return animationStartMarkerLayer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemBlue
        
        generateText()
        setupPencilKit()
        
        view.addSubview(containerBackgroundView)
        containerBackgroundView.layer.addSublayer(animationMarkerLayer)
        containerBackgroundView.layer.addSublayer(animationStartMarkerLayer)
        
        NSLayoutConstraint.activate([
            containerBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerBackgroundView.widthAnchor.constraint(equalToConstant: 400),
            containerBackgroundView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        containerBackgroundView.addSubview(backgroundCanvasView)
        containerBackgroundView.addSubview(canvasView)
        
        NSLayoutConstraint.activate([
            backgroundCanvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundCanvasView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundCanvasView.widthAnchor.constraint(equalToConstant: 400),
            backgroundCanvasView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            canvasView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            canvasView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            canvasView.widthAnchor.constraint(equalToConstant: 400),
            canvasView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func generateText() {
        backgroundCanvasView.drawing = textGenerator.synthesizeTextDrawing(text: "Testing").transformed(using: CGAffineTransform(scaleX: 2, y: 2).concatenating(CGAffineTransform(translationX: backgroundCanvasView.center.x, y: backgroundCanvasView.center.y)))
    }
    
    func setupPencilKit() {
        
        toolPicker = PKToolPicker()
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
    }
    
    func updateLayout(for toolPicker: PKToolPicker) {
        let obscuredFrame = toolPicker.frameObscured(in: view)
        
        // If the tool picker is floating over the canvas, it also contains
        // undo and redo buttons.
        if obscuredFrame.isNull {
            canvasView.contentInset = .zero
            navigationItem.leftBarButtonItems = []
        }
        
        // Otherwise, the bottom of the canvas should be inset to the top of the
        // tool picker, and the tool picker no longer displays its own undo and
        // redo buttons.
        else {
            canvasView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: view.bounds.maxY - obscuredFrame.minY, right: 0)
            
        }
        canvasView.scrollIndicatorInsets = canvasView.contentInset
    }
    
    func animateNextStroke() {
        let nextStrokeIndex = canvasView.drawing.strokes.count
        guard nextStrokeIndex < backgroundCanvasView.drawing.strokes.count else {
            // Hide the animation markers.
            animationMarkerLayer.opacity = 0.0
            animationStartMarkerLayer.opacity = 0.0
            return
        }
        
        let strokeToAnimate = backgroundCanvasView.drawing.strokes[nextStrokeIndex]
        animatingStroke = strokeToAnimate
        animationParametricValue = 0
        animationLastFrameTime = Date()
        animationTimer?.invalidate()
        animationTimer = Timer.scheduledTimer(withTimeInterval: 1.0 / 60, repeats: true) { _ in self.stepAnimation() }
        
        // Setup the start marker layer.
        animationStartMarkerLayer.position = strokeToAnimate.path.interpolatedLocation(at: 0).applying(strokeToAnimate.transform)
        animationStartMarkerLayer.opacity = 1.0
    }
    
    func stepAnimation() {
        guard let animatingStroke = animatingStroke, animationParametricValue < CGFloat(animatingStroke.path.count - 1) else {
            // Animate the next stroke again, in `repeatStrokeAnimationTime` seconds.
            startAnimation(afterDelay: PencilKitViewController.repeatStrokeAnimationTime)
            return
        }
        
        let currentTime = Date()
        let delta = currentTime.timeIntervalSince(animationLastFrameTime)
        animationParametricValue = animatingStroke.path.parametricValue(
            animationParametricValue,
            offsetBy: .time(delta * TimeInterval(animationSpeed)))
        animationMarkerLayer.position = animatingStroke.path.interpolatedLocation(at: animationParametricValue)
            .applying(animatingStroke.transform)
        animationMarkerLayer.opacity = 1
        animationLastFrameTime = currentTime
    }
    
    func startAnimation(afterDelay delay: TimeInterval) {
        // Animate the next stroke again after `delay`.
        stopAnimation()
        animationTimer = Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
            // Only animate the next stroke if another animation has not already started.
            if self.animatingStroke == nil {
                self.animateNextStroke()
            }
        }
    }
    
    func stopAnimation() {
        animationMarkerLayer.opacity = 0
        animatingStroke = nil
        animationTimer?.invalidate()
    }
    
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        // Stop any animation as soon as the user begins to draw.
        stopAnimation()
        animationStartMarkerLayer.opacity = 0.0
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        // Avoid triggering the scoring, if we are programatically mutating the drawing.
        guard !isUpdatingDrawing else { return }
        
        let testDrawing = backgroundCanvasView.drawing
        let strokeIndex = canvasView.drawing.strokes.count - 1
        
        // Score the last stroke.
        guard let lastStroke = canvasView.drawing.strokes.last else { return }
        guard strokeIndex < testDrawing.strokes.count else { return }
        
        isUpdatingDrawing = true
        
        // Stroke matching.
        let threshold: CGFloat = 10
        let distance = lastStroke.discreteFrechetDistance(to: testDrawing.strokes[strokeIndex], maxThreshold: threshold)
        
        if distance < threshold {
            // Adjust the correct stroke to have a green ink.
            canvasView.drawing.strokes[strokeIndex].ink.color = .green
            
            // If the user has finished, show the final score.
            if strokeIndex + 1 >= testDrawing.strokes.count {
                print("\(Int(score * 100))%")
            }
        } else {
            // If the stroke drawn was bad, remove it so the user can try again.
            canvasView.drawing.strokes.removeLast()
            incorrectStrokeCount += 1
        }
        
        updateScore()
        startAnimation(afterDelay: PencilKitViewController.nextStrokeAnimationTime)
        isUpdatingDrawing = false
    }
    
    var score: Double {
        let correctStrokeCount = canvasView.drawing.strokes.count
        return 1.0 / (1.0 + Double(incorrectStrokeCount) / Double(1 + correctStrokeCount))
    }

    func updateScore() {
        if !canvasView.drawing.strokes.isEmpty {
            let percent = Int(score * 100)
            print("PERCENT", percent)
        } else {
            print("")
        }
    }
}
