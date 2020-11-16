//
//  NewHeadnTailDDCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 14/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class NewHeadnTailDDCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var timer = Timer()
    var player: AVAudioPlayer?
    let originHead1Position = CGRect(x: (UIScreen.main.bounds.width/2) - 403 , y: (UIScreen.main.bounds.height/2) - 180, width: 80, height: 80)
    let originHead2Position = CGRect(x: (UIScreen.main.bounds.width / 2) - 403, y: (UIScreen.main.bounds.height/2) - 40, width: 80, height: 80)
    let originHead3Position = CGRect(x: (UIScreen.main.bounds.width / 2) - 403, y: (UIScreen.main.bounds.height/2) + 100, width: 80, height: 80)
    let headPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 , y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
    
    let originTail1Position = CGRect(x: (UIScreen.main.bounds.width/2) + 315 , y: (UIScreen.main.bounds.height/2) - 180, width: 80, height: 80)
    let originTail2Position = CGRect(x: (UIScreen.main.bounds.width / 2) + 315, y: (UIScreen.main.bounds.height/2) - 40, width: 80, height: 80)
    let originTail3Position = CGRect(x: (UIScreen.main.bounds.width / 2) + 315, y: (UIScreen.main.bounds.height/2) + 100, width: 80, height: 80)
    let tailPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width / 2) + 75 , y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
    
    var pulsatingLayer1 : CAShapeLayer!
    var pulsatingLayer2 : CAShapeLayer!
    var pulsatingLayer3 : CAShapeLayer!
    
    var pulsatingLayer4 : CAShapeLayer!
    var pulsatingLayer5 : CAShapeLayer!
    var pulsatingLayer6 : CAShapeLayer!
    
    var pulsatingLayerGuideHead : CAShapeLayer!
    var pulsatingLayerGuideTail : CAShapeLayer!
    
    var isHeadPlaceholdersFilled : Bool? = false
    var aksaraOnHeadPlaceHolders : String?
    
    var isTailPlaceholdersFilled : Bool? = false
    var aksaraOnTailPlaceHolders : String?
    
    var aksaraName = ["Wa", "Sa", "Tha"]
    var aksaraQuestion : String? = "Wa"
    
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.text = "Wa"
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
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
    
    
    //HEAD
    let headIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "headImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var headButton1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Kepala \(aksaraName[0])")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadA)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 40
        return button
    }()

    lazy var headButton2: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Kepala \(aksaraName[1])")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadB)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 40
        
        return button
    }()
    
    lazy var headButton3: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Kepala \(aksaraName[2])")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadC)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 40
        
        return button
    }()

    
    lazy var headPlaceHoldersButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "elipsHeadUnfill"), for: .normal)
        button.layer.cornerRadius = 70
        return button
    }()
    
    //TAIL
    let tailIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tailImage")
        image.contentMode = .scaleAspectFit
//        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var tailButton1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Ekor \(aksaraName[0])")?.withRenderingMode(.alwaysTemplate)
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
        var image = UIImage(named: "Jawa Ekor \(aksaraName[1])")?.withRenderingMode(.alwaysTemplate)
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
        var image = UIImage(named: "Jawa Ekor \(aksaraName[2])")?.withRenderingMode(.alwaysTemplate)
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
        button.setImage(UIImage(named: "elipsTailUnfill"), for: .normal)
        button.layer.cornerRadius = 70
        return button
    }()

    
    //----------------------//
    
    lazy var moveGS_HeadA: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_HeadB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 1
        return moveGS
    }()
    
    lazy var moveGS_HeadC: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 2
        return moveGS
    }()
    
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
        image.image = UIImage(named: "Jawa Soal 4 Wa")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        
        return image
    }()

    let aksaraNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Wa"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    let statementImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "statementContainer")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let statementLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Jawaban kamu sudah benar"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    //Head
    let headView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    let headImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Kepala Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let lineHead: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lineHeadnTail")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        return image
    }()
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Kepala"
        label.textColor = Theme.current.accentWhite
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let headImageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "headImage")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headImageChoice: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Kepala Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headImageRight: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Kepala Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headCorrectLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        image.image = UIImage(named: "Jawa Ekor Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailLine: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lineHeadnTail")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Ekor"
        label.textColor = Theme.current.accentWhite
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tailImageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tailImage")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tailImageChoice: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Ekor Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tailImageRight: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Ekor Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tailCorrectLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        if pulsatingLayerGuideHead != nil {
            pulsatingLayerGuideHead.removeFromSuperlayer()
            pulsatingLayerGuideHead.removeAllAnimations()
        }
        

    }
    
    @objc func doStuff() {
       // perform any action you wish to
        print("User inactive for more than 5 seconds .")
//        setupHint()
        timer.invalidate()
    }
    
    func setupHint() {
        //fill the puslatingLayer
        pulsatingLayerGuideHead = createCircleShapeLayerForHint(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        headPlaceHoldersButton.layer.addSublayer(pulsatingLayerGuideHead)
        
        
        
        //animation
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 1.2
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        let position = CABasicAnimation(keyPath: "position")
        position.fromValue = [-100, 80]
        position.toValue = [100, 80]
        
        groupAnimation.animations = [scaleDown, fade ,position]
        
        pulsatingLayerGuideHead.add(groupAnimation, forKey: "pulsing")
       
        //repeat translation
//        UIImageView.animate(withDuration: 1, delay: 0.5, options: [.repeat] , animations: {
//            self.pulsatingLayerGuideHead.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 600 , y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
//            self.hintHandImage.alpha = 0
//            })
        
        
    }
    
    private func createCircleShapeLayerForHint(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
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
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 2, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 40, y: 40)
        return layer
    }
    
    private func setupCircleLayers() {
        pulsatingLayer1 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        headButton1.layer.addSublayer(pulsatingLayer1)
        
        pulsatingLayer2 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        headButton2.layer.addSublayer(pulsatingLayer2)
        
        pulsatingLayer3 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        headButton3.layer.addSublayer(pulsatingLayer3)
        
        
        pulsatingLayer4 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        tailButton1.layer.addSublayer(pulsatingLayer4)
        
        pulsatingLayer5 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        tailButton2.layer.addSublayer(pulsatingLayer5)
        
        pulsatingLayer6 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        tailButton3.layer.addSublayer(pulsatingLayer6)
        
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
        scaleDown.toValue = 32
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
        pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
        
        pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
    }
    

    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        let name =  sender.name
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 32
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
        if name == "Head" {
            
            
            if sender.state == .began {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
                playSoundDrag()
            } else if sender.state == .changed {
                if sender.index == 0 {
                    let translation = sender.translation(in: self)
                    headButton1.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    pulsatingLayer1.removeAnimation(forKey: "pulsing")
                } else if sender.index == 1 {
                    let translation = sender.translation(in: self)
                    headButton2.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    pulsatingLayer2.removeAnimation(forKey: "pulsing")
                } else if sender.index == 2 {
                    let translation = sender.translation(in: self)
                    headButton3.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    pulsatingLayer3.removeAnimation(forKey: "pulsing")
                }
                
                
                self.headPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 - 20 , y: (UIScreen.main.bounds.height/2) - 70 - 20, width: 180, height: 180)
                self.headPlaceHoldersButton.backgroundColor = .clear
                UIView.animate(withDuration: 1) {
                    self.headPlaceHoldersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    
                    self.headPlaceHoldersButton.setImage(UIImage(named: "elipsFillHead"), for: .normal)
                }
                
            } else if sender.state == .ended {
                self.headPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 , y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
                
                pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
                
                
                if (headPlaceHoldersButton.frame.intersects(sender.view!.frame)) {
                    playSoundPlacing()
                    
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.error)
                    
                    UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                        if sender.index == 0 {
                            pulsatingLayer1.removeAnimation(forKey: "pulsing")
                            pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
                            pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
                            aksaraOnHeadPlaceHolders = aksaraName[0]
                        } else if sender.index == 1 {
                            pulsatingLayer2.removeAnimation(forKey: "pulsing")
                            pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
                            pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
                            aksaraOnHeadPlaceHolders = aksaraName[1]
                        } else if sender.index == 2 {
                            pulsatingLayer3.removeAnimation(forKey: "pulsing")
                            pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
                            pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
                            aksaraOnHeadPlaceHolders = aksaraName[2]
                        }
                        isHeadPlaceholdersFilled = true
                    }
                    
                    checkAnswer()
                }
                
                if isHeadPlaceholdersFilled == false {
                    UIView.animate(withDuration: 1) {
                        self.headPlaceHoldersButton.setImage(UIImage(named: "elipsHeadUnfill"), for: .normal)
                    }
                } else {
                    self.headPlaceHoldersButton.backgroundColor = .init(white: 1, alpha: 0.2)
                    self.headPlaceHoldersButton.setImage(UIImage(named: "Jawa Kepala \(aksaraOnHeadPlaceHolders!)"), for: .normal)
                    self.headPlaceHoldersButton.imageView?.contentMode = .scaleAspectFit
                    self.headPlaceHoldersButton.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
                }
                
                //animate go back to initial
                UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    if sender.index == 0 {
                        self.headButton1.transform = .identity
                    } else if sender.index == 1 {
                        self.headButton2.transform = .identity
                    } else if sender.index == 2 {
                        self.headButton3.transform = .identity
                    }
                }
            }
        } else if name == "Tail" {
            if sender.state == .began {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                playSoundDrag()
            } else if sender.state == .changed {
                if sender.index == 0 {
                    let translation = sender.translation(in: self)
                    tailButton1.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    pulsatingLayer4.removeAnimation(forKey: "pulsing")
                    pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
                    pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
                    
                } else if sender.index == 1 {
                    let translation = sender.translation(in: self)
                    tailButton2.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    pulsatingLayer5.removeAnimation(forKey: "pulsing")
                    pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
                    pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
                } else if sender.index == 2 {
                    let translation = sender.translation(in: self)
                    tailButton3.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                    pulsatingLayer6.removeAnimation(forKey: "pulsing")
                    pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
                    pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
                }
                self.tailPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 75 - 20 , y: (UIScreen.main.bounds.height/2) - 70 - 20, width: 180, height: 180)
                
                
                self.tailPlaceHoldersButton.backgroundColor = .clear
                UIView.animate(withDuration: 1) {
                    self.tailPlaceHoldersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    
                    self.tailPlaceHoldersButton.setImage(UIImage(named: "elipsTailFill"), for: .normal)
                }
                
            } else if sender.state == .ended {
                self.tailPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 75, y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
                
                
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
                }
                

                
                if isTailPlaceholdersFilled == false {
                    UIView.animate(withDuration: 1) {
                        self.tailPlaceHoldersButton.setImage(UIImage(named: "elipsTailUnfill"), for: .normal)
                    }
                } else {
                    self.tailPlaceHoldersButton.backgroundColor = .init(white: 1, alpha: 0.2)
                    self.tailPlaceHoldersButton.setImage(UIImage(named: "Jawa Ekor \(aksaraOnTailPlaceHolders!)"), for: .normal)
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
            }
        }
        
    }
    
    func checkAnswer() {
        
        if isHeadPlaceholdersFilled == true && isTailPlaceholdersFilled == true {
            answerTransitionAnimation()
            headImageChoice.image = UIImage(named: "Jawa Kepala \(aksaraOnHeadPlaceHolders!)")
            tailImageChoice.image = UIImage(named: "Jawa Ekor \(aksaraOnTailPlaceHolders!)")
            
            if aksaraOnHeadPlaceHolders == aksaraQuestion && aksaraOnTailPlaceHolders == aksaraQuestion {
                QuickStartReviewData.instance.quizesCorrectStatus[0] = true
                playSoundTrue()
                statementLabel.text = "Jawaban kamu sudah benar"
                
            } else {
                QuickStartReviewData.instance.quizesCorrectStatus[0] = false
                playSoundFalse()
                statementLabel.text = "Jawaban kamu masih salah"
            }
            
            if aksaraOnHeadPlaceHolders == aksaraQuestion {
                headCorrectLabel.image = UIImage(named: "correctAnswer")
            } else {
                headCorrectLabel.image = UIImage(named: "falseAnswer")
            }
            
            if aksaraOnTailPlaceHolders == aksaraQuestion {
                tailCorrectLabel.image = UIImage(named: "correctAnswer")
            } else {
                tailCorrectLabel.image = UIImage(named: "falseAnswer")
            }
        }
    }
    
    func answerTransitionAnimation() {
        UIView.animate(withDuration: 1) { [self] in
            questionLabel.alpha = 0
            questionLabel.removeFromSuperview()
            headPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 + 153 , y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
            tailPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 75 - 153 , y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
            headPlaceHoldersButton.alpha = 0
            tailPlaceHoldersButton.alpha = 0
            headButton1.alpha = 0
            headButton2.alpha = 0
            headButton3.alpha = 0
            tailButton1.alpha = 0
            tailButton2.alpha = 0
            tailButton3.alpha = 0
            headIcon.alpha = 0
            tailIcon.alpha = 0
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                animationGuideAppear()
            }
        }
    }
    
    func animationGuideAppear() {
        addSubview(tailView)
        tailView.alpha = 0
        self.tailView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 + 153, y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
        tailView.layer.cornerRadius = 70
        
        addSubview(tailLine)
        tailLine.alpha = 0
        self.tailLine.frame = CGRect(x: (UIScreen.main.bounds.width / 2), y: (UIScreen.main.bounds.height/2), width: 80, height: 2)
        
        addSubview(headView)
        headView.alpha = 0
        self.headView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 + 153, y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
        headView.layer.cornerRadius = 70
        
        addSubview(lineHead)
        lineHead.alpha = 0
        self.lineHead.frame = CGRect(x: (UIScreen.main.bounds.width / 2), y: (UIScreen.main.bounds.height/2), width: 80, height: 2)
        
        UIView.animate(withDuration: 1) { [self] in
                //TAIL
            self.addSubview(self.tailImage)
            self.tailImage.alpha = 0
            
            UIImageView.animate(withDuration: 1, delay: 0, options: [] , animations: {
                self.tailView.frame = CGRect(x: self.frame.size.width/2 + 250, y: (UIScreen.main.bounds.height/2) + 70, width: 96, height: 96)
                self.tailView.alpha = 0.2
                self.tailView.layer.cornerRadius = 48
                
                self.tailLine.alpha = 1
                self.tailLine.frame = CGRect(x: self.frame.size.width/2 + 140, y: (UIScreen.main.bounds.height/2) - 30 , width: 80, height: 2)
                self.tailLabelAppear()
            }) { (completed) in
                //head appear after finish
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UIView.animate(withDuration: 1) {
                        self.tailImage.alpha = 1
                        self.tailImageLogo.alpha = 1
                        self.tailLabel.alpha = 1
                    }
                }
            }
                
                
                //HEAD
                
                self.addSubview(self.headImage)
                self.headImage.alpha = 0
                
                UIImageView.animate(withDuration: 1, delay: 0, options: [] , animations: {
                    self.headView.frame = CGRect(x: self.frame.size.width/2 - 390, y: (UIScreen.main.bounds.height/2) + 70, width: 96, height: 96)
                    self.headView.alpha = 0.2
                    self.headView.layer.cornerRadius = 48
                    
                    self.lineHead.alpha = 1
                    self.lineHead.frame = CGRect(x: self.frame.size.width/2 - 220, y: (UIScreen.main.bounds.height/2) - 30, width: 80, height: 2)
                    self.headLabelAppear()
                    
                }) { (completed) in
                    
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        UIView.animate(withDuration: 1) {
                            self.headImage.alpha = 1
                            self.headImageLogo.alpha = 1
                            self.headLabel.alpha = 1
                        }
                    }
                }

            
            
        }
    }
    
    func headLabelAppear() {

        addSubview(headImageLogo)
        headImageLogo.centerXAnchor.constraint(equalTo: headView.centerXAnchor).isActive = true
        headImageLogo.bottomAnchor.constraint(equalTo: headView.topAnchor, constant: -163).isActive = true
        headImageLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headImageLogo.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
        addSubview(headImageChoice)
        headImageChoice.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        headImageChoice.centerXAnchor.constraint(equalTo: headView.centerXAnchor, constant: 0).isActive = true
        headImageChoice.widthAnchor.constraint(equalToConstant: 22).isActive = true
        headImageChoice.heightAnchor.constraint(equalToConstant: 56).isActive = true
 
        addSubview(headImageRight)
        headImageRight.centerYAnchor.constraint(equalTo: headView.centerYAnchor, constant: 0).isActive = true
        headImageRight.centerXAnchor.constraint(equalTo: headView.centerXAnchor, constant: 0).isActive = true
        headImageRight.widthAnchor.constraint(equalToConstant: 13).isActive = true
        headImageRight.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        //correct image
        addSubview(headCorrectLabel)
        headCorrectLabel.centerYAnchor.constraint(equalTo: headView.centerYAnchor, constant: 0).isActive = true
        headCorrectLabel.trailingAnchor.constraint(equalTo: headView.leadingAnchor, constant: -16).isActive = true
        headCorrectLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        headCorrectLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true

        
        
    }
    
    func tailLabelAppear() {

        addSubview(aksaraImage)
        aksaraImage.alpha = 1
        aksaraImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 192).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        addSubview(aksaraNameLabel)
        aksaraNameLabel.topAnchor.constraint(equalTo: aksaraImage.bottomAnchor, constant: 80).isActive = true
        aksaraNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(tailImageLogo)
        tailImageLogo.centerXAnchor.constraint(equalTo: tailView.centerXAnchor).isActive = true
        tailImageLogo.bottomAnchor.constraint(equalTo: tailView.topAnchor, constant: -164).isActive = true
        tailImageLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        tailImageLogo.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
        addSubview(tailImageRight)
//        tailImageChoice.alpha = 0
        tailImageRight.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        tailImageRight.centerXAnchor.constraint(equalTo: tailView.centerXAnchor, constant: 0).isActive = true
        tailImageRight.widthAnchor.constraint(equalToConstant: 22).isActive = true
        tailImageRight.heightAnchor.constraint(equalToConstant: 56).isActive = true
 
        addSubview(tailImageChoice)
        tailImageChoice.centerYAnchor.constraint(equalTo: tailView.centerYAnchor, constant: 0).isActive = true
        tailImageChoice.centerXAnchor.constraint(equalTo: tailView.centerXAnchor, constant: 0).isActive = true
        tailImageChoice.widthAnchor.constraint(equalToConstant: 13).isActive = true
        tailImageChoice.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        //statememt
        addSubview(statementImage)
        statementImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        statementImage.bottomAnchor.constraint(equalTo: aksaraImage.topAnchor, constant: -56).isActive = true
        statementImage.heightAnchor.constraint(equalToConstant: 39).isActive = true
        statementImage.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        addSubview(statementLabel)
        statementLabel.centerXAnchor.constraint(equalTo: statementImage.centerXAnchor).isActive = true
        statementLabel.centerYAnchor.constraint(equalTo: statementImage.centerYAnchor).isActive = true
        
        //correct image
        addSubview(tailCorrectLabel)
        tailCorrectLabel.centerYAnchor.constraint(equalTo: tailView.centerYAnchor, constant: 0).isActive = true
        tailCorrectLabel.leadingAnchor.constraint(equalTo: tailView.trailingAnchor, constant: 16).isActive = true
        tailCorrectLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        tailCorrectLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        //continue Button
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
    
    
    func setupView() {
        addSubview(headButton1)
        headButton1.frame = originHead1Position

        addSubview(headButton2)
        headButton2.frame = originHead2Position

        addSubview(headButton3)
        headButton3.frame = originHead3Position

        addSubview(headPlaceHoldersButton)
        headPlaceHoldersButton.frame = headPlaceholderPosition
        
        
        addSubview(tailButton1)
        tailButton1.frame = originTail1Position

        addSubview(tailButton2)
        tailButton2.frame = originTail2Position

        addSubview(tailButton3)
        tailButton3.frame = originTail3Position

        addSubview(tailPlaceHoldersButton)
        tailPlaceHoldersButton.frame = tailPlaceholderPosition
        
        addSubview(headIcon)
        headIcon.bottomAnchor.constraint(equalTo: headButton1.topAnchor, constant: -16).isActive = true
        headIcon.centerXAnchor.constraint(equalTo: headButton1.centerXAnchor, constant: 0).isActive = true
        headIcon.heightAnchor.constraint(equalToConstant: 51).isActive = true
        headIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(tailIcon)
        tailIcon.bottomAnchor.constraint(equalTo: tailButton1.topAnchor, constant: -16).isActive = true
        tailIcon.centerXAnchor.constraint(equalTo: tailButton1.centerXAnchor, constant: 0).isActive = true
        tailIcon.heightAnchor.constraint(equalToConstant: 27).isActive = true
        tailIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        addSubview(questionLabel)
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionLabel.centerYAnchor.constraint(equalTo: headPlaceHoldersButton.centerYAnchor, constant: 0).isActive = true
        
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

