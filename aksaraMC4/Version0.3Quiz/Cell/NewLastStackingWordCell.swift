//
//  NewLastStackingWordCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 03/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class NewLastStackingWordCell: UICollectionViewCell {
    
    var player: AVAudioPlayer?
    var pulsatingLayerAksara1 : CAShapeLayer!
    var pulsatingLayerAksara2 : CAShapeLayer!
    var pulsatingLayerAksara3 : CAShapeLayer!
    var pulsatingLayerAksara4 : CAShapeLayer!
    var pulsatingLayerAksara5 : CAShapeLayer!
    
    var pulsatingLayerPlaceholder1 : CAShapeLayer!
    var pulsatingLayerPlaceholder2 : CAShapeLayer!
    var pulsatingLayerPlaceholder3 : CAShapeLayer!
    var pulsatingLayerPlaceholder4 : CAShapeLayer!
    var pulsatingLayerPlaceholder5 : CAShapeLayer!
    
    var placeholderDone1 : Bool? = false
    var placeholderDone2 : Bool? = false
    var placeholderDone3 : Bool? = false
    var placeholderDone4 : Bool? = false
    var placeholderDone5 : Bool? = false
    
    
    

    
    let wordLabel: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 40)
        label.text = "Jogja"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
//        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var aksaraButton1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "susun jogja soal 1")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Aksara1)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var aksaraButton2: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "susun jogja soal 2")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Aksara2)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var aksaraButton3: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "susun jogja soal 3")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Aksara3)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var aksaraButton4: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "susun jogja soal 4")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Aksara4)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var aksaraButton5: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "susun jogja soal 5")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_Aksara5)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .clear
        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var placeholder1 : UIButton = {
        let button = UIButton()
//        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
//        button.setImage(image, for: .normal)
//        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
//        button.addGestureRecognizer(moveGS_Aksara)
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.current.accentWhite.cgColor
//        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
//        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()

    lazy var placeholder2 : UIButton = {
        let button = UIButton()
//        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
//        button.setImage(image, for: .normal)
//        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
//        button.addGestureRecognizer(moveGS_Aksara)
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.current.accentWhite.cgColor
//        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
//        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var placeholder3 : UIButton = {
        let button = UIButton()
//        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
//        button.setImage(image, for: .normal)
//        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
//        button.addGestureRecognizer(moveGS_Aksara)
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.current.accentWhite.cgColor
//        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
//        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var placeholder4 : UIButton = {
        let button = UIButton()
//        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
//        button.setImage(image, for: .normal)
//        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
//        button.addGestureRecognizer(moveGS_Aksara)
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.current.accentWhite.cgColor
//        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
//        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    lazy var placeholder5 : UIButton = {
        let button = UIButton()
//        var image = UIImage(named: "Jawa Soal 4 Wa")?.withRenderingMode(.alwaysTemplate)
//        button.setImage(image, for: .normal)
//        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
//        button.addGestureRecognizer(moveGS_Aksara)
        button.layer.borderWidth = 1
        button.layer.borderColor = Theme.current.accentWhite.cgColor
//        button.imageView?.contentMode = .scaleAspectFit
//        button.backgroundColor = UIColor.init(white: 1, alpha: 0.3)
//        button.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
        button.layer.cornerRadius = 32
        return button
    }()
    
    
    //--------- NEW VIEW ------ //
    
    let wordLabelNew: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Jogja"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
//        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let hintImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "hintSusunJogja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1

        return image
    }()
    
    
    let jogjaImageResult: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "aksaraJogja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1

        return image
    }()
    
    let hintImageResult: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "succesHintJogja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1

        return image
    }()
    
    lazy var continueButton : UIButton = {
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
        button.tag = 0
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.alpha = 0
        button.layer.cornerRadius = 24
//        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    

    //----------------- MOVE GESTURE ------------------------//
    lazy var moveGS_Aksara1: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Aksara 1"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_Aksara2: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Aksara 2"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 1
        
        return moveGS
    }()
    
    lazy var moveGS_Aksara3: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Aksara 3"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 2
        
        return moveGS
    }()
    
    lazy var moveGS_Aksara4: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Aksara 4"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 3
        
        return moveGS
    }()
    
    lazy var moveGS_Aksara5: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Aksara 5"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 4
        
        return moveGS
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        setBackgroundDragnDrop()
        setupLayout()
        setupCircleLayer()
        setupAnimationHint()
        
    }

    func setupAnimationHint() {
        hintImage.frame = CGRect(x: self.frame.size.width/2 - 239  , y: self.frame.size.height/2 + 168 - 80 , width: 480, height: 71)
        hintImage.alpha = 0
        UIView.animate(withDuration: 1, delay: 1) { [self] in
            hintImage.alpha = 1
            hintImage.frame = CGRect(x: self.frame.size.width/2 - 239  , y: self.frame.size.height/2 + 168 , width: 480, height: 71)
        }
        
        //hint dissapear by time
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
            UIView.animate(withDuration: 0.5) {
                self.hintImage.alpha = 0
            }
        }
        
        
//        UIView.animate(withDuration: 1, delay: 8) { [self] in
//            hintImage.alpha = 0
////            hintImage.frame = CGRect(x: self.frame.size.width/2 - 239  , y: self.frame.size.height/2 + 168 , width: 480, height: 71)
//        }
    }
    
    //create pulsating layer
    
    private func createCircleShapeLayer1(strokeColor: UIColor, fillColor: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 1, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        layer.path = circularPath.cgPath
        layer.strokeColor = strokeColor.cgColor
        layer.lineWidth = 20
        layer.fillColor = fillColor.cgColor
        layer.lineCap = CAShapeLayerLineCap.round
        layer.position = .init(x: 32, y: 32)
        return layer
    }
    
    func setupCircleLayer() {
        pulsatingLayerAksara1 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraButton1.layer.addSublayer(pulsatingLayerAksara1)
        
        pulsatingLayerAksara2 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraButton2.layer.addSublayer(pulsatingLayerAksara2)
        
        pulsatingLayerAksara3 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraButton3.layer.addSublayer(pulsatingLayerAksara3)
        
        pulsatingLayerAksara4 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraButton4.layer.addSublayer(pulsatingLayerAksara4)
        
        pulsatingLayerAksara5 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        aksaraButton5.layer.addSublayer(pulsatingLayerAksara5)
        
        //placeholder
        pulsatingLayerPlaceholder1 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        placeholder1.layer.addSublayer(pulsatingLayerPlaceholder1)
        
        pulsatingLayerPlaceholder2 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        placeholder2.layer.addSublayer(pulsatingLayerPlaceholder2)
        
        pulsatingLayerPlaceholder3 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        placeholder3.layer.addSublayer(pulsatingLayerPlaceholder3)
        
        pulsatingLayerPlaceholder4 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        placeholder4.layer.addSublayer(pulsatingLayerPlaceholder4)
        
        pulsatingLayerPlaceholder5 = createCircleShapeLayer1(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6))
        placeholder5.layer.addSublayer(pulsatingLayerPlaceholder5)
        
        
        animatePulsatingLayer()
    }
    
    func animatePulsatingLayer() {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 36
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
      

//        pulsatingLayerAksara1.add(groupAnimation, forKey: "pulsing")
//        pulsatingLayerAksara2.add(groupAnimation, forKey: "pulsing")
//        pulsatingLayerAksara3.add(groupAnimation, forKey: "pulsing")
//        pulsatingLayerAksara4.add(groupAnimation, forKey: "pulsing")
//        pulsatingLayerAksara5.add(groupAnimation, forKey: "pulsing")
        
        //if placeholder done then aksara not pulsating anymore
        if placeholderDone1 == true {
            pulsatingLayerAksara5.removeAnimation(forKey: "pulsing")
        } else {
            pulsatingLayerAksara5.add(groupAnimation, forKey: "pulsing")
        }
        
        if placeholderDone2 == true {
            pulsatingLayerAksara4.removeAnimation(forKey: "pulsing")
        } else {
            pulsatingLayerAksara4.add(groupAnimation, forKey: "pulsing")
        }
        
        if placeholderDone3 == true {
            pulsatingLayerAksara3.removeAnimation(forKey: "pulsing")
        } else {
            pulsatingLayerAksara3.add(groupAnimation, forKey: "pulsing")
        }
        
        if placeholderDone4 == true {
            pulsatingLayerAksara2.removeAnimation(forKey: "pulsing")
        } else {
            pulsatingLayerAksara2.add(groupAnimation, forKey: "pulsing")
        }
        
        if placeholderDone5 == true {
            pulsatingLayerAksara1.removeAnimation(forKey: "pulsing")
        } else {
            pulsatingLayerAksara1.add(groupAnimation, forKey: "pulsing")
        }
    }
    
    func animatePulsatingLayerPlaceholder() {
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 36
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
      
    
        pulsatingLayerPlaceholder1.add(groupAnimation, forKey: "pulsing")
        pulsatingLayerPlaceholder2.add(groupAnimation, forKey: "pulsing")
        pulsatingLayerPlaceholder3.add(groupAnimation, forKey: "pulsing")
        pulsatingLayerPlaceholder4.add(groupAnimation, forKey: "pulsing")
        pulsatingLayerPlaceholder5.add(groupAnimation, forKey: "pulsing")

        
    }
    
    func setupLayout() {
        
        addSubview(wordLabel)
        wordLabel.frame = CGRect(x: self.frame.size.width/2 - 55, y: 199, width: 110, height: 48)
        
        addSubview(aksaraButton1)
        aksaraButton1.frame = CGRect(x: self.frame.size.width/2 - 192, y: self.frame.size.height/2 - 118, width: 64, height: 64)
        
        addSubview(aksaraButton2)
        aksaraButton2.frame = CGRect(x: self.frame.size.width/2 - 112, y: self.frame.size.height/2 - 118, width: 64, height: 64)
        
        addSubview(aksaraButton3)
        aksaraButton3.frame = CGRect(x: self.frame.size.width/2 - 32, y: self.frame.size.height/2 - 118, width: 64, height: 64)
        
        addSubview(aksaraButton4)
        aksaraButton4.frame = CGRect(x: self.frame.size.width/2 + 48, y: self.frame.size.height/2 - 118, width: 64, height: 64)
        
        addSubview(aksaraButton5)
        aksaraButton5.frame = CGRect(x: self.frame.size.width/2 + 128, y: self.frame.size.height/2 - 118, width: 64, height: 64)
        
        addSubview(placeholder1)
        placeholder1.frame = CGRect(x: self.frame.size.width/2 - 140 , y: self.frame.size.height/2 - 8, width: 64, height: 64)
        
        addSubview(placeholder2)
        placeholder2.frame = CGRect(x: self.frame.size.width/2 - 68 , y: self.frame.size.height/2 - 8, width: 64, height: 64)
        
        addSubview(placeholder3)
        placeholder3.frame = CGRect(x: self.frame.size.width/2 + 4 , y: self.frame.size.height/2 - 8, width: 64, height: 64)
        
        addSubview(placeholder4)
        placeholder4.frame = CGRect(x: self.frame.size.width/2 + 75 , y: self.frame.size.height/2 - 8, width: 64, height: 64)
        
        addSubview(placeholder5)
        placeholder5.frame = CGRect(x: self.frame.size.width/2 + 75 , y: self.frame.size.height/2 + 62 , width: 64, height: 64)
        
        addSubview(hintImage)
        hintImage.frame = CGRect(x: self.frame.size.width/2 - 239  , y: self.frame.size.height/2 + 168 - 80 , width: 480, height: 71)
    }
    
    func setupNewView() {
        
        addSubview(continueButton)
        continueButton.alpha = 0
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        
        
        addSubview(wordLabelNew)
        wordLabelNew.alpha = 0
        wordLabelNew.frame = CGRect(x: self.frame.size.width/2 - 44  , y: self.frame.size.height/2 + 65 - 80, width: 480, height: 71)
        
        
        addSubview(hintImageResult)
        hintImage.alpha = 0
        hintImageResult.frame = CGRect(x: self.frame.size.width/2 - 120  , y: self.frame.size.height/2 + 135 - 80, width: 240, height: 39)
        
        addSubview(jogjaImageResult)
        jogjaImageResult.alpha = 0
        jogjaImageResult.frame = CGRect(x: self.frame.size.width/2 - 202  , y: self.frame.size.height/2 - 177 - 80, width: 405, height: 200)
        
        UIView.animate(withDuration: 1) { [self] in
//            addSubview(wordLabel)
            wordLabelNew.alpha = 1
            wordLabelNew.frame = CGRect(x: self.frame.size.width/2 - 44  , y: self.frame.size.height/2 + 65, width: 480, height: 71)
            
            
//            addSubview(hintImageResult)
            hintImageResult.alpha = 1
            hintImageResult.frame = CGRect(x: self.frame.size.width/2 - 120  , y: self.frame.size.height/2 + 135, width: 240, height: 39)
            
//            addSubview(jogjaImageResult)
            jogjaImageResult.alpha = 1
            jogjaImageResult.frame = CGRect(x: self.frame.size.width/2 - 202  , y: self.frame.size.height/2 - 177 , width: 405, height: 200)
            
            continueButton.alpha = 1
        }
    }
    
    func dissapearView() {
        
        UIView.animate(withDuration: 2) { [self] in
            wordLabel.alpha = 0
            aksaraButton1.alpha = 0
            aksaraButton2.alpha = 0
            aksaraButton3.alpha = 0
            aksaraButton4.alpha = 0
            aksaraButton5.alpha = 0

            placeholder1.alpha = 0
            placeholder2.alpha = 0
            placeholder3.alpha = 0
            placeholder4.alpha = 0
            placeholder5.alpha = 0
        } completion: { [self] (complete) in
            wordLabel.removeFromSuperview()
            aksaraButton1.removeFromSuperview()
            aksaraButton2.removeFromSuperview()
            aksaraButton3.removeFromSuperview()
            aksaraButton4.removeFromSuperview()
            aksaraButton5.removeFromSuperview()

            placeholder1.removeFromSuperview()
            placeholder2.removeFromSuperview()
            placeholder3.removeFromSuperview()
            placeholder4.removeFromSuperview()
            placeholder5.removeFromSuperview()
            
            setupNewView()
            
        }

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
    
    func playSoundResult() {
        guard let url = Bundle.main.url(forResource: "Hasil_Bagus_B", withExtension: "mp3") else { return }
        
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


extension  NewLastStackingWordCell:  UIGestureRecognizerDelegate {
    
    
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
    
        let groupAnimation = CAAnimationGroup()
        groupAnimation.beginTime = CACurrentMediaTime()
        groupAnimation.duration = 1
        groupAnimation.autoreverses = false
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)


        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.toValue = 36
        let fade = CABasicAnimation(keyPath: "opacity")
        fade.toValue = 0
        groupAnimation.animations = [scaleDown,fade]
        
        
        if sender.state == .began {
            //start pulsating placeholder
            playSoundDrag()
            animatePulsatingLayerPlaceholder()
            //end pulsating on aksara
            if sender.index == 0 {
                pulsatingLayerAksara2.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara3.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara4.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara5.removeAnimation(forKey: "pulsing")
            } else if sender.index == 1 {
                pulsatingLayerAksara1.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara3.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara4.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara5.removeAnimation(forKey: "pulsing")
            } else if sender.index == 2 {
                pulsatingLayerAksara1.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara2.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara4.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara5.removeAnimation(forKey: "pulsing")
            } else if sender.index == 3 {
                pulsatingLayerAksara1.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara2.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara3.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara5.removeAnimation(forKey: "pulsing")
            } else if sender.index == 4 {
                pulsatingLayerAksara1.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara2.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara3.removeAnimation(forKey: "pulsing")
                pulsatingLayerAksara4.removeAnimation(forKey: "pulsing")
            }
            
            
            
        } else if sender.state == .changed {
            
            if sender.index == 0 {
                let translation = sender.translation(in: self)
                aksaraButton1.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            } else if sender.index == 1 {
                let translation = sender.translation(in: self)
                aksaraButton2.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            } else if sender.index == 2 {
                let translation = sender.translation(in: self)
                aksaraButton3.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            } else if sender.index == 3 {
                let translation = sender.translation(in: self)
                aksaraButton4.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            } else if sender.index == 4 {
                let translation = sender.translation(in: self)
                aksaraButton5.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
            }

            
            
        } else if sender.state == .ended {
            

            //remove pulsating in placeholder
            pulsatingLayerPlaceholder1.removeAnimation(forKey: "pulsing")
            pulsatingLayerPlaceholder2.removeAnimation(forKey: "pulsing")
            pulsatingLayerPlaceholder3.removeAnimation(forKey: "pulsing")
            pulsatingLayerPlaceholder4.removeAnimation(forKey: "pulsing")
            pulsatingLayerPlaceholder5.removeAnimation(forKey: "pulsing")
            
            //start pulsating on all aksara
            animatePulsatingLayer()
            
            
            //sender position right
            if sender.index == 4 {
                if (placeholder1.frame.intersects(sender.view!.frame)) {
                    playSoundTrue()
                    print("placeholder 1 benar")
                    self.placeholderDone1 = true
                    placeholder1.setImage(UIImage(named: "susun jogja jawaban 1"), for: .normal)
                    placeholder1.imageView?.contentMode = .scaleAspectFit
                    placeholder1.backgroundColor = .clear
                    placeholder1.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
                    pulsatingLayerAksara5.removeAnimation(forKey: "pulsing")
                    
                    placeholder1.layer.borderWidth = 2
                    placeholder1.layer.borderColor = UIColor.systemGreen.cgColor
                    
                } else {
                    playSoundFalse()
                }
            } else if sender.index == 3 {
                if (placeholder2.frame.intersects(sender.view!.frame)) {
                    playSoundTrue()
                    print("placeholder 2 benar")
                    self.placeholderDone2 = true
                    placeholder2.setImage(UIImage(named: "susun jogja jawaban 2"), for: .normal)
                    placeholder2.imageView?.contentMode = .scaleAspectFit
                    placeholder2.backgroundColor = .clear
                    placeholder2.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
                    pulsatingLayerAksara4.removeAnimation(forKey: "pulsing")
                    
                    placeholder2.layer.borderWidth = 2
                    placeholder2.layer.borderColor = UIColor.systemGreen.cgColor
                } else {
                    playSoundFalse()
                }
            } else if sender.index == 2 {
                if (placeholder3.frame.intersects(sender.view!.frame)) {
                    playSoundTrue()
                    print("placeholder 3 benar")
                    self.placeholderDone3 = true
                    placeholder3.setImage(UIImage(named: "susun jogja jawaban 3"), for: .normal)
                    placeholder3.imageView?.contentMode = .scaleAspectFit
                    placeholder3.backgroundColor = .clear
                    placeholder3.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
                    pulsatingLayerAksara3.removeAnimation(forKey: "pulsing")
                    
                    placeholder3.layer.borderWidth = 2
                    placeholder3.layer.borderColor = UIColor.systemGreen.cgColor
                    
                }  else {
                    playSoundFalse()
                }
            } else if sender.index == 1 {
                if (placeholder4.frame.intersects(sender.view!.frame)) {
                    playSoundTrue()
                    print("placeholder 4 benar")
                    self.placeholderDone4 = true
                    placeholder4.setImage(UIImage(named: "susun jogja jawaban 4"), for: .normal)
                    placeholder4.imageView?.contentMode = .scaleAspectFit
                    placeholder4.backgroundColor = .clear
                    placeholder4.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
                    pulsatingLayerAksara2.removeAnimation(forKey: "pulsing")
                    
                    placeholder4.layer.borderWidth = 2
                    placeholder4.layer.borderColor = UIColor.systemGreen.cgColor
                }  else {
                    playSoundFalse()
                }
            } else if sender.index == 0 {
                if (placeholder5.frame.intersects(sender.view!.frame)) {
                    playSoundTrue()
                    print("placeholder 5 benar")
                    self.placeholderDone5 = true
                    placeholder5.setImage(UIImage(named: "susun jogja jawaban 5"), for: .normal)
                    placeholder5.imageView?.contentMode = .scaleAspectFit
                    placeholder5.backgroundColor = .clear
                    placeholder5.imageEdgeInsets = UIEdgeInsets(top: 18, left: 18, bottom: 18, right: 18)
                    pulsatingLayerAksara1.removeAnimation(forKey: "pulsing")
                    
                    placeholder5.layer.borderWidth = 2
                    placeholder5.layer.borderColor = UIColor.systemGreen.cgColor
                }  else {
                    playSoundFalse()
                }
            }
            
            
            
            //animate go back to initial
            UIView.animate(withDuration: 1,delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                if sender.index == 0 {
                    self.aksaraButton1.transform = .identity
                } else if sender.index == 1 {
                    self.aksaraButton2.transform = .identity
                } else if sender.index == 2 {
                    self.aksaraButton3.transform = .identity
                } else if sender.index == 3 {
                    self.aksaraButton4.transform = .identity
                } else if sender.index == 4 {
                    self.aksaraButton5.transform = .identity
                }
            }
            
            //benar semua
            if placeholderDone1 == true && placeholderDone2 == true && placeholderDone3 == true && placeholderDone4 == true && placeholderDone5 == true {
                print("BENAR SEMUA")
                dissapearView()
                playSoundResult()
            }
            
            
        }
        
        
        
    }
    
    
}
