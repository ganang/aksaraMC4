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
    let originHead1Position = CGRect(x: (UIScreen.main.bounds.width/2) - 403 , y: (UIScreen.main.bounds.height/2) - 152, width: 80, height: 80)
    let originHead2Position = CGRect(x: (UIScreen.main.bounds.width / 2) - 403, y: (UIScreen.main.bounds.height/2) - 32, width: 80, height: 80)
    let originHead3Position = CGRect(x: (UIScreen.main.bounds.width / 2) - 403, y: (UIScreen.main.bounds.height/2) + 88, width: 80, height: 80)
    let headPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width / 2) - 220 , y: (UIScreen.main.bounds.height/2) - 72, width: 140, height: 140)
    
    let originTail1Position = CGRect(x: (UIScreen.main.bounds.width/2) + 315 , y: (UIScreen.main.bounds.height/2) - 152, width: 80, height: 80)
    let originTail2Position = CGRect(x: (UIScreen.main.bounds.width / 2) + 315, y: (UIScreen.main.bounds.height/2) - 32, width: 80, height: 80)
    let originTail3Position = CGRect(x: (UIScreen.main.bounds.width / 2) + 315, y: (UIScreen.main.bounds.height/2) + 88, width: 80, height: 80)
    let tailPlaceholderPosition = CGRect(x: (UIScreen.main.bounds.width / 2) + 80 , y: (UIScreen.main.bounds.height/2) - 72, width: 140, height: 140)
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
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
    
    var aksaraName = ["Ja", "Sa", "Tha"]
    var aksaraQuestion : String? = "Ja"
    
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 56)
        label.text = "Ja"
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
    
    //HEAD
    let headIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "headImage")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        
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
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        //        image.alpha = 0
        
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
    
    //--HintBottom--//
    let viewHintExplain: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "viewHintExplainDD")
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
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        
        let firstWord   = ""
        let secondWord = "Masih ingat yang tadi ?\n"
        let thirdWord   = "Coba susun "
        let fourWord   = "Aksara Ja "
        let fiveWord   = "berdasarkan "
        let sixWord   = "kepala "
        let sevenWord   = "dan "
        let eightWord   = "ekornya "
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: fourWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: fiveWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: sixWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: sevenWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: eightWord, attributes: attrs as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        label.textAlignment = .center
        
        return label
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
        image.image = UIImage(named: "Jawa Soal 4 Ja")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0
        
        return image
    }()
    
    let aksaraNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Ja"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    let statementImage: UIImageView = {
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width/2) - 160 , y: (UIScreen.main.bounds.height/2) + 12, width: 320, height: 138))
        image.image = UIImage(named: "statementContainer")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let statementLabel: UILabel = {
        let label = UILabel(frame : CGRect(x: (UIScreen.main.bounds.width/2) - 110, y: (UIScreen.main.bounds.height/2) + 76, width: 220, height: 19))
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
        image.image = UIImage(named: "Jawa Kepala Ja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let lineHead: UIImageView = {
        let image = UIImageView(frame : CGRect(x: UIScreen.main.bounds.width/2 - 40, y: (UIScreen.main.bounds.height/2) - 41 , width: 80, height: 2))
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
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width / 2) - 258, y: (UIScreen.main.bounds.height/2) - 176, width: 40, height: 56))
        image.image = UIImage(named: "headImage")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        return image
    }()
    
    let headImageChoice: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Kepala Ja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headImageRight: UIImageView = {
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width / 2) - 258, y: (UIScreen.main.bounds.height/2) - 68, width: 40, height: 56))
        image.image = UIImage(named: "Jawa Kepala Ja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let headCorrectLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
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
        image.image = UIImage(named: "Jawa Ekor Ja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailLine: UIImageView = {
        let image = UIImageView(frame : CGRect(x: UIScreen.main.bounds.width/2 - 40, y: (UIScreen.main.bounds.height/2) - 41 , width: 80, height: 2))
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
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width / 2) + 210, y: (UIScreen.main.bounds.height/2) - 176, width: 40, height: 56))
        image.image = UIImage(named: "tailImage")
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
        image.contentMode = .scaleAspectFit
        image.setImageColor(color: UIColor.init(displayP3Red: 255/255, green: 223/255, blue: 118/255, alpha: 1))
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
    
    let tailImageRight: UIImageView = {
        let image = UIImageView(frame : CGRect(x: (UIScreen.main.bounds.width / 2) + 210, y: (UIScreen.main.bounds.height/2) - 68, width: 40, height: 56))
        image.image = UIImage(named: "Jawa Ekor Ja")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
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
    lazy var circleAnimateMove1: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.1691792295 + 30, y: SCREEN_HEIGHT / 2 - 20, width: 40, height: 40))
        view.backgroundColor = .white
        view.alpha = 0
        view.layer.cornerRadius = 40/2
        return view
    }()
    
    lazy var circleAnimateMove2: UIView = {
        let view = UIView(frame : CGRect(x: SCREEN_WIDTH * 0.7671691792 + 30, y: SCREEN_HEIGHT / 2 - 20, width: 40, height: 40))
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
        addSubview(circleAnimateMove1)
        addSubview(circleAnimateMove2)
        
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.repeat, .curveLinear], animations: { [self] in
            UIView.animate(withDuration: 0.6) {
                self.circleAnimateMove1.alpha = 0.2
                self.circleAnimateMove2.alpha = 0.2
            }
            circleAnimateMove1.frame = CGRect(x: SCREEN_WIDTH/2 - 160, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            circleAnimateMove2.frame = CGRect(x: SCREEN_WIDTH/2 + 160, y: SCREEN_HEIGHT/2 - 20, width: 40, height: 40)
            self.circleAnimateMove1.alpha = 0.0
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
        
        pulsatingLayerGuideHead = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.init(white: 1, alpha: 0.6), position: CGPoint(x: headPlaceHoldersButton.frame.width/2, y: headPlaceHoldersButton.frame.height/2))
        headPlaceHoldersButton.layer.addSublayer(pulsatingLayerGuideHead)
        
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
        
        pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
        
        pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
        pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
    }
    
    
    private func animatePulsatingLayerItemMovingHead() {
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
        
        pulsatingLayerGuideHead.add(groupAnimation, forKey: "pulsing")
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
        self.pulsatingLayer1.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer2.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer3.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer4.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer5.removeAnimation(forKey: "pulsing")
        self.pulsatingLayer6.removeAnimation(forKey: "pulsing")
    }
    
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        circleAnimateMove1.isHidden = true
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
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: { [self] in
            viewHintExplain.alpha = 0.0
        })
        
        if name == "Head" {
            
            
            if sender.state == .began {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
                playSoundDrag()
                animatePulsatingLayerItemMovingHead()
            } else if sender.state == .changed {
                if sender.index == 0 {
                    let translation = sender.translation(in: self)
                    headButton1.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                } else if sender.index == 1 {
                    let translation = sender.translation(in: self)
                    headButton2.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                } else if sender.index == 2 {
                    let translation = sender.translation(in: self)
                    headButton3.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                }
                
                removeGestureAnimation()
                
                UIView.animate(withDuration: 1) {
                    self.headPlaceHoldersButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                    
                    self.headPlaceHoldersButton.setImage(UIImage(named: "elipsHeadUnfill"), for: .normal)
                    self.tailPlaceHoldersButton.alpha = 0.2
                }
                
            } else if sender.state == .ended {
                self.tailPlaceHoldersButton.alpha = 1.0
                self.headPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 220 , y: (UIScreen.main.bounds.height/2) - 72, width: 140, height: 140)
                
                pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer4.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer5.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer6.add(groupAnimation, forKey: "pulsing")
                
                
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
                }else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { [self] in
                        circleAnimateMove1.isHidden = false
                        circleAnimateMove2.isHidden = false
                    }
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.pulsatingLayerGuideHead.removeAnimation(forKey: "pulsing")
                }
            }
        } else if name == "Tail" {
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
                    
                    self.tailPlaceHoldersButton.setImage(UIImage(named: "elipsTailUnfill"), for: .normal)
                    self.headPlaceHoldersButton.alpha = 0.2
                }
                
            } else if sender.state == .ended {
                self.headPlaceHoldersButton.alpha = 1.0
                self.tailPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 80 , y: (UIScreen.main.bounds.height/2) - 72, width: 140, height: 140)
                
                pulsatingLayer1.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer2.add(groupAnimation, forKey: "pulsing")
                pulsatingLayer3.add(groupAnimation, forKey: "pulsing")
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
                        circleAnimateMove1.isHidden = false
                        circleAnimateMove2.isHidden = false
                    }
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
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                    self.pulsatingLayerGuideTail.removeAnimation(forKey: "pulsing")
                }
                
            }
        }
    }
    
    func checkAnswer() {
        if isHeadPlaceholdersFilled == true && isTailPlaceholdersFilled == true {
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
            
            answerTransitionAnimation()
        }
    }
    
    func answerTransitionAnimation() {
        removeGestureAnimation()
        UIView.animate(withDuration: 1.0) { [self] in
            viewHintExplain.removeFromSuperview()
            
            //--Animation Change--//
            headButton1.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 483 , y: (UIScreen.main.bounds.height/2) - 152, width: 80, height: 80)
            headButton2.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 483, y: (UIScreen.main.bounds.height/2) - 32, width: 80, height: 80)
            headButton3.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 483, y: (UIScreen.main.bounds.height/2) + 88, width: 80, height: 80)
            tailButton1.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 395 , y: (UIScreen.main.bounds.height/2) - 152, width: 80, height: 80)
            tailButton2.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 395, y: (UIScreen.main.bounds.height/2) - 32, width: 80, height: 80)
            tailButton3.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 395, y: (UIScreen.main.bounds.height/2) + 88, width: 80, height: 80)
            headIcon.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 483 , y: (UIScreen.main.bounds.height/2) - 225, width: 40, height: 52)
            tailIcon.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 395 , y: (UIScreen.main.bounds.height/2) - 225, width: 40, height: 52)
            
            headButton1.alpha = 0
            headButton2.alpha = 0
            headButton3.alpha = 0
            tailButton1.alpha = 0
            tailButton2.alpha = 0
            tailButton3.alpha = 0
            headIcon.alpha = 0
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
        self.tailLine.frame = CGRect(x: (UIScreen.main.bounds.width / 2), y: (UIScreen.main.bounds.height/2), width: 80, height: 2)
        
        addSubview(headView)
        headView.alpha = 0
        self.headView.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 223 + 153, y: (UIScreen.main.bounds.height/2) - 70, width: 140, height: 140)
        headView.layer.cornerRadius = 70
        
        addSubview(lineHead)
        lineHead.alpha = 0
        self.lineHead.frame = CGRect(x: (UIScreen.main.bounds.width / 2), y: (UIScreen.main.bounds.height/2), width: 80, height: 2)
        
        UIView.animate(withDuration: 1.0) { [self] in
            //TAIL
            self.addSubview(self.tailImage)
            self.tailImage.alpha = 0
            
            UIImageView.animate(withDuration: 0.4, delay: 0, options: [] , animations: {
                
                self.tailLine.alpha = 1
                self.tailLine.frame = CGRect(x: self.frame.size.width/2 + 140, y: (UIScreen.main.bounds.height/2) - 41 , width: 80, height: 2)
                self.tailLabelAppear()
            }) { (completed) in
                //head appear after finish
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UIView.animate(withDuration: 1) {
                        self.tailImage.alpha = 1
                        self.tailLabel.alpha = 1
                    }
                }
            }
            
            
            //HEAD
            
            self.addSubview(self.headImage)
            self.headImage.alpha = 0
            
            UIImageView.animate(withDuration: 0.4, delay: 0, options: [] , animations: {
                
                self.lineHead.alpha = 1
                self.lineHead.frame = CGRect(x: self.frame.size.width/2 - 220, y: (UIScreen.main.bounds.height/2) - 41, width: 80, height: 2)
                self.headLabelAppear()
                
            }) { (completed) in
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    UIView.animate(withDuration: 1) {
                        self.headImage.alpha = 1
                        self.headLabel.alpha = 1
                    }
                }
            }
            
            
        }
    }
    
    func headLabelAppear() {
        
        headPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 348, y: (UIScreen.main.bounds.height/2) + 36, width: 140, height: 140)
        
        addSubview(headImageLogo)
        headImageLogo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 306, y: (UIScreen.main.bounds.height/2) - 176, width: 40, height: 56)
        
        
        addSubview(headImageRight)
        headImageRight.frame = CGRect(x: (UIScreen.main.bounds.width / 2) - 306, y: (UIScreen.main.bounds.height/2) - 68, width: 40, height: 56)
        
        headCorrectLabel.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            UIView.animate(withDuration: 1) { [self] in
                //correct image
                addSubview(headCorrectLabel)
                headCorrectLabel.alpha = 1
                headCorrectLabel.centerYAnchor.constraint(equalTo: headPlaceHoldersButton.centerYAnchor, constant: 0).isActive = true
                headCorrectLabel.trailingAnchor.constraint(equalTo: headPlaceHoldersButton.leadingAnchor, constant: -16).isActive = true
                headCorrectLabel.heightAnchor.constraint(equalToConstant: 32).isActive = true
                headCorrectLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
            }
        }
        
        
    }
    
    func tailLabelAppear() {
        
        addSubview(aksaraImage)
        aksaraImage.alpha = 1
        aksaraImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 172).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 120).isActive = true

        //Ja Jawaban
        questionLabel.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        questionLabel.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 18 , y: (UIScreen.main.bounds.height/2) + 60, width: 37, height: 38)
        
        tailPlaceHoldersButton.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 208, y: (UIScreen.main.bounds.height/2) + 36, width: 140, height: 140)
        
        addSubview(tailImageLogo)
        tailImageLogo.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 258, y: (UIScreen.main.bounds.height/2) - 176, width: 40, height: 56)
        
        addSubview(tailImageRight)
        tailImageRight.frame = CGRect(x: (UIScreen.main.bounds.width / 2) + 258, y: (UIScreen.main.bounds.height/2) - 68, width: 40, height: 56)
        
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
                statementImage.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 160 , y: (UIScreen.main.bounds.height/2) + 60, width: 320, height: 138)
                
                addSubview(statementLabel)
                statementLabel.alpha = 1
                statementLabel.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 110 , y: (UIScreen.main.bounds.height/2) + 124, width: 220, height: 19)
                
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
        headIcon.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 380 , y: (UIScreen.main.bounds.height/2) - 225, width: 40, height: 52)
        
        addSubview(tailIcon)
        tailIcon.frame = CGRect(x: (UIScreen.main.bounds.width/2) + 340 , y: (UIScreen.main.bounds.height/2) - 225, width: 40, height: 52)
        
        addSubview(questionLabel)
        questionLabel.frame = CGRect(x: (UIScreen.main.bounds.width/2) - 32 , y: (UIScreen.main.bounds.height/2) - 39, width: 64, height: 67)
        
        addSubview(viewHintExplain)
        viewHintExplain.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -145).isActive = true
        viewHintExplain.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        viewHintExplain.heightAnchor.constraint(equalToConstant: 71).isActive = true
        viewHintExplain.widthAnchor.constraint(equalToConstant: 520).isActive = true
        
        viewHintExplain.addSubview(hintLabel)
        hintLabel.centerYAnchor.constraint(equalTo: viewHintExplain.centerYAnchor, constant: 2).isActive = true
        hintLabel.centerXAnchor.constraint(equalTo: viewHintExplain.centerXAnchor).isActive = true
        hintLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        hintLabel.widthAnchor.constraint(equalToConstant: 435).isActive = true
        
        viewHintExplain.addSubview(infoHintImageView)
        infoHintImageView.topAnchor.constraint(equalTo: hintLabel.topAnchor, constant: -4).isActive = true
        infoHintImageView.centerXAnchor.constraint(equalTo: viewHintExplain.centerXAnchor, constant: -108).isActive = true
        infoHintImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        infoHintImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
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

