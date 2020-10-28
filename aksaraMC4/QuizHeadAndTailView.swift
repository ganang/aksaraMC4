//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuizHeadAndTailView: UIViewController, UIGestureRecognizerDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originHeadAPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 - 68, width: 64, height: 64)
    let originHeadBPosition = CGRect(x: 112, y: UIScreen.main.bounds.height/2 - 68, width: 64, height: 64)
    let originHeadCPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 + 4, width: 64, height: 64)
    let originHeadDPosition = CGRect(x: 112, y: UIScreen.main.bounds.height/2 + 4, width: 64, height: 64)
    
    let originTailAPosition = CGRect(x: UIScreen.main.bounds.width - 112, y: UIScreen.main.bounds.height/2 - 68, width: 64, height: 64)
    let originTailBPosition = CGRect(x: UIScreen.main.bounds.width - 184, y: UIScreen.main.bounds.height/2 - 68, width: 64, height: 64)
    let originTailCPosition = CGRect(x: UIScreen.main.bounds.width - 112, y: UIScreen.main.bounds.height/2 + 4, width: 64, height: 64)
    let originTailDPosition = CGRect(x: UIScreen.main.bounds.width - 184, y: UIScreen.main.bounds.height/2 + 4, width: 64, height: 64)
    
    let originHeaderHead = CGRect(x: 73, y: UIScreen.main.bounds.height/2 - 96, width: 100, height: 20)
    let originHeaderTail = CGRect(x: UIScreen.main.bounds.width - 136, y: UIScreen.main.bounds.height/2 - 96, width: 100, height: 20)
    
    var isHeadFill = false
    var isTailFill = false
    
    lazy var placeholderHead: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var placeholderTail: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
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
        
        return button
    }()
    
    
    // Handle Success View
    lazy var successButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Lanjut 􀆊", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        button.setCheckButtonBackgroundColorTrue(withOpacity: 1)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(handleSuccessButton), for: .touchUpInside)
        button.isEnabled = true
        button.isHidden = true
        
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
        
        return button
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setBackgroundColor()
        navigationController?.navigationBar.isHidden = true
        
        setupView()
    }
    
    func setupView() {
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        view.addSubview(placeholderHead)
        view.addSubview(placeholderTail)
        
        view.addSubview(questionLabel)
        view.addSubview(headerHeadLabel)
        view.addSubview(headerTailLabel)
        view.addSubview(footerPlaceholderHead)
        view.addSubview(footerPlaceholderTail)
        
        view.addSubview(headA)
        view.addSubview(headB)
        view.addSubview(headC)
        view.addSubview(headD)
        
        view.addSubview(tailA)
        view.addSubview(tailB)
        view.addSubview(tailC)
        view.addSubview(tailD)
        
        view.addSubview(checkButton)
        view.addSubview(successButton)
        
        view.addSubview(questionPlaceholder)
        view.addSubview(checkPlaceholderHead)
        view.addSubview(checkPlaceholderTail)
    }
    
    func setupConstraint() {
        placeholderHead.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderHead.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        placeholderHead.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderHead.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        placeholderTail.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderTail.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        placeholderTail.widthAnchor.constraint(equalToConstant: 100).isActive = true
        placeholderTail.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: SCREEN_HEIGHT/4).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
        
        checkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        checkButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        successButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        successButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        successButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        successButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        questionPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -120).isActive = true
        questionPlaceholder.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        questionPlaceholder.widthAnchor.constraint(equalToConstant: 100).isActive = true
        questionPlaceholder.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        checkPlaceholderHead.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 56).isActive = true
        checkPlaceholderHead.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        checkPlaceholderHead.widthAnchor.constraint(equalToConstant: 100).isActive = true
        checkPlaceholderHead.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        checkPlaceholderTail.leadingAnchor.constraint(equalTo: checkPlaceholderHead.trailingAnchor, constant: 24).isActive = true
        checkPlaceholderTail.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        checkPlaceholderTail.widthAnchor.constraint(equalToConstant: 100).isActive = true
        checkPlaceholderTail.heightAnchor.constraint(equalToConstant: 100).isActive = true
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
        placeholderHead.isHidden = true
        placeholderTail.isHidden = true
        footerPlaceholderHead.isHidden = true
        footerPlaceholderTail.isHidden = true
        
        questionLabel.text = "Benar sekali 😄"
        questionLabel.textColor = .systemGreen
        
        checkButton.isHidden = true
        
        successButton.isHidden = false
        questionPlaceholder.isHidden = false
        checkPlaceholderHead.isHidden = false
        checkPlaceholderTail.isHidden = false
    }
    
    @objc func handleSuccessButton() {
        print("LANJUT")
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
                    placeholderHead.setChoosenBackgroundColor()
                    placeholderHead.setImage(image, for: .normal)
                    placeholderHead.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderHead.tintColor = .white
                    
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
                    placeholderTail.setChoosenBackgroundColor()
                    placeholderTail.setImage(image, for: .normal)
                    placeholderTail.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                    placeholderTail.tintColor = .white
                    
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
        } else if sender.state == .began {
        } else {
            sender.view?.center = sender.location(in: view)
        }
    }
}
