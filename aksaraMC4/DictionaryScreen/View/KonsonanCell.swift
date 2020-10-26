//
//  AksaraCell.swift
//  aksaraMC4
//
//  Created by Naratama on 25/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class KonsonanCell: UICollectionViewCell {

    let konsonanCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.6)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let konsonanCardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Ha"
        label.textColor = Theme.current.textColor1
        return label
    }()
    
    let konsonanImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Jawaban Ha")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
    
        addSubview(konsonanCard)
        konsonanCard.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        konsonanCard.topAnchor.constraint(equalTo: topAnchor).isActive = true
        konsonanCard.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        konsonanCard.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        konsonanCard.addSubview(konsonanImageIcon)
        konsonanImageIcon.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor, constant: -16).isActive = true
        konsonanImageIcon.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
        konsonanImageIcon.heightAnchor.constraint(equalToConstant: 48).isActive = true
        konsonanImageIcon.widthAnchor.constraint(equalToConstant: 88).isActive = true
        
        konsonanCard.addSubview(konsonanCardTitle)
        
        NSLayoutConstraint.activate([
            konsonanCardTitle.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor),
            konsonanCardTitle.bottomAnchor.constraint(equalTo: konsonanCard.bottomAnchor, constant: -10)
        ])
        
    }

}
