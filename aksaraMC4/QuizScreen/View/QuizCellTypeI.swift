//
//  TypeNewMix3Cell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 29/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit

class QuizCellTypeI: UICollectionViewCell{
    
    var firstCanvasCenterXAnchor1 : NSLayoutConstraint?
    var firstCanvasTrailingAnchor2 : NSLayoutConstraint?
    var firstCanvasTrailingAnchor3 : NSLayoutConstraint?
    var secondCanvasLeadingAnchor1 : NSLayoutConstraint?
    var secondCanvasCenterXAnchor2 : NSLayoutConstraint?
    var thirdCanvasLeadingAnchor1 : NSLayoutConstraint?
    var isCanvas1Filled : Bool?
    var isCanvas2Filled : Bool?
    var isCanvas3Filled : Bool?
    
    var aksaraCount : Int? = 3
   
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
        image.image = UIImage(named: "correctAnswer")
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
        canvasView.allowsFingerDrawing = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 2)
        canvasView.tag = 0
        canvasView.delegate = self
        
        return canvasView
    }()

    
    let question1Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Aksara Wa"
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
        canvasView.allowsFingerDrawing = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 2)
        canvasView.tag = 1
        canvasView.delegate = self
        
        return canvasView
    }()
    
    let checkmarkImage2 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let question2Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Aksara Ha"
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
        canvasView.allowsFingerDrawing = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 2)
        canvasView.tag = 2
        canvasView.delegate = self
        
        return canvasView
    }()
    
    let checkmarkImage3 : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let question3Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Aksara Na"
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
    
    let continueButton : UIButton = {
        let btn = UIButton()
//        btn.setCheckBottomBlueBackgroundColor()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Check", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        btn.setTitleColor(Theme.current.accentWhite, for: .normal)
        
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.imageView?.tintColor = Theme.current.accentWhite
        btn.backgroundColor = UIColor.rgb(red: 4, green: 110, blue: 208, alpha: 1)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 130, bottom: 0, right: 0)
        btn.alpha = 0.4
//        btn.isHidden = true
        
//        btn.setCardTrueBackgroundColor()
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()

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
        addSubview(questionTitle)
        questionTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        
        addSubview(containerCanvasView1)
        containerCanvasView1.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 106).isActive = true
        firstCanvasCenterXAnchor1?.isActive = true
        containerCanvasView1.widthAnchor.constraint(equalToConstant: 240).isActive = true
        containerCanvasView1.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        containerCanvasView1.addSubview(canvasView1)
        canvasView1.topAnchor.constraint(equalTo: containerCanvasView1.topAnchor).isActive = true
        canvasView1.bottomAnchor.constraint(equalTo: containerCanvasView1.bottomAnchor).isActive = true
        canvasView1.leadingAnchor.constraint(equalTo: containerCanvasView1.leadingAnchor).isActive = true
        canvasView1.trailingAnchor.constraint(equalTo: containerCanvasView1.trailingAnchor).isActive = true
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
        
        addSubview(continueButton)
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        print(continueButton)
        
        if aksaraCount == 2 {
            firstCanvasCenterXAnchor1?.isActive = false
            firstCanvasTrailingAnchor2?.isActive = true
            
            
            addSubview(containerCanvasView2)
            containerCanvasView2.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 106).isActive = true
//            firstCanvasCenterXAnchor1?.isActive = true
            secondCanvasLeadingAnchor1?.isActive = true
            containerCanvasView2.widthAnchor.constraint(equalToConstant: 240).isActive = true
            containerCanvasView2.heightAnchor.constraint(equalToConstant: 240).isActive = true
            
            containerCanvasView2.addSubview(canvasView2)
            canvasView2.topAnchor.constraint(equalTo: containerCanvasView2.topAnchor).isActive = true
            canvasView2.bottomAnchor.constraint(equalTo: containerCanvasView2.bottomAnchor).isActive = true
            canvasView2.leadingAnchor.constraint(equalTo: containerCanvasView2.leadingAnchor).isActive = true
            canvasView2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor).isActive = true
            
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
            
            firstCanvasCenterXAnchor1?.isActive = false
            firstCanvasTrailingAnchor3?.isActive = true
            secondCanvasLeadingAnchor1?.isActive = false
            
            //second canvas
            addSubview(containerCanvasView2)
            containerCanvasView2.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 106).isActive = true
            secondCanvasCenterXAnchor2?.isActive = true
            containerCanvasView2.widthAnchor.constraint(equalToConstant: 240).isActive = true
            containerCanvasView2.heightAnchor.constraint(equalToConstant: 240).isActive = true
            
            containerCanvasView2.addSubview(canvasView2)
            canvasView2.topAnchor.constraint(equalTo: containerCanvasView2.topAnchor).isActive = true
            canvasView2.bottomAnchor.constraint(equalTo: containerCanvasView2.bottomAnchor).isActive = true
            canvasView2.leadingAnchor.constraint(equalTo: containerCanvasView2.leadingAnchor).isActive = true
            canvasView2.trailingAnchor.constraint(equalTo: containerCanvasView2.trailingAnchor).isActive = true
            
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
            containerCanvasView3.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 106).isActive = true
            thirdCanvasLeadingAnchor1?.isActive = true
            containerCanvasView3.widthAnchor.constraint(equalToConstant: 240).isActive = true
            containerCanvasView3.heightAnchor.constraint(equalToConstant: 240).isActive = true
            
            containerCanvasView3.addSubview(canvasView3)
            canvasView3.topAnchor.constraint(equalTo: containerCanvasView3.topAnchor).isActive = true
            canvasView3.bottomAnchor.constraint(equalTo: containerCanvasView3.bottomAnchor).isActive = true
            canvasView3.leadingAnchor.constraint(equalTo: containerCanvasView3.leadingAnchor).isActive = true
            canvasView3.trailingAnchor.constraint(equalTo: containerCanvasView3.trailingAnchor).isActive = true
            
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
                continueButton.alpha = 1
            } else {
                continueButton.alpha = 0.4
            }
        } else if aksaraCount == 2 {
            if isCanvas1Filled == true && isCanvas2Filled == true {
                continueButton.alpha = 1
            } else {
                continueButton.alpha = 0.4
            }
        } else if aksaraCount == 3 {
            if isCanvas1Filled == true && isCanvas2Filled == true && isCanvas3Filled == true {
                continueButton.alpha = 1
            } else {
                continueButton.alpha = 0.4
            }
        }
        

    }

}
