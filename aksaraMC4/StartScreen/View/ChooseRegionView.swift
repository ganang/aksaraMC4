//
//  chooseRegionView.swift
//  aksaraMC4
//
//  Created by Naratama on 01/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import Foundation

import UIKit

class ChooseRegionView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Pilih aksara yang ingin kamu pelajari :"
        return label
    }()
    
    let aksaraLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Aksara Jawa"
        return label
    }()
    
    let aksaraLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Aksara Sunda - Segera !"
        return label
    }()
    
    let aksaraLabel3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Aksara Bali"
        return label
    }()
    
    let aksaraLabel4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Aksara Batak"
        return label
    }()
    
    let aksaraLabel5: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Aksara Bugis"
        return label
    }()
    
    let aksaraLabel6: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Aksara Lampung"
        return label
    }()
    
    let warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "*Kamu dapat mempelajari aksara lainnya juga nanti"
        return label
    }()
    
    let arrowRight: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "arrow.right", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let clock: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "clock", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let lockFill1: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "lock.fill", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let lockFill2: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "lock.fill", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let lockFill3: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "lock.fill", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let lockFill4: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "lock.fill", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let profileIcon: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "book.fill", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
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
    
    lazy var aksaraView1: UIView = {
        let aksaraView = UIView()
        aksaraView.layer.cornerRadius = 32

        aksaraView.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        aksaraView.translatesAutoresizingMaskIntoConstraints = false
        aksaraView.addInnerShadow()
        aksaraView.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return aksaraView
    }()
    
    lazy var aksaraView2: UIView = {
        let aksaraView = UIView()
        aksaraView.layer.cornerRadius = 32

        aksaraView.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        aksaraView.translatesAutoresizingMaskIntoConstraints = false
        aksaraView.addInnerShadow()
        aksaraView.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return aksaraView
    }()
    
    lazy var aksaraView3: UIView = {
        let aksaraView = UIView()
        aksaraView.layer.cornerRadius = 32

        aksaraView.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        aksaraView.translatesAutoresizingMaskIntoConstraints = false
        aksaraView.addInnerShadow()
        aksaraView.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return aksaraView
    }()
    
    lazy var aksaraView4: UIView = {
        let aksaraView = UIView()
        aksaraView.layer.cornerRadius = 32

        aksaraView.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        aksaraView.translatesAutoresizingMaskIntoConstraints = false
        aksaraView.addInnerShadow()
        aksaraView.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return aksaraView
    }()
    
    lazy var aksaraView5: UIView = {
        let aksaraView = UIView()
        aksaraView.layer.cornerRadius = 32

        aksaraView.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        aksaraView.translatesAutoresizingMaskIntoConstraints = false
        aksaraView.addInnerShadow()
        aksaraView.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return aksaraView
    }()
    
    lazy var aksaraView6: UIView = {
        let aksaraView = UIView()
        aksaraView.layer.cornerRadius = 32

        aksaraView.layer.backgroundColor = UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
        aksaraView.translatesAutoresizingMaskIntoConstraints = false
        aksaraView.addInnerShadow()
        aksaraView.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return aksaraView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        setBackgroundColor()
        setupView()
        

    }
    
    func setupView() {
        addSubview(circleProfile)
        circleProfile.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circleProfile.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -245).isActive = true
        circleProfile.heightAnchor.constraint(equalToConstant: 48).isActive = true
        circleProfile.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        circleProfile.addSubview(profileIcon)
        profileIcon.centerXAnchor.constraint(equalTo: circleProfile.centerXAnchor, constant: 0).isActive = true
        profileIcon.centerYAnchor.constraint(equalTo: circleProfile.centerYAnchor, constant: 0).isActive = true
        profileIcon.heightAnchor.constraint(equalToConstant: 24).isActive = true
        profileIcon.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        addSubview(titleLabel)
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: circleProfile.bottomAnchor, constant: 24).isActive = true
        
        addSubview(aksaraView1)
        aksaraView1.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraView1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive = true
        aksaraView1.heightAnchor.constraint(equalToConstant: 48).isActive = true
        aksaraView1.widthAnchor.constraint(equalToConstant: 480).isActive = true
        
        aksaraView1.addSubview(aksaraLabel1)
        aksaraLabel1.centerXAnchor.constraint(equalTo: aksaraView1.centerXAnchor, constant: 0).isActive = true
        aksaraLabel1.centerYAnchor.constraint(equalTo: aksaraView1.centerYAnchor, constant: 0).isActive = true
        
        aksaraView1.addSubview(arrowRight)
        arrowRight.trailingAnchor.constraint(equalTo: aksaraView1.trailingAnchor, constant: -24).isActive = true
        arrowRight.centerYAnchor.constraint(equalTo: aksaraView1.centerYAnchor, constant: 0).isActive = true
        arrowRight.heightAnchor.constraint(equalToConstant: 24).isActive = true
        arrowRight.widthAnchor.constraint(equalToConstant: 23).isActive = true
        
        addSubview(aksaraView2)
        aksaraView2.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraView2.topAnchor.constraint(equalTo: aksaraView1.bottomAnchor, constant: 16).isActive = true
        aksaraView2.heightAnchor.constraint(equalToConstant: 48).isActive = true
        aksaraView2.widthAnchor.constraint(equalToConstant: 480).isActive = true
        aksaraView2.alpha = 0.4
        
        aksaraView2.addSubview(aksaraLabel2)
        aksaraLabel2.centerXAnchor.constraint(equalTo: aksaraView2.centerXAnchor, constant: 0).isActive = true
        aksaraLabel2.centerYAnchor.constraint(equalTo: aksaraView2.centerYAnchor, constant: 0).isActive = true
        
        aksaraView2.addSubview(clock)
        clock.trailingAnchor.constraint(equalTo: aksaraView2.trailingAnchor, constant: -24).isActive = true
        clock.centerYAnchor.constraint(equalTo: aksaraView2.centerYAnchor, constant: 0).isActive = true
        clock.heightAnchor.constraint(equalToConstant: 24).isActive = true
        clock.widthAnchor.constraint(equalToConstant: 23).isActive = true
        
        addSubview(aksaraView3)
        aksaraView3.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraView3.topAnchor.constraint(equalTo: aksaraView2.bottomAnchor, constant: 16).isActive = true
        aksaraView3.heightAnchor.constraint(equalToConstant: 48).isActive = true
        aksaraView3.widthAnchor.constraint(equalToConstant: 480).isActive = true
        aksaraView3.alpha = 0.4
        
        aksaraView3.addSubview(aksaraLabel3)
        aksaraLabel3.centerXAnchor.constraint(equalTo: aksaraView3.centerXAnchor, constant: 0).isActive = true
        aksaraLabel3.centerYAnchor.constraint(equalTo: aksaraView3.centerYAnchor, constant: 0).isActive = true
        
        aksaraView3.addSubview(lockFill1)
        lockFill1.trailingAnchor.constraint(equalTo: aksaraView3.trailingAnchor, constant: -24).isActive = true
        lockFill1.centerYAnchor.constraint(equalTo: aksaraView3.centerYAnchor, constant: 0).isActive = true
        lockFill1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lockFill1.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        addSubview(aksaraView4)
        aksaraView4.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraView4.topAnchor.constraint(equalTo: aksaraView3.bottomAnchor, constant: 16).isActive = true
        aksaraView4.heightAnchor.constraint(equalToConstant: 48).isActive = true
        aksaraView4.widthAnchor.constraint(equalToConstant: 480).isActive = true
        aksaraView4.alpha = 0.4
        
        aksaraView4.addSubview(aksaraLabel4)
        aksaraLabel4.centerXAnchor.constraint(equalTo: aksaraView4.centerXAnchor, constant: 0).isActive = true
        aksaraLabel4.centerYAnchor.constraint(equalTo: aksaraView4.centerYAnchor, constant: 0).isActive = true
        
        aksaraView4.addSubview(lockFill2)
        lockFill2.trailingAnchor.constraint(equalTo: aksaraView4.trailingAnchor, constant: -24).isActive = true
        lockFill2.centerYAnchor.constraint(equalTo: aksaraView4.centerYAnchor, constant: 0).isActive = true
        lockFill2.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lockFill2.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        addSubview(aksaraView5)
        aksaraView5.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraView5.topAnchor.constraint(equalTo: aksaraView4.bottomAnchor, constant: 16).isActive = true
        aksaraView5.heightAnchor.constraint(equalToConstant: 48).isActive = true
        aksaraView5.widthAnchor.constraint(equalToConstant: 480).isActive = true
        aksaraView5.alpha = 0.4
        
        aksaraView5.addSubview(aksaraLabel5)
        aksaraLabel5.centerXAnchor.constraint(equalTo: aksaraView5.centerXAnchor, constant: 0).isActive = true
        aksaraLabel5.centerYAnchor.constraint(equalTo: aksaraView5.centerYAnchor, constant: 0).isActive = true
        
        aksaraView5.addSubview(lockFill3)
        lockFill3.trailingAnchor.constraint(equalTo: aksaraView5.trailingAnchor, constant: -24).isActive = true
        lockFill3.centerYAnchor.constraint(equalTo: aksaraView5.centerYAnchor, constant: 0).isActive = true
        lockFill3.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lockFill3.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        addSubview(aksaraView6)
        aksaraView6.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraView6.topAnchor.constraint(equalTo: aksaraView5.bottomAnchor, constant: 16).isActive = true
        aksaraView6.heightAnchor.constraint(equalToConstant: 48).isActive = true
        aksaraView6.widthAnchor.constraint(equalToConstant: 480).isActive = true
        aksaraView6.alpha = 0.4
        
        aksaraView6.addSubview(aksaraLabel6)
        aksaraLabel6.centerXAnchor.constraint(equalTo: aksaraView6.centerXAnchor, constant: 0).isActive = true
        aksaraLabel6.centerYAnchor.constraint(equalTo: aksaraView6.centerYAnchor, constant: 0).isActive = true
        
        aksaraView6.addSubview(lockFill4)
        lockFill4.trailingAnchor.constraint(equalTo: aksaraView6.trailingAnchor, constant: -24).isActive = true
        lockFill4.centerYAnchor.constraint(equalTo: aksaraView6.centerYAnchor, constant: 0).isActive = true
        lockFill4.heightAnchor.constraint(equalToConstant: 24).isActive = true
        lockFill4.widthAnchor.constraint(equalToConstant: 21).isActive = true
        
        addSubview(warningLabel)
        warningLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        warningLabel.topAnchor.constraint(equalTo: aksaraView6.bottomAnchor, constant: 24).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
