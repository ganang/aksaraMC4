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

    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let firstWord   = ""
        let secondWord = "Aksara"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 56), NSAttributedString.Key.foregroundColor: UIColor(patternImage: UIImage(named: "gradientText")!)]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now", size: 56), NSAttributedString.Key.foregroundColor: UIColor(patternImage: UIImage(named: "gradientText")!)]
        let thirdWord   = "Nusantara"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let indonesianMapImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "indonesianMap")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let batakButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startScreenBatakButton")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let lampungButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startScreenLampungButton")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let sundaButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startScreenSundaButton")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let jawaButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startScreenJawaButton")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let baliButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startScreenBaliButton")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let bugisButton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "startScreenBugisButton")
        image.contentMode = .scaleAspectFill
        image.isUserInteractionEnabled = true
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
    }
    
    func setupView() {
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 165).isActive = true
        
        
        addSubview(indonesianMapImage)
        indonesianMapImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        indonesianMapImage.topAnchor.constraint(equalTo: topAnchor, constant: 289).isActive = true
        indonesianMapImage.heightAnchor.constraint(equalToConstant: 336).isActive = true
        indonesianMapImage.widthAnchor.constraint(equalToConstant: 960).isActive = true
        
        addSubview(batakButton)
        batakButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 143).isActive = true
        batakButton.topAnchor.constraint(equalTo: topAnchor, constant: 268).isActive = true
        batakButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        batakButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(lampungButton)
        lampungButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 263).isActive = true
        lampungButton.topAnchor.constraint(equalTo: topAnchor, constant: 421).isActive = true
        lampungButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        lampungButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(sundaButton)
        sundaButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 309).isActive = true
        sundaButton.topAnchor.constraint(equalTo: topAnchor, constant: 573).isActive = true
        sundaButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        sundaButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(jawaButton)
        jawaButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 407).isActive = true
        jawaButton.topAnchor.constraint(equalTo: topAnchor, constant: 486).isActive = true
        jawaButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        jawaButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(baliButton)
        baliButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 477).isActive = true
        baliButton.topAnchor.constraint(equalTo: topAnchor, constant: 596).isActive = true
        baliButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        baliButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        addSubview(bugisButton)
        bugisButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 571).isActive = true
        bugisButton.topAnchor.constraint(equalTo: topAnchor, constant: 365).isActive = true
        bugisButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        bugisButton.widthAnchor.constraint(equalToConstant: 120).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
