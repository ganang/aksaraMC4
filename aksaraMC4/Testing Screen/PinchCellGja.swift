//
//  PinchCellGja.swift
//  aksaraMC4
//
//  Created by Naratama on 04/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class PinchCellGja: BaseCell, UIGestureRecognizerDelegate {
    
    var isCarakanMoving = false
    var isSandhanganMoving = false
    var isIntersect = false
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: frame.width/2 - 70, y: 150, width: 140, height: 200)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "GjaAksaraImage")
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var guideWritingName: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: frame.width/2 - 28, y: frame.height/2 + 40, width: 57, height: 38)
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Gja"
        label.textColor = .white
        label.alpha = 0
        
        return label
    }()
    
    lazy var resultImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: frame.width/2 - 120, y: frame.height/2 + 100, width: 240, height: 39)
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 0
        
        return imageView
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: frame.width/2 - 120, y: frame.height - 120, width: 240, height: 48)
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
        button.alpha = 0
        button.isEnabled = false
        
        return button
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Gja"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
    let carakanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Carakan"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
    let sandhanganLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Pasangan"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
    lazy var carakanButton: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Soal 4 Ga")?.withRenderingMode(.alwaysTemplate)
        button.layer.frame = CGRect(x: frame.width/2 - 290, y: frame.height/2 - 50, width: 200, height: 200)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.addGestureRecognizer(moveGS_Carakan)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 48, left: 48, bottom: 48, right: 48)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 100
        button.alpha = 1
        
        return button
    }()
    
    lazy var sandhangan1Button: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "TaPasanganImage")?.withRenderingMode(.alwaysTemplate)
        button.layer.frame = CGRect(x: frame.width/2 + 120, y: frame.height/2 - 150, width: 200, height: 200)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.addGestureRecognizer(moveGS_Sandhangan1)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 100
        button.alpha = 1
        
        return button
    }()
    
    lazy var sandhangan2Button: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "GjaPasanganImage")?.withRenderingMode(.alwaysTemplate)
        button.layer.frame = CGRect(x: frame.width/2 + 120, y: frame.height/2 + 100, width: 200, height: 200)
        button.setImage(image, for: .normal)
        button.imageView?.tintColor = Theme.current.accentWhite
        button.isUserInteractionEnabled = true
        button.adjustsImageWhenHighlighted = false
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.addGestureRecognizer(moveGS_Sandhangan2)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 48, left: 48, bottom: 48, right: 48)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 100
        button.alpha = 1
        
        return button
    }()
    
    lazy var moveGS_Carakan: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Carakan"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 0
        
        return moveGS
    }()
    
    lazy var moveGS_Sandhangan1: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Sandhangan1"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 1
        
        return moveGS
    }()
    
    lazy var moveGS_Sandhangan2: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Sandhangan2"
        moveGS.viewName = ""
        moveGS.aksaraName = ""
        moveGS.delegate = self
        moveGS.index = 2
        
        return moveGS
    }()
    
    lazy var leftTrackingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "leftTrackingJoImageQuiz")
        imageView.alpha = 1
        
        return imageView
    }()
    
    lazy var rightTrackingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rightTrackingJoImageQuiz")
        imageView.alpha = 1
        
        return imageView
    }()
    
    override func setupViews() {
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        addSubview(questionLabel)
        addSubview(carakanLabel)
        addSubview(sandhanganLabel)
        addSubview(carakanButton)
        addSubview(sandhangan1Button)
        addSubview(sandhangan2Button)
        addSubview(leftTrackingImage)
        addSubview(rightTrackingImage)
        addSubview(backgroundImageView)
        addSubview(guideWritingName)
        addSubview(resultImage)
        addSubview(continueButton)
    }
    
    func setupConstraint() {
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 140).isActive = true
        questionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        carakanLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 48).isActive = true
        carakanLabel.trailingAnchor.constraint(equalTo: questionLabel.leadingAnchor, constant: -140).isActive = true
        
        sandhanganLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 48).isActive = true
        sandhanganLabel.leadingAnchor.constraint(equalTo: questionLabel.trailingAnchor, constant: 140).isActive = true
        
        leftTrackingImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 16).isActive = true
        leftTrackingImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        leftTrackingImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        leftTrackingImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        rightTrackingImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 16).isActive = true
        rightTrackingImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 130).isActive = true
        rightTrackingImage.widthAnchor.constraint(equalToConstant: 260).isActive = true
        rightTrackingImage.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer) {
        if (sender.state == .began) {
            leftTrackingImage.alpha = 0
            rightTrackingImage.alpha = 0
        }
        
        if (sender.state == .changed) {
            if sender.index == 0 {
                let translation = sender.translation(in: self)
                carakanButton.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                carakanButton.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                isCarakanMoving = true
            }
            
            if sender.index == 1 {
                let translation = sender.translation(in: self)
                sandhangan1Button.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                sandhangan1Button.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                isSandhanganMoving = true
            }
            
            if sender.index == 2 {
                let translation = sender.translation(in: self)
                sandhangan2Button.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                sandhangan2Button.transform = CGAffineTransform(translationX: translation.x , y: translation.y)
                isSandhanganMoving = true
            }
            
            if (isCarakanMoving && isSandhanganMoving) {
                if (carakanButton.frame.intersects(sandhangan2Button.frame) || (sandhangan2Button.frame.intersects(carakanButton.frame))) {
                    let percentage = rectIntersectionInPerc(r1: carakanButton.frame, r2: sandhangan2Button.frame)
                    
                    if (percentage > 30) {
                        isIntersect = true
                        handleCorrectIntersect()
                    }
                }
            }
        
        }
        
        if (sender.state == .ended) {
            
            if (isCarakanMoving && isSandhanganMoving) {
                if (isIntersect == false) {
                    UIView.animate(withDuration: 1,delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseIn) { [self] in
                        self.carakanButton.transform = .identity
                        self.sandhangan1Button.transform = .identity
                        self.sandhangan2Button.transform = .identity
                        self.isCarakanMoving = false
                        self.isSandhanganMoving = false
                        self.leftTrackingImage.alpha = 1
                        self.rightTrackingImage.alpha = 1
                    }
                }
            } else if (isCarakanMoving) {
                UIView.animate(withDuration: 0.5,delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    self.carakanButton.transform = .identity
                    self.isCarakanMoving = false
                    self.leftTrackingImage.alpha = 1
                    self.rightTrackingImage.alpha = 1
                }
            } else if (isSandhanganMoving) {
                UIView.animate(withDuration: 0.5,delay: 0,usingSpringWithDamping: 1, initialSpringVelocity: 2, options: .curveEaseIn) { [self] in
                    self.sandhangan1Button.transform = .identity
                    self.sandhangan2Button.transform = .identity
                    self.isSandhanganMoving = false
                    self.leftTrackingImage.alpha = 1
                    self.rightTrackingImage.alpha = 1
                }
            }
        }
    }
    
    func rectIntersectionInPerc(r1:CGRect, r2:CGRect) -> CGFloat {
        if (r1.intersects(r2)) {

           //let interRect:CGRect = r1.rectByIntersecting(r2); //OLD
           let interRect:CGRect = r1.intersection(r2);

           return ((interRect.width * interRect.height) / (((r1.width * r1.height) + (r2.width * r2.height))/2.0) * 100.0)
        }
        return 0;
    }
    
    func handleCorrectIntersect() {
        self.leftTrackingImage.alpha = 0
        self.rightTrackingImage.alpha = 0
        self.resultImage.image = UIImage(named: "correctAnswerStatement")
        
        UIView.animateKeyframes(withDuration: 1.8, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.questionLabel.alpha = 0
                self.carakanLabel.alpha = 0
                self.sandhanganLabel.alpha = 0
                self.carakanButton.alpha = 0
                self.sandhangan1Button.alpha = 0
                self.sandhangan2Button.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 1, animations: {
                self.guideWritingName.frame = CGRect(x: self.frame.width/2 - 28, y: self.frame.height/2 + 80, width: 57, height: 38)
                self.guideWritingName.alpha = 1
                self.backgroundImageView.frame = CGRect(x: self.frame.width/2 - 70, y: self.frame.height/2 - 176, width: 140, height: 200)
                self.backgroundImageView.alpha = 1
                self.resultImage.frame =  CGRect(x: self.frame.width/2 - 120, y: self.frame.height/2 + 140, width: 240, height: 39)
                self.resultImage.alpha = 1
                self.continueButton.frame = CGRect(x: self.frame.width/2 - 120, y: self.frame.height - 100, width: 240, height: 48)
                self.continueButton.alpha = 1
                self.continueButton.isEnabled = true
            })
        })
    }
}
