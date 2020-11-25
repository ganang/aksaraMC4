//
//  NewPanduanFirstCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 15/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class NewPanduanFirstCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var player: AVAudioPlayer?
    var pulsatingLayerAksara : CAShapeLayer!
    var pulsatingLayerLatin : CAShapeLayer!
    var pulsatingLayerPlaceholderAksara : CAShapeLayer!
    var pulsatingLayerPlaceholderLatin : CAShapeLayer!
    var isPlaceholderAksaraFilled : Bool? = false
    var isPlaceholderLatinFilled : Bool? = false
    
    let aksaraPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width/2) - 100 , y: (UIScreen.main.bounds.height/2) - 216 , width: 200, height: 200)
    let latinPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width/2) - 50 , y: (UIScreen.main.bounds.height/2), width: 100, height: 100)
    
    let aksaraPosition = CGRect(x: (UIScreen.main.bounds.width/2) - 460 , y: (UIScreen.main.bounds.height/2) - 128 , width: 140, height: 140)
    let latinPosition = CGRect(x: (UIScreen.main.bounds.width/2) + 319 , y: (UIScreen.main.bounds.height/2) - 128 , width: 140, height: 140)

   
    
    
    lazy var aksaraPlaceholderButton: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = UIColor.init(white: 1, alpha: 0.2)
        
        button.isUserInteractionEnabled = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 60, left: 60, bottom: 60, right: 60)
        button.layer.cornerRadius = 100
        return button
    }()
    
    lazy var latinPlaceholderButton: UIButton = {
        let button = UIButton()

        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        
        
        button.setTitle("Wa", for: .normal)
        button.setTitleColor(UIColor.init(white: 1, alpha: 0.2), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        
        button.layer.cornerRadius = 50
        return button
    }()
    

    lazy var aksaraButton: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Aksara)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        button.layer.cornerRadius = 70
        return button
    }()
    
    lazy var latinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Wa", for: .normal)
        button.setTitleColor(Theme.current.accentWhite, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Latin)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        
        button.layer.cornerRadius = 70
        return button
    }()
    
    lazy var continueButton : UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCheckButtonBackgroundGoldColor(withOpacity: 1, withHeight: 48, withWidth: 240, withCorner: 24)
        button.setTitle("Lanjut", for: .normal)
        button.setTitleColor(Theme.current.accentPurple, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let tintedImage = UIImage(systemName: "arrow.right", withConfiguration: boldConfig)?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        if let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
        button.tag = 0
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.alpha = 0.4
        
        return button
    }()
    
    //-----------GESTURE-----------//
    
    lazy var moveGS_Aksara: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Aksara"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_Latin: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Latin"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 1
        return moveGS
    }()
    
    
    
    //------------- AFTER VIEW -------------//
    
    let correctImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswerBig")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        
        return image
    }()
    
    let aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Wa")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.isHidden = true
        
        return image
    }()

    let aksaraName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Wa"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
//
//
        setupViewInitial()
        setupCircleLayers()
        setBackgroundOpening()

    }
    

    
    //Create Pulsating
    private func createCircleShapeLayer1(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 0.1, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 70, y: 70)
        return layer
    }
    
    private func createCircleShapeLayer2(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 0.1, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 100, y: 100)
        return layer
    }
    
    private func createCircleShapeLayer3(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 0.1, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 50, y: 50)
        return layer
    }
    
    private func setupCircleLayers() {
        pulsatingLayerAksara = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraButton.layer.addSublayer(pulsatingLayerAksara)
        
        
        
        pulsatingLayerLatin = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        latinButton.layer.addSublayer(pulsatingLayerLatin)
        
        pulsatingLayerPlaceholderAksara = createCircleShapeLayer2(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraPlaceholderButton.layer.addSublayer(pulsatingLayerPlaceholderAksara)
//
        
        pulsatingLayerPlaceholderLatin = createCircleShapeLayer3(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        latinPlaceholderButton.layer.addSublayer(pulsatingLayerPlaceholderLatin)

        animatePulsatingLayer1()
        animatePulsatingLayer2()
        animatePulsatingLayer3()
        
        
    }
    
    func animatePulsatingLayer1() {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 800
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
      
        pulsatingLayerAksara.add(groupAnimation, forKey: "pulsing")
        pulsatingLayerLatin.add(groupAnimation, forKey: "pulsing")
        
    }
    
    func animatePulsatingLayer2() {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 1200
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
    }
  
    func animatePulsatingLayer3() {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 600
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
    }
    
    //MoveGS
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
    
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown1 = CABasicAnimation(keyPath: "transform.scale")
        scaleDown1.toValue = 800
        let fade1 = CABasicAnimation(keyPath: "opacity")
        fade1.toValue = 0
        groupAnimation.animations = [scaleDown1,fade1]
        
        
        
        let groupAnimation2 = CAAnimationGroup()
        groupAnimation2.beginTime = CACurrentMediaTime()
        groupAnimation2.duration = 1
        groupAnimation2.autoreverses = false
        groupAnimation2.repeatCount = Float.infinity
        groupAnimation2.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown2 = CABasicAnimation(keyPath: "transform.scale")
        scaleDown2.toValue = 1200
        let fade2 = CABasicAnimation(keyPath: "opacity")
        fade2.toValue = 0
        groupAnimation2.animations = [scaleDown2,fade2]
        
        let groupAnimation3 = CAAnimationGroup()
        groupAnimation3.beginTime = CACurrentMediaTime()
        groupAnimation3.duration = 1
        groupAnimation3.autoreverses = false
        groupAnimation3.repeatCount = Float.infinity
        groupAnimation3.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown3 = CABasicAnimation(keyPath: "transform.scale")
        scaleDown3.toValue = 600
        let fade3 = CABasicAnimation(keyPath: "opacity")
        fade3.toValue = 0
        groupAnimation3.animations = [scaleDown3,fade3]
        
        
        let name =  sender.name
        if name == "Aksara" {
            if sender.state == .began {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                playSoundDrag()
                pulsatingLayerAksara.removeAnimation(forKey: "pulsing")
                pulsatingLayerLatin.removeAnimation(forKey: "pulsing")
                pulsatingLayerPlaceholderAksara.add(groupAnimation2, forKey: "pulsing")
                
                
            } else if sender.state == .changed {
                let translation = sender.translation(in: self)
                aksaraButton.transform = CGAffineTransform(translationX: translation.x , y: translation.y)

            } else if sender.state == .ended {

                pulsatingLayerAksara.add(groupAnimation, forKey: "pulsing")
                pulsatingLayerLatin.add(groupAnimation, forKey: "pulsing")
                pulsatingLayerPlaceholderAksara.removeAnimation(forKey: "pulsing")
                
                if (aksaraPlaceholderButton.frame.intersects(sender.view!.frame)) {
//                    print("end on placeholder")
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    playSoundPlacing()
                    isPlaceholderAksaraFilled = true
                    pulsatingLayerAksara.removeAnimation(forKey: "pulsing")
                    aksaraPlaceholderButton.imageView?.tintColor = UIColor.init(white: 1, alpha: 1)
                    aksaraPlaceholderButton.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
                    aksaraPlaceholderButton.layer.borderWidth = 0
                }
                UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    self.aksaraButton.transform = .identity
                }
                
                checkAnswer()
            }
        } else if name == "Latin" {
            if sender.state == .began {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                playSoundDrag()
                pulsatingLayerAksara.removeAnimation(forKey: "pulsing")
                pulsatingLayerLatin.removeAnimation(forKey: "pulsing")
                pulsatingLayerPlaceholderLatin.add(groupAnimation3, forKey: "pulsing")
                
                
            } else if sender.state == .changed {
                let translation = sender.translation(in: self)
                latinButton.transform = CGAffineTransform(translationX: translation.x , y: translation.y)

            } else if sender.state == .ended {
                pulsatingLayerAksara.add(groupAnimation, forKey: "pulsing")
                pulsatingLayerLatin.add(groupAnimation, forKey: "pulsing")
                pulsatingLayerPlaceholderLatin.removeAnimation(forKey: "pulsing")
                
                if (latinPlaceholderButton.frame.intersects(sender.view!.frame)) {
//                    print("end on placeholder")
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    playSoundPlacing()
                    isPlaceholderLatinFilled = true
                    pulsatingLayerLatin.removeAnimation(forKey: "pulsing")
                    latinPlaceholderButton.imageView?.tintColor = UIColor.init(white: 1, alpha: 1)
                    latinPlaceholderButton.setTitleColor(UIColor.white, for: .normal)
                    latinPlaceholderButton.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
                    latinPlaceholderButton.layer.borderWidth = 0
                }
                UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    self.latinButton.transform = .identity
                }
                
                checkAnswer()
            }
        }
    }
 
    func checkAnswer() {
        if isPlaceholderLatinFilled == true && isPlaceholderAksaraFilled == true {
            pulsatingLayerAksara.removeAnimation(forKey: "pulsing")
            pulsatingLayerLatin.removeAnimation(forKey: "pulsing")
            doneFunction()
        }
    }
    
    func doneFunction() {
        playSoundTrue()
        addSubview(aksaraImage)
        aksaraImage.alpha = 0
        aksaraImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraImage.topAnchor.constraint(equalTo: topAnchor, constant: 220).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 192).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        addSubview(aksaraName)
        aksaraName.alpha = 0
        aksaraName.topAnchor.constraint(equalTo: aksaraImage.bottomAnchor, constant: 80).isActive = true
        aksaraName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //correct answer
        addSubview(correctImage)
        self.correctImage.frame = CGRect(x: frame.size.width/2 - 20, y: 290, width: 40, height: 40)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse], animations: { [self] in
            self.correctImage.alpha = 1
            self.correctImage.frame = CGRect(x: self.frame.size.width/2 - 50, y: 260, width: 100, height: 100)



        }) { [self] (completed) in
            self.correctImage.alpha = 0

        }
        
        UIView.animate(withDuration: 1) { [self] in
            
            aksaraButton.alpha = 0
            aksaraPlaceholderButton.alpha = 0
            latinPlaceholderButton.alpha = 0
            latinButton.alpha = 0
            
            aksaraImage.alpha = 1
            aksaraName.alpha = 1
            
            continueButton.alpha = 1
        }
    }
    
    func setupViewInitial() {

            setupViewReal()

    }
    
    func setupViewReal() {

        addSubview(aksaraPlaceholderButton)
        aksaraPlaceholderButton.frame = aksaraPlaceholderPosition
        
        addSubview(latinPlaceholderButton)
        latinPlaceholderButton.frame = latinPlaceholderPosition
        
        addSubview(aksaraButton)
        aksaraButton.frame = aksaraPosition
        
        addSubview(latinButton)
        latinButton.frame = latinPosition
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    //SOUND
    func playSoundTrue() {
        guard let url = Bundle.main.url(forResource: "Jawaban_Benar_A", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSoundDrag() {
        guard let url = Bundle.main.url(forResource: "Drag Sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSoundPlacing() {
        guard let url = Bundle.main.url(forResource: "Drop Sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
