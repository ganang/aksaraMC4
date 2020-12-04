//
//  NewGaHeadnTailDDCell.swift
//  aksaraMC4
//
//  Created by Naratama on 02/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class NewGaHeadnTailDDCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var timer = Timer()
    var player: AVAudioPlayer?
    
    let originTail1Position = CGRect(x: (UIScreen.main.bounds.width/2) + 210 , y: (UIScreen.main.bounds.height/2) - 152, width: 80, height: 80)
    let originTail2Position = CGRect(x: (UIScreen.main.bounds.width / 2) + 210, y: (UIScreen.main.bounds.height/2) - 32, width: 80, height: 80)
    let originTail3Position = CGRect(x: (UIScreen.main.bounds.width / 2) + 210, y: (UIScreen.main.bounds.height/2) + 88, width: 80, height: 80)
    let tailPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width / 2) - 70 , y: (UIScreen.main.bounds.height/2) - 72, width: 140, height: 140)
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    var pulsatingLayer4 : CAShapeLayer!
    var pulsatingLayer5 : CAShapeLayer!
    var pulsatingLayer6 : CAShapeLayer!
    
    var pulsatingLayerGuideTail : CAShapeLayer!
    
    var isTailPlaceholdersFilled : Bool? = false
    var aksaraOnTailPlaceHolders : String?
    
    var aksaraName = ["Na", "Ra", "Ga"]
    var aksaraQuestion : String? = "Ga"
    
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.text = "Ga"
        label.textColor = Theme.current.accentWhite
        
        return label
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
        button.alpha = 1
        
        return button
    }()
    
    
    //TAIL
    let tailIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullBodyGold")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        //        image.alpha = 0
        
        return image
    }()
    
    lazy var tailButton1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Soal 4 \(aksaraName[0])")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailA)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 40
        return button
    }()
    
    lazy var tailButton2: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Soal 4 \(aksaraName[1])")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailB)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 40
        
        return button
    }()
    
    lazy var tailButton3: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Soal 4 \(aksaraName[2])")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailC)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        //        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 40
        
        return button
    }()
    
    
    lazy var tailPlaceHoldersButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "elipsGaUnfill"), for: .normal)
        button.layer.cornerRadius = 70
        return button
    }()
    
    
    //----------------------//
    lazy var moveGS_TailA: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_TailB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 1
        return moveGS
    }()
    
    lazy var moveGS_TailC: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 2
        return moveGS
    }()
    
    
    //------------------- NEW VIEW --------------??
    
    let aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Ga")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        
        return image
    }()
    
    let aksaraNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Ga"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    let statementImage: UIImageView = {
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width/2) + 60 , y: (UIScreen.main.bounds.height/2), width: 180, height: 39))
        image.image = UIImage(named: "statementContainerGa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let statementLabel: UILabel = {
        let label = UILabel(frame : CGRect(x: (UIScreen.main.bounds.width/2) + 100, y: (UIScreen.main.bounds.height/2) + 14 , width: 100, height: 19))
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Tepat sekali"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    
    
    //tail
    let tailView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    let tailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Ekor Ga")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailLine: UIImageView = {
        let image = UIImageView(frame : CGRect(x: UIScreen.main.bounds.width/2 - 50, y: (UIScreen.main.bounds.height/2) - 8 , width: 80, height: 2))
        image.image = UIImage(named: "lineHeadnTail")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailImageLogo: UIImageView = {
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width / 2) + 32, y: (UIScreen.main.bounds.height/2) - 140, width: 72, height: 40))
        image.image = UIImage(named: "fullBodyGold")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    let tailImageChoice: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Ekor Ja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tailCorrectLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //AnimationHint
    lazy var circleAnimateMove2: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.7671691792 - 80, y: SCREEN_HEIGHT / 2 - 20, width: 40, height: 40))
        view.backgroundColor = .white
        view.alpha = 0
        view.layer.cornerRadius = 40/2
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        setupTimerInactivity()
        setupView()
        setupCircleLayers()
        setBackgroundDragnDrop()
    }
    
    func setupTimerInactivity() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(doStuff), userInfo: nil, repeats: false)
        let resetTimer = UITapGestureRecognizer(target: self, action: #selector(resetTimers))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(resetTimer)
    }
    
    
    @objc func resetTimers() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(doStuff), userInfo: nil, repeats: false)
//        if pulsatingLayerGuideHead != nil {
//            pulsatingLayerGuideHead.removeFromSuperlayer()
//            pulsatingLayerGuideHead.removeAllAnimations()
//        }
    }
    
    @objc func doStuff() {
        // perform any action you wish to
        print("User inactive for more than 5 seconds .")
        setupHintCircleAnimation()
        timer.invalidate()
    }
    
    func setupHintCircleAnimation() {
        addSubview(circleAnimateMove2)
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.repeat, .curveLinear], animations: { [self] in
            UIView.animate(withDuration: 0.6) {
                self.circleAnimateMove2.alpha = 0.2
            }
            circleAnimateMove2.frame = CGRect(x: SCREEN_WIDTH/2 - 20, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            self.circleAnimateMove2.alpha = 0.0
        })
    }
    
    private func createCircleShapeLayerForHint(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 4, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 70, y: 70)
        return layer
    }
    
    
    
    
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 0.2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 40, y: 40)
        return layer
    }
    
    
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor, position: CGPoint) -> CAShapeLayer {
        let layer = CAShapeLayer()
        //        layer.frame = originHead1Position
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 0.1, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = position
        return layer
    }
    
    private func setupCircleLayers() {
        pulsatingLayer4 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        tailButton1.layer.addSublayer(pulsatingLayer4)
        
        pulsatingLayer5 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        tailButton2.layer.addSublayer(pulsatingLayer5)
        
        pulsatingLayer6 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        tailButton3.layer.addSublayer(pulsatingLayer6)
        
        pulsatingLayerGuideTail = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: tailPlaceHoldersButton.frame.width/2, y: tailPlaceHoldersButton.frame.height/2))
        tailPlaceHoldersButton.layer.addSublayer(pulsatingLayerGuideTail)
        
        animatePulsatingLayer()
    }
    
    private func animatePulsatingLayer() {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 320
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
    }
    private func animatePulsatingLayerItemMovingTail() {
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
        
        pulsatingLayerGuideTail.add(groupAnimation, forKey: "pulsing")
    }
    
    private func removeGestureAnimation() {
        self.pulsatingLayer4.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer5.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer6.removeAnimation(forKey: "pulsing")
    }
    
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        circleAnimateMove2.isHidden = true
        let name =  sender.name
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 320
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        if name == "Tail" {
            if sender.state == .began {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                playSoundDrag()
                animatePulsatingLayerItemMovingTail()
            } else if sender.state == .changed {
                if sender.index == 0 {
                    let translation = sender.translation(in: self)
                    tailButton1.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    
                } else if sender.index == 1 {
                    let translation = sender.translation(in: self)
                    tailButton2.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                } else if sender.index == 2 {
                    let translation = sender.translation(in: self)
                    tailButton3.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                }
                
                removeGestureAnimation()
                
                UIView.animate(withDuration: 1) {
                    self.tailPlaceHoldersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    
                    self.tailPlaceHoldersButton.setImage(UIImage(named: "elipsGaUnfill"), for: .normal)
                    
                }
                
            } else if sender.state == .ended {
                
                pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
                
                if (tailPlaceHoldersButton.frame.intersects(sender.view!.frame)) {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    playSoundPlacing()
                    
                    
                    UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                        if sender.index == 0 {
                            pulsatingLayer4.removeAnimation(forKey: "pulsing")
                            pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
                            pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
                            aksaraOnTailPlaceHolders = aksaraName[0]
                        } else if sender.index == 1 {
                            pulsatingLayer5.removeAnimation(forKey: "pulsing")
                            pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
                            pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
                            aksaraOnTailPlaceHolders = aksaraName[1]
                        } else if sender.index == 2 {
                            pulsatingLayer6.removeAnimation(forKey: "pulsing")
                            pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
                            pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
                            aksaraOnTailPlaceHolders = aksaraName[2]
                        }
                        isTailPlaceholdersFilled = true
                    }
                    checkAnswer()
                }else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [self] in
                        circleAnimateMove2.isHidden = false
                    }
                }
                
                
                
                if isTailPlaceholdersFilled == false {
                    UIView.animate(withDuration: 1) {
                        self.tailPlaceHoldersButton.setImage(UIImage(named: "elipsGaUnfill"), for: .normal)
                    }
                } else {
                    self.tailPlaceHoldersButton.backgroundColor = .init(white: 1, alpha: 0.2)
                    self.tailPlaceHoldersButton.setImage(UIImage(named: "Jawa Soal 4 \(aksaraOnTailPlaceHolders!)"), for: .normal)
                    self.tailPlaceHoldersButton.imageView?.contentMode = .scaleAspectFit
                    self.tailPlaceHoldersButton.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
                }
                
                
                //animate go back to initial
                UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    if sender.index == 0 {
                        self.tailButton1.transform = .identity
                    } else if sender.index == 1 {
                        self.tailButton2.transform = .identity
                    } else if sender.index == 2 {
                        self.tailButton3.transform = .identity
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.pulsatingLayerGuideTail.removeAnimation(forKey: "pulsing")
                }
                
            }
        }
    }
    
    func checkAnswer() {
        if isTailPlaceholdersFilled == true {
            tailImageChoice.image = UIImage(named: "Jawa Ekor \(aksaraOnTailPlaceHolders!)")
            
            if aksaraOnTailPlaceHolders == aksaraQuestion {
                QuickStartReviewData.instance.quizesCorrectStatus[0] = true
                playSoundTrue()
                statementLabel.text = "Tepat sekali"
                
            } else {
                QuickStartReviewData.instance.quizesCorrectStatus[0] = false
                playSoundFalse()
                statementLabel.text = "Belum benar"
            }
            
            if aksaraOnTailPlaceHolders == aksaraQuestion {
                tailCorrectLabel.image = UIImage(named: "correctAnswer")
            } else {
                tailCorrectLabel.image = UIImage(named: "falseAnswer")
            }
            
            answerTransitionAnimation()
        }
    }
    
    func answerTransitionAnimation() {
        removeGestureAnimation()
        UIView.animate(withDuration: 1.0) { [self] in
            
            //--Animation Change--//
            tailButton1.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 290 , y: (UIScreen.main.bounds.height/2) - 152, width: 80, height: 80)
            tailButton2.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 290, y: (UIScreen.main.bounds.height/2) - 32, width: 80, height: 80)
            tailButton3.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 290, y: (UIScreen.main.bounds.height/2) + 88, width: 80, height: 80)
            tailIcon.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 290 , y: (UIScreen.main.bounds.height/2) - 225, width: 72, height: 40)
            
            tailButton1.alpha = 0
            tailButton2.alpha = 0
            tailButton3.alpha = 0
            tailIcon.alpha = 0
            
            animationGuideAppear()
        }
    }
    
    func animationGuideAppear() {
        addSubview(tailView)
        tailView.alpha = 0
        self.tailView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 + 153, y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
        tailView.layer.cornerRadius = 70
        
        addSubview(tailLine)
        tailLine.alpha = 0
        
        UIView.animate(withDuration: 1.0) { [self] in
            //TAIL
            self.addSubview(self.tailImage)
            self.tailImage.alpha = 0
            
            UIImageView.animate(withDuration: 0.4, delay: 0, options: [] , animations: {
                
                self.tailLine.alpha = 1
                self.tailLabelAppear()
            }) { (completed) in
                //head appear after finish
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UIView.animate(withDuration: 1) {
                        self.tailImage.alpha = 1
                    }
                }
            }
            
        }
    }
    
    func tailLabelAppear() {
        
        addSubview(aksaraImage)
        aksaraImage.alpha = 1
        aksaraImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -164).isActive = true
        aksaraImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -7).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 132).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 120).isActive = true

        //Ga Jawaban
        questionLabel.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        questionLabel.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 187 , y: (UIScreen.main.bounds.height/2) + 81, width: 48, height: 38)
        
        tailPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 79, y: (UIScreen.main.bounds.height/2) - 77, width: 140, height: 140)
        
        addSubview(tailImageLogo)
        tailImageLogo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 112, y: (UIScreen.main.bounds.height/2) - 140, width: 72, height: 40)
        
        
        
        tailCorrectLabel.alpha = 0
        statementImage.alpha = 0
        statementLabel.alpha = 0
        continueButton.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            UIView.animate(withDuration: 1) { [self] in
                //correct image
                addSubview(tailCorrectLabel)
                tailCorrectLabel.alpha = 1
                tailCorrectLabel.centerYAnchor.constraint(equalTo: tailPlaceHoldersButton.centerYAnchor, constant: 0).isActive = true
                tailCorrectLabel.leadingAnchor.constraint(equalTo: tailPlaceHoldersButton.trailingAnchor, constant: 16).isActive = true
                tailCorrectLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
                tailCorrectLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
                
                //statememt
                addSubview(statementImage)
                statementImage.alpha = 1
                statementImage.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 60 , y: (UIScreen.main.bounds.height/2) + 80, width: 180, height: 39)
                
                addSubview(statementLabel)
                statementLabel.alpha = 1
                statementLabel.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 100 , y: (UIScreen.main.bounds.height/2) + 94, width: 100, height: 19)
                
                //continue Button
                addSubview(continueButton)
                continueButton.alpha = 1
                continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
                continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
                continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
                continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
            }
        }
        
    }
    
    
    func setupView() {
        
        
        addSubview(tailButton1)
        tailButton1.frame = originTail1Position
        
        addSubview(tailButton2)
        tailButton2.frame = originTail2Position
        
        addSubview(tailButton3)
        tailButton3.frame = originTail3Position
        
        addSubview(tailPlaceHoldersButton)
        tailPlaceHoldersButton.frame = tailPlaceholderPosition
        
        
        addSubview(tailIcon)
        tailIcon.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 210 , y: (UIScreen.main.bounds.height/2) - 225, width: 72, height: 40)
        
        addSubview(questionLabel)
        questionLabel.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 254 , y: (UIScreen.main.bounds.height/2) - 39, width: 84, height: 67)
        
    }
    
    //SOUND
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
    
    
    
    func playSoundFalse() {
        guard let url = Bundle.main.url(forResource: "Jawaban_Salah_D", withExtension: "mp3") else { return }
        
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


