//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class QuizTypeE3Cell: BaseCell, UIGestureRecognizerDelegate {
    
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
    
    let originHeaderHead = CGRect(x: 70, y: (UIScreen.main.bounds.height - 121)/2 - 96, width: 100, height: 20)
    let originHeaderTail = CGRect(x: UIScreen.main.bounds.width - 156, y: (UIScreen.main.bounds.height - 121)/2 - 96, width: 100, height: 20)
    
    var isCarakanA = false
    var isCarakanB = false
    var isCarakanC = false
    
    var carakan1Question: String?
    var carakan2Question: String?
    var carakan3Question: String?
    var carakan1Answer: String? = ""
    var carakan2Answer: String? = ""
    var carakan3Answer: String? = ""
    
    var selectedArray = [10, 11, 12]
    
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
            let questionName1: String = (questions?[0].name!)!
            let questionName2: String = (questions?[1].name!)!
            let questionName3: String = (questions?[2].name!)!
            carakan1Question = questionName1
            carakan2Question = questionName2
            carakan3Question = questionName3
            
            // set question image
            let image1 = UIImage(named: "\(region) Jawaban \(questionName1)")?.withRenderingMode(.alwaysTemplate)
            questionPlaceholder1.setImage(image1, for: .normal)
            aksaraLabel1.text = questionName1
            footerPlaceholderCarakanA.text = questionName1
            
            let image2 = UIImage(named: "\(region) Jawaban \(questionName2)")?.withRenderingMode(.alwaysTemplate)
            questionPlaceholder2.setImage(image2, for: .normal)
            aksaraLabel2.text = questionName2
            footerPlaceholderCarakanB.text = questionName2
            
            let image3 = UIImage(named: "\(region) Jawaban \(questionName3)")?.withRenderingMode(.alwaysTemplate)
            questionPlaceholder3.setImage(image3, for: .normal)
            aksaraLabel3.text = questionName3
            footerPlaceholderCarakanC.text = questionName3
            
            // setup answers
            let answerChoices = quizData?.answerChoices?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [AnswerChoice]
            let answer1: String = String((answerChoices?[0].name)!)
            let answer2: String = String((answerChoices?[1].name)!)
            let answer3: String = String((answerChoices?[2].name)!)
            let answer4: String = String((answerChoices?[3].name)!)
            let answer5: String = String((answerChoices?[4].name)!)
            let answer6: String = String((answerChoices?[5].name)!)
            let answer7: String = String((answerChoices?[6].name)!)
            let answer8: String = String((answerChoices?[7].name)!)
            
            moveGS_carakan1.name = answer1
            moveGS_carakan2.name = answer2
            moveGS_carakan3.name = answer3
            moveGS_carakan4.name = answer4
            moveGS_carakan5.name = answer5
            moveGS_carakan6.name = answer6
            moveGS_carakan7.name = answer7
            moveGS_carakan8.name = answer8
            
            moveGS_carakan1.viewName = "\(region) Jawaban \(answer1)"
            moveGS_carakan2.viewName = "\(region) Jawaban \(answer2)"
            moveGS_carakan3.viewName = "\(region) Jawaban \(answer3)"
            moveGS_carakan4.viewName = "\(region) Jawaban \(answer4)"
            moveGS_carakan5.viewName = "\(region) Jawaban \(answer5)"
            moveGS_carakan6.viewName = "\(region) Jawaban \(answer6)"
            moveGS_carakan7.viewName = "\(region) Jawaban \(answer7)"
            moveGS_carakan8.viewName = "\(region) Jawaban \(answer8)"
            
            let imageCarakan1 = UIImage(named: "\(region) Jawaban \(answer1)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan2 = UIImage(named: "\(region) Jawaban \(answer2)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan3 = UIImage(named: "\(region) Jawaban \(answer3)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan4 = UIImage(named: "\(region) Jawaban \(answer4)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan5 = UIImage(named: "\(region) Jawaban \(answer5)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan6 = UIImage(named: "\(region) Jawaban \(answer6)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan7 = UIImage(named: "\(region) Jawaban \(answer7)")?.withRenderingMode(.alwaysTemplate)
            let imageCarakan8 = UIImage(named: "\(region) Jawaban \(answer8)")?.withRenderingMode(.alwaysTemplate)
            
            carakan1.setImage(imageCarakan1, for: .normal)
            carakan2.setImage(imageCarakan2, for: .normal)
            carakan3.setImage(imageCarakan3, for: .normal)
            carakan4.setImage(imageCarakan4, for: .normal)
            carakan5.setImage(imageCarakan5, for: .normal)
            carakan6.setImage(imageCarakan6, for: .normal)
            carakan7.setImage(imageCarakan7, for: .normal)
            carakan8.setImage(imageCarakan8, for: .normal)
        }
    }
    
    lazy var placeholderCarakanA: UIButton = {
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
    
    lazy var placeholderCarakanB: UIButton = {
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
    
    lazy var placeholderCarakanC: UIButton = {
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
        label.text = "Bagaimanakah aksaranya ?"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let headerCarakanALabel: UILabel = {
        let label = UILabel()
        label.text = "Carakan"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let headerCarakanBLabel: UILabel = {
        let label = UILabel()
        label.text = "Carakan"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let footerPlaceholderCarakanA: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wa"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let footerPlaceholderCarakanB: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ha"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let footerPlaceholderCarakanC: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Na"
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
    
    
    // Handle Success View
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
    
    lazy var questionPlaceholder1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Wa")?.withRenderingMode(.alwaysTemplate)
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
    
    let aksaraLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Wa"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    lazy var questionPlaceholder2: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
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
    
    let aksaraLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ha"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
    }()
    
    lazy var questionPlaceholder3: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Na")?.withRenderingMode(.alwaysTemplate)
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
    
    let aksaraLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Na"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.isHidden = true
        
        return label
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
    
    // --------------------------------------------------------------------------------------------------- //
    
    lazy var moveGS_carakan1: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ha"
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_carakan2: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Na"
        moveGS.delegate = self
        moveGS.index = 1
        
        return moveGS
    }()
    
    lazy var moveGS_carakan3: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ca"
        moveGS.delegate = self
        moveGS.index = 2
        
        return moveGS
    }()
    
    lazy var moveGS_carakan4: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ra"
        moveGS.delegate = self
        moveGS.index = 3
        
        return moveGS
    }()
    
    lazy var moveGS_carakan5: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Ka"
        moveGS.delegate = self
        moveGS.index = 4
        
        return moveGS
    }()
    
    lazy var moveGS_carakan6: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Da"
        moveGS.delegate = self
        moveGS.index = 5
        
        return moveGS
    }()
    
    lazy var moveGS_carakan7: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Tha"
        moveGS.delegate = self
        moveGS.index = 6
        
        return moveGS
    }()
    
    lazy var moveGS_carakan8: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Sa"
        moveGS.delegate = self
        moveGS.index = 7
        
        return moveGS
    }()
    
    lazy var carakan1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan1)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan2: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Na")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan2)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan3: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ca")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan3)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan4: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ra")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan4)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan5: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ka")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan5)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan6: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Da")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan6)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan7: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Tha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan7)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakan8: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Sa")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_carakan8)
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
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        addSubview(placeholderCarakanA)
        addSubview(placeholderCarakanB)
        addSubview(placeholderCarakanC)
        
        addSubview(questionLabel)
        addSubview(headerCarakanALabel)
        addSubview(headerCarakanBLabel)
        addSubview(footerPlaceholderCarakanA)
        addSubview(footerPlaceholderCarakanB)
        addSubview(footerPlaceholderCarakanC)
        
        addSubview(carakan1)
        addSubview(carakan2)
        addSubview(carakan3)
        addSubview(carakan4)
        
        addSubview(carakan5)
        addSubview(carakan6)
        addSubview(carakan7)
        addSubview(carakan8)
        
        addSubview(checkButton)
        addSubview(continueButton)
        
        addSubview(questionPlaceholder1)
        addSubview(questionPlaceholder2)
        addSubview(questionPlaceholder3)
        addSubview(aksaraLabel1)
        addSubview(aksaraLabel2)
        addSubview(aksaraLabel3)
    
        addSubview(questionFullDetailLabel)
        addSubview(answersFullDetailLabel)
    }
    
    func setupConstraint() {
        placeholderCarakanA.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        placeholderCarakanA.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderCarakanA.heightAnchor.constraint(equalToConstant: 100).isActive = true
        centerPlaceHolderConstraint =  placeholderCarakanA.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -116)
        centerPlaceHolderConstraint?.isActive = true
        
        placeholderCarakanB.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        placeholderCarakanB.leadingAnchor.constraint(equalTo: placeholderCarakanA.trailingAnchor, constant: 24).isActive = true
        placeholderCarakanB.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderCarakanB.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        placeholderCarakanC.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        placeholderCarakanC.leadingAnchor.constraint(equalTo: placeholderCarakanB.trailingAnchor, constant: 24).isActive = true
        placeholderCarakanC.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderCarakanC.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        headerCarakanALabel.frame = originHeaderHead
        headerCarakanBLabel.frame = originHeaderTail
        
        footerPlaceholderCarakanA.topAnchor.constraint(equalTo: placeholderCarakanA.bottomAnchor, constant: 16).isActive = true
        footerPlaceholderCarakanA.centerXAnchor.constraint(equalTo: placeholderCarakanA.centerXAnchor).isActive = true
        
        footerPlaceholderCarakanB.topAnchor.constraint(equalTo: placeholderCarakanB.bottomAnchor, constant: 16).isActive = true
        footerPlaceholderCarakanB.centerXAnchor.constraint(equalTo: placeholderCarakanB.centerXAnchor).isActive = true
        
        footerPlaceholderCarakanC.topAnchor.constraint(equalTo: placeholderCarakanC.bottomAnchor, constant: 16).isActive = true
        footerPlaceholderCarakanC.centerXAnchor.constraint(equalTo: placeholderCarakanC.centerXAnchor).isActive = true
        
        carakan1.frame = originHeadAPosition
        carakan2.frame = originHeadBPosition
        carakan3.frame = originHeadCPosition
        carakan4.frame = originHeadDPosition
        carakan5.frame = originTailAPosition
        carakan6.frame = originTailBPosition
        carakan7.frame = originTailCPosition
        carakan8.frame = originTailDPosition
        
        checkButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        checkButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        questionPlaceholder3.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -120).isActive = true
        questionPlaceholder3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        questionPlaceholder3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questionPlaceholder3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionPlaceholder2.trailingAnchor.constraint(equalTo: questionPlaceholder3.leadingAnchor, constant: -16).isActive = true
        questionPlaceholder2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        questionPlaceholder2.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questionPlaceholder2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionPlaceholder1.trailingAnchor.constraint(equalTo: questionPlaceholder2.leadingAnchor, constant: -16).isActive = true
        questionPlaceholder1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        questionPlaceholder1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questionPlaceholder1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionFullDetailLabel.bottomAnchor.constraint(equalTo: questionPlaceholder2.topAnchor, constant: -20).isActive = true
        questionFullDetailLabel.centerXAnchor.constraint(equalTo: questionPlaceholder2.centerXAnchor).isActive = true
        
        aksaraLabel1.topAnchor.constraint(equalTo: questionPlaceholder1.bottomAnchor, constant: 16).isActive = true
        aksaraLabel1.centerXAnchor.constraint(equalTo: questionPlaceholder1.centerXAnchor).isActive = true
        
        aksaraLabel2.topAnchor.constraint(equalTo: questionPlaceholder2.bottomAnchor, constant: 16).isActive = true
        aksaraLabel2.centerXAnchor.constraint(equalTo: questionPlaceholder2.centerXAnchor).isActive = true
        
        aksaraLabel3.topAnchor.constraint(equalTo: questionPlaceholder3.bottomAnchor, constant: 16).isActive = true
        aksaraLabel3.centerXAnchor.constraint(equalTo: questionPlaceholder3.centerXAnchor).isActive = true
        
        answersFullDetailLabel.centerXAnchor.constraint(equalTo: placeholderCarakanB.centerXAnchor).isActive = true
        answersFullDetailLabel.bottomAnchor.constraint(equalTo: placeholderCarakanB.topAnchor, constant: -16).isActive = true
    }
    
    @objc func handleCheckButton() {
        hideViewAfterCheck()
        showViewAfterCheck()
        
        placeholderCarakanA.removeLayer(name: "dragAndDropLayer")
        placeholderCarakanB.removeLayer(name: "dragAndDropLayer")
        placeholderCarakanC.removeLayer(name: "dragAndDropLayer")
        
        // check answer
        checkAnswers()
        
        delegate?.stopTimerChoosen()
        
        centerPlaceHolderConstraint?.constant = 120
        layoutIfNeeded()
    }
    
    func hideViewAfterCheck() {
        carakan1.isHidden = true
        carakan2.isHidden = true
        carakan3.isHidden = true
        carakan4.isHidden = true
        carakan5.isHidden = true
        carakan6.isHidden = true
        carakan7.isHidden = true
        carakan8.isHidden = true
        headerCarakanALabel.isHidden = true
        headerCarakanBLabel.isHidden = true
        checkButton.isHidden = true
    }
    
    func showViewAfterCheck() {
        continueButton.isHidden = false
        questionPlaceholder1.isHidden = false
        questionPlaceholder2.isHidden = false
        questionPlaceholder3.isHidden = false
        aksaraLabel1.isHidden = false
        aksaraLabel2.isHidden = false
        aksaraLabel3.isHidden = false
        
        questionFullDetailLabel.isHidden = false
        answersFullDetailLabel.isHidden = false
    }
    
    func checkAnswers() {
        footerPlaceholderCarakanA.text = carakan1Answer
        footerPlaceholderCarakanB.text = carakan2Answer
        footerPlaceholderCarakanC.text = carakan3Answer
        
        if (carakan1Question == carakan1Answer && carakan2Question == carakan2Answer && carakan3Question == carakan3Answer) {
            // handle true
            questionLabel.text = "Benar sekali 😄"
            questionLabel.textColor = Theme.current.accentTextGreen
            placeholderCarakanA.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderCarakanB.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderCarakanC.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        
            delegate?.setTrueStatus()
            
            // handle continue button
            self.continueButton.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
            
            playSoundTrue()
            generator.notificationOccurred(.success)
        } else {
            // handle false
            questionLabel.text = "Sayang sekali ☹️"
            questionLabel.textColor = Theme.current.accentTextRed
            
            delegate?.setFalseStatus()
            
            // handle continue button
            self.continueButton.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
            
            if (carakan1Question == carakan1Answer) {
                placeholderCarakanA.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            } else {
                placeholderCarakanA.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
                placeholderCarakanA.shake()
            }
            
            if (carakan2Question == carakan2Answer) {
                placeholderCarakanB.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            } else {
                placeholderCarakanB.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
                placeholderCarakanB.shake()
            }
            
            if (carakan3Question == carakan3Answer) {
                placeholderCarakanC.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            } else {
                placeholderCarakanC.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
                placeholderCarakanC.shake()
            }
            
            playSoundFalse()
            generator.notificationOccurred(.error)
        }
    }
    
    func handleTimer() {
        footerPlaceholderCarakanA.text = carakan1Answer
        footerPlaceholderCarakanB.text = carakan2Answer
        footerPlaceholderCarakanC.text = carakan3Answer
        
        hideViewAfterCheck()
        showViewAfterCheck()
        
        // remove the original layer background
        placeholderCarakanA.removeLayer(name: "dragAndDropLayer")
        placeholderCarakanB.removeLayer(name: "dragAndDropLayer")
        placeholderCarakanC.removeLayer(name: "dragAndDropLayer")
        
        // handle false
        questionLabel.text = "Sayang sekali waktumu habis ☹️"
        questionLabel.textColor = Theme.current.accentTextRed
        delegate?.setFalseStatus()
        
        // handle continue button
        self.continueButton.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
        
        if (carakan1Question == carakan1Answer) {
            placeholderCarakanA.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        } else {
            placeholderCarakanA.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderCarakanA.shake()
        }
        
        if (carakan2Question == carakan2Answer) {
            placeholderCarakanB.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        } else {
            placeholderCarakanB.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderCarakanB.shake()
        }
        
        if (carakan3Question == carakan3Answer) {
            placeholderCarakanC.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        } else {
            placeholderCarakanC.setCheckButtonBackgroundColorFalse(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
            placeholderCarakanC.shake()
        }
        
        generator.notificationOccurred(.error)
        
        // centering the placeholder
        centerPlaceHolderConstraint?.constant = 120
        layoutIfNeeded()
    }
    
    func rectIntersectionInPerc(r1:CGRect, r2:CGRect) -> CGFloat {
        if (r1.intersects(r2)) {

           //let interRect:CGRect = r1.rectByIntersecting(r2); //OLD
           let interRect:CGRect = r1.intersection(r2);

           return ((interRect.width * interRect.height) / (((r1.width * r1.height) + (r2.width * r2.height))/2.0) * 100.0)
        }
        return 0;
    }
    
    func resetButton() {
        let arrayOfCarakanIndex = [0, 1, 2, 3, 4, 5, 6, 7]
        let arrayOfCarakanView = [carakan1, carakan2, carakan3, carakan4, carakan5, carakan6, carakan7, carakan8]
        let filteredArray = arrayOfCarakanIndex.filter{ !selectedArray.contains($0) }
    
        for (_, unselect) in filteredArray.enumerated() {
            arrayOfCarakanView[unselect].removeLayer(name: "dragAndDrop")
            arrayOfCarakanView[unselect].tintColor = .systemBlue
        }
    }
    
    func updateStatusCheckButton() {
        if (isCarakanA && isCarakanB && isCarakanC) {
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
        let viewName = sender.viewName
        let name =  sender.name
        let index = sender.index! as Int
        
        if sender.state == .ended {
            
            if (placeholderCarakanA.frame.intersects(sender.view!.frame) && placeholderCarakanB.frame.intersects(sender.view!.frame)) {
                let percentageA = rectIntersectionInPerc(r1: placeholderCarakanA.frame, r2: sender.view!.frame)
                let percentageB = rectIntersectionInPerc(r1: placeholderCarakanB.frame, r2: sender.view!.frame)
                
                if (percentageA > percentageB) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderCarakanA.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderCarakanA.setImage(image, for: .normal)
                    placeholderCarakanA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderCarakanA.tintColor = .white
                    carakan1Answer = name
                    
                    selectedArray[0] = index
                    resetButton()
                    
                    sender.view!.setChoosenBackgroundColor()
                    sender.view!.tintColor = .white
                    
                    isCarakanA = true
                    updateStatusCheckButton()
                } else if (percentageB > percentageA) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderCarakanB.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderCarakanB.setImage(image, for: .normal)
                    placeholderCarakanB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderCarakanB.tintColor = .white
                    carakan2Answer = name
                    selectedArray[1] = index
                    resetButton()
                    
                    sender.view!.setChoosenBackgroundColor()
                    sender.view!.tintColor = .white
                    
                    isCarakanB = true
                    updateStatusCheckButton()
                }
                
            } else if (placeholderCarakanB.frame.intersects(sender.view!.frame) && placeholderCarakanC.frame.intersects(sender.view!.frame)) {
                let percentageB = rectIntersectionInPerc(r1: placeholderCarakanB.frame, r2: sender.view!.frame)
                let percentageC = rectIntersectionInPerc(r1: placeholderCarakanC.frame, r2: sender.view!.frame)
                
                if (percentageB > percentageC) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderCarakanB.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderCarakanB.setImage(image, for: .normal)
                    placeholderCarakanB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderCarakanB.tintColor = .white
                    carakan2Answer = name
                    selectedArray[1] = index
                    resetButton()
                    
                    sender.view!.setChoosenBackgroundColor()
                    sender.view!.tintColor = .white
                    
                    isCarakanB = true
                    updateStatusCheckButton()
                } else if (percentageC > percentageB) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderCarakanC.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderCarakanC.setImage(image, for: .normal)
                    placeholderCarakanC.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderCarakanC.tintColor = .white
                    carakan3Answer = name
                    selectedArray[2] = index
                    resetButton()

                    sender.view!.setChoosenBackgroundColor()
                    sender.view!.tintColor = .white
                    
                    isCarakanC = true
                    updateStatusCheckButton()
                }
                
            } else if (placeholderCarakanA.frame.intersects(sender.view!.frame)) {
                let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                placeholderCarakanA.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                placeholderCarakanA.setImage(image, for: .normal)
                placeholderCarakanA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                placeholderCarakanA.tintColor = .white
                carakan1Answer = name
                selectedArray[0] = index
                resetButton()
                
                sender.view!.setChoosenBackgroundColor()
                sender.view!.tintColor = .white
                
                isCarakanA = true
                updateStatusCheckButton()
            } else if (placeholderCarakanB.frame.intersects(sender.view!.frame)) {
                let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                placeholderCarakanB.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                placeholderCarakanB.setImage(image, for: .normal)
                placeholderCarakanB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                placeholderCarakanB.tintColor = .white
                carakan2Answer = name
                selectedArray[1] = index
                resetButton()
                
                sender.view!.setChoosenBackgroundColor()
                sender.view!.tintColor = .white
                
                isCarakanB = true
                updateStatusCheckButton()
            } else if (placeholderCarakanC.frame.intersects(sender.view!.frame)) {
                let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                placeholderCarakanC.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                placeholderCarakanC.setImage(image, for: .normal)
                placeholderCarakanC.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                placeholderCarakanC.tintColor = .white
                carakan3Answer = name
                selectedArray[2] = index
                resetButton()

                sender.view!.setChoosenBackgroundColor()
                sender.view!.tintColor = .white
                
                isCarakanC = true
                updateStatusCheckButton()
            }
            
            
            if (senderView == carakan1) {
                sender.view?.frame = self.originHeadAPosition
            } else if (senderView == carakan2) {
                sender.view?.frame = self.originHeadBPosition
            } else if (senderView == carakan3) {
                sender.view?.frame = self.originHeadCPosition
            } else if (senderView == carakan4) {
                sender.view?.frame = self.originHeadDPosition
            } else if (senderView == carakan5) {
                sender.view?.frame = self.originTailAPosition
            } else if (senderView == carakan6) {
                sender.view?.frame = self.originTailBPosition
            } else if (senderView == carakan7) {
                sender.view?.frame = self.originTailCPosition
            } else {
                sender.view?.frame = self.originTailDPosition
            }
            
            placeholderCarakanA.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
            placeholderCarakanB.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
            placeholderCarakanC.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
            
            
        } else if sender.state == .began {
            placeholderCarakanA.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 0.6), alpha: 1, x: 0, y: 0, blur: 20, spread: 0)
            placeholderCarakanB.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 0.6), alpha: 1, x: 0, y: 0, blur: 20, spread: 0)
            placeholderCarakanC.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 0.6), alpha: 1, x: 0, y: 0, blur: 20, spread: 0)
            
        } else {
            sender.view?.center = sender.location(in: self)
        }
    }
}
