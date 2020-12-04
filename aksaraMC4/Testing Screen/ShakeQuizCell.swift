//
//  ShakeQuizController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 02/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class ShakeQuizCell: BaseCell, CAAnimationDelegate, UIGestureRecognizerDelegate {
    
    var timer = Timer()
    var currentTime = 0
    var isShaking = false
    var isShakingEnable = true
    var isHeadAMoving = false
    var isHeadBMoving = false
    var isIntersect = false
    var player: AVAudioPlayer?
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "shakeJo")
        imageView.alpha = 1
        
        return imageView
    }()
    
    lazy var guideWritingName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Jo"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
    lazy var changeSandanganImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "JaToJoImage")
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var trackingImage1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "leftTrackingDirection")
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var trackingImage2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rightTrackingDirection")
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var trackingImage3: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pinchImage")
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var informationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "informationJoImage")
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var button1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "jaImageFull")?.withRenderingMode(.alwaysTemplate)
        button.layer.frame = CGRect(x: frame.width/2 - 100, y: frame.height/2 - 100, width: 200, height: 200)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.addGestureRecognizer(moveGS_HeadA)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 60)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 100
        button.alpha = 0
        
        return button
    }()
    
    lazy var button1Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Ja"
        label.textColor = .white
        label.alpha = 0
        label.layer.frame = CGRect(x: frame.width/2 - 12.5, y: frame.height/2 + 100, width: 50, height: 50)
        
        return label
    }()
    
    lazy var button2: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "talingTarungImageFull")?.withRenderingMode(.alwaysTemplate)
        button.layer.frame = CGRect(x: frame.width/2 - 100, y: frame.height/2 - 100, width: 200, height: 200)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.addGestureRecognizer(moveGS_HeadB)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 45, left: 45, bottom: 45, right: 45)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 100
        button.alpha = 0
        
        return button
    }()
    
    lazy var button2Label: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Taling Tarung"
        label.textColor = .white
        label.alpha = 0
        label.layer.frame = CGRect(x: frame.width/2 - 82.5, y: frame.height/2 + 100, width: 200, height: 50)
        
        return label
    }()
    
    let trackingImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.isHidden = false
        imageView.image = UIImage(named: "trackingImageGa1")
        
        return imageView
    }()
    
    let trackingImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.isHidden = false
        imageView.image = UIImage(named: "trackingImageGa1")
        
        return imageView
    }()
    
    lazy var moveGS_HeadA: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "HeadA"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_HeadB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "HeadB"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 1
        
        return moveGS
    }()
    
    lazy var continueButton: UIButton = {
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
    
    override func setupViews() {
        self.becomeFirstResponder()
        backgroundImageView.shakeAnimateView(view: self, withCount: 3)
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        addSubview(backgroundImageView)
        addSubview(guideWritingName)
        addSubview(changeSandanganImage)
        addSubview(button1)
        addSubview(button2)
        addSubview(button1Label)
        addSubview(button2Label)
        addSubview(trackingImage1)
        addSubview(trackingImage2)
        addSubview(trackingImage3)
        addSubview(continueButton)
        addSubview(informationImage)
    }
    
    func setupConstraint() {
        backgroundImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        backgroundImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8).isActive = true
        backgroundImageView.widthAnchor.constraint(equalToConstant: 306).isActive = true
        backgroundImageView.heightAnchor.constraint(equalToConstant: 174).isActive = true
        
        guideWritingName.topAnchor.constraint(equalTo: backgroundImageView.bottomAnchor, constant: 8).isActive = true
        guideWritingName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        changeSandanganImage.topAnchor.constraint(equalTo: guideWritingName.bottomAnchor, constant: 40).isActive = true
        changeSandanganImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        changeSandanganImage.widthAnchor.constraint(equalToConstant: 360).isActive = true
        changeSandanganImage.heightAnchor.constraint(equalToConstant: 39).isActive = true
        
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        continueButton.layer.cornerRadius = 32
        
        trackingImage1.centerYAnchor.constraint(equalTo: button1.centerYAnchor).isActive = true
        trackingImage1.trailingAnchor.constraint(equalTo: button1.trailingAnchor, constant: -120).isActive = true
        trackingImage1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        trackingImage1.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        trackingImage2.centerYAnchor.constraint(equalTo: button2.centerYAnchor).isActive = true
        trackingImage2.leadingAnchor.constraint(equalTo: button2.leadingAnchor, constant: 120).isActive = true
        trackingImage2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        trackingImage2.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        trackingImage3.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 40).isActive = true
        trackingImage3.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        trackingImage3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        trackingImage3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        informationImage.centerYAnchor.constraint(equalTo: button2Label.centerYAnchor, constant: 92).isActive = true
        informationImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        informationImage.widthAnchor.constraint(equalToConstant: 820).isActive = true
        informationImage.heightAnchor.constraint(equalToConstant: 71).isActive = true
    }
    
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer) {
        
        if (sender.state == .began) {
            self.trackingImage1.alpha = 0
            self.trackingImage2.alpha = 0
            self.trackingImage3.alpha = 0
        }
        
        if (sender.state == .changed) {
            if sender.index == 0 {
                let translation = sender.translation(in: self)
                button1.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                button1Label.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                isHeadAMoving = true
            }
            
            if sender.index == 1 {
                let translation = sender.translation(in: self)
                button2.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                button2Label.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                isHeadBMoving = true
            }
            
            if (isHeadAMoving && isHeadBMoving) {
                if (button1.frame.intersects(button2.frame)) || (button2.frame.intersects(button1.frame)) {
                    isIntersect = true
                    handleIntersect()
                    playSoundTrue()
                }
            }
        }
        
        if (sender.state == .ended) {
            
            if (isHeadAMoving && isHeadBMoving) {
                
                if (isIntersect == false) {
                    UIView.animate(withDuration: 1,delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) { [self] in
                        self.button1.transform = .identity
                        self.button1Label.transform = .identity
                        self.button2.transform = .identity
                        self.button2Label.transform = .identity
                        isHeadAMoving = false
                        isHeadBMoving = false
                        self.trackingImage1.alpha = 1
                        self.trackingImage2.alpha = 1
                        self.trackingImage3.alpha = 1
                    }
                }
                
            } else if (isHeadAMoving) {
                UIView.animate(withDuration: 1,delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) { [self] in
                    self.button1.transform = .identity
                    self.button1Label.transform = .identity
                    isHeadAMoving = false
                    self.trackingImage1.alpha = 1
                    self.trackingImage2.alpha = 1
                    self.trackingImage3.alpha = 1
                }
            } else if (isHeadBMoving) {
                UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) { [self] in
                    self.button2.transform = .identity
                    self.button2Label.transform = .identity
                    isHeadBMoving = false
                    self.trackingImage1.alpha = 1
                    self.trackingImage2.alpha = 1
                    self.trackingImage3.alpha = 1
                }
            }
        }
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if (isShaking) {
            backgroundImageView.shakeAnimateView(view: self, withCount: 1)
        }
    }
    
    // We are willing to become first responder to get shake motion
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    // Enable detection of shake motion
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (isShakingEnable == true) {
            if motion == .motionShake {
                isShaking = true
                backgroundImageView.shakeAnimateView(view: self, withCount: 1)
                timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(handleShake), userInfo: nil, repeats: true)
            }
        }
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        isShaking = false
        timer.invalidate()
    }
    
    override func motionCancelled(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        isShaking = false
        timer.invalidate()
    }
    
    func handleIntersect() {
        self.trackingImage1.alpha = 0
        self.trackingImage2.alpha = 0
        self.trackingImage3.alpha = 0
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.button1.alpha = 0
                self.button2.alpha = 0
                self.button1Label.alpha = 0
                self.button2Label.alpha = 0
                self.informationImage.alpha = 0
            })
        }) { (complete) in
            UIView.animate(withDuration: 1.6, delay: 0.8, options: [.curveEaseOut], animations: {
                self.guideWritingName.alpha = 1
                self.backgroundImageView.alpha = 1
                self.changeSandanganImage.alpha = 1
                self.continueButton.alpha = 1
                self.continueButton.isEnabled = true
            })
        }
    }
    
    @objc func handleShake() {
        isShakingEnable = false
        timer.invalidate()
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.backgroundImageView.alpha = 0
                self.guideWritingName.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.7, animations: {
                self.button1.alpha = 1
                self.button1Label.alpha = 1
                self.button2.alpha = 1
                self.button2Label.alpha = 1
                self.button1.layer.frame = CGRect(x: self.frame.width/2 - 300, y: self.frame.height/2 - 100, width: 200, height: 200)
                self.button2.layer.frame = CGRect(x: self.frame.width/2 + 100, y: self.frame.height/2 - 100, width: 200, height: 200)
                self.button1Label.layer.frame = CGRect(x: self.frame.width/2 - 212.5, y: self.frame.height/2 + 100, width: 50, height: 50)
                self.button2Label.layer.frame = CGRect(x: self.frame.width/2 + 122.5, y: self.frame.height/2 + 100, width: 200, height: 50)
            })
            
        }) { (complete) in
            UIView.animate(withDuration: 1.2, delay: 0.8, options: [.curveEaseOut], animations: {
                self.trackingImage1.alpha = 1
                self.trackingImage2.alpha = 1
                self.trackingImage3.alpha = 1
                self.informationImage.alpha = 1
            })
        }
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
}
