//
//  RegionView.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class RegionView: UIView {
    
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
    

    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 32)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara Jawa"
        return label
    }()
    
    let menuCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let mainCardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 64)
        label.text = "Main"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let menuImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let mainCardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 18)
        label.textColor = Theme.current.textColor1
        label.text = "Berlatih dengan bermain"
        return label
    }()
    
    let mainCardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Regular", size: 18)
        label.textColor = Theme.current.textColor1
        label.text = "Membaca, mendengar, dan menulis"
        return label
    }()
    
    
    
    let kamusCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let kamusCardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 64)
        label.text = "Kamus"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let kamusImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "kamusAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let kamusCardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 18)
        label.textColor = Theme.current.textColor1
        label.text = "Kamus Aksara Jawa"
        return label
    }()
    
    let kamusCardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Regular", size: 18)
        label.textColor = Theme.current.textColor1
        label.text = "Carakan, Sandhangan, Angka, Swara"
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
    }
    
    func setupView() {
        
        addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(backButtonTitle)
        backButtonTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 0).isActive = true
        backButtonTitle.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 32).isActive = true

        
        
        addSubview(menuCard)
        menuCard.heightAnchor.constraint(equalToConstant: 480).isActive = true
        menuCard.widthAnchor.constraint(equalToConstant: 400).isActive = true
        menuCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 181).isActive = true
        menuCard.topAnchor.constraint(equalTo: topAnchor, constant: 192).isActive = true

        menuCard.addSubview(mainCardTitle)
        mainCardTitle.leadingAnchor.constraint(equalTo: menuCard.leadingAnchor, constant: 40).isActive = true
        mainCardTitle.topAnchor.constraint(equalTo: menuCard.topAnchor, constant: 279).isActive = true
        
        menuCard.addSubview(menuImageIcon)
        menuImageIcon.heightAnchor.constraint(equalToConstant: 180.22).isActive = true
        menuImageIcon.widthAnchor.constraint(equalToConstant: 331.54).isActive = true
        menuImageIcon.leadingAnchor.constraint(equalTo: menuCard.leadingAnchor, constant: -43).isActive = true
        menuImageIcon.topAnchor.constraint(equalTo: menuCard.topAnchor, constant: 53).isActive = true
        
        menuCard.addSubview(mainCardSubtitle1)
        mainCardSubtitle1.leadingAnchor.constraint(equalTo: menuCard.leadingAnchor, constant: 40).isActive = true
        mainCardSubtitle1.topAnchor.constraint(equalTo: mainCardTitle.bottomAnchor, constant: 16).isActive = true
        
        menuCard.addSubview(mainCardSubtitle2)
        mainCardSubtitle2.leadingAnchor.constraint(equalTo: menuCard.leadingAnchor, constant: 40).isActive = true
        mainCardSubtitle2.topAnchor.constraint(equalTo: mainCardSubtitle1.bottomAnchor, constant: 8).isActive = true
        
        
        addSubview(kamusCard)
        kamusCard.heightAnchor.constraint(equalToConstant: 480).isActive = true
        kamusCard.widthAnchor.constraint(equalToConstant: 400).isActive = true
        kamusCard.leadingAnchor.constraint(equalTo: menuCard.trailingAnchor, constant: 48).isActive = true
        kamusCard.topAnchor.constraint(equalTo: topAnchor, constant: 192).isActive = true
        
        kamusCard.addSubview(kamusCardTitle)
        kamusCardTitle.leadingAnchor.constraint(equalTo: kamusCard.leadingAnchor, constant: 40).isActive = true
        kamusCardTitle.topAnchor.constraint(equalTo: kamusCard.topAnchor, constant: 279).isActive = true
        
        kamusCard.addSubview(kamusImageIcon)
        kamusImageIcon.heightAnchor.constraint(equalToConstant: 208.73).isActive = true
        kamusImageIcon.widthAnchor.constraint(equalToConstant: 316).isActive = true
        kamusImageIcon.leadingAnchor.constraint(equalTo: kamusCard.leadingAnchor, constant: -25).isActive = true
        kamusImageIcon.topAnchor.constraint(equalTo: kamusCard.topAnchor, constant: 24).isActive = true

        kamusCard.addSubview(kamusCardSubtitle1)
        kamusCardSubtitle1.leadingAnchor.constraint(equalTo: kamusCard.leadingAnchor, constant: 40).isActive = true
        kamusCardSubtitle1.topAnchor.constraint(equalTo: kamusCardTitle.bottomAnchor, constant: 16).isActive = true

        kamusCard.addSubview(kamusCardSubtitle2)
        kamusCardSubtitle2.leadingAnchor.constraint(equalTo: kamusCard.leadingAnchor, constant: 40).isActive = true
        kamusCardSubtitle2.topAnchor.constraint(equalTo: kamusCardSubtitle1.bottomAnchor, constant: 8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
