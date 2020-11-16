//
//  PencilStrokeCell.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 15/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit
import AVFoundation

class PencilStrokeWithoutCell: BaseCell, PKCanvasViewDelegate {
    
    let generator = UINotificationFeedbackGenerator()
    var player: AVAudioPlayer?
    var textGenerator = TextGenerator()
    var toolPicker: PKToolPicker!
    var incorrectStrokeCount = 0
    var isUpdatingDrawing = false
    var strokeAksaraIndex: Int? = 0
    var strokeWa = [0, 1]
    var aksara = "Wa"
    
    var withoutTracker: Bool? {
        didSet {
            
        }
    }
    
    let plusCenterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "plusCenterImage")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let containerBackgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "shadowImageWaGreen")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var backgroundCanvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.backgroundColor = .clear
        
        return canvasView
    }()
    
    lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.tool = PKInkingTool(.pen, color: .white, width: 20)
        canvasView.delegate = self
        canvasView.drawingPolicy = .anyInput
        
        return canvasView
    }()
    
    let trackingImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "waTrack1")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "trackingButton"), for: .normal)
        button.setTitle("1", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = false
        
        return button
    }()
    
    let trackingImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "waTrack2")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingCorrectImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "waCorrectTrackImage1")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingCorrectImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "waCorrectTrackImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "trackingButton"), for: .normal)
        button.setTitle("2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
        
        return button
    }()
    
    lazy var guideWritingName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Tulis : Wa"
        label.textColor = .white
        
        return label
    }()
    
    lazy var correctButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "successImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 - 40, y: frame.height/2 - 40, width: 80, height: 80)
        button.isHidden = true
        
        return button
    }()
    
    lazy var guideAksaraName: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Wa"
        label.textColor = .white
        label.frame = CGRect(x: frame.width/2 - 56, y: frame.height/2 + 180, width: 52, height: 38)
        label.isHidden = true
        
        return label
    }()
    
    lazy var smallCorrectButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "successImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 + 16, y: frame.height/2 + 185, width: 32, height: 32)
        button.isHidden = true
        
        return button
    }()
    
    lazy var youSuccessButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "youSuccessImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 - 118, y: frame.height/2 + 180, width: 240, height: 39)
        button.isHidden = true
        
        return button
    }()
    
    lazy var gotItButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCheckButtonBackgroundGoldColor(withOpacity: 1, withHeight: 48, withWidth: 240, withCorner: 24)
        button.setTitle("Mengerti", for: .normal)
        button.setTitleColor(Theme.current.accentPurple, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let tintedImage = UIImage(systemName: "arrow.right", withConfiguration: boldConfig)?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        if let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.isHidden = true
        
        return button
    }()
    
    func generateText() {
        backgroundCanvasView.drawing = textGenerator.synthesizeTextDrawing(text: "wa1")
    }
    
    override func setupViews() {
        setupInterfaceComponent()
        setupConstraint()
        generateText()
    }
    
    deinit {
        self.player = nil
    }
    
    func setupInterfaceComponent() {
        addSubview(plusCenterImageView)
        addSubview(containerBackgroundView)
        addSubview(guideAksaraName)
        addSubview(guideWritingName)
        addSubview(correctButton)
        addSubview(smallCorrectButton)
        addSubview(youSuccessButton)
        addSubview(gotItButton)
        bringSubviewToFront(smallCorrectButton)
        bringSubviewToFront(correctButton)
        
        containerBackgroundView.addSubview(backgroundImageView)
        containerBackgroundView.addSubview(backgroundCanvasView)
        containerBackgroundView.addSubview(trackingCorrectImageView2)
        containerBackgroundView.addSubview(trackingCorrectImageView1)
        containerBackgroundView.addSubview(canvasView)
        
        canvasView.addSubview(trackingButton1)
        canvasView.addSubview(trackingButton2)
        
        canvasView.bringSubviewToFront(trackingButton1)
        canvasView.bringSubviewToFront(trackingButton2)
        
        containerBackgroundView.addSubview(trackingImageView1)
        containerBackgroundView.addSubview(trackingImageView2)
    }
    
    func setupConstraint() {
        plusCenterImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        plusCenterImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        plusCenterImageView.widthAnchor.constraint(equalToConstant: 402).isActive = true
        plusCenterImageView.heightAnchor.constraint(equalToConstant: 402).isActive = true
        
        containerBackgroundView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerBackgroundView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerBackgroundView.widthAnchor.constraint(equalToConstant: 402).isActive = true
        containerBackgroundView.heightAnchor.constraint(equalToConstant: 402).isActive = true
        
        backgroundCanvasView.centerXAnchor.constraint(equalTo: containerBackgroundView.centerXAnchor).isActive = true
        backgroundCanvasView.centerYAnchor.constraint(equalTo: containerBackgroundView.centerYAnchor).isActive = true
        backgroundCanvasView.widthAnchor.constraint(equalToConstant: 402).isActive = true
        backgroundCanvasView.heightAnchor.constraint(equalToConstant: 402).isActive = true
        
        backgroundImageView.centerXAnchor.constraint(equalTo: containerBackgroundView.centerXAnchor).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: containerBackgroundView.centerYAnchor).isActive = true
        backgroundImageView.widthAnchor.constraint(equalToConstant: 287).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        trackingButton1.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -12).isActive = true
        trackingButton1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -6).isActive = true
        trackingButton1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 8).isActive = true
        trackingImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 12).isActive = true
        trackingImageView1.widthAnchor.constraint(equalToConstant: 191).isActive = true
        trackingImageView1.heightAnchor.constraint(equalToConstant: 215).isActive = true
        
        trackingCorrectImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 2).isActive = true
        trackingCorrectImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 2).isActive = true
        trackingCorrectImageView1.widthAnchor.constraint(equalToConstant: 212).isActive = true
        trackingCorrectImageView1.heightAnchor.constraint(equalToConstant: 236).isActive = true
        
        trackingButton2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -8).isActive = true
        trackingButton2.leadingAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: -28).isActive = true
        trackingButton2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView2.leadingAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 9).isActive = true
        trackingImageView2.widthAnchor.constraint(equalToConstant: 124.5).isActive = true
        trackingImageView2.heightAnchor.constraint(equalToConstant: 215).isActive = true
        
        trackingCorrectImageView2.centerXAnchor.constraint(equalTo: containerBackgroundView.centerXAnchor).isActive = true
        trackingCorrectImageView2.centerYAnchor.constraint(equalTo: containerBackgroundView.centerYAnchor).isActive = true
        trackingCorrectImageView2.widthAnchor.constraint(equalToConstant: 286).isActive = true
        trackingCorrectImageView2.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        canvasView.centerXAnchor.constraint(equalTo: containerBackgroundView.centerXAnchor).isActive = true
        canvasView.centerYAnchor.constraint(equalTo: containerBackgroundView.centerYAnchor).isActive = true
        canvasView.widthAnchor.constraint(equalToConstant: 402).isActive = true
        canvasView.heightAnchor.constraint(equalToConstant: 402).isActive = true
        
        guideWritingName.bottomAnchor.constraint(equalTo: containerBackgroundView.topAnchor, constant: -20).isActive = true
        guideWritingName.centerXAnchor.constraint(equalTo: containerBackgroundView.centerXAnchor).isActive = true
        
        gotItButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28).isActive = true
        gotItButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        gotItButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        gotItButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        gotItButton.layer.cornerRadius = 32
    }
    
    func handleSuccess() {
        canvasView.drawingGestureRecognizer.isEnabled = false
        backgroundCanvasView.drawingGestureRecognizer.isEnabled = false
        
        handleCorrectAnswer()
    }
    
    func playSoundTrue() {
        guard let url = Bundle.main.url(forResource: "Jawaban_Benar_A", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func handleCorrectAnswer() {
        UIView.transition(with: correctButton, duration: 1, options: .transitionCrossDissolve, animations: {
            self.correctButton.isHidden = false
            self.correctButton.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
            self.playSoundTrue()
//            self.generator.notificationOccurred(.success)
        }) { (complete) in
            self.correctButton.isHidden = true
            
            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.curveEaseIn], animations: {
                self.youSuccessButton.isHidden = false
                self.youSuccessButton.frame = CGRect(x: self.frame.width/2 - 120, y: self.frame.height/2 + 250, width: 240, height: 39)
            }, completion: { complete in
                // anim done
            });
            
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseIn], animations: {
                self.smallCorrectButton.isHidden = false
                self.guideAksaraName.isHidden = false
                self.smallCorrectButton.frame = CGRect(x: self.frame.width/2 + 16, y: self.frame.height/2 + 211, width: 32, height: 32)
                self.guideAksaraName.frame = CGRect(x: self.frame.width/2 - 56, y: self.frame.height/2 + 204, width: 52, height: 38)
            }, completion: { complete in
                // anim done
                self.gotItButton.isHidden = false
            });
        }
    }
    
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        // Stop any animation as soon as the user begins to draw.
        let trackingButtons = [trackingButton1, trackingButton2]

        let testDrawing = backgroundCanvasView.drawing

        if (strokeAksaraIndex! < testDrawing.strokes.count) {
            trackingButtons[strokeAksaraIndex!].isHidden = true
        }
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        let trackingButtons = [trackingButton1, trackingButton2]
        let trackingImages = [trackingImageView1, trackingImageView2]
        let trackingCorrectImages = [trackingCorrectImageView1, trackingCorrectImageView2]
        // Avoid triggering the scoring, if we are programatically mutating the drawing.
        guard !isUpdatingDrawing else { return }
        
        let testDrawing = backgroundCanvasView.drawing
        let strokeIndex = canvasView.drawing.strokes.count - 1
        
        // Score the last stroke.
        guard let lastStroke = canvasView.drawing.strokes.last else { return }
        guard strokeIndex < testDrawing.strokes.count else { return }
        
        isUpdatingDrawing = true
        
        // Stroke matching.
        let threshold: CGFloat = 30
        let distance = lastStroke.discreteFrechetDistance(to: testDrawing.strokes[strokeIndex], maxThreshold: threshold)
        
        if distance < threshold {
            // Adjust the correct stroke to have a green ink.
            canvasView.drawing.strokes[strokeIndex].ink.color = .clear
            
            trackingButtons[strokeAksaraIndex!].isHidden = true
//            trackingImages[strokeAksaraIndex!].isHidden = true
            trackingCorrectImages[strokeAksaraIndex!].isHidden = false
            
            self.strokeAksaraIndex! += 1
            
            if (strokeAksaraIndex! < testDrawing.strokes.count) {
                trackingButtons[strokeAksaraIndex!].isHidden = false
//                trackingImages[strokeAksaraIndex!].isHidden = false
                
            }
            
            // If the user has finished, show the final score.
            if strokeIndex + 1 >= testDrawing.strokes.count {
//                print("\(Int(score * 100))%")
                trackingCorrectImages[0].isHidden = true
                handleSuccess()
            }
        } else {
            // If the stroke drawn was bad, remove it so the user can try again.
            canvasView.drawing.strokes.removeLast()
            incorrectStrokeCount += 1
            trackingButtons[strokeAksaraIndex!].isHidden = false
            generator.notificationOccurred(.error)
        }
        
        updateScore()
        isUpdatingDrawing = false
    }
    
    var score: Double {
        let correctStrokeCount = canvasView.drawing.strokes.count
        return 1.0 / (1.0 + Double(incorrectStrokeCount) / Double(1 + correctStrokeCount))
    }

    func updateScore() {
        if !canvasView.drawing.strokes.isEmpty {
            let percent = Int(score * 100)
//            print("PERCENT", percent)
        } else {
            print("")
        }
    }
}
