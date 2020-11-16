//
//  QuizViewTypeA.swift
//  QuizDrag&Drop
//
//  Created by Naratama on 14/11/20.
//

import UIKit
import AVFoundation

class QuizViewTypeAV2: BaseCell, UIGestureRecognizerDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originQuizImagePosition = CGRect(x: UIScreen.main.bounds.width/2 - 160, y: UIScreen.main.bounds.height/2 - 160, width: 320, height: 320)
    
    var player: AVAudioPlayer?
    
    let originQuizImagePositionAnswer = CGRect(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 83, width: 160, height: 120)
    let originStateTrueImagePositionAnswer = CGRect(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 131, width: 160, height: 120)
    
    var pulsatingLayer1 : CAShapeLayer!
    var pulsatingLayer2 : CAShapeLayer!
    var pulsatingLayer3 : CAShapeLayer!
    var pulsatingLayer4 : CAShapeLayer!
    var pulsatingLayerQuizImage : CAShapeLayer!
    
    lazy var quizImage: UIButton = {
        let button = UIButton()
        button.frame = originQuizImagePosition
        var image = UIImage(named: "Jawa Soal 1 Wa")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_ImageQuestion)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 100, left: 88, bottom: 100, right: 88)
        return button
    }()
    
    lazy var pilgan1Answer: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.textColor = Theme.current.accentWhite
        label.text = "Wa"
        label.frame = CGRect(x: SCREEN_WIDTH * 0.1691792295, y: SCREEN_HEIGHT * 0.2158273381, width: 100, height: 67)
        return label
    }()
    
    lazy var pilgan2Answer: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.textColor = Theme.current.accentWhite
        label.text = "Ta"
        label.frame = CGRect(x: SCREEN_WIDTH * 0.7671691792, y: SCREEN_HEIGHT * 0.2158273381, width: 100, height: 67)
        return label
    }()
    
    lazy var pilgan3Answer: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.textColor = Theme.current.accentWhite
        label.text = "Ca"
        label.frame = CGRect(x: SCREEN_WIDTH * 0.1691792295, y: SCREEN_HEIGHT * 0.7038369305, width: 100, height: 67)
        return label
    }()
    
    lazy var pilgan4Answer: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.textColor = Theme.current.accentWhite
        label.text = "Pa"
        label.frame = CGRect(x: SCREEN_WIDTH * 0.7671691792, y: SCREEN_HEIGHT * 0.7038369305, width: 100, height: 67)
        return label
    }()
    
    //State TrueOrFalse
    lazy var stateTrueAnswer: UIImageView = {
        let image = UIImageView(frame : originStateTrueImagePositionAnswer)
        image.image = UIImage(named: "Jawa Soal 1 Wa")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var stateFalseAnswer: UIImageView = {
        let image = UIImageView(frame : CGRect(x: UIScreen.main.bounds.width/2 + 152, y: UIScreen.main.bounds.height/2 - 131, width: 160, height: 120))
        image.image = UIImage(named: "Jawa Soal 1 Ta")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var stateLabelTrueAnswer: UILabel = {
        let label = UILabel(frame : CGRect(x: SCREEN_WIDTH/2 - 44, y: SCREEN_HEIGHT/2 + 30, width: 52, height: 38))
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.textColor = Theme.current.accentWhite
        label.text = "Wa"
        return label
    }()
    
    lazy var stateLabelFalseAnswer: UILabel = {
        let label = UILabel(frame : CGRect(x: SCREEN_WIDTH/2 + 187, y: SCREEN_HEIGHT/2 + 30, width: 52, height: 38))
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.textColor = Theme.current.accentWhite
        label.text = "Ta"
        return label
    }()
    
    lazy var viewStateExplain: UIImageView = {
        let image = UIImageView(frame : CGRect(x: SCREEN_WIDTH/2 - 160, y: SCREEN_HEIGHT/2 + 88, width: 320, height: 39))
        image.image = UIImage(named: "viewStateExplain")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var stateLabelExplain: UILabel = {
        let label = UILabel(frame : CGRect(x: SCREEN_WIDTH/2 - 107, y: SCREEN_HEIGHT/2 + 101, width: 214, height: 19))
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = "Jawaban kamu tepat sekali"
        return label
    }()
    
    lazy var trueState: UIImageView = {
        let image = UIImageView(frame : CGRect(x: SCREEN_WIDTH/2 + 20, y: SCREEN_HEIGHT/2 + 37, width: 24, height: 24))
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var falseState: UIImageView = {
        let image = UIImageView(frame : CGRect(x: SCREEN_WIDTH/2 + 243, y: SCREEN_HEIGHT/2 + 37, width: 24, height: 24))
        image.image = UIImage(named: "falseAnswer")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var lanjutStateButton: UIButton = {
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
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        
        return button
    }()
    
    //Gesture
    lazy var moveGS_ImageQuestion: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "ImageQuestion"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    
    private func setupCircleLayers() {
        pulsatingLayer1 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: pilgan1Answer.bounds.midX, y: pilgan1Answer.bounds.midY))
        pilgan1Answer.layer.addSublayer(pulsatingLayer1)
        
        pulsatingLayer2 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: pilgan2Answer.bounds.midX, y: pilgan2Answer.bounds.midY))
        pilgan2Answer.layer.addSublayer(pulsatingLayer2)
        
        pulsatingLayer3 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: pilgan3Answer.bounds.midX, y: pilgan3Answer.bounds.midY))
        pilgan3Answer.layer.addSublayer(pulsatingLayer3)
        
        pulsatingLayer4 = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: pilgan4Answer.bounds.midX, y: pilgan4Answer.bounds.midY))
        pilgan4Answer.layer.addSublayer(pulsatingLayer4)
        
        pulsatingLayerQuizImage = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: quizImage.frame.width/2, y: quizImage.frame.height/2))
        quizImage.layer.addSublayer(pulsatingLayerQuizImage)
        
        animatePulsatingLayerItemMoving()
    }
    
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor, position: CGPoint) -> CAShapeLayer {
        let layer = CAShapeLayer()
        //        layer.frame = originHead1Position
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 8, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = position
        return layer
    }
    
    private func animatePulsatingLayer() {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 8
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        
        groupAnimation.animations = [scaleDown,fade]
        
        pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
    }
    
    
    
    
    private func animatePulsatingLayerItemMoving() {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 20
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        
        groupAnimation.animations = [scaleDown,fade]
        
        pulsatingLayerQuizImage.add(groupAnimation, forKey: "pulsing")
    }
    
    func backgroundColor() {
        let colorTop =  UIColor(red: 8/255, green: 122/255, blue: 160/255, alpha: 1).cgColor
        let colorBottom = UIColor(red: 19/255.0, green: 63/255.0, blue: 95/255.0, alpha: 1).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.alpha = 0.2
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        backgroundColor()
        setupView()
        setupCircleLayers()
    }
    
    func setupView() {
        addSubview(quizImage)
        addSubview(pilgan1Answer)
        addSubview(pilgan2Answer)
        addSubview(pilgan3Answer)
        addSubview(pilgan4Answer)
    }
    
    func hiddenSetupView() {
        quizImage.isHidden = true
        pilgan1Answer.isHidden = true
        pilgan2Answer.isHidden = true
        pilgan3Answer.isHidden = true
        pilgan4Answer.isHidden = true
    }
    
    func setupViewAnswerStateTrue() {
        QuickStartReviewData.instance.quizesCorrectStatus[1] = true
        print(SCREEN_HEIGHT/2)
        hiddenSetupView()
        
        addSubview(stateTrueAnswer)
        addSubview(trueState)
        addSubview(stateLabelTrueAnswer)
        addSubview(viewStateExplain)
        addSubview(stateLabelExplain)
        
        addSubview(lanjutStateButton)
        lanjutStateButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lanjutStateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        lanjutStateButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        lanjutStateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupViewAnswerStateFalse() {
        QuickStartReviewData.instance.quizesCorrectStatus[1] = false
        hiddenSetupView()
        
        //Left
        addSubview(stateTrueAnswer)
        stateTrueAnswer.frame = CGRect(x: UIScreen.main.bounds.width/2 - 312, y: UIScreen.main.bounds.height/2 - 131, width: 160, height: 120)
        
        addSubview(trueState)
        trueState.frame = CGRect(x: SCREEN_WIDTH/2 - 212, y: SCREEN_HEIGHT/2 + 37, width: 24, height: 24)
        
        addSubview(stateLabelTrueAnswer)
        stateLabelTrueAnswer.frame = CGRect(x: SCREEN_WIDTH/2 - 276, y: SCREEN_HEIGHT/2 + 30, width: 52, height: 38)
        
        //Right
        addSubview(stateFalseAnswer)
        addSubview(falseState)
        addSubview(stateLabelFalseAnswer)
        addSubview(viewStateExplain)
        viewStateExplain.frame = CGRect(x: SCREEN_WIDTH/2 + 73, y: SCREEN_HEIGHT/2 + 88, width: 320, height: 39)
        
        stateLabelExplain.text = "Jawaban kamu belum benar"
        addSubview(stateLabelExplain)
        stateLabelExplain.frame = CGRect(x: SCREEN_WIDTH/2 + 124, y: SCREEN_HEIGHT/2 + 101, width: 224, height: 19)
        
        addSubview(lanjutStateButton)
        lanjutStateButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lanjutStateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        lanjutStateButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        lanjutStateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animationQuizQuickStart1Question(){
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: { [self] in
            quizImage.alpha = 0
            pilgan1Answer.frame = CGRect(x: SCREEN_WIDTH * 0.1691792295, y: SCREEN_HEIGHT * 0.2158273381 + 48, width: 100, height: 67)
            pilgan2Answer.frame = CGRect(x: SCREEN_WIDTH * 0.7671691792, y: SCREEN_HEIGHT * 0.2158273381 + 48, width: 100, height: 67)
            pilgan3Answer.frame = CGRect(x: SCREEN_WIDTH * 0.1691792295, y: SCREEN_HEIGHT * 0.7038369305 + 48, width: 100, height: 67)
            pilgan4Answer.frame = CGRect(x: SCREEN_WIDTH * 0.7671691792, y: SCREEN_HEIGHT * 0.7038369305 + 48, width: 100, height: 67)
            pilgan1Answer.alpha = 0.0
            pilgan2Answer.alpha = 0.0
            pilgan3Answer.alpha = 0.0
            pilgan4Answer.alpha = 0.0
        })
    }
    
    func animationQuizQuickStart1AnswerTrue(){
        self.stateTrueAnswer.alpha = 0.0
        self.trueState.alpha = 0.0
        self.stateLabelTrueAnswer.alpha = 0.0
        self.viewStateExplain.alpha = 0.0
        self.stateLabelExplain.alpha = 0.0
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: { [self] in
            UIView.animate(withDuration: 1.5) {
                self.stateTrueAnswer.alpha = 1.0
                self.trueState.alpha = 1.0
                self.stateLabelTrueAnswer.alpha = 1.0
                self.viewStateExplain.alpha = 1.0
                self.stateLabelExplain.alpha = 1.0
            }
            stateTrueAnswer.frame = originQuizImagePositionAnswer
            trueState.frame = CGRect(x: SCREEN_WIDTH/2 + 20, y: SCREEN_HEIGHT/2 + 85, width: 24, height: 24)
            stateLabelTrueAnswer.frame = CGRect(x: SCREEN_WIDTH/2 - 44, y: SCREEN_HEIGHT/2 + 78, width: 52, height: 38)
            viewStateExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 160, y: SCREEN_HEIGHT/2 + 136, width: 320, height: 39)
            stateLabelExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 107, y: SCREEN_HEIGHT/2 + 149, width: 214, height: 19)
        })
    }
    
    func animationQuizQuickStart1AnswerFalse(){
        self.stateTrueAnswer.alpha = 0.0
        self.trueState.alpha = 0.0
        self.stateLabelTrueAnswer.alpha = 0.0
        self.stateFalseAnswer.alpha = 0.0
        self.falseState.alpha = 0.0
        self.stateLabelFalseAnswer.alpha = 0.0
        self.viewStateExplain.alpha = 0.0
        self.stateLabelExplain.alpha = 0.0
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: { [self] in
            UIView.animate(withDuration: 1.5) {
                self.stateTrueAnswer.alpha = 1.0
                self.trueState.alpha = 1.0
                self.stateLabelTrueAnswer.alpha = 1.0
                self.stateFalseAnswer.alpha = 1.0
                self.falseState.alpha = 1.0
                self.stateLabelFalseAnswer.alpha = 1.0
                self.viewStateExplain.alpha = 1.0
                self.stateLabelExplain.alpha = 1.0
            }
            stateTrueAnswer.frame = CGRect(x: UIScreen.main.bounds.width/2 - 312, y: UIScreen.main.bounds.height/2 - 83, width: 160, height: 120)
            trueState.frame = CGRect(x: SCREEN_WIDTH/2 - 212, y: SCREEN_HEIGHT/2 + 85, width: 24, height: 24)
            stateLabelTrueAnswer.frame = CGRect(x: SCREEN_WIDTH/2 - 276, y: SCREEN_HEIGHT/2 + 78, width: 52, height: 38)
            stateFalseAnswer.frame = CGRect(x: UIScreen.main.bounds.width/2 + 152, y: UIScreen.main.bounds.height/2 - 83, width: 160, height: 120)
            falseState.frame = CGRect(x: SCREEN_WIDTH/2 + 243, y: SCREEN_HEIGHT/2 + 85, width: 24, height: 24)
            stateLabelFalseAnswer.frame = CGRect(x: SCREEN_WIDTH/2 + 187, y: SCREEN_HEIGHT/2 + 78, width: 52, height: 38)
            viewStateExplain.frame = CGRect(x: SCREEN_WIDTH/2 + 73, y: SCREEN_HEIGHT/2 + 136, width: 320, height: 39)
            stateLabelExplain.frame = CGRect(x: SCREEN_WIDTH/2 + 124, y: SCREEN_HEIGHT/2 + 149, width: 224, height: 19)
        })
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
    
    // MARK: Gesture to move selected object
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        let senderView = sender.view
        let name =  sender.name
        
        if sender.state == .ended {
            animatePulsatingLayerItemMoving()
            if (name == "ImageQuestion") {
                if (pilgan1Answer.frame.intersects(sender.view!.frame)) {
                    //DropDown&FadeOutAnimation
                    animationQuizQuickStart1Question()
                    
                    //AnswerPopUp
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        
                        self.setupViewAnswerStateTrue()
                        self.animationQuizQuickStart1AnswerTrue()
                        self.playSoundTrue()
                    }
                }
                else if (pilgan2Answer.frame.intersects(sender.view!.frame)) {
                    //DropDown&FadeOutAnimation
                    animationQuizQuickStart1Question()
                    
                    //AnswerPopUp
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        self.setupViewAnswerStateFalse()
                        self.animationQuizQuickStart1AnswerFalse()
                        self.playSoundFalse()
                    }
                }
                else if (pilgan3Answer.frame.intersects(sender.view!.frame)) {
                    stateLabelFalseAnswer.text = "Ca"
                    stateFalseAnswer.image = UIImage(named: "Jawa Soal 1 Ca")
                    //DropDown&FadeOutAnimation
                    animationQuizQuickStart1Question()
                    
                    //AnswerPopUp
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        self.setupViewAnswerStateFalse()
                        self.animationQuizQuickStart1AnswerFalse()
                        self.playSoundFalse()
                    }
                }
                else if (pilgan4Answer.frame.intersects(sender.view!.frame)) {
                    stateLabelFalseAnswer.text = "Pa"
                    stateFalseAnswer.image = UIImage(named: "Jawa Jawaban Pa")
                    stateFalseAnswer.setImageColor(color: .white)
                    //DropDown&FadeOutAnimation
                    animationQuizQuickStart1Question()
                    
                    //AnswerPopUp
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        self.setupViewAnswerStateFalse()
                        self.animationQuizQuickStart1AnswerFalse()
                        self.playSoundFalse()
                    }
                }
                else{
                    //animate go back to initial
                    UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                        sender.view?.transform = .identity
                        
                    }
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.pulsatingLayer1.removeAnimation(forKey: "pulsing")
                self.pulsatingLayer2.removeAnimation(forKey: "pulsing")
                self.pulsatingLayer3.removeAnimation(forKey: "pulsing")
                self.pulsatingLayer4.removeAnimation(forKey: "pulsing")
            }
            
        }
        
        if sender.state == .began {
            animatePulsatingLayer()
            
        } else if sender.state == .changed {
            let translation = sender.translation(in: self)
            senderView!.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            pulsatingLayerQuizImage.removeAnimation(forKey: "pulsing")
        }
    }
}

