//
//  QuizCellTypeGuide.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 29/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit

class QuizCellTypeGuide: UICollectionViewCell {
    
    lazy var containerCanvasView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        
        
        
        return view
    }()
    
    let shadowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HaColor")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "info.circle.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.accentWhite
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        return button
    }()
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Latihan Menulis"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    lazy var reloadButton : UIButton = {
        let btn = UIButton()
        
        let origImage = UIImage(named: "reloadButton")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        btn.setImage(tintedImage, for: .normal)
        btn.tintColor = Theme.current.accentWhite
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.tag = 0
        btn.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)

        return btn
    }()
    
    lazy var canvasView: PKCanvasView = {
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
    
    let checkmarkImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let checkButton : UIButton = {
        let button = UIButton(type: .system)
        let custombutton = NSMutableAttributedString(string: "Cek", attributes: [ NSAttributedString.Key.foregroundColor: Theme.current.textColor1])
        button.setAttributedTitle(custombutton, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = Theme.current.accentWhite
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return button
    }()
    
    //Question
    lazy var guideCardContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    lazy var aksaraName : UILabel = {
        let label = UILabel()
        label.text = "Ha"
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var aksaraRegion : UILabel = {
        let label = UILabel()
        label.text = "Aksara Jawa"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let speakerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "speaker.2.fill")
        image.tintColor = Theme.current.accentWhite
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HaWhite")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var aksaraType : UILabel = {
        let label = UILabel()
        label.text = "Carakan"
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let bookmarkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "bookmark.fill")
        image.tintColor = Theme.current.accentWhite
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var aksaraExample : UILabel = {
        let label = UILabel()
        label.text = "Ha : hawa"
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    //Anatomi
    lazy var anatomiCardContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    lazy var aksaraNameAnatomi : UILabel = {
        let label = UILabel()
        label.text = "Anatomi Ha"
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var anatomiHeadImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "anatomiHaHead")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var plusImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.tintColor = Theme.current.accentWhite
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var anatomiTailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "anatomiHaTail")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var headLabel : UILabel = {
        let label = UILabel()
        label.text = "Kepala"
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var tailLabel : UILabel = {
        let label = UILabel()
        label.text = "Ekor"
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let continueButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Check", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        btn.setTitleColor(Theme.current.accentWhite, for: .normal)
        
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.imageView?.tintColor = Theme.current.accentWhite
        btn.backgroundColor = UIColor.rgb(red: 4, green: 110, blue: 208, alpha: 1)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 130, bottom: 0, right: 0)
        btn.alpha = 1
        return btn
    }()
    
    
    
    //Modal
    
    lazy var backgroundBlurView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.07, alpha: 1.00).withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addBlurEffect()
        let tapClose = UITapGestureRecognizer(target: self, action: #selector(hideModal))
        view.addGestureRecognizer(tapClose)
        
        return view
    }()
    
    
    lazy var containerModalView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)

        return view
    }()
    
    lazy var infoButtonModal: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "info.circle.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.textColor1
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        return button
    }()
    
    let questionLabelModal : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Latihan Menulis"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var descriptionTextModal : UILabel = {
        let label = UILabel()
        label.text = "Kamu dapat menggunakan Apple Pencil atau ujung jari untuk menulis dan cek hasil tulisan aksaramu"
        label.numberOfLines = 3
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let instructionImageModal: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "instructionImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let understandButtonModal : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Mengerti", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        btn.setTitleColor(Theme.current.textColor1, for: .normal)

        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        setupView()
        setupViewCanvas()
        setupViewGuideCard()
        setupViewAnatomiCard()
        
        
    }
    
    @objc func showModal() {
        modalOpened()
    }
    
    @objc func hideModal() {
//        print("tapped")
        backgroundBlurView.removeFromSuperview()
    }
    
    @objc func reloadPencilKit(_ sender: UIButton) {
        canvasView.drawing = PKDrawing()
    }
    
    func modalOpened() {
        addSubview(backgroundBlurView)
        backgroundBlurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        backgroundBlurView.addSubview(containerModalView)
        containerModalView.centerXAnchor.constraint(equalTo: backgroundBlurView.centerXAnchor).isActive = true
        containerModalView.centerYAnchor.constraint(equalTo: backgroundBlurView.centerYAnchor).isActive = true
        containerModalView.heightAnchor.constraint(equalToConstant: 560).isActive = true
        containerModalView.widthAnchor.constraint(equalToConstant: 440).isActive = true
        
        containerModalView.addSubview(infoButtonModal)
        infoButtonModal.leadingAnchor.constraint(equalTo: containerModalView.leadingAnchor, constant: 36).isActive = true
        infoButtonModal.topAnchor.constraint(equalTo: containerModalView.topAnchor, constant: 38).isActive = true
        infoButtonModal.heightAnchor.constraint(equalToConstant: 28 ).isActive = true
        infoButtonModal.widthAnchor.constraint(equalToConstant: 28 ).isActive = true
        
        containerModalView.addSubview(questionLabelModal)
        questionLabelModal.leadingAnchor.constraint(equalTo: infoButtonModal.trailingAnchor, constant: 12).isActive = true
        questionLabelModal.centerYAnchor.constraint(equalTo: infoButtonModal.centerYAnchor, constant: 0).isActive = true
        
        containerModalView.addSubview(descriptionTextModal)
        descriptionTextModal.leadingAnchor.constraint(equalTo: containerModalView.leadingAnchor, constant: 36).isActive = true
        descriptionTextModal.topAnchor.constraint(equalTo: containerModalView.topAnchor, constant: 80).isActive = true
        descriptionTextModal.heightAnchor.constraint(equalToConstant: 81 ).isActive = true
        descriptionTextModal.widthAnchor.constraint(equalToConstant: 331 ).isActive = true
        
        containerModalView.addSubview(instructionImageModal)
        instructionImageModal.leadingAnchor.constraint(equalTo: containerModalView.leadingAnchor, constant: 145).isActive = true
        instructionImageModal.topAnchor.constraint(equalTo: containerModalView.topAnchor, constant: 206).isActive = true
        instructionImageModal.heightAnchor.constraint(equalToConstant: 178 ).isActive = true
        instructionImageModal.widthAnchor.constraint(equalToConstant: 259 ).isActive = true
        
        containerModalView.addSubview(understandButtonModal)
        understandButtonModal.centerXAnchor.constraint(equalTo: containerModalView.centerXAnchor, constant: 0).isActive = true
        understandButtonModal.bottomAnchor.constraint(equalTo: containerModalView.bottomAnchor, constant: -44).isActive = true
        understandButtonModal.heightAnchor.constraint(equalToConstant: 24 ).isActive = true
        understandButtonModal.widthAnchor.constraint(equalToConstant: 92 ).isActive = true
        
        
    }
    
    func setupView() {
        addSubview(continueButton)
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    func setupViewGuideCard() {
        addSubview(guideCardContainer)
        guideCardContainer.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        guideCardContainer.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        guideCardContainer.widthAnchor.constraint(equalToConstant: 440).isActive = true
        guideCardContainer.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        guideCardContainer.addSubview(aksaraName)
        aksaraName.leadingAnchor.constraint(equalTo: guideCardContainer.leadingAnchor, constant: 24).isActive = true
        aksaraName.topAnchor.constraint(equalTo: guideCardContainer.topAnchor, constant: 24).isActive = true
        
        guideCardContainer.addSubview(aksaraRegion)
        aksaraRegion.leadingAnchor.constraint(equalTo: guideCardContainer.leadingAnchor, constant: 24).isActive = true
        aksaraRegion.topAnchor.constraint(equalTo: aksaraName.bottomAnchor, constant: 4).isActive = true
        
        guideCardContainer.addSubview(speakerImage)
        speakerImage.trailingAnchor.constraint(equalTo: guideCardContainer.trailingAnchor, constant: -24).isActive = true
        speakerImage.topAnchor.constraint(equalTo: guideCardContainer.topAnchor, constant: 24).isActive = true
        speakerImage.widthAnchor.constraint(equalToConstant: 33).isActive = true
        speakerImage.heightAnchor.constraint(equalToConstant: 29).isActive = true
        guideCardContainer.bringSubviewToFront(speakerImage)
        
        guideCardContainer.addSubview(aksaraImage)
        aksaraImage.centerXAnchor.constraint(equalTo: guideCardContainer.centerXAnchor, constant: 0).isActive = true
        aksaraImage.centerYAnchor.constraint(equalTo: guideCardContainer.centerYAnchor, constant: 0).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        guideCardContainer.addSubview(aksaraType)
        aksaraType.leadingAnchor.constraint(equalTo: guideCardContainer.leadingAnchor, constant: 24).isActive = true
        aksaraType.topAnchor.constraint(equalTo: guideCardContainer.topAnchor, constant: 192).isActive = true
        
        guideCardContainer.addSubview(bookmarkImage)
        bookmarkImage.leadingAnchor.constraint(equalTo: guideCardContainer.leadingAnchor, constant: 24).isActive = true
        bookmarkImage.topAnchor.constraint(equalTo: aksaraType.bottomAnchor, constant: 4).isActive = true
        bookmarkImage.widthAnchor.constraint(equalToConstant: 16).isActive = true
        bookmarkImage.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        guideCardContainer.addSubview(aksaraExample)
        aksaraExample.leadingAnchor.constraint(equalTo: bookmarkImage.trailingAnchor, constant: 8).isActive = true
        aksaraExample.topAnchor.constraint(equalTo: aksaraType.bottomAnchor, constant: 4).isActive = true
        
    }
    
    func setupViewAnatomiCard() {
        addSubview(anatomiCardContainer)
        anatomiCardContainer.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        anatomiCardContainer.topAnchor.constraint(equalTo: guideCardContainer.bottomAnchor, constant: 16).isActive = true
        anatomiCardContainer.widthAnchor.constraint(equalToConstant: 440).isActive = true
        anatomiCardContainer.heightAnchor.constraint(equalToConstant: 260).isActive = true
        
        anatomiCardContainer.addSubview(aksaraNameAnatomi)
        aksaraNameAnatomi.leadingAnchor.constraint(equalTo: anatomiCardContainer.leadingAnchor, constant: 24).isActive = true
        aksaraNameAnatomi.topAnchor.constraint(equalTo: anatomiCardContainer.topAnchor, constant: 24).isActive = true
        
        anatomiCardContainer.addSubview(anatomiHeadImage)
        anatomiHeadImage.leadingAnchor.constraint(equalTo: anatomiCardContainer.leadingAnchor, constant: 162).isActive = true
        anatomiHeadImage.centerYAnchor.constraint(equalTo: anatomiCardContainer.centerYAnchor).isActive = true
        anatomiHeadImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        anatomiHeadImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        anatomiCardContainer.addSubview(plusImage)
        plusImage.centerXAnchor.constraint(equalTo: anatomiCardContainer.centerXAnchor, constant: 0).isActive = true
        plusImage.centerYAnchor.constraint(equalTo: anatomiCardContainer.centerYAnchor).isActive = true
        plusImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        plusImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        anatomiCardContainer.addSubview(anatomiTailImage)
        anatomiTailImage.trailingAnchor.constraint(equalTo: anatomiCardContainer.trailingAnchor, constant: -163).isActive = true
        anatomiTailImage.centerYAnchor.constraint(equalTo: anatomiCardContainer.centerYAnchor).isActive = true
        anatomiTailImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        anatomiTailImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        anatomiCardContainer.addSubview(headLabel)
        headLabel.topAnchor.constraint(equalTo: anatomiHeadImage.bottomAnchor, constant: 12).isActive = true
        headLabel.centerXAnchor.constraint(equalTo: anatomiHeadImage.centerXAnchor).isActive = true
        
        anatomiCardContainer.addSubview(tailLabel)
        tailLabel.topAnchor.constraint(equalTo: anatomiTailImage.bottomAnchor, constant: 12).isActive = true
        tailLabel.centerXAnchor.constraint(equalTo: anatomiTailImage.centerXAnchor).isActive = true
        
    }
    
    func setupViewCanvas() {
        addSubview(containerCanvasView)
        containerCanvasView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 40).isActive = true
        containerCanvasView.topAnchor.constraint(equalTo: topAnchor, constant: 108).isActive = true
        containerCanvasView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        containerCanvasView.heightAnchor.constraint(equalToConstant: 420).isActive = true
        
        containerCanvasView.addSubview(shadowImage)
        shadowImage.centerXAnchor.constraint(equalTo: containerCanvasView.centerXAnchor).isActive = true
        shadowImage.centerYAnchor.constraint(equalTo: containerCanvasView.centerYAnchor).isActive = true
        shadowImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        shadowImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(infoButton)
        infoButton.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor, constant: 0).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: -23).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 28 ).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 28 ).isActive = true
        
        addSubview(questionLabel)
        questionLabel.leadingAnchor.constraint(equalTo: infoButton.trailingAnchor, constant: 9).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: -22).isActive = true
        
        addSubview(reloadButton)
        reloadButton.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: 0).isActive = true
        reloadButton.bottomAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: -23).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 29 ).isActive = true
        reloadButton.widthAnchor.constraint(equalToConstant: 25 ).isActive = true
        
        addSubview(canvasView)
        canvasView.topAnchor.constraint(equalTo: containerCanvasView.topAnchor).isActive = true
        canvasView.bottomAnchor.constraint(equalTo: containerCanvasView.bottomAnchor).isActive = true
        canvasView.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor).isActive = true
        canvasView.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor).isActive = true
        
        addSubview(checkmarkImage)
        checkmarkImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
        checkmarkImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        checkmarkImage.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: -16).isActive = true
        checkmarkImage.topAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: 26).isActive = true
        
        
        addSubview(checkButton)
        checkButton.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor).isActive = true
        checkButton.topAnchor.constraint(equalTo: containerCanvasView.bottomAnchor, constant: 16).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension QuizCellTypeGuide : PKCanvasViewDelegate {
    

    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {

    }

}