//
//  StageScreenView.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 08/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class StageView: UIView {
    
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        //button.subviews.first?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let backButtonTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 32)
        label.text = "Tahap 1"
        label.textColor = Theme.current.textColor1
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()


    //TAHAP 1 CARD
    let tahap1Card : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let tahap1gununganImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap1progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 16)
        label.text = "45/45"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap1CardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "Tahap 1"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap1ImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tahap1CardAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap1CardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahap1CardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Regular", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Carakan"
        return label
    }()
    
    
    //TAHAP 2 CARD
    let tahap2Card : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let tahap2gununganImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap2progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 16)
        label.text = "45/45"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap2CardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "Tahap 1"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap2ImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tahap2CardAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap2CardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahap2CardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Regular", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Carakan"
        return label
    }()
    
    //TAHAP 3 CARD
    let tahap3Card : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let tahap3gununganImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap3progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 16)
        label.text = "45/45"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap3CardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "Tahap 1"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap3ImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tahap3CardAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap3CardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahap3CardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Regular", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Carakan"
        return label
    }()

    //TAHAP 4 CARD
    let tahap4Card : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.alpha = 1
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let tahap4gununganImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap4progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 16)
        label.text = "45/45"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap4CardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "Tahap 1"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let tahap4ImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tahap4CardAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap4CardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahap4CardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Regular", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Carakan"
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
    }
    
    func setupView() {
        setupBackButton()
        setupLayoutCard1()
        setupLayoutCard2()
        setupLayoutCard3()
        setupLayoutCard4()
    }
    
    func setupBackButton() {
        addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(backButtonTitle)
        backButtonTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 0).isActive = true
        backButtonTitle.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 32).isActive = true
    }
    
    func setupLayoutCard1() {
        addSubview(tahap1Card)
        tahap1Card.heightAnchor.constraint(equalToConstant: 400).isActive = true
        tahap1Card.widthAnchor.constraint(equalToConstant: 240).isActive = true
        tahap1Card.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 93).isActive = true
        tahap1Card.topAnchor.constraint(equalTo: topAnchor, constant: 217).isActive = true
        
        tahap1Card.addSubview(tahap1gununganImageIcon)
        tahap1gununganImageIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        tahap1gununganImageIcon.widthAnchor.constraint(equalToConstant: 16.79).isActive = true
        tahap1gununganImageIcon.trailingAnchor.constraint(equalTo: tahap1Card.trailingAnchor, constant: -17.82).isActive = true
        tahap1gununganImageIcon.topAnchor.constraint(equalTo: tahap1Card.topAnchor, constant: 16).isActive = true
        
        
        tahap1Card.addSubview(tahap1progresLabel)
        tahap1progresLabel.trailingAnchor.constraint(equalTo: tahap1gununganImageIcon.leadingAnchor, constant: -8).isActive = true
        tahap1progresLabel.topAnchor.constraint(equalTo: tahap1Card.topAnchor, constant: 23).isActive = true
        

        tahap1Card.addSubview(tahap1CardTitle)
        tahap1CardTitle.leadingAnchor.constraint(equalTo: tahap1Card.leadingAnchor, constant: 24).isActive = true
        tahap1CardTitle.topAnchor.constraint(equalTo: tahap1Card.topAnchor, constant: 286).isActive = true
        
        
        tahap1Card.addSubview(tahap1ImageIcon)
        tahap1ImageIcon.heightAnchor.constraint(equalToConstant: 152.73).isActive = true
        tahap1ImageIcon.widthAnchor.constraint(equalToConstant: 120).isActive = true
        tahap1ImageIcon.centerXAnchor.constraint(equalTo: tahap1Card.centerXAnchor).isActive = true
        tahap1ImageIcon.topAnchor.constraint(equalTo: tahap1Card.topAnchor, constant: 85).isActive = true

        tahap1Card.addSubview(tahap1CardSubtitle1)
        tahap1CardSubtitle1.leadingAnchor.constraint(equalTo: tahap1Card.leadingAnchor, constant: 24).isActive = true
        tahap1CardSubtitle1.topAnchor.constraint(equalTo: tahap1CardTitle.bottomAnchor, constant: 8).isActive = true

        tahap1Card.addSubview(tahap1CardSubtitle2)
        tahap1CardSubtitle2.leadingAnchor.constraint(equalTo: tahap1Card.leadingAnchor, constant: 24).isActive = true
        tahap1CardSubtitle2.topAnchor.constraint(equalTo: tahap1CardSubtitle1.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupLayoutCard2() {
        addSubview(tahap2Card)
        tahap2Card.heightAnchor.constraint(equalToConstant: 400).isActive = true
        tahap2Card.widthAnchor.constraint(equalToConstant: 240).isActive = true
        tahap2Card.leadingAnchor.constraint(equalTo: tahap1Card.trailingAnchor, constant: 16).isActive = true
        tahap2Card.topAnchor.constraint(equalTo: topAnchor, constant: 217).isActive = true
        
        tahap2Card.addSubview(tahap2gununganImageIcon)
        tahap2gununganImageIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        tahap2gununganImageIcon.widthAnchor.constraint(equalToConstant: 16.79).isActive = true
        tahap2gununganImageIcon.trailingAnchor.constraint(equalTo: tahap2Card.trailingAnchor, constant: -17.82).isActive = true
        tahap2gununganImageIcon.topAnchor.constraint(equalTo: tahap2Card.topAnchor, constant: 16).isActive = true
        
        
        tahap2Card.addSubview(tahap2progresLabel)
        tahap2progresLabel.trailingAnchor.constraint(equalTo: tahap2gununganImageIcon.leadingAnchor, constant: -8).isActive = true
        tahap2progresLabel.topAnchor.constraint(equalTo: tahap2Card.topAnchor, constant: 23).isActive = true
        

        tahap2Card.addSubview(tahap2CardTitle)
        tahap2CardTitle.leadingAnchor.constraint(equalTo: tahap2Card.leadingAnchor, constant: 24).isActive = true
        tahap2CardTitle.topAnchor.constraint(equalTo: tahap2Card.topAnchor, constant: 286).isActive = true
        
        
        tahap2Card.addSubview(tahap2ImageIcon)
        tahap2ImageIcon.heightAnchor.constraint(equalToConstant: 152.73).isActive = true
        tahap2ImageIcon.widthAnchor.constraint(equalToConstant: 120).isActive = true
        tahap2ImageIcon.centerXAnchor.constraint(equalTo: tahap2Card.centerXAnchor).isActive = true
        tahap2ImageIcon.topAnchor.constraint(equalTo: tahap2Card.topAnchor, constant: 85).isActive = true

        tahap2Card.addSubview(tahap2CardSubtitle1)
        tahap2CardSubtitle1.leadingAnchor.constraint(equalTo: tahap2Card.leadingAnchor, constant: 24).isActive = true
        tahap2CardSubtitle1.topAnchor.constraint(equalTo: tahap2CardTitle.bottomAnchor, constant: 8).isActive = true

        tahap2Card.addSubview(tahap2CardSubtitle2)
        tahap2CardSubtitle2.leadingAnchor.constraint(equalTo: tahap2Card.leadingAnchor, constant: 24).isActive = true
        tahap2CardSubtitle2.topAnchor.constraint(equalTo: tahap2CardSubtitle1.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupLayoutCard3() {
        addSubview(tahap3Card)
        tahap3Card.heightAnchor.constraint(equalToConstant: 400).isActive = true
        tahap3Card.widthAnchor.constraint(equalToConstant: 240).isActive = true
        tahap3Card.leadingAnchor.constraint(equalTo: tahap2Card.trailingAnchor, constant: 16).isActive = true
        tahap3Card.topAnchor.constraint(equalTo: topAnchor, constant: 217).isActive = true
        
        tahap3Card.addSubview(tahap3gununganImageIcon)
        tahap3gununganImageIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        tahap3gununganImageIcon.widthAnchor.constraint(equalToConstant: 16.79).isActive = true
        tahap3gununganImageIcon.trailingAnchor.constraint(equalTo: tahap3Card.trailingAnchor, constant: -17.82).isActive = true
        tahap3gununganImageIcon.topAnchor.constraint(equalTo: tahap3Card.topAnchor, constant: 16).isActive = true
        
        
        tahap3Card.addSubview(tahap3progresLabel)
        tahap3progresLabel.trailingAnchor.constraint(equalTo: tahap3gununganImageIcon.leadingAnchor, constant: -8).isActive = true
        tahap3progresLabel.topAnchor.constraint(equalTo: tahap3Card.topAnchor, constant: 23).isActive = true
        

        tahap3Card.addSubview(tahap3CardTitle)
        tahap3CardTitle.leadingAnchor.constraint(equalTo: tahap3Card.leadingAnchor, constant: 24).isActive = true
        tahap3CardTitle.topAnchor.constraint(equalTo: tahap3Card.topAnchor, constant: 286).isActive = true
        
        
        tahap3Card.addSubview(tahap3ImageIcon)
        tahap3ImageIcon.heightAnchor.constraint(equalToConstant: 152.73).isActive = true
        tahap3ImageIcon.widthAnchor.constraint(equalToConstant: 120).isActive = true
        tahap3ImageIcon.centerXAnchor.constraint(equalTo: tahap3Card.centerXAnchor).isActive = true
        tahap3ImageIcon.topAnchor.constraint(equalTo: tahap3Card.topAnchor, constant: 85).isActive = true

        tahap3Card.addSubview(tahap3CardSubtitle1)
        tahap3CardSubtitle1.leadingAnchor.constraint(equalTo: tahap3Card.leadingAnchor, constant: 24).isActive = true
        tahap3CardSubtitle1.topAnchor.constraint(equalTo: tahap3CardTitle.bottomAnchor, constant: 8).isActive = true

        tahap3Card.addSubview(tahap3CardSubtitle2)
        tahap3CardSubtitle2.leadingAnchor.constraint(equalTo: tahap3Card.leadingAnchor, constant: 24).isActive = true
        tahap3CardSubtitle2.topAnchor.constraint(equalTo: tahap3CardSubtitle1.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupLayoutCard4() {
        addSubview(tahap4Card)
        tahap4Card.heightAnchor.constraint(equalToConstant: 400).isActive = true
        tahap4Card.widthAnchor.constraint(equalToConstant: 240).isActive = true
        tahap4Card.leadingAnchor.constraint(equalTo: tahap3Card.trailingAnchor, constant: 16).isActive = true
        tahap4Card.topAnchor.constraint(equalTo: topAnchor, constant: 217).isActive = true
        
        tahap4Card.addSubview(tahap4gununganImageIcon)
        tahap4gununganImageIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        tahap4gununganImageIcon.widthAnchor.constraint(equalToConstant: 16.79).isActive = true
        tahap4gununganImageIcon.trailingAnchor.constraint(equalTo: tahap4Card.trailingAnchor, constant: -17.82).isActive = true
        tahap4gununganImageIcon.topAnchor.constraint(equalTo: tahap4Card.topAnchor, constant: 16).isActive = true
        
        
        tahap4Card.addSubview(tahap4progresLabel)
        tahap4progresLabel.trailingAnchor.constraint(equalTo: tahap4gununganImageIcon.leadingAnchor, constant: -8).isActive = true
        tahap4progresLabel.topAnchor.constraint(equalTo: tahap4Card.topAnchor, constant: 23).isActive = true
        

        tahap4Card.addSubview(tahap4CardTitle)
        tahap4CardTitle.leadingAnchor.constraint(equalTo: tahap4Card.leadingAnchor, constant: 24).isActive = true
        tahap4CardTitle.topAnchor.constraint(equalTo: tahap4Card.topAnchor, constant: 286).isActive = true
        
        
        tahap4Card.addSubview(tahap4ImageIcon)
        tahap4ImageIcon.heightAnchor.constraint(equalToConstant: 152.73).isActive = true
        tahap4ImageIcon.widthAnchor.constraint(equalToConstant: 120).isActive = true
        tahap4ImageIcon.centerXAnchor.constraint(equalTo: tahap4Card.centerXAnchor).isActive = true
        tahap4ImageIcon.topAnchor.constraint(equalTo: tahap4Card.topAnchor, constant: 85).isActive = true

        tahap4Card.addSubview(tahap4CardSubtitle1)
        tahap4CardSubtitle1.leadingAnchor.constraint(equalTo: tahap4Card.leadingAnchor, constant: 24).isActive = true
        tahap4CardSubtitle1.topAnchor.constraint(equalTo: tahap4CardTitle.bottomAnchor, constant: 8).isActive = true

        tahap4Card.addSubview(tahap4CardSubtitle2)
        tahap4CardSubtitle2.leadingAnchor.constraint(equalTo: tahap4Card.leadingAnchor, constant: 24).isActive = true
        tahap4CardSubtitle2.topAnchor.constraint(equalTo: tahap4CardSubtitle1.bottomAnchor, constant: 0).isActive = true
        tahap4CardSubtitle2.trailingAnchor.constraint(equalTo: tahap4Card.trailingAnchor, constant: -12).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
