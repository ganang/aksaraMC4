//
//  UlasanView.swift
//  aksaraMC4
//
//  Created by Naratama on 02/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import Foundation

import UIKit

class InputNameView: UIView, UITextViewDelegate {
    
    var quizAnswerLabelConstraint: NSLayoutConstraint!
    var name : String?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 12
        
        let firstWord   = ""
        let secondWord = "Sebelum memulai, masukkan :\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 24), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 24), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Nama profil"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var textViewDecorative: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "decorativeTextFieldInputName")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var usernameLabel: UITextView = {
        let label = UITextView()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = UIColor.rgb(red: 29, green: 112, blue: 188, alpha: 0.2)
        label.text = "Nama profil"
        label.backgroundColor = .clear
        label.isScrollEnabled = false
        label.textAlignment = .center

        return label
    }()

    lazy var continueButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(systemName: "chevron.right")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Lanjut", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        button.tintColor = Theme.current.accentWhite
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 28
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
//        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
        button.backgroundColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -140)
        button.alpha = 0.4
        
        return button
    }()
    
    var limitTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.text = "20"
        return label
    }()
    
    lazy var profileIconDecorative: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "decorativeProfileInputName")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    let profileIcon: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "person.fill", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let topDecorationImage1: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FlowerFull")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let topDecorationImage2: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FlowerFull")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let middleDecorationImage1: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FlowerHalf")
        img.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi/2))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let middleDecorationImage2: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FlowerHalf")
        img.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*1.5))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let circleProfile: UIView = {
        let circleProfile = UIView()
        circleProfile.layer.cornerRadius = 48/2
        
        circleProfile.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        circleProfile.translatesAutoresizingMaskIntoConstraints = false
        circleProfile.addInnerShadow()
        circleProfile.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return circleProfile
    }()
    
    lazy var inputUsername: UIView = {
        let inputUsername = UIView()
        inputUsername.layer.cornerRadius = 32

        inputUsername.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        inputUsername.translatesAutoresizingMaskIntoConstraints = false
        inputUsername.addInnerShadow()
        inputUsername.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return inputUsername
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        setBackgroundColor()
        setupView()
//        usernameLabel.delegate = self
    }
    
    func setupView() {
        addSubview(circleProfile)
        circleProfile.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        quizAnswerLabelConstraint = circleProfile.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -190)
        quizAnswerLabelConstraint.isActive = true
        circleProfile.heightAnchor.constraint(equalToConstant: 48).isActive = true
        circleProfile.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(topDecorationImage1)
        topDecorationImage1.trailingAnchor.constraint(equalTo: circleProfile.leadingAnchor, constant: -16).isActive = true
        topDecorationImage1.centerYAnchor.constraint(equalTo: circleProfile.centerYAnchor).isActive = true
        topDecorationImage1.heightAnchor.constraint(equalToConstant: 34).isActive = true
        topDecorationImage1.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        addSubview(topDecorationImage2)
        topDecorationImage2.leadingAnchor.constraint(equalTo: circleProfile.trailingAnchor, constant: 16).isActive = true
        topDecorationImage2.centerYAnchor.constraint(equalTo: circleProfile.centerYAnchor).isActive = true
        topDecorationImage2.heightAnchor.constraint(equalToConstant: 34).isActive = true
        topDecorationImage2.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        circleProfile.addSubview(profileIcon)
        profileIcon.centerXAnchor.constraint(equalTo: circleProfile.centerXAnchor, constant: 0).isActive = true
        profileIcon.centerYAnchor.constraint(equalTo: circleProfile.centerYAnchor, constant: 0).isActive = true
        profileIcon.heightAnchor.constraint(equalToConstant: 29).isActive = true
        profileIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(profileIconDecorative)
        profileIconDecorative.centerXAnchor.constraint(equalTo: circleProfile.centerXAnchor, constant: 0).isActive = true
        profileIconDecorative.centerYAnchor.constraint(equalTo: circleProfile.centerYAnchor, constant: 0).isActive = true
        profileIconDecorative.heightAnchor.constraint(equalToConstant: 34).isActive = true
        profileIconDecorative.widthAnchor.constraint(equalToConstant: 148).isActive = true
        
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: circleProfile.bottomAnchor, constant: 24).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        addSubview(inputUsername)
        inputUsername.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        inputUsername.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40).isActive = true
        inputUsername.heightAnchor.constraint(equalToConstant: 64).isActive = true
        inputUsername.widthAnchor.constraint(equalToConstant: 640).isActive = true
        
        addSubview(textViewDecorative)
        textViewDecorative.centerXAnchor.constraint(equalTo: inputUsername.centerXAnchor, constant: 0).isActive = true
        textViewDecorative.centerYAnchor.constraint(equalTo: inputUsername.centerYAnchor, constant: 0).isActive = true
        textViewDecorative.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textViewDecorative.widthAnchor.constraint(equalToConstant: 718).isActive = true
        
        inputUsername.addSubview(usernameLabel)
        usernameLabel.centerXAnchor.constraint(equalTo: inputUsername.centerXAnchor, constant: 0).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: inputUsername.centerYAnchor, constant: 0).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: 560).isActive = true
        
        inputUsername.addSubview(limitTextLabel)
        limitTextLabel.trailingAnchor.constraint(equalTo: inputUsername.trailingAnchor, constant: -24).isActive = true
        limitTextLabel.centerYAnchor.constraint(equalTo: inputUsername.centerYAnchor, constant: 0).isActive = true
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: inputUsername.centerXAnchor, constant: 0).isActive = true
        continueButton.topAnchor.constraint(equalTo: inputUsername.bottomAnchor, constant: 24).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true

    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
