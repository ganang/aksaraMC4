//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class QuizHeadAndTailCell: BaseCell, UIGestureRecognizerDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originHeadAPosition = CGRect(x: 40, y: (UIScreen.main.bounds.height - 121)/2 - 68, width: 64, height: 64)
    let originHeadBPosition = CGRect(x: 112, y: (UIScreen.main.bounds.height - 121)/2 - 68, width: 64, height: 64)
    let originHeadCPosition = CGRect(x: 40, y: (UIScreen.main.bounds.height - 121)/2 + 4, width: 64, height: 64)
    let originHeadDPosition = CGRect(x: 112, y: (UIScreen.main.bounds.height - 121)/2 + 4, width: 64, height: 64)
    
    let originTailAPosition = CGRect(x: UIScreen.main.bounds.width - 112, y: (UIScreen.main.bounds.height - 121)/2 - 68, width: 64, height: 64)
    let originTailBPosition = CGRect(x: UIScreen.main.bounds.width - 184, y: (UIScreen.main.bounds.height - 121)/2 - 68, width: 64, height: 64)
    let originTailCPosition = CGRect(x: UIScreen.main.bounds.width - 112, y: (UIScreen.main.bounds.height - 121)/2 + 4, width: 64, height: 64)
    let originTailDPosition = CGRect(x: UIScreen.main.bounds.width - 184, y: (UIScreen.main.bounds.height - 121)/2 + 4, width: 64, height: 64)
    
    let originHeaderHead = CGRect(x: 73, y: (UIScreen.main.bounds.height - 121)/2 - 96, width: 100, height: 20)
    let originHeaderTail = CGRect(x: UIScreen.main.bounds.width - 136, y: (UIScreen.main.bounds.height - 121)/2 - 96, width: 100, height: 20)
    
    var isHeadFill = false
    var isTailFill = false
    
    var headQuestion: String?
    var tailQuestion: String?
    var headAnswer: String?
    var tailAnswer: String?
    
    var centerPlaceHolderConstraint: NSLayoutConstraint?
    
    var delegate : QuizControllerProtocol?
    
    let generator = UINotificationFeedbackGenerator()
    var player: AVAudioPlayer?
    
    var regionSelected: String?
    var quizData: Quiz? {
        didSet {
            
            let region: String = String(regionSelected!)
            // setup questions
            let questions = quizData?.questions?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Question]
            let questionName: String = (questions?[0].name!)!
            headQuestion = "Head \(questionName)"
            tailQuestion = "Tail \(questionName)"
            
            // set question text
            let attrs1 = [NSAttributedString.Key.font : UIFont.init(name: "NowAlt-Medium", size: 24), NSAttributedString.Key.foregroundColor : Theme.current.textColor1]
            let attrs2 = [NSAttributedString.Key.font : UIFont.init(name: "NowAlt-Bold", size: 24), NSAttributedString.Key.foregroundColor : Theme.current.textColor1]
            let attributedString1 = NSMutableAttributedString(string: "Bagaimana anatomi aksara ", attributes: attrs1 as [NSAttributedString.Key : Any])
            let attributedString2 = NSMutableAttributedString(string: questionName, attributes: attrs2 as [NSAttributedString.Key : Any])
            let attributedString3 = NSMutableAttributedString(string: " ?", attributes: attrs1 as [NSAttributedString.Key : Any])
            attributedString1.append(attributedString2)
            attributedString1.append(attributedString3)
            self.questionLabel.attributedText = attributedString1
            
            // set question image
            let image = UIImage(named: "Jawa Jawaban \(questionName)")?.withRenderingMode(.alwaysTemplate)
            questionPlaceholder.setImage(image, for: .normal)
            aksaraLabel.text = questionName
            
            // setup answers
            let answerChoices = quizData?.answerChoices?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [AnswerChoice]
            
            let answerChoice1: String = (answerChoices?[0].name)!
            let answerChoice2: String = (answerChoices?[1].name)!
            let answerChoice3: String = (answerChoices?[2].name)!
            let answerChoice4: String = (answerChoices?[3].name)!
            let answerChoice5: String = (answerChoices?[4].name)!
            let answerChoice6: String = (answerChoices?[5].name)!
            let answerChoice7: String = (answerChoices?[6].name)!
            let answerChoice8: String = (answerChoices?[7].name)!
            
            moveGS_HeadA.viewName = "\(region) Kepala \(answerChoice1)"
            moveGS_HeadB.viewName = "\(region) Kepala \(answerChoice2)"
            moveGS_HeadC.viewName = "\(region) Kepala \(answerChoice3)"
            moveGS_HeadD.viewName = "\(region) Kepala \(answerChoice4)"
            moveGS_TailA.viewName = "\(region) Ekor \(answerChoice5)"
            moveGS_TailB.viewName = "\(region) Ekor \(answerChoice6)"
            moveGS_TailC.viewName = "\(region) Ekor \(answerChoice7)"
            moveGS_TailD.viewName = "\(region) Ekor \(answerChoice8)"
            
            moveGS_HeadA.aksaraName = "Head \(answerChoice1)"
            moveGS_HeadB.aksaraName = "Head \(answerChoice2)"
            moveGS_HeadC.aksaraName = "Head \(answerChoice3)"
            moveGS_HeadD.aksaraName = "Head \(answerChoice4)"
            moveGS_TailA.aksaraName = "Tail \(answerChoice5)"
            moveGS_TailB.aksaraName = "Tail \(answerChoice6)"
            moveGS_TailC.aksaraName = "Tail \(answerChoice7)"
            moveGS_TailD.aksaraName = "Tail \(answerChoice8)"
            
            let imageHeadA = UIImage(named: "\(region) Kepala \(answerChoice1)")?.withRenderingMode(.alwaysTemplate)
            let imageHeadB = UIImage(named: "\(region) Kepala \(answerChoice2)")?.withRenderingMode(.alwaysTemplate)
            let imageHeadC = UIImage(named: "\(region) Kepala \(answerChoice3)")?.withRenderingMode(.alwaysTemplate)
            let imageHeadD = UIImage(named: "\(region) Kepala \(answerChoice4)")?.withRenderingMode(.alwaysTemplate)
            let imageTailA = UIImage(named: "\(region) Ekor \(answerChoice5)")?.withRenderingMode(.alwaysTemplate)
            let imageTailB = UIImage(named: "\(region) Ekor \(answerChoice6)")?.withRenderingMode(.alwaysTemplate)
            let imageTailC = UIImage(named: "\(region) Ekor \(answerChoice7)")?.withRenderingMode(.alwaysTemplate)
            let imageTailD = UIImage(named: "\(region) Ekor \(answerChoice8)")?.withRenderingMode(.alwaysTemplate)
            
            headA.setImage(imageHeadA, for: .normal)
            headB.setImage(imageHeadB, for: .normal)
            headC.setImage(imageHeadC, for: .normal)
            headD.setImage(imageHeadD, for: .normal)
            
            tailA.setImage(imageTailA, for: .normal)
            tailB.setImage(imageTailB, for: .normal)
            tailC.setImage(imageTailC, for: .normal)
            tailD.setImage(imageTailD, for: .normal)
        }
    }
    
    lazy var placeholderHead: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.95)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 1), alpha: 0.1, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var placeholderTail: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.95)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let headerHeadLabel: UILabel = {
        let label = UILabel()
        label.text = "Kepala"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let headerTailLabel: UILabel = {
        let label = UILabel()
        label.text = "Ekor"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let footerPlaceholderHead: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kepala"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let footerPlaceholderTail: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ekor"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cek", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        button.setCheckButtonBackgroundColor(withOpacity: 0.6)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.clipsToBounds = true
        
        button.addTarget(self, action: #selector(handleCheckButton), for: .touchUpInside)
        button.isEnabled = false
        button.layer.masksToBounds = false
        
        return button
    }()
    
    
    // Handle continue Button
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Lanjut", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 130, bottom: 0, right: 0)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.clipsToBounds = true
        button.isEnabled = true
        button.isHidden = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var questionPlaceholder: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Da")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.isHidden = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var checkPlaceholderHead: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Da")?.withRenderingMode(.alwaysTemplate)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.isHidden = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var checkPlaceholderTail: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Da")?.withRenderingMode(.alwaysTemplate)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.isHidden = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    let questionFullDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Aksara Utuh :"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    let answersFullDetailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Jawaban Kamu :"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ha"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    let answerHeadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kepala"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    let answerTailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ekor"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    // --------------------------------------------------------------------------------------------------- //
    
    lazy var moveGS_HeadA: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_HeadB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_HeadC: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_HeadD: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailA: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailC: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailD: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var headA: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadA)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var headB: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Na")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadB)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var headC: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ca")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadC)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var headD: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ra")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_HeadD)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var tailA: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ka")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailA)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var tailB: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Da")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailB)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var tailC: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Tha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailC)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var tailD: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Sa")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_TailD)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    override func setupViews() {
        setBackgroundColor()
        
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        addSubview(placeholderHead)
        addSubview(placeholderTail)
        
        addSubview(questionLabel)
        addSubview(headerHeadLabel)
        addSubview(headerTailLabel)
        addSubview(footerPlaceholderHead)
        addSubview(footerPlaceholderTail)
        
        addSubview(headA)
        addSubview(headB)
        addSubview(headC)
        addSubview(headD)
        
        addSubview(tailA)
        addSubview(tailB)
        addSubview(tailC)
        addSubview(tailD)
        
        addSubview(checkButton)
        addSubview(continueButton)
        
        addSubview(questionPlaceholder)
        addSubview(checkPlaceholderHead)
        addSubview(checkPlaceholderTail)
        
        addSubview(questionFullDetailLabel)
        addSubview(aksaraLabel)
        addSubview(answersFullDetailLabel)
    }
    
    func setupConstraint() {
        placeholderHead.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        placeholderHead.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderHead.heightAnchor.constraint(equalToConstant: 100).isActive = true
        centerPlaceHolderConstraint =  placeholderHead.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -72)
        centerPlaceHolderConstraint?.isActive = true
        
        placeholderTail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        placeholderTail.leadingAnchor.constraint(equalTo: placeholderHead.trailingAnchor, constant: 24).isActive = true
        placeholderTail.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderTail.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        headerHeadLabel.frame = originHeaderHead
        headerTailLabel.frame = originHeaderTail
        
        footerPlaceholderHead.topAnchor.constraint(equalTo: placeholderHead.bottomAnchor, constant: 16).isActive = true
        footerPlaceholderHead.centerXAnchor.constraint(equalTo: placeholderHead.centerXAnchor).isActive = true
        
        footerPlaceholderTail.topAnchor.constraint(equalTo: placeholderTail.bottomAnchor, constant: 16).isActive = true
        footerPlaceholderTail.centerXAnchor.constraint(equalTo: placeholderTail.centerXAnchor).isActive = true
        
        headA.frame = originHeadAPosition
        headB.frame = originHeadBPosition
        headC.frame = originHeadCPosition
        headD.frame = originHeadDPosition
        
        tailA.frame = originTailAPosition
        tailB.frame = originTailBPosition
        tailC.frame = originTailCPosition
        tailD.frame = originTailDPosition
        
        checkButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        checkButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        questionPlaceholder.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -120).isActive = true
        questionPlaceholder.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        questionPlaceholder.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questionPlaceholder.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        checkPlaceholderHead.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 56).isActive = true
        checkPlaceholderHead.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkPlaceholderHead.widthAnchor.constraint(equalToConstant: 100).isActive = true
        checkPlaceholderHead.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        checkPlaceholderTail.leadingAnchor.constraint(equalTo: checkPlaceholderHead.trailingAnchor, constant: 24).isActive = true
        checkPlaceholderTail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkPlaceholderTail.widthAnchor.constraint(equalToConstant: 100).isActive = true
        checkPlaceholderTail.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionFullDetailLabel.bottomAnchor.constraint(equalTo: questionPlaceholder.topAnchor, constant: -16).isActive = true
        questionFullDetailLabel.centerXAnchor.constraint(equalTo: questionPlaceholder.centerXAnchor).isActive = true
        
        aksaraLabel.topAnchor.constraint(equalTo: checkPlaceholderHead.bottomAnchor, constant: 16).isActive = true
        aksaraLabel.centerXAnchor.constraint(equalTo: questionPlaceholder.centerXAnchor).isActive = true
        
        answersFullDetailLabel.leadingAnchor.constraint(equalTo: checkPlaceholderHead.centerXAnchor).isActive = true
        answersFullDetailLabel.bottomAnchor.constraint(equalTo: checkPlaceholderHead.topAnchor, constant: -16).isActive = true
    }
    
    @objc func handleCheckButton() {
        hideViewAfterCheck()
        showViewAfterCheck()
        
        // remove the original layer background
        placeholderHead.removeLayer(name: "dragAndDropLayer")
        placeholderTail.removeLayer(name: "dragAndDropLayer")
        
        checkAnswers()
        
        delegate?.stopTimerChoosen()
        
        // centering the placeholder
        centerPlaceHolderConstraint?.constant = 120
        layoutIfNeeded()
    }
    
    func checkAnswers() {
        if (headQuestion == headAnswer && tailQuestion == tailAnswer) {
            // handle true
            questionLabel.text = "Benar sekali 😄"
            questionLabel.textColor = Theme.current.accentTextGreen
            placeholderHead.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderTail.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            
            
//            delegate?.setTrueStatus()
            
            // handle continue button
            self.continueButton.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
            
            playSoundTrue()
            generator.notificationOccurred(.success)
        } else {
            // handle false
            questionLabel.text = "Sayang sekali ☹️"
            questionLabel.textColor = Theme.current.accentTextRed
//            delegate?.setFalseStatus()
            
            // handle continue button
            self.continueButton.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
            
            if (headQuestion == headAnswer) {
                placeholderHead.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            } else {
                placeholderHead.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
                placeholderHead.shake()
            }
            
            if (tailQuestion == tailAnswer) {
                placeholderTail.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            } else {
                placeholderTail.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
                placeholderTail.shake()
            }
            
            playSoundFalse()
            generator.notificationOccurred(.error)
        }
    }
    
    func hideViewAfterCheck() {
        headA.isHidden = true
        headB.isHidden = true
        headC.isHidden = true
        headD.isHidden = true
        tailA.isHidden = true
        tailB.isHidden = true
        tailC.isHidden = true
        tailD.isHidden = true
        headerHeadLabel.isHidden = true
        headerTailLabel.isHidden = true
        checkButton.isHidden = true
    }
    
    func showViewAfterCheck() {
        continueButton.isHidden = false
        questionPlaceholder.isHidden = false
        questionFullDetailLabel.isHidden = false
        answersFullDetailLabel.isHidden = false
        aksaraLabel.isHidden = false
    }
    
    func handleTimer() {
        hideViewAfterCheck()
        showViewAfterCheck()
        
        // remove the original layer background
        placeholderHead.removeLayer(name: "dragAndDropLayer")
        placeholderTail.removeLayer(name: "dragAndDropLayer")
        
        // handle false
        questionLabel.text = "Sayang sekali waktumu habis ☹️"
        questionLabel.textColor = Theme.current.accentTextRed
//        delegate?.setFalseStatus()
        
        // handle continue button
        self.continueButton.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
        
        if (headQuestion == headAnswer) {
            placeholderHead.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        } else {
            placeholderHead.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderHead.shake()
        }
        
        if (tailQuestion == tailAnswer) {
            placeholderTail.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        } else {
            placeholderTail.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderTail.shake()
        }
        
        generator.notificationOccurred(.error)
        // centering the placeholder
        centerPlaceHolderConstraint?.constant = 120
        layoutIfNeeded()
    }
    
    func updateStatusCheckButton() {
        if (isHeadFill && isTailFill) {
            checkButton.removeLayer(name: "check")
            checkButton.setCheckButtonBackgroundColor(withOpacity: 1)
            checkButton.isEnabled = true
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
        let senderView = sender.view
        let name =  sender.name
        let aksaraName = sender.aksaraName
        let viewName = sender.viewName
        
        if sender.state == .ended {
            
            if (name == "Head") {
                if (placeholderHead.frame.intersects(sender.view!.frame)) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderHead.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderHead.setImage(image, for: .normal)
                    placeholderHead.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderHead.tintColor = .white
                    headAnswer = aksaraName
                    
                    checkPlaceholderHead.setImage(image, for: .normal)
                    checkPlaceholderHead.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    checkPlaceholderHead.tintColor = .white
                    
                    // reset backgroundColor of head
                    headA.removeLayer(name: "dragAndDrop")
                    headB.removeLayer(name: "dragAndDrop")
                    headC.removeLayer(name: "dragAndDrop")
                    headD.removeLayer(name: "dragAndDrop")
                    headA.tintColor = .systemBlue
                    headB.tintColor = .systemBlue
                    headC.tintColor = .systemBlue
                    headD.tintColor = .systemBlue
                    sender.view!.setChoosenBackgroundColor()
                    sender.view!.tintColor = .white
                    
                    isHeadFill = true
                    updateStatusCheckButton()
                }
            } else {
                if (placeholderTail.frame.intersects(sender.view!.frame)) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderTail.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderTail.setImage(image, for: .normal)
                    placeholderTail.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderTail.tintColor = .white
                    tailAnswer = aksaraName
                    
                    checkPlaceholderTail.setImage(image, for: .normal)
                    checkPlaceholderTail.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    checkPlaceholderTail.tintColor = .white
                    
                    // reset backgroundColor of tail
                    tailA.removeLayer(name: "dragAndDrop")
                    tailB.removeLayer(name: "dragAndDrop")
                    tailC.removeLayer(name: "dragAndDrop")
                    tailD.removeLayer(name: "dragAndDrop")
                    tailA.tintColor = .systemBlue
                    tailB.tintColor = .systemBlue
                    tailC.tintColor = .systemBlue
                    tailD.tintColor = .systemBlue
                    sender.view!.setChoosenBackgroundColor()
                    sender.view!.tintColor = .white
                    
                    isTailFill = true
                    updateStatusCheckButton()
                }
            }
            
            if (senderView == headA) {
                sender.view?.frame = self.originHeadAPosition
            } else if (senderView == headB) {
                sender.view?.frame = self.originHeadBPosition
            } else if (senderView == headC) {
                sender.view?.frame = self.originHeadCPosition
            } else if (senderView == headD) {
                sender.view?.frame = self.originHeadDPosition
            } else if (senderView == tailA) {
                sender.view?.frame = self.originTailAPosition
            } else if (senderView == tailB) {
                sender.view?.frame = self.originTailBPosition
            } else if (senderView == tailC) {
                sender.view?.frame = self.originTailCPosition
            } else {
                sender.view?.frame = self.originTailDPosition
            }
            
            placeholderHead.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
            placeholderTail.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
            
            
        } else if sender.state == .began {
            if name == "Head" {
                placeholderHead.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 0.6), alpha: 1, x: 0, y: 0, blur: 20, spread: 0)
            } else {
                placeholderTail.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 0.6), alpha: 1, x: 0, y: 0, blur: 20, spread: 0)
            }
            
        } else {
            sender.view?.center = sender.location(in: self)
        }
    }
}
