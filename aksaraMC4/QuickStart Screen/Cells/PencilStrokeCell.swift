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
import CoreGraphics

class PencilStrokeCell: BaseCell, PKCanvasViewDelegate, CAAnimationDelegate {
    
    var moveAlongPathJa: CAAnimation!
    var customTrackView: CustomTrackView!
    
    var countdownTimer: Timer!
    var countdownProgressTimer: Timer!
    var idleTimer: Timer!
    var idleTime = 2
    var totalTime: Int = 30
    var progressTime = 3000
    
    let generator = UINotificationFeedbackGenerator()
    var player: AVAudioPlayer?
    var textGenerator = TextGenerator()
    var toolPicker: PKToolPicker!
    var incorrectStrokeCount = 0
    var isUpdatingDrawing = false
    var isTouchDrawing = false
    var isHintRunning = false
    var strokeAksaraIndex: Int? = 0
    var strokeWa = [0, 1]
    var aksara: String? {
        didSet {
            setupButtons()
            guideWritingName.text = "Tulis : \(String(aksara!))"
        }
    }
    
    func setupButtons() {
        generateText(withText: aksara!)
        
        if (aksara == "Ga") {
            backgroundImageView.image = UIImage(named: "shadowImageGa")
            trackingImageView1.image = UIImage(named: "trackingImageGa1")
            trackingImageView2.image = UIImage(named: "trackingImageGa2")
            trackingImageView3.image = UIImage(named: "trackingImageGa3")
            trackingCorrectImageView1.image = UIImage(named: "gaCorrectTrackImage1")
            trackingCorrectImageView2.image = UIImage(named: "gaCorrectTrackImage2")
            trackingCorrectImageView3.image = UIImage(named: "gaCorrectTrackImage3")
        }
        
        if (aksara == "Ja") {
            backgroundImageView.image = UIImage(named: "shadowImageJa")
            trackingImageView1.image = UIImage(named: "trackingImageJa1")
            trackingImageView2.image = UIImage(named: "trackingImageJa2")
            trackingImageView3.image = UIImage(named: "trackingImageJa3")
            trackingCorrectImageView1.image = UIImage(named: "jaCorrectTrackImage1")
            trackingCorrectImageView2.image = UIImage(named: "jaCorrectTrackImage2")
            trackingCorrectImageView3.image = UIImage(named: "jaCorrectTrackImage3")
        }
        
        if (aksara == "Jo") {
            backgroundImageView.image = UIImage(named: "shadowImageJo")
            trackingImageView1.image = UIImage(named: "trackingImageJo1")
            trackingImageView2.image = UIImage(named: "trackingImageJo2")
            trackingImageView3.image = UIImage(named: "trackingImageJo3")
            trackingImageView4.image = UIImage(named: "trackingImageJo4")
            trackingImageView5.image = UIImage(named: "trackingImageJo5")
            trackingCorrectImageView1.image = UIImage(named: "trackingJo1")
            trackingCorrectImageView2.image = UIImage(named: "jaCorrectTrackImage1")
            trackingCorrectImageView3.image = UIImage(named: "jaCorrectTrackImage2")
            trackingCorrectImageView4.image = UIImage(named: "jaCorrectTrackImage3")
            trackingCorrectImageView5.image = UIImage(named: "trackingJo5")
        }
        
        if (aksara == "Gja") {
            backgroundImageView.image = UIImage(named: "shadowImageGja")
            trackingImageView1.image = UIImage(named: "trackingImageGja1")
            trackingImageView2.image = UIImage(named: "trackingImageGja2")
            trackingImageView3.image = UIImage(named: "trackingImageGja3")
            trackingImageView4.image = UIImage(named: "trackingImageGja4")
            trackingImageView5.image = UIImage(named: "trackingImageGja5")
            trackingCorrectImageView1.image = UIImage(named: "trackingCorrectImageGja1")
            trackingCorrectImageView2.image = UIImage(named: "trackingCorrectImageGja2")
            trackingCorrectImageView3.image = UIImage(named: "trackingCorrectImageGja3")
            trackingCorrectImageView4.image = UIImage(named: "trackingCorrectImageGja4")
            trackingCorrectImageView5.image = UIImage(named: "trackingCorrectImageGja5")
        }
        
    }
    
    lazy var circularProgressBar: GradientCircularProgressBar = {
        let progressBar = GradientCircularProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = .init(white: 1, alpha: 0.2)
        progressBar.progress = 0
        progressBar.gradientColors = [Theme.current.gradientTopGold.cgColor, Theme.current.gradientTopGold.cgColor]
        
        return progressBar
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "30"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
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
    
    // HANDLE JA POSITIONING
    let trackingImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = false
        
        return imageView
    }()
    
    let trackingImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingImageView5: UIImageView = {
        let imageView = UIImageView()
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
        button.isUserInteractionEnabled = false
        button.isHidden = false
        
        return button
    }()
    
    let trackingButton2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "trackingButton"), for: .normal)
        button.setTitle("2", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    let trackingButton3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "trackingButton"), for: .normal)
        button.setTitle("3", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    let trackingButton4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "trackingButton"), for: .normal)
        button.setTitle("4", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    let trackingButton5: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "trackingButton"), for: .normal)
        button.setTitle("5", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.isHidden = true
        button.isUserInteractionEnabled = false
        
        return button
    }()
    
    let trackingCorrectImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingCorrectImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingCorrectImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingCorrectImageView4: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    let trackingCorrectImageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    // =================================================================== //
    
    
    lazy var guideWritingName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Tulis : Wa"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
    lazy var correctButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "successImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 - 40, y: frame.height/2 - 40, width: 80, height: 80)
        button.isUserInteractionEnabled = false
        button.alpha = 0
        
        return button
    }()
    
    lazy var guideAksaraName: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Wa"
        label.textColor = .white
        label.frame = CGRect(x: frame.width/2 - 56, y: frame.height/2 - 300, width: 52, height: 38)
        label.alpha = 0
        
        return label
    }()
    
    lazy var smallCorrectButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "successImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 + 16, y: frame.height/2 - 294, width: 32, height: 32)
        button.alpha = 0
        
        return button
    }()
    
    lazy var youSuccessButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "correctAnswerStatement"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 - 116, y: frame.height/2 + 210, width: 240, height: 60)
        button.alpha = 0
        
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
        button.alpha = 0
        button.isEnabled = false
        
        return button
    }()
    
    func generateText(withText text: String) {
        backgroundCanvasView.drawing = textGenerator.synthesizeTextDrawing(text: text)
    }
    
    override func setupViews() {
        setupInterfaceComponent()
        setupConstraint()
//        addTrackAnimation(withIndex: 0)
//        startTimer()
//        startAFKTime()
    }
    
    deinit {
        self.player = nil
    }
    
    func curvedPath(withIndex index: Int) -> UIBezierPath {
        
        var path = UIBezierPath()
        
        if (index == 0) {
            path = self.createCurvePathJaTrack1()
        }
        
        if (index == 1) {
            path = self.createCurvePathJaTrack2()
        }
        
        if (index == 2) {
            path = self.createCurvePathJaTrack3()
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.position = CGPoint(x: 200, y: 200)
        self.layer.addSublayer(shapeLayer)
        
        return path
    }
    
    func addTrackAnimation(withIndex index: Int) {
        let moveAlongPath = CAKeyframeAnimation(keyPath: "position")
        moveAlongPath.path = curvedPath(withIndex: index).cgPath
        moveAlongPath.duration = 1.5
        moveAlongPath.repeatCount = 1
        moveAlongPath.calculationMode = CAAnimationCalculationMode.paced
        moveAlongPath.timingFunctions = [CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)]
        moveAlongPath.delegate = self
        
        self.moveAlongPathJa = moveAlongPath
    }
    
    func createLayer() -> CALayer {
        self.customTrackView  = CustomTrackView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        self.addSubview(customTrackView)
        let customlayer = customTrackView.layer
        customlayer.bounds = CGRect(x: 0, y: 0, width: 24, height: 24)
        
        return customlayer
    }
    
    func initiateAnimation() {
//        let layer = self.createLayer()
//        layer.add(self.moveAlongPathJa, forKey: "animate along Path")
    }
    
    func createCurvePathJaTrack1() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 186, y: 280))
        path.addLine(to: CGPoint(x: 186, y: 126))
        path.addArc(withCenter: CGPoint(x: 216, y: 126), radius: 30, startAngle: CGFloat(Double.pi), endAngle: CGFloat(0), clockwise: true)
        path.addLine(to: CGPoint(x: 246, y: 242))
        path.addArc(withCenter: CGPoint(x: 276, y: 242), radius: 30, startAngle: CGFloat(2*Double.pi/2), endAngle: CGFloat(Double.pi/2), clockwise: false)
        path.addLine(to: CGPoint(x: 376, y: 272))
        
        return path
    }
    
    func createCurvePathJaTrack2() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 376, y: 272))
        path.addArc(withCenter: CGPoint(x: 376, y: 238), radius: 34, startAngle: CGFloat(Double.pi/2), endAngle: CGFloat(Double.pi), clockwise: true)
        path.addLine(to: CGPoint(x: 342, y: 138))
        path.addArc(withCenter: CGPoint(x: 366, y: 122), radius: 24, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3*Double.pi/2), clockwise: true)
        path.addLine(to: CGPoint(x: 440, y: 98))
        
        return path
    }
    
    func createCurvePathJaTrack3() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 438, y: 95))
        path.addArc(withCenter: CGPoint(x: 361, y: 95), radius: 77, startAngle: CGFloat(0), endAngle: CGFloat(Double.pi/2), clockwise: true)
        path.addArc(withCenter: CGPoint(x: 361, y: 256), radius: 77, startAngle: CGFloat(3*Double.pi/2), endAngle: CGFloat(0), clockwise: true)
        path.addLine(to: CGPoint(x: 438, y: 278))
        
        return path
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        customTrackView.removeFromSuperview()
        isHintRunning = false
        
        if totalTime != 0 {
            if (isTouchDrawing == false) {
                endIdleTime()
                startAFKTime()
            }
        }
    }
    
    func animationDidStart(_ anim: CAAnimation) {
        isHintRunning = true
    }
    
    func setupAksaraJaConstraint() {
        
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
        backgroundImageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        trackingButton1.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -12).isActive = true
        trackingButton1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -6).isActive = true
        trackingButton1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 12).isActive = true
        trackingImageView1.widthAnchor.constraint(equalToConstant: 201.5).isActive = true
        trackingImageView1.heightAnchor.constraint(equalToConstant: 180.5).isActive = true
        
        trackingCorrectImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 4).isActive = true
        trackingCorrectImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 5.5).isActive = true
        trackingCorrectImageView1.widthAnchor.constraint(equalToConstant: 212).isActive = true
        trackingCorrectImageView1.heightAnchor.constraint(equalToConstant: 192.5).isActive = true
        
        trackingButton2.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -32).isActive = true
        trackingButton2.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -36).isActive = true
        trackingButton2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 8).isActive = true
        trackingImageView2.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -12).isActive = true
        trackingImageView2.widthAnchor.constraint(equalToConstant: 99.5).isActive = true
        trackingImageView2.heightAnchor.constraint(equalToConstant: 180.5).isActive = true
        
        trackingCorrectImageView2.centerXAnchor.constraint(equalTo: containerBackgroundView.centerXAnchor, constant: 1.5).isActive = true
        trackingCorrectImageView2.centerYAnchor.constraint(equalTo: containerBackgroundView.centerYAnchor, constant: 0.5).isActive = true
        trackingCorrectImageView2.widthAnchor.constraint(equalToConstant: 272).isActive = true
        trackingCorrectImageView2.heightAnchor.constraint(equalToConstant: 194).isActive = true
        
        trackingButton3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -12).isActive = true
        trackingButton3.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: 4).isActive = true
        trackingButton3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView3.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
        trackingImageView3.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView3.heightAnchor.constraint(equalToConstant: 184).isActive = true
        
        trackingCorrectImageView3.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingCorrectImageView3.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        trackingCorrectImageView3.widthAnchor.constraint(equalToConstant: 280).isActive = true
        trackingCorrectImageView3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
    
    func setupAksaraGaConstraint() {
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
        backgroundImageView.widthAnchor.constraint(equalToConstant: 220).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        trackingButton1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -8).isActive = true
        trackingButton1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -6).isActive = true
        trackingButton1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 14).isActive = true
        trackingImageView1.widthAnchor.constraint(equalToConstant: 43).isActive = true
        trackingImageView1.heightAnchor.constraint(equalToConstant: 179.5).isActive = true
        
        trackingCorrectImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 4).isActive = true
        trackingCorrectImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 4).isActive = true
        trackingCorrectImageView1.widthAnchor.constraint(equalToConstant: 57.5).isActive = true
        trackingCorrectImageView1.heightAnchor.constraint(equalToConstant: 192.5).isActive = true
        
        trackingButton2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 24).isActive = true
        trackingButton2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 28).isActive = true
        trackingButton2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 54).isActive = true
        trackingImageView2.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView2.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        trackingCorrectImageView2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 4).isActive = true
        trackingCorrectImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 3.5).isActive = true
        trackingCorrectImageView2.widthAnchor.constraint(equalToConstant: 135.5).isActive = true
        trackingCorrectImageView2.heightAnchor.constraint(equalToConstant: 193).isActive = true
        
        trackingButton3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 24).isActive = true
        trackingButton3.leadingAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingButton3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView3.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
        trackingImageView3.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView3.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        trackingCorrectImageView3.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingCorrectImageView3.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        trackingCorrectImageView3.widthAnchor.constraint(equalToConstant: 220).isActive = true
        trackingCorrectImageView3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
    
    func setupAksaraJoConstraint() {
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
        backgroundImageView.widthAnchor.constraint(equalToConstant: 306).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 174).isActive = true
        
        trackingButton1.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 40).isActive = true
        trackingButton1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -6).isActive = true
        trackingButton1.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton1.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 14).isActive = true
        trackingImageView1.widthAnchor.constraint(equalToConstant: 43).isActive = true
        trackingImageView1.heightAnchor.constraint(equalToConstant: 179.5).isActive = true
        
        trackingCorrectImageView1.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 23).isActive = true
        trackingCorrectImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 2).isActive = true
        trackingCorrectImageView1.widthAnchor.constraint(equalToConstant: 64).isActive = true
        trackingCorrectImageView1.heightAnchor.constraint(equalToConstant: 126).isActive = true
        
        trackingButton2.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 28).isActive = true
        trackingButton2.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: -72).isActive = true
        trackingButton2.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton2.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 54).isActive = true
        trackingImageView2.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView2.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        trackingCorrectImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 0).isActive = true
        trackingCorrectImageView2.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: -16).isActive = true
        trackingCorrectImageView2.widthAnchor.constraint(equalToConstant: 132).isActive = true
        trackingCorrectImageView2.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        trackingButton3.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 28).isActive = true
        trackingButton3.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 56).isActive = true
        trackingButton3.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton3.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView3.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
        trackingImageView3.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView3.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        trackingCorrectImageView3.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingCorrectImageView3.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        trackingCorrectImageView3.widthAnchor.constraint(equalToConstant: 220).isActive = true
        trackingCorrectImageView3.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        trackingButton4.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 24).isActive = true
        trackingButton4.leadingAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingButton4.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView4.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView4.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
        trackingImageView4.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView4.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        trackingCorrectImageView4.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingCorrectImageView4.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        trackingCorrectImageView4.widthAnchor.constraint(equalToConstant: 220).isActive = true
        trackingCorrectImageView4.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        trackingButton5.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 24).isActive = true
        trackingButton5.leadingAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingButton5.widthAnchor.constraint(equalToConstant: 40).isActive = true
        trackingButton5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        trackingImageView5.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView5.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -8).isActive = true
        trackingImageView5.widthAnchor.constraint(equalToConstant: 80.5).isActive = true
        trackingImageView5.heightAnchor.constraint(equalToConstant: 182).isActive = true
        
        trackingCorrectImageView5.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor).isActive = true
        trackingCorrectImageView5.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor).isActive = true
        trackingCorrectImageView5.widthAnchor.constraint(equalToConstant: 220).isActive = true
        trackingCorrectImageView5.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
    
    func setupAksaraGjaConstraint() {
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
        backgroundImageView.widthAnchor.constraint(equalToConstant: 224).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        trackingButton1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: -4).isActive = true
        trackingButton1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: -6).isActive = true
        trackingButton1.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton1.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 12).isActive = true
        trackingImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 14).isActive = true
        trackingImageView1.widthAnchor.constraint(equalToConstant: 33).isActive = true
        trackingImageView1.heightAnchor.constraint(equalToConstant: 145).isActive = true
        
        trackingCorrectImageView1.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 4).isActive = true
        trackingCorrectImageView1.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 2).isActive = true
        trackingCorrectImageView1.widthAnchor.constraint(equalToConstant: 48).isActive = true
        trackingCorrectImageView1.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        trackingButton2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 28).isActive = true
        trackingButton2.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: -72).isActive = true
        trackingButton2.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton2.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 10).isActive = true
        trackingImageView2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 44).isActive = true
        trackingImageView2.widthAnchor.constraint(equalToConstant: 66).isActive = true
        trackingImageView2.heightAnchor.constraint(equalToConstant: 148).isActive = true
        
        trackingCorrectImageView2.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 4).isActive = true
        trackingCorrectImageView2.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 2).isActive = true
        trackingCorrectImageView2.widthAnchor.constraint(equalToConstant: 110).isActive = true
        trackingCorrectImageView2.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        trackingButton3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 28).isActive = true
        trackingButton3.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: -8).isActive = true
        trackingButton3.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton3.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 10).isActive = true
        trackingImageView3.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -52).isActive = true
        trackingImageView3.widthAnchor.constraint(equalToConstant: 66).isActive = true
        trackingImageView3.heightAnchor.constraint(equalToConstant: 148).isActive = true
        
        trackingCorrectImageView3.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 4).isActive = true
        trackingCorrectImageView3.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor, constant: 2).isActive = true
        trackingCorrectImageView3.widthAnchor.constraint(equalToConstant: 172).isActive = true
        trackingCorrectImageView3.heightAnchor.constraint(equalToConstant: 156).isActive = true
        
        trackingButton4.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 24).isActive = true
        trackingButton4.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 24).isActive = true
        trackingButton4.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton4.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView4.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -10).isActive = true
        trackingImageView4.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 8).isActive = true
        trackingImageView4.widthAnchor.constraint(equalToConstant: 96).isActive = true
        trackingImageView4.heightAnchor.constraint(equalToConstant: 129).isActive = true
        
        trackingCorrectImageView4.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 8).isActive = true
        trackingCorrectImageView4.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 86).isActive = true
        trackingCorrectImageView4.widthAnchor.constraint(equalToConstant: 109).isActive = true
        trackingCorrectImageView4.heightAnchor.constraint(equalToConstant: 139).isActive = true
        
        trackingButton5.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 24).isActive = true
        trackingButton5.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 56).isActive = true
        trackingButton5.widthAnchor.constraint(equalToConstant: 32).isActive = true
        trackingButton5.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        trackingImageView5.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: -10).isActive = true
        trackingImageView5.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor, constant: -6).isActive = true
        trackingImageView5.widthAnchor.constraint(equalToConstant: 84).isActive = true
        trackingImageView5.heightAnchor.constraint(equalToConstant: 98).isActive = true
        
        trackingCorrectImageView5.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor, constant: 32).isActive = true
        trackingCorrectImageView5.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor, constant: 86).isActive = true
        trackingCorrectImageView5.widthAnchor.constraint(equalToConstant: 160).isActive = true
        trackingCorrectImageView5.heightAnchor.constraint(equalToConstant: 144).isActive = true
        
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
    
    func setupInterfaceComponent() {
        addSubview(plusCenterImageView)
        addSubview(containerBackgroundView)
        addSubview(guideAksaraName)
        addSubview(guideWritingName)
        addSubview(correctButton)
        addSubview(smallCorrectButton)
        addSubview(youSuccessButton)
//        addSubview(circularProgressBar)
//        addSubview(timerLabel)
        addSubview(gotItButton)
        bringSubviewToFront(smallCorrectButton)
        bringSubviewToFront(correctButton)
        
        containerBackgroundView.addSubview(backgroundImageView)
        containerBackgroundView.addSubview(backgroundCanvasView)
        
        backgroundImageView.addSubview(trackingCorrectImageView5)
        backgroundImageView.addSubview(trackingCorrectImageView4)
        backgroundImageView.addSubview(trackingCorrectImageView3)
        backgroundImageView.addSubview(trackingCorrectImageView2)
        backgroundImageView.addSubview(trackingCorrectImageView1)
        containerBackgroundView.addSubview(canvasView)
        
        containerBackgroundView.addSubview(trackingButton1)
        containerBackgroundView.addSubview(trackingButton2)
        containerBackgroundView.addSubview(trackingButton3)
        containerBackgroundView.addSubview(trackingButton4)
        containerBackgroundView.addSubview(trackingButton5)
        
        backgroundImageView.addSubview(trackingImageView1)
        backgroundImageView.addSubview(trackingImageView2)
        backgroundImageView.addSubview(trackingImageView3)
        backgroundImageView.addSubview(trackingImageView4)
        backgroundImageView.addSubview(trackingImageView5)
    }
    
    func setupConstraint() {
        
        DispatchQueue.main.async {
            if (self.aksara == "Ja") {
                self.setupAksaraJaConstraint()
            }
            
            if (self.aksara == "Ga") {
                self.setupAksaraGaConstraint()
            }
            
            if (self.aksara == "Jo") {
                self.setupAksaraJoConstraint()
            }
            
            if (self.aksara == "Gja") {
                self.setupAksaraGjaConstraint()
            }
        }
        
//        circularProgressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
//        circularProgressBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        circularProgressBar.widthAnchor.constraint(equalToConstant: 48).isActive = true
//        circularProgressBar.heightAnchor.constraint(equalToConstant: 48).isActive = true
//
//        timerLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor).isActive = true
//        timerLabel.centerYAnchor.constraint(equalTo: circularProgressBar.centerYAnchor).isActive = true
    }
    
    func handleSuccess() {
        canvasView.drawingGestureRecognizer.isEnabled = false
        backgroundCanvasView.drawingGestureRecognizer.isEnabled = false
        timerLabel.isHidden = true
        circularProgressBar.isHidden = true
        
        if (countdownTimer != nil) {
            countdownTimer.invalidate()
        }
        
        if (countdownProgressTimer != nil) {
            countdownProgressTimer.invalidate()
        }
        
        endIdleTime()
        
        handleCorrectAnswer()
    }
    
    func handleTimesUp() {
        canvasView.drawingGestureRecognizer.isEnabled = false
        backgroundCanvasView.drawingGestureRecognizer.isEnabled = false
//        customTrackView.layer.removeAllAnimations()
        customTrackView.removeFromSuperview()
        timerLabel.isHidden = true
        circularProgressBar.isHidden = true
        endIdleTime()
        
        if (aksara == "Ja" || aksara == "Ga") {
            trackingButton1.isHidden = true
            trackingButton2.isHidden = true
            trackingButton3.isHidden = true
            trackingImageView1.isHidden = true
            trackingImageView2.isHidden = true
            trackingImageView3.isHidden = true
            trackingCorrectImageView3.isHidden = false
        }
        
        handleFalseAnswer()
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
    
    func playSoundFalse() {
        guard let url = Bundle.main.url(forResource: "Jawaban_Salah_D", withExtension: "mp3") else { return }
        
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
    
    func handleFalseAnswer() {
        youSuccessButton.setBackgroundImage(UIImage(named: "timeUpImage"), for: .normal)
        correctButton.setImage(UIImage(named: "falseAnswer"), for: .normal)
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.correctButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.playSoundFalse()
                self.correctButton.alpha = 0.9
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.7, animations: {
                self.correctButton.alpha = 0
            })
            
            
        }) { (complete) in
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.youSuccessButton.alpha = 1
                self.youSuccessButton.frame = CGRect(x: self.frame.width/2 - 116, y: self.frame.height/2 + 230, width: 240, height: 60)
            }, completion: { complete in
                // anim done
            });
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.gotItButton.alpha = 1
            }, completion: { complete in
                // anim done
                self.gotItButton.isEnabled = true
            });
        }
    }
    
    func handleCorrectAnswer() {
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.correctButton.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.playSoundTrue()
                self.correctButton.alpha = 0.9
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.7, animations: {
                self.correctButton.alpha = 0
            })
            
            
        }) { (complete) in
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.youSuccessButton.alpha = 1
                self.youSuccessButton.frame = CGRect(x: self.frame.width/2 - 116, y: self.frame.height/2 + 230, width: 240, height: 60)
            }, completion: { complete in
                // anim done
            });
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.gotItButton.alpha = 1
            }, completion: { complete in
                // anim done
                self.gotItButton.isEnabled = true
            });
        }
    }
    
    func startAFKTime() {
        idleTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateIdleTime), userInfo: nil, repeats: true)
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        countdownProgressTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateProgressTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime != 0 {
            totalTime -= 1
            timerLabel.text = String(totalTime)
        } else {
            endTimer()
        }
    }
    
    @objc func updateProgressTime() {
        if totalTime != 0 {
            circularProgressBar.progress += 0.01/30
            progressTime -= Int(0.01)
        } else {
            endTimer()
        }
    }
    
    @objc func updateIdleTime() {
        if idleTime != 0 {
            idleTime -= 1
        } else {
            
            if (isTouchDrawing == false || isHintRunning == false) {
                initiateAnimation()
            }
            
            endIdleTime()
        }
    }
    
    func endIdleTime() {
        if (idleTimer != nil) {
            idleTimer.invalidate()
            idleTime = 2
        }
    }
    
    func endTimer() {
        if (countdownTimer != nil) {
            countdownTimer.invalidate()
        }
        
        if (countdownProgressTimer != nil) {
            countdownProgressTimer.invalidate()
        }
        
        handleTimesUp()
    }
    
    func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        // Stop any animation as soon as the user begins to draw.
        let trackingButtons = [trackingButton1, trackingButton2, trackingButton3, trackingButton4, trackingButton5]
        
        isTouchDrawing = true
        endIdleTime()
        
        let testDrawing = backgroundCanvasView.drawing
        
        if (strokeAksaraIndex! < testDrawing.strokes.count) {
            trackingButtons[strokeAksaraIndex!].isHidden = true
        }
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        let trackingButtons = [trackingButton1, trackingButton2, trackingButton3, trackingButton4, trackingButton5]
        let trackingImages = [trackingImageView1, trackingImageView2, trackingImageView3, trackingImageView4, trackingImageView5]
        let trackingCorrectImages = [trackingCorrectImageView1, trackingCorrectImageView2, trackingCorrectImageView3, trackingCorrectImageView4, trackingCorrectImageView5]
        // Avoid triggering the scoring, if we are programatically mutating the drawing.
        guard !isUpdatingDrawing else { return }
        
        let testDrawing = backgroundCanvasView.drawing
        let strokeIndex = canvasView.drawing.strokes.count - 1
        
        // Score the last stroke.
        guard let lastStroke = canvasView.drawing.strokes.last else { return }
        guard strokeIndex < testDrawing.strokes.count else { return }
        
        isUpdatingDrawing = true
        
        // Stroke matching.
        let threshold: CGFloat = 50
        let distance = lastStroke.discreteFrechetDistance(to: testDrawing.strokes[strokeIndex], maxThreshold: threshold)
        
        if distance < threshold {
            // Adjust the correct stroke to have a green ink.
            canvasView.drawing.strokes[strokeIndex].ink.color = .clear
            
            trackingButtons[strokeAksaraIndex!].isHidden = true
            trackingImages[strokeAksaraIndex!].isHidden = true
            trackingCorrectImages[strokeAksaraIndex!].isHidden = false
            
            self.strokeAksaraIndex! += 1
            
            if (strokeAksaraIndex! < testDrawing.strokes.count) {
                trackingButtons[strokeAksaraIndex!].isHidden = false
                trackingImages[strokeAksaraIndex!].isHidden = false
//                addTrackAnimation(withIndex: strokeAksaraIndex!)
                
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
            
            containerBackgroundView.shakeView()
            
            if (isHintRunning == false) {
                self.initiateAnimation()
                self.endIdleTime()
            }
            
        }
        
        updateScore()
        isUpdatingDrawing = false
    }
    
    func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        isTouchDrawing = false
        
        if (isHintRunning == false) {
            idleTime = 2
            startAFKTime()
        }
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
//            print("")
        }
    }
}

class CustomTrackView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    func setUpView() {
        let image = UIImage(named: "trackingButton")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 200, y: 200, width: self.bounds.width, height: self.bounds.height)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
