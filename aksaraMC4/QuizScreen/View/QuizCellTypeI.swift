//
//  TypeNewMix3Cell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 29/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit
import AVFoundation
import CoreML

class QuizCellTypeI: UICollectionViewCell{
    
    var QuizMiddleDecorationWidth1 : NSLayoutConstraint?
    var QuizMiddleDecorationWidth2 : NSLayoutConstraint?
    var QuizMiddleDecorationWidth3 : NSLayoutConstraint?
    var firstCanvasCenterXAnchor1 : NSLayoutConstraint?
    var firstCanvasTrailingAnchor2 : NSLayoutConstraint?
    var firstCanvasTrailingAnchor3 : NSLayoutConstraint?
    var secondCanvasLeadingAnchor1 : NSLayoutConstraint?
    var secondCanvasCenterXAnchor2 : NSLayoutConstraint?
    var thirdCanvasLeadingAnchor1 : NSLayoutConstraint?
    var isCanvas1Filled : Bool?
    var isCanvas2Filled : Bool?
    var isCanvas3Filled : Bool?
    
    var carakan1Question: String?
    var carakan2Question: String?
    var carakan3Question: String?
    var carakan1Answer: String? = ""
    var carakan2Answer: String? = ""
    var carakan3Answer: String? = ""
    var canvasViewImage1: UIImage?
    var canvasViewImage2: UIImage?
    var canvasViewImage3: UIImage?
    
    var aksaraCount : Int? {
        didSet {
            setupView()
        }
    }
    let generator = UINotificationFeedbackGenerator()
    var player: AVAudioPlayer?
    var regionSelected: String?
    var delegate: QuizController?
    var quizData: Quiz? {
        didSet {
            let region: String = String(regionSelected!)
            
            // setup questions
            let questions = quizData?.questions?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Question]
            
            if (aksaraCount == 1) {
                let question1Name: String = String((questions?[0].name)!)
                let image1 = UIImage(named: "\(region) Jawaban \(question1Name)")
                
                carakan1Question = questions?[0].name
                question1Label.text = "Aksara \(String((questions?[0].name)!))"
                shadowImage1.image = image1
            }
            
            if (aksaraCount == 2) {
                let question1Name: String = String((questions?[0].name)!)
                let image1 = UIImage(named: "\(region) Jawaban \(question1Name)")
                let question2Name: String = String((questions?[1].name)!)
                let image2 = UIImage(named: "\(region) Jawaban \(question2Name)")
                
                carakan1Question = questions?[0].name
                carakan2Question = questions?[1].name
                
                question1Label.text = "Aksara \(String((questions?[0].name)!))"
                question2Label.text = "Aksara \(String((questions?[1].name)!))"
                
                shadowImage1.image = image1
                shadowImage2.image = image2
            }
            
            if (aksaraCount == 3) {
                let question1Name: String = String((questions?[0].name)!)
                let image1 = UIImage(named: "\(region) Jawaban \(question1Name)")
                let question2Name: String = String((questions?[1].name)!)
                let image2 = UIImage(named: "\(region) Jawaban \(question2Name)")
                let question3Name: String = String((questions?[2].name)!)
                let image3 = UIImage(named: "\(region) Jawaban \(question3Name)")
                
                carakan1Question = questions?[0].name
                carakan2Question = questions?[1].name
                carakan3Question = questions?[2].name
                
                question1Label.text = "Aksara \(String((questions?[0].name)!))"
                question2Label.text = "Aksara \(String((questions?[1].name)!))"
                question3Label.text = "Aksara \(String((questions?[2].name)!))"
                
                shadowImage1.image = image1
                shadowImage2.image = image2
                shadowImage3.image = image3
            }
        }
    }
    
    let questionTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Tuliskan :"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var containerCanvasView1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        
        return view
    }()
    
    let checkmarkImage1 : UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let QuizMiddleDecoration: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "QuizCanvasMiddleDecorationState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var canvasView1: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 24
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        canvasView.tag = 0
        canvasView.delegate = self
        
        return canvasView
    }()
    
    
    let question1Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = ""
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var reloadButton1 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"reloadButton"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 0
        btn.addTarget(self, action: #selector(reloadPencilKit(_:)), for: .touchUpInside)
        
        
        return btn
    }()
    
    
    let containerCanvasView2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    lazy var canvasView2: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 24
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        canvasView.tag = 1
        canvasView.delegate = self
        
        return canvasView
    }()
    
    let checkmarkImage2 : UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let question2Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = ""
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var reloadButton2 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"reloadButton"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 1
        btn.addTarget(self, action: #selector(reloadPencilKit(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    let containerCanvasView3 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    lazy var canvasView3: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 24
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        canvasView.tag = 2
        canvasView.delegate = self
        
        return canvasView
    }()
    
    let checkmarkImage3 : UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let question3Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = ""
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var reloadButton3 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named:"reloadButton"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 2
        btn.addTarget(self, action: #selector(reloadPencilKit(_:)), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ButtonLanjutStateCek"), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
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
//        button.setTitle("Lanjut", for: .normal)
//        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        button.setImage(UIImage(named: "ButtonLanjutStateTrue"), for: .normal)
        button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
//        button.imageView?.tintColor = Theme.current.accentWhite
//        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 130, bottom: 0, right: 0)
//        button.addInnerShadow()
//        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.clipsToBounds = true
        button.isEnabled = true
        button.isHidden = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    let shadowImage1: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        
        return image
    }()
    
    let shadowImage2: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        
        return image
    }()
    
    let shadowImage3: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setBackgroundColor()
        
        setupDynamicConstraint()
        setupView()
    }
    
    func setupDynamicConstraint() {
        firstCanvasCenterXAnchor1 = containerCanvasView1.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0)
        firstCanvasTrailingAnchor2 = containerCanvasView1.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -16)
        firstCanvasTrailingAnchor3 = containerCanvasView1.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -152)
        
        secondCanvasLeadingAnchor1 = containerCanvasView2.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 16)
        secondCanvasCenterXAnchor2 = containerCanvasView2.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        thirdCanvasLeadingAnchor1 = containerCanvasView3.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 152)
        
        QuizMiddleDecorationWidth1 = QuizMiddleDecoration.widthAnchor.constraint(equalToConstant: 566)
        QuizMiddleDecorationWidth2 = QuizMiddleDecoration.widthAnchor.constraint(equalToConstant: 866)
        QuizMiddleDecorationWidth3 = QuizMiddleDecoration.widthAnchor.constraint(equalToConstant: 952)
    }
    
    @objc func reloadPencilKit(_ sender: UIButton) {
        if sender.tag == 0 {
            canvasView1.drawing = PKDrawing()
        } else if sender.tag == 1 {
            canvasView2.drawing = PKDrawing()
        } else if sender.tag == 2 {
            canvasView3.drawing = PKDrawing()
        }
        
    }
    
    func setupView() {
        addSubview(QuizMiddleDecoration)
        QuizMiddleDecoration.heightAnchor.constraint(equalToConstant: 506).isActive = true
        QuizMiddleDecorationWidth1?.isActive = true
        QuizMiddleDecoration.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        QuizMiddleDecoration.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        
        addSubview(questionTitle)
        questionTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionTitle.topAnchor.constraint(equalTo: topAnchor, constant: 48).isActive = true
        
        addSubview(containerCanvasView1)
        containerCanvasView1.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 72).isActive = true
        firstCanvasCenterXAnchor1?.isActive = true
        containerCanvasView1.widthAnchor.constraint(equalToConstant: 300).isActive = true
        containerCanvasView1.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        containerCanvasView1.addSubview(canvasView1)
        canvasView1.topAnchor.constraint(equalTo: containerCanvasView1.topAnchor).isActive = true
        canvasView1.bottomAnchor.constraint(equalTo: containerCanvasView1.bottomAnchor).isActive = true
        canvasView1.leadingAnchor.constraint(equalTo: containerCanvasView1.leadingAnchor).isActive = true
        canvasView1.trailingAnchor.constraint(equalTo: containerCanvasView1.trailingAnchor).isActive = true
        
        containerCanvasView1.addSubview(shadowImage1)
        shadowImage1.centerXAnchor.constraint(equalTo: containerCanvasView1.centerXAnchor).isActive = true
        shadowImage1.centerYAnchor.constraint(equalTo: containerCanvasView1.centerYAnchor).isActive = true
        shadowImage1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        shadowImage1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //
        containerCanvasView1.addSubview(checkmarkImage1)
        checkmarkImage1.trailingAnchor.constraint(equalTo: containerCanvasView1.trailingAnchor, constant: -12).isActive = true
        checkmarkImage1.topAnchor.constraint(equalTo: containerCanvasView1.topAnchor, constant: 12).isActive = true
        checkmarkImage1.widthAnchor.constraint(equalToConstant: 24).isActive = true
        checkmarkImage1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        containerCanvasView1.addSubview(question1Label)
        question1Label.bottomAnchor.constraint(equalTo: containerCanvasView1.topAnchor, constant: -18).isActive = true
        question1Label.centerXAnchor.constraint(equalTo: containerCanvasView1.centerXAnchor, constant: 0).isActive = true
        
        addSubview(reloadButton1)
        reloadButton1.bottomAnchor.constraint(equalTo: containerCanvasView1.topAnchor, constant: -16).isActive = true
        reloadButton1.trailingAnchor.constraint(equalTo: containerCanvasView1.trailingAnchor, constant: 0).isActive = true
        reloadButton1.heightAnchor.constraint(equalToConstant: 29).isActive = true
        reloadButton1.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(checkButton)
        checkButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        checkButton.topAnchor.constraint(equalTo: canvasView1.bottomAnchor, constant: 40).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 302).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: canvasView1.bottomAnchor, constant: 40).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 302).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        if aksaraCount == 2 {
            QuizMiddleDecorationWidth1?.isActive = false
            QuizMiddleDecorationWidth2?.isActive = true
            QuizMiddleDecoration.image = UIImage(named: "QuizCanvas2MiddleDecorationState")
            
            firstCanvasCenterXAnchor1?.isActive = false
            firstCanvasTrailingAnchor2?.isActive = true
            
            
            addSubview(containerCanvasView2)
            containerCanvasView2.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 72).isActive = true
            //            firstCanvasCenterXAnchor1?.isActive = true
            secondCanvasLeadingAnchor1?.isActive = true
            containerCanvasView2.widthAnchor.constraint(equalToConstant: 300).isActive = true
            containerCanvasView2.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
            containerCanvasView2.addSubview(canvasView2)
            canvasView2.topAnchor.constraint(equalTo: containerCanvasView2.topAnchor).isActive = true
            canvasView2.bottomAnchor.constraint(equalTo: containerCanvasView2.bottomAnchor).isActive = true
            canvasView2.leadingAnchor.constraint(equalTo: containerCanvasView2.leadingAnchor).isActive = true
            canvasView2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor).isActive = true
            
            containerCanvasView2.addSubview(shadowImage2)
            shadowImage2.centerXAnchor.constraint(equalTo: containerCanvasView2.centerXAnchor).isActive = true
            shadowImage2.centerYAnchor.constraint(equalTo: containerCanvasView2.centerYAnchor).isActive = true
            shadowImage2.widthAnchor.constraint(equalToConstant: 60).isActive = true
            shadowImage2.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            containerCanvasView2.addSubview(question2Label)
            question2Label.bottomAnchor.constraint(equalTo: containerCanvasView2.topAnchor, constant: -18).isActive = true
            question2Label.centerXAnchor.constraint(equalTo: containerCanvasView2.centerXAnchor, constant: 0).isActive = true
            
            containerCanvasView2.addSubview(checkmarkImage2)
            checkmarkImage2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor, constant: -12).isActive = true
            checkmarkImage2.topAnchor.constraint(equalTo: containerCanvasView2.topAnchor, constant: 12).isActive = true
            checkmarkImage2.widthAnchor.constraint(equalToConstant: 24).isActive = true
            checkmarkImage2.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            addSubview(reloadButton2)
            reloadButton2.bottomAnchor.constraint(equalTo: containerCanvasView2.topAnchor, constant: -16).isActive = true
            reloadButton2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor, constant: 0).isActive = true
            reloadButton2.heightAnchor.constraint(equalToConstant: 29).isActive = true
            reloadButton2.widthAnchor.constraint(equalToConstant: 25).isActive = true
            
        } else if aksaraCount == 3 {
            QuizMiddleDecorationWidth1?.isActive = false
            QuizMiddleDecorationWidth2?.isActive = false
            QuizMiddleDecorationWidth3?.isActive = true
            QuizMiddleDecoration.image = UIImage(named: "QuizCanvas3MiddleDecorationState")
            
            firstCanvasCenterXAnchor1?.isActive = false
            firstCanvasTrailingAnchor3?.isActive = true
            secondCanvasLeadingAnchor1?.isActive = false
            
            //second canvas
            addSubview(containerCanvasView2)
            containerCanvasView2.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 72).isActive = true
            secondCanvasCenterXAnchor2?.isActive = true
            containerCanvasView2.widthAnchor.constraint(equalToConstant: 300).isActive = true
            containerCanvasView2.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
            containerCanvasView2.addSubview(canvasView2)
            canvasView2.topAnchor.constraint(equalTo: containerCanvasView2.topAnchor).isActive = true
            canvasView2.bottomAnchor.constraint(equalTo: containerCanvasView2.bottomAnchor).isActive = true
            canvasView2.leadingAnchor.constraint(equalTo: containerCanvasView2.leadingAnchor).isActive = true
            canvasView2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor).isActive = true
            
            containerCanvasView2.addSubview(shadowImage2)
            shadowImage2.centerXAnchor.constraint(equalTo: containerCanvasView2.centerXAnchor).isActive = true
            shadowImage2.centerYAnchor.constraint(equalTo: containerCanvasView2.centerYAnchor).isActive = true
            shadowImage2.widthAnchor.constraint(equalToConstant: 60).isActive = true
            shadowImage2.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            containerCanvasView2.addSubview(checkmarkImage2)
            checkmarkImage2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor, constant: -12).isActive = true
            checkmarkImage2.topAnchor.constraint(equalTo: containerCanvasView2.topAnchor, constant: 12).isActive = true
            checkmarkImage2.widthAnchor.constraint(equalToConstant: 24).isActive = true
            checkmarkImage2.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            containerCanvasView2.addSubview(question2Label)
            question2Label.bottomAnchor.constraint(equalTo: containerCanvasView2.topAnchor, constant: -18).isActive = true
            question2Label.centerXAnchor.constraint(equalTo: containerCanvasView2.centerXAnchor, constant: 0).isActive = true
            
            addSubview(reloadButton2)
            reloadButton2.bottomAnchor.constraint(equalTo: containerCanvasView2.topAnchor, constant: -16).isActive = true
            reloadButton2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor, constant: 0).isActive = true
            reloadButton2.heightAnchor.constraint(equalToConstant: 29).isActive = true
            reloadButton2.widthAnchor.constraint(equalToConstant: 25).isActive = true
            
            //third canvas
            addSubview(containerCanvasView3)
            containerCanvasView3.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 72).isActive = true
            thirdCanvasLeadingAnchor1?.isActive = true
            containerCanvasView3.widthAnchor.constraint(equalToConstant: 300).isActive = true
            containerCanvasView3.heightAnchor.constraint(equalToConstant: 300).isActive = true
            
            containerCanvasView3.addSubview(canvasView3)
            canvasView3.topAnchor.constraint(equalTo: containerCanvasView3.topAnchor).isActive = true
            canvasView3.bottomAnchor.constraint(equalTo: containerCanvasView3.bottomAnchor).isActive = true
            canvasView3.leadingAnchor.constraint(equalTo: containerCanvasView3.leadingAnchor).isActive = true
            canvasView3.trailingAnchor.constraint(equalTo: containerCanvasView3.trailingAnchor).isActive = true
            
            containerCanvasView3.addSubview(shadowImage3)
            shadowImage3.centerXAnchor.constraint(equalTo: containerCanvasView3.centerXAnchor).isActive = true
            shadowImage3.centerYAnchor.constraint(equalTo: containerCanvasView3.centerYAnchor).isActive = true
            shadowImage3.widthAnchor.constraint(equalToConstant: 60).isActive = true
            shadowImage3.heightAnchor.constraint(equalToConstant: 60).isActive = true
            
            containerCanvasView3.addSubview(checkmarkImage3)
            checkmarkImage3.trailingAnchor.constraint(equalTo: containerCanvasView3.trailingAnchor, constant: -12).isActive = true
            checkmarkImage3.topAnchor.constraint(equalTo: containerCanvasView3.topAnchor, constant: 12).isActive = true
            checkmarkImage3.widthAnchor.constraint(equalToConstant: 24).isActive = true
            checkmarkImage3.heightAnchor.constraint(equalToConstant: 24).isActive = true
            
            containerCanvasView3.addSubview(question3Label)
            question3Label.bottomAnchor.constraint(equalTo: containerCanvasView3.topAnchor, constant: -18).isActive = true
            question3Label.centerXAnchor.constraint(equalTo: containerCanvasView3.centerXAnchor, constant: 0).isActive = true
            
            addSubview(reloadButton3)
            reloadButton3.bottomAnchor.constraint(equalTo: containerCanvasView3.topAnchor, constant: -16).isActive = true
            reloadButton3.trailingAnchor.constraint(equalTo: containerCanvasView3.trailingAnchor, constant: 0).isActive = true
            reloadButton3.heightAnchor.constraint(equalToConstant: 29).isActive = true
            reloadButton3.widthAnchor.constraint(equalToConstant: 25).isActive = true
        }

    }
    
    func handleTrueCoreData() {
        quizData?.isCorrect = true
        PersistenceService.saveContext()
    }
    
    func handleFalseCoreData() {
        quizData?.isCorrect = false
        PersistenceService.saveContext()
    }
    
    func handleTimer() {
        questionTitle.text = "Sayang sekali waktu habis ☹️"
        questionTitle.textColor = Theme.current.accentTextRed
        self.continueButton.setImage(UIImage(named: "ButtonLanjutStateFalse"), for: .normal)
        
        checkButton.isHidden = true
        continueButton.isHidden = false
        playSoundFalse()
        generator.notificationOccurred(.error)
        
        // handle core data
        handleFalseCoreData()
        
        if (aksaraCount == 1) {
            reloadButton1.isHidden = true
            canvasView1.drawingGestureRecognizer.isEnabled = false
            shadowImage1.isHidden = false
            
            if (isCanvas1Filled == true) {
                let status = predictAksara1()
                
                if (status == true) {
                    checkmarkImage1.image = UIImage(named: "correctAnswer")
                } else {
                    checkmarkImage1.image = UIImage(named: "falseAnswer")
                }
            }
        }
        
        if (aksaraCount == 2) {
            reloadButton1.isHidden = true
            reloadButton2.isHidden = true
            canvasView1.drawingGestureRecognizer.isEnabled = false
            canvasView2.drawingGestureRecognizer.isEnabled = false
            shadowImage1.isHidden = false
            shadowImage2.isHidden = false
            
            if (isCanvas1Filled == true) {
                let status = predictAksara1()
                
                if (status == true) {
                    checkmarkImage1.image = UIImage(named: "correctAnswer")
                } else {
                    checkmarkImage1.image = UIImage(named: "falseAnswer")
                }
            }
            
            if (isCanvas2Filled == true) {
                let status = predictAksara2()
                
                if (status == true) {
                    checkmarkImage2.image = UIImage(named: "correctAnswer")
                } else {
                    checkmarkImage2.image = UIImage(named: "falseAnswer")
                }
            }
        }
        
        if (aksaraCount == 3) {
            reloadButton1.isHidden = true
            reloadButton2.isHidden = true
            reloadButton3.isHidden = true
            canvasView1.drawingGestureRecognizer.isEnabled = false
            canvasView2.drawingGestureRecognizer.isEnabled = false
            canvasView3.drawingGestureRecognizer.isEnabled = false
            shadowImage1.isHidden = false
            shadowImage2.isHidden = false
            shadowImage3.isHidden = false
            
            if (isCanvas1Filled == true) {
                let status = predictAksara1()
                
                if (status == true) {
                    checkmarkImage1.image = UIImage(named: "correctAnswer")
                } else {
                    checkmarkImage1.image = UIImage(named: "falseAnswer")
                }
            }
            
            if (isCanvas2Filled == true) {
                let status = predictAksara2()
                
                if (status == true) {
                    checkmarkImage2.image = UIImage(named: "correctAnswer")
                } else {
                    checkmarkImage2.image = UIImage(named: "falseAnswer")
                }
            }
            
            if (isCanvas3Filled == true) {
                let status = predictAksara3()
                
                if (status == true) {
                    checkmarkImage3.image = UIImage(named: "correctAnswer")
                } else {
                    checkmarkImage3.image = UIImage(named: "falseAnswer")
                }
            }
        }
    }
    
    func handleStroke(withCanvas canvas: PKCanvasView) {
        let strokeCount = canvas.drawing.strokes.count
        
        for i in 0...strokeCount - 1 {
            canvas.drawing.strokes[i].ink.color = .lightGray
        }
        
    }
    
    func handleTrue() {
        questionTitle.text = "Benar sekali 😄"
        questionTitle.textColor = Theme.current.accentTextGreen
        
        delegate?.stopTimerChoosen()
        
        // handle continue button
        self.continueButton.setImage(UIImage(named: "ButtonLanjutStateTrue"), for: .normal)
        
        playSoundTrue()
        generator.notificationOccurred(.success)
        
        // handle core data
        handleTrueCoreData()
    }
    
    func handleFalse() {
        questionTitle.text = "Sayang sekali ☹️"
        questionTitle.textColor = Theme.current.accentTextRed

        delegate?.stopTimerChoosen()
        
        // handle continue button
        self.continueButton.setImage(UIImage(named: "ButtonLanjutStateFalse"), for: .normal)
        
        playSoundFalse()
        generator.notificationOccurred(.error)
        
        // handle core data
        handleFalseCoreData()
    }
    
    @objc func handleCheckButton() {
        checkButton.isHidden = true
        continueButton.isHidden = false
        
        if aksaraCount == 1 {
            canvasView1.drawingGestureRecognizer.isEnabled = false
            reloadButton1.isHidden = true
            handleStroke(withCanvas: canvasView1)
            shadowImage1.isHidden = false
            
            let checkStatus = predictAksara1()
            
            if checkStatus == true {
                handleTrue()
                checkmarkImage1.image = UIImage(named: "correctAnswer")
            } else {
                checkmarkImage1.image = UIImage(named: "falseAnswer")
                handleFalse()
            }
            
            
        }
        
        if aksaraCount == 2 {
            canvasView1.drawingGestureRecognizer.isEnabled = false
            canvasView2.drawingGestureRecognizer.isEnabled = false
            reloadButton1.isHidden = true
            reloadButton2.isHidden = true
            handleStroke(withCanvas: canvasView1)
            handleStroke(withCanvas: canvasView2)
            shadowImage1.isHidden = false
            shadowImage2.isHidden = false
            
            let checkStatus1 = predictAksara1()
            let checkStatus2 = predictAksara2()
            
            if (checkStatus1 == true && checkStatus2 == true) {
                handleTrue()
                checkmarkImage1.image = UIImage(named: "correctAnswer")
                checkmarkImage2.image = UIImage(named: "correctAnswer")
            } else {
                if checkStatus1 == false {
                    checkmarkImage1.image = UIImage(named: "falseAnswer")
                } else {
                    checkmarkImage1.image = UIImage(named: "correctAnswer")
                }
                
                if checkStatus2 == false {
                    checkmarkImage2.image = UIImage(named: "falseAnswer")
                } else {
                    checkmarkImage2.image = UIImage(named: "correctAnswer")
                }
                
                handleFalse()
            }
        }
        
        if aksaraCount == 3 {
            canvasView1.drawingGestureRecognizer.isEnabled = false
            canvasView2.drawingGestureRecognizer.isEnabled = false
            canvasView3.drawingGestureRecognizer.isEnabled = false
            reloadButton1.isHidden = true
            reloadButton2.isHidden = true
            reloadButton3.isHidden = true
            handleStroke(withCanvas: canvasView1)
            handleStroke(withCanvas: canvasView2)
            handleStroke(withCanvas: canvasView3)
            shadowImage1.isHidden = false
            shadowImage2.isHidden = false
            shadowImage3.isHidden = false
            
            let checkStatus1 = predictAksara1()
            let checkStatus2 = predictAksara2()
            let checkStatus3 = predictAksara3()
            
            if (checkStatus1 == true && checkStatus2 == true && checkStatus3) {
                handleTrue()
                checkmarkImage1.image = UIImage(named: "correctAnswer")
                checkmarkImage2.image = UIImage(named: "correctAnswer")
                checkmarkImage3.image = UIImage(named: "correctAnswer")
            } else {
                if checkStatus1 == false {
                    checkmarkImage1.image = UIImage(named: "falseAnswer")
                } else {
                    checkmarkImage1.image = UIImage(named: "correctAnswer")
                }
                
                if checkStatus2 == false {
                    checkmarkImage2.image = UIImage(named: "falseAnswer")
                } else {
                    checkmarkImage2.image = UIImage(named: "correctAnswer")
                }
                
                if checkStatus3 == false {
                    checkmarkImage3.image = UIImage(named: "falseAnswer")
                } else {
                    checkmarkImage3.image = UIImage(named: "correctAnswer")
                }
                
                handleFalse()
            }
        }
    }
    
    func predictAksara1() -> Bool {
        canvasViewImage1 = canvasView1.drawing.image(from: canvasView1.bounds, scale: 1)
        
        guard let pixelBuffer = canvasViewImage1?.pixelBuffer() else {
            fatalError("Unexpected runtime error.")
        }
        
        let aksaraModel: AksaraModel = try! AksaraModel(configuration: MLModelConfiguration.init())
        
        guard let checkNumberOutput = try? aksaraModel.prediction(image: pixelBuffer) else {
            fatalError("Unexpected runtime error.")
        }
        
        if carakan1Question == checkNumberOutput.classLabel {
            let probs = checkNumberOutput.classLabelProbs
            let carakanProbs = probs[carakan1Question!]
            
//            if carakanProbs! > 0.88 {
//                return true
//            } else {
//                return false
//            }
            
            return true
        } else {
            return false
        }
        
    }
    
    func predictAksara2() -> Bool {
        let image = canvasView2.drawing.image(from: canvasView2.bounds, scale: 1.5)
        
        guard let pixelBuffer = image.pixelBuffer() else {
            fatalError("Unexpected runtime error.")
        }
        
        let aksaraModel: AksaraModel = try! AksaraModel(configuration: MLModelConfiguration.init())
        
        guard let checkNumberOutput = try? aksaraModel.prediction(image: pixelBuffer) else {
            fatalError("Unexpected runtime error.")
        }
        
        if carakan2Question == checkNumberOutput.classLabel {
            let probs = checkNumberOutput.classLabelProbs
            let carakanProbs = probs[carakan1Question!]!
            
//            if carakanProbs > 0.88 {
//                return true
//            } else {
//                return false
//            }
            
            return true
            
        } else {
            return false
        }
    }
    
    func predictAksara3() -> Bool {
        let image = canvasView3.drawing.image(from: canvasView3.bounds, scale: 1)
        
        guard let pixelBuffer = image.pixelBuffer() else {
            fatalError("Unexpected runtime error.")
        }
        
        let aksaraModel: AksaraModel = try! AksaraModel(configuration: MLModelConfiguration.init())
        
        guard let checkNumberOutput = try? aksaraModel.prediction(image: pixelBuffer) else {
            fatalError("Unexpected runtime error.")
        }
        
        if carakan3Question == checkNumberOutput.classLabel {
            let probs = checkNumberOutput.classLabelProbs
            let carakanProbs = probs[carakan1Question!]
            
//            print("CARAKAN3", carakanProbs)
//
//            if carakanProbs! > 0.88 {
//                return true
//            } else {
//                return false
//            }
            
            return true
            
        } else {
            return false
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuizCellTypeI : PKCanvasViewDelegate {
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if canvasView.tag == 0 {
            if canvasView.drawing.strokes.count > 0 {
                self.isCanvas1Filled = true
            } else {
                self.isCanvas1Filled = false
            }
        } else if canvasView.tag == 1 {
            if canvasView.drawing.strokes.count > 0 {
                self.isCanvas2Filled = true
            } else {
                self.isCanvas2Filled = false
            }
        } else if canvasView.tag == 2 {
            if canvasView.drawing.strokes.count > 0 {
                self.isCanvas3Filled = true
            } else {
                self.isCanvas3Filled = false
            }
        }
        
        if aksaraCount == 1 {
            if isCanvas1Filled == true {
                checkButton.removeLayer(name: "check")
//                checkButton.setCheckButtonBackgroundColor(withOpacity: 1)
                checkButton.isEnabled = true
            } 
        } else if aksaraCount == 2 {
            if isCanvas1Filled == true && isCanvas2Filled == true {
                checkButton.removeLayer(name: "check")
//                checkButton.setCheckButtonBackgroundColor(withOpacity: 1)
                checkButton.isEnabled = true
            }
        } else if aksaraCount == 3 {
            if isCanvas1Filled == true && isCanvas2Filled == true && isCanvas3Filled == true {
                checkButton.removeLayer(name: "check")
//                checkButton.setCheckButtonBackgroundColor(withOpacity: 1)
                checkButton.isEnabled = true
            }
        }
    }
    
}
