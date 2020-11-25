//
//  QuizViewTypeA.swift
//  QuizDrag&Drop
//
//  Created by Naratama on 14/11/20.
//

import UIKit
import AVFoundation

class QuizViewTypeAV2: BaseCell, UIGestureRecognizerDelegate {
    
    var timer = Timer()
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originQuizImagePosition = CGRect(x: UIScreen.main.bounds.width/2 - 120, y: UIScreen.main.bounds.height/2 - 120, width: 240, height: 240)
    
    var player: AVAudioPlayer?
    
    let originQuizImagePositionAnswer = CGRect(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 75, width: 160, height: 120)
    let originStateTrueImagePositionAnswer = CGRect(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 163, width: 160, height: 120)
    var pulsatingLayer1 : CAShapeLayer!
    var pulsatingLayer2 : CAShapeLayer!
    var pulsatingLayer3 : CAShapeLayer!
    var pulsatingLayer4 : CAShapeLayer!
    var pulsatingLayerQuizImage : CAShapeLayer!
    
    lazy var quizImage: UIButton = {
        let button = UIButton()
        button.frame = originQuizImagePosition
        button.setTitle("Ja", for: .normal)
        button.setTitleColor(Theme.current.accentWhite, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        button.imageEdgeInsets = UIEdgeInsets(top: 86, left: 88, bottom: 86, right: 88)
        button.backgroundColor = .clear
        //        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        //        button.clipsToBounds = true
        button.layer.cornerRadius = 240/2
        
        return button
    }()
    
    lazy var pilgan1Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 1 Ja")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: SCREEN_WIDTH * 0.1691792295, y: SCREEN_HEIGHT * 0.2158273381, width: 100, height: 67)
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(moveGS_ImageQuestion1)
        return image
    }()
    
    lazy var pilgan2Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 1 Ca")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: SCREEN_WIDTH * 0.7671691792, y: SCREEN_HEIGHT * 0.2158273381, width: 100, height: 67)
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(moveGS_ImageQuestion2)
        return image
    }()
    
    lazy var pilgan3Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 1 Dha")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: SCREEN_WIDTH * 0.1691792295, y: SCREEN_HEIGHT * 0.7038369305, width: 100, height: 67)
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(moveGS_ImageQuestion3)
        return image
    }()
    
    lazy var pilgan4Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 1 Ma")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 255/255, blue: 255/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: SCREEN_WIDTH * 0.7671691792, y: SCREEN_HEIGHT * 0.7038369305, width: 100, height: 67)
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(moveGS_ImageQuestion4)
        return image
    }()
    
    //State TrueOrFalse
    lazy var stateTrueAnswer: UIImageView = {
        let image = UIImageView(frame : originStateTrueImagePositionAnswer)
        image.image = UIImage(named: "Jawa Soal 1 Ja")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var stateFalseAnswer: UIImageView = {
        let image = UIImageView(frame : CGRect(x: UIScreen.main.bounds.width/2 + 152, y: UIScreen.main.bounds.height/2 - 163, width: 160, height: 120))
        image.image = UIImage(named: "Jawa Soal 1 Ca")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var stateLabelTrueAnswer: UILabel = {
        let label = UILabel(frame : CGRect(x: SCREEN_WIDTH/2 - 26, y: SCREEN_HEIGHT/2 + 14, width: 52, height: 38))
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.textColor = Theme.current.accentWhite
        label.text = "Ja"
        return label
    }()
    
    lazy var stateLabelFalseAnswer: UILabel = {
        let label = UILabel(frame : CGRect(x: SCREEN_WIDTH/2 + 187, y: SCREEN_HEIGHT/2 + 14, width: 52, height: 38))
        label.textAlignment = .center
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.textColor = Theme.current.accentWhite
        label.text = "Ca"
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
        let image = UIImageView(frame : CGRect(x: SCREEN_WIDTH/2 + 134, y: SCREEN_HEIGHT/2 + 101, width: 20, height: 20))
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var falseState: UIImageView = {
        let image = UIImageView(frame : CGRect(x: SCREEN_WIDTH/2 + 134, y: SCREEN_HEIGHT/2 + 101, width: 20, height: 20))
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
    
    //--HintBottom--//
    let viewHintExplain: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "viewHintExplainQuiz6")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let infoHintImageView: UIImageView = {
        let imageView = UIImageView()
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        imageView.image = UIImage(systemName: "info.circle.fill", withConfiguration: boldConfig)?.withRenderingMode(.alwaysTemplate)
        imageView.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let hintLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite]
        
        
        let firstWord   = ""
        let secondWord = "Selanjutnya cocokkan aksara "
        let thirdWord   = "Ja "
        let fourWord   = "dan latinnya"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: fourWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        label.textAlignment = .center
        
        return label
    }()
    
    //Gesture
    lazy var moveGS_ImageQuestion1: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "ImageQuestion"
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_ImageQuestion2: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "ImageQuestion"
        moveGS.delegate = self
        moveGS.index = 1
        
        return moveGS
    }()
    
    lazy var moveGS_ImageQuestion3: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "ImageQuestion"
        moveGS.delegate = self
        moveGS.index = 2
        
        return moveGS
    }()
    
    lazy var moveGS_ImageQuestion4: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "ImageQuestion"
        moveGS.delegate = self
        moveGS.index = 3
        
        return moveGS
    }()
    
    //AnimationHint
    lazy var circleAnimateMove1: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.1691792295 + 30, y: SCREEN_HEIGHT * 0.2158273381 + 10, width: 40, height: 40))
        view.backgroundColor = .white
        view.alpha = 0
        view.layer.cornerRadius = 40/2
        return view
    }()
    
    lazy var circleAnimateMove2: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.7671691792 + 30, y: SCREEN_HEIGHT * 0.2158273381 + 10, width: 40, height: 40))
        view.backgroundColor = .white
        view.alpha = 0
        view.layer.cornerRadius = 40/2
        return view
    }()
    
    lazy var circleAnimateMove3: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.1691792295 + 30, y: SCREEN_HEIGHT * 0.7038369305 + 10, width: 40, height: 40))
        view.backgroundColor = .white
        view.alpha = 0
        view.layer.cornerRadius = 40/2
        return view
    }()
    
    lazy var circleAnimateMove4: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.7671691792 + 30, y: SCREEN_HEIGHT * 0.7038369305 + 10, width: 40, height: 40))
        view.backgroundColor = .white
        view.alpha = 0
        view.layer.cornerRadius = 40/2
        return view
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
        
        animatePulsatingLayer()
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
    
    private func animatePulsatingLayer() {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime() + 0.5
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        
        
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 720
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
        scaleDown.toValue = 1600
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
        
        setupTimerInactivity()
        backgroundColor()
        setupView()
        setupCircleLayers()
    }
    
    func setupTimerInactivity() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
        let resetTimer = UITapGestureRecognizer(target: self, action: #selector(resetTimers))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(resetTimer)
    }
    
    @objc func doStuff() {
        // perform any action you wish to
        print("User inactive for more than 5 seconds .")
        setupHintCircleAnimation()
        timer.invalidate()
    }
    
    @objc func resetTimers() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
    }
    
    func setupHintCircleAnimation() {
        addSubview(circleAnimateMove1)
        addSubview(circleAnimateMove2)
        addSubview(circleAnimateMove3)
        addSubview(circleAnimateMove4)
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.repeat, .curveLinear], animations: { [self] in
            UIView.animate(withDuration: 0.6) {
                self.circleAnimateMove1.alpha = 0.2
                self.circleAnimateMove2.alpha = 0.2
                self.circleAnimateMove3.alpha = 0.2
                self.circleAnimateMove4.alpha = 0.2
            }
            circleAnimateMove1.frame = CGRect(x: SCREEN_WIDTH/2 - 20, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            circleAnimateMove2.frame = CGRect(x: SCREEN_WIDTH/2 - 20, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            circleAnimateMove3.frame = CGRect(x: SCREEN_WIDTH/2 - 20, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            circleAnimateMove4.frame = CGRect(x: SCREEN_WIDTH/2 - 20, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            self.circleAnimateMove1.alpha = 0.0
            self.circleAnimateMove2.alpha = 0.0
            self.circleAnimateMove3.alpha = 0.0
            self.circleAnimateMove4.alpha = 0.0
        })
    }
    
    func setupView() {
        addSubview(quizImage)
        addSubview(pilgan1Answer)
        addSubview(pilgan2Answer)
        addSubview(pilgan3Answer)
        addSubview(pilgan4Answer)
        
        addSubview(viewHintExplain)
        viewHintExplain.topAnchor.constraint(equalTo: quizImage.bottomAnchor, constant: 64).isActive = true
        viewHintExplain.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewHintExplain.heightAnchor.constraint(equalToConstant: 39).isActive = true
        viewHintExplain.widthAnchor.constraint(equalToConstant: 440).isActive = true
        
        viewHintExplain.addSubview(hintLabel)
        hintLabel.centerYAnchor.constraint(equalTo: viewHintExplain.centerYAnchor, constant: 4).isActive = true
        hintLabel.centerXAnchor.constraint(equalTo: viewHintExplain.centerXAnchor,constant: 15).isActive = true
        hintLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        hintLabel.widthAnchor.constraint(equalToConstant: 343).isActive = true
        
        viewHintExplain.addSubview(infoHintImageView)
        infoHintImageView.centerYAnchor.constraint(equalTo: hintLabel.centerYAnchor).isActive = true
        infoHintImageView.trailingAnchor.constraint(equalTo: hintLabel.leadingAnchor, constant: -8).isActive = true
        infoHintImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        infoHintImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
    }
    
    func hiddenSetupView() {
        willRemoveSubview(circleAnimateMove1)
        willRemoveSubview(circleAnimateMove2)
        willRemoveSubview(circleAnimateMove3)
        willRemoveSubview(circleAnimateMove4)
        willRemoveSubview(quizImage)
        willRemoveSubview(pilgan1Answer)
        willRemoveSubview(pilgan2Answer)
        willRemoveSubview(pilgan3Answer)
        willRemoveSubview(pilgan4Answer)
    }
    
    func setupViewAnswerStateTrue() {
        QuickStartReviewData.instance.quizesCorrectStatus[1] = true
        print(SCREEN_HEIGHT/2)
        hiddenSetupView()
        
        addSubview(stateTrueAnswer)
        addSubview(stateLabelTrueAnswer)
        addSubview(viewStateExplain)
        addSubview(trueState)
        addSubview(stateLabelExplain)
        
        addSubview(lanjutStateButton)
        lanjutStateButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lanjutStateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        lanjutStateButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        lanjutStateButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupViewAnswerStateFalse() {
        QuickStartReviewData.instance.quizesCorrectStatus[1] = false
        hiddenSetupView()
        
        //Left
        addSubview(stateTrueAnswer)
        stateTrueAnswer.frame = CGRect(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 163, width: 160, height: 120)
        
        addSubview(stateLabelTrueAnswer)
        stateLabelTrueAnswer.frame = CGRect(x: SCREEN_WIDTH/2 - 26, y: SCREEN_HEIGHT/2 + 14, width: 52, height: 38)
        
        //Right
        addSubview(viewStateExplain)
        viewStateExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 160, y: SCREEN_HEIGHT/2 + 88, width: 320, height: 39)
        addSubview(falseState)
        
        stateLabelExplain.text = "Jawaban kamu belum benar"
        addSubview(stateLabelExplain)
        stateLabelExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 107, y: SCREEN_HEIGHT/2 + 101, width: 224, height: 19)
        
        addSubview(lanjutStateButton)
        lanjutStateButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        lanjutStateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
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
            stateLabelTrueAnswer.frame = CGRect(x: SCREEN_WIDTH/2 - 26, y: SCREEN_HEIGHT/2 + 72, width: 52, height: 38)
            viewStateExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 160, y: SCREEN_HEIGHT/2 + 128, width: 320, height: 39)
            trueState.frame = CGRect(x: SCREEN_WIDTH/2 + 134, y: SCREEN_HEIGHT/2 + 141, width: 20, height: 20)
            stateLabelExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 107, y: SCREEN_HEIGHT/2 + 141, width: 214, height: 19)
        })
    }
    
    func animationQuizQuickStart1AnswerFalse(){
        self.stateTrueAnswer.alpha = 0.0
        self.stateLabelTrueAnswer.alpha = 0.0
        self.falseState.alpha = 0.0
        self.viewStateExplain.alpha = 0.0
        self.stateLabelExplain.alpha = 0.0
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: { [self] in
            UIView.animate(withDuration: 1.5) {
                self.stateTrueAnswer.alpha = 1.0
                self.stateLabelTrueAnswer.alpha = 1.0
                self.falseState.alpha = 1.0
                self.viewStateExplain.alpha = 1.0
                self.stateLabelExplain.alpha = 1.0
            }
            stateTrueAnswer.frame = CGRect(x: UIScreen.main.bounds.width/2 - 80, y: UIScreen.main.bounds.height/2 - 75, width: 160, height: 120)
            stateLabelTrueAnswer.frame = CGRect(x: SCREEN_WIDTH/2 - 26, y: SCREEN_HEIGHT/2 + 72, width: 52, height: 38)
            viewStateExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 160, y: SCREEN_HEIGHT/2 + 128, width: 320, height: 39)
            falseState.frame = CGRect(x: SCREEN_WIDTH/2 + 134, y: SCREEN_HEIGHT/2 + 141, width: 20, height: 20)
            stateLabelExplain.frame = CGRect(x: SCREEN_WIDTH/2 - 107, y: SCREEN_HEIGHT/2 + 141, width: 224, height: 19)
        })
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
        circleAnimateMove1.isHidden = true
        circleAnimateMove2.isHidden = true
        circleAnimateMove3.isHidden = true
        circleAnimateMove4.isHidden = true
        let senderView = sender.view
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: { [self] in
            viewHintExplain.alpha = 0.0
        })
        
        
        if sender.state == .ended {
            animatePulsatingLayer()
            //            if (name == "ImageQuestion") {
            if (quizImage.frame.intersects(sender.view!.frame) && sender.index == 0) {
                //DropDown&FadeOutAnimation
                pilgan1Answer.alpha = 0
                animationQuizQuickStart1Question()
                
                //AnswerPopUp
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.setupViewAnswerStateTrue()
                    self.animationQuizQuickStart1AnswerTrue()
                    self.playSoundTrue()
                }
                
                print("benar")
            }
            else if (quizImage.frame.intersects(sender.view!.frame) && sender.index == 1) {
                //DropDown&FadeOutAnimation
                pilgan2Answer.alpha = 0
                animationQuizQuickStart1Question()
                
                //AnswerPopUp
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.setupViewAnswerStateFalse()
                    self.animationQuizQuickStart1AnswerFalse()
                    self.playSoundFalse()
                }
                
                print("salah1")
            }
            else if (quizImage.frame.intersects(sender.view!.frame) && sender.index == 2) {
                //DropDown&FadeOutAnimation
                pilgan3Answer.alpha = 0
                animationQuizQuickStart1Question()
                
                //AnswerPopUp
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.setupViewAnswerStateFalse()
                    self.animationQuizQuickStart1AnswerFalse()
                    self.playSoundFalse()
                }
                
                print("salah 2")
            }
            else if (quizImage.frame.intersects(sender.view!.frame) && sender.index == 3) {
                //DropDown&FadeOutAnimation
                pilgan4Answer.alpha = 0
                animationQuizQuickStart1Question()
                
                //AnswerPopUp
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                    self.setupViewAnswerStateFalse()
                    self.animationQuizQuickStart1AnswerFalse()
                    self.playSoundFalse()
                }
                
                print("salah3")
            }
            else{
                //animate go back to initial
                UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    sender.view?.transform = .identity
                    print("CEKKKK")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [self] in
                        circleAnimateMove1.isHidden = false
                        circleAnimateMove2.isHidden = false
                        circleAnimateMove3.isHidden = false
                        circleAnimateMove4.isHidden = false
                    }
                }
            }
            //            }
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.pulsatingLayerQuizImage.removeAnimation(forKey: "pulsing")
                self.viewHintExplain.removeFromSuperview()
            }
            
        }
        
        if sender.state == .began {
            playSoundDrag()
            animatePulsatingLayerItemMoving()
            
            
        } else if sender.state == .changed {
            let translation = sender.translation(in: self)
            senderView!.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            self.pulsatingLayer1.removeAnimation(forKey: "pulsing")
            self.pulsatingLayer2.removeAnimation(forKey: "pulsing")
            self.pulsatingLayer3.removeAnimation(forKey: "pulsing")
            self.pulsatingLayer4.removeAnimation(forKey: "pulsing")
        }
    }
}

