//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

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
    
    var centerPlaceHolderConstraint: NSLayoutConstraint?
    
    var delegate : QuizControllerProtocol?
    
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
        label.text = "Bagaimana anatomi aksara Ha ?"
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
        button.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 56, withWidth: Double(SCREEN_WIDTH), withCorner: 0)
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
        moveGS.viewName = "Jawa Jawaban Ha"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_HeadB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Na"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_HeadC: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ca"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_HeadD: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ra"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailA: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Ka"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailB: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Da"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailC: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Tha"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_TailD: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Sa"
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
        
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: SCREEN_HEIGHT/4).isActive = true
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
        continueButton.isHidden = false
        questionPlaceholder.isHidden = false
        questionFullDetailLabel.isHidden = false
        answersFullDetailLabel.isHidden = false
        aksaraLabel.isHidden = false
    
        questionLabel.text = "Benar sekali 😄"
        questionLabel.textColor = .systemGreen
        
        placeholderHead.removeLayer(name: "dragAndDropLayer")
        placeholderTail.removeLayer(name: "dragAndDropLayer")
        placeholderHead.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        placeholderTail.setCheckButtonBackgroundColorTrue(withOpacity: 1, withHeight: 100, withWidth: 100, withCorner: 16)
        centerPlaceHolderConstraint?.constant = 120
        
        placeholderTail.shake()
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        layoutIfNeeded()
    }
    
    func handleTimer() {
        print("TIME_OUT")
    }
    
    func updateStatusCheckButton() {
        if (isHeadFill && isTailFill) {
            checkButton.removeLayer(name: "check")
            checkButton.setCheckButtonBackgroundColor(withOpacity: 1)
            checkButton.isEnabled = true
        }
    }
    
    // MARK: Gesture to move selected object
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        let senderView = sender.view
        let name =  sender.name
        let viewName = sender.viewName
        
        if sender.state == .ended {
            
            if (name == "Head") {
                if (placeholderHead.frame.intersects(sender.view!.frame)) {
                    let image = UIImage(named: viewName!)?.withRenderingMode(.alwaysTemplate)
                    placeholderHead.setChoosenBackgroundColorLayer(withHeight: 100, withWidth: 100)
                    placeholderHead.setImage(image, for: .normal)
                    placeholderHead.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderHead.tintColor = .white
                    
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
