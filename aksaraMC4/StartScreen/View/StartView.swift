//
//  StartView.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 10/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import Foundation

import UIKit

class StartView: UIView {
    
    //Label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Hasil dan ulasan"
        return label
    }()
    
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 20)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let firstWord   = ""
        let secondWord = "Tahap 1 - Tingkat 1\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 24), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Carakan"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let hasilLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Hasil kamu"
        return label
    }()
    
    let waktuQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 13
        
        let firstWord   = ""
        let secondWord = "Waktu\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Kuis benar"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        return label
    }()
    
    //UIView & Image
    lazy var AksaraCardContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 0
        view.addInnerShadow()
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    lazy var aksaraInTopCard1 : UILabel = {
        let label = UILabel()
        label.text = "Ha"
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
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
    
    
    //SFSymbol
    let timer: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "timer", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let checkmark: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "checkmark.circle", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Button
    let backButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(showWarningModal), for: .touchUpInside)
        if let image = UIImage(named: "backIcon") {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 10)
        button.tintColor = Theme.current.textColor1
        button.backgroundColor = .init(white: 1, alpha: 0.6)
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 1), alpha: 0.1, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    //ScrollView
    lazy var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.isUserInteractionEnabled = true
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
        setupScrollView()
    }
    
    func setupScrollView() {
        addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupView() {
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -339).isActive = true
        
        addSubview(backButton)
        backButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -353).isActive = true
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.03350083752).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(AksaraCardContainer)
        AksaraCardContainer.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -247).isActive = true
        AksaraCardContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40).isActive = true
        AksaraCardContainer.widthAnchor.constraint(equalToConstant: 487).isActive = true
        AksaraCardContainer.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        AksaraCardContainer.addSubview(aksaraLabel)
        aksaraLabel.centerXAnchor.constraint(equalTo: AksaraCardContainer.centerXAnchor).isActive = true
        aksaraLabel.topAnchor.constraint(equalTo: AksaraCardContainer.topAnchor, constant: 24).isActive = true
        
        addSubview(tahapLabel)
        tahapLabel.leadingAnchor.constraint(equalTo: AksaraCardContainer.trailingAnchor, constant: 24).isActive = true
        tahapLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 64).isActive = true
        
        addSubview(hasilLabel)
        hasilLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        hasilLabel.topAnchor.constraint(equalTo: tahapLabel.bottomAnchor, constant: 50).isActive = true
        
        addSubview(waktuQuizLabel)
        waktuQuizLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        waktuQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
