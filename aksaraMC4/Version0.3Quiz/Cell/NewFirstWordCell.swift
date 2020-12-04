//
//  NewFirstWordCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 01/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit


class NewFirstWordCell: UICollectionViewCell {
    
    let wordImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "groupOfJogja")
        image.contentMode = .scaleAspectFit

        return image
    }()
    

    
    let hintImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "info Jogja")
        image.contentMode = .scaleAspectFit

        return image
    }()
    
    lazy var continueButton : UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCheckButtonBackgroundGoldColor(withOpacity: 1, withHeight: 48, withWidth: 240, withCorner: 24)
        button.setTitle("Mengerti", for: .normal)
        button.setTitleColor(Theme.current.accentPurple, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let tintedImage = UIImage(systemName: "arrow.right", withConfiguration: boldConfig)?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        if let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
        button.tag = 0
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.alpha = 0
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        setBackgroundOpening()
        settingInitial()
        animationFunc()
        
    }
    
    func settingInitial() {
        addSubview(wordImage)
        wordImage.alpha = 0.1
        wordImage.frame = CGRect(x: self.frame.size.width/2 - 120, y: self.frame.size.height/2 - 236 - 120, width: 243, height: 373)
        
        addSubview(hintImage)
        hintImage.alpha = 0
        hintImage.frame = CGRect(x: self.frame.size.width/2 - 219, y: self.frame.size.height/2 + 154, width: 440, height: 39)
//        self.headImage.frame = CGRect(x: self.frame.size.width/2 - 336, y: 360, width: 33, height: 56)
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        
    }

    func animationFunc() {
        UIView.animate(withDuration: 1.5 ,delay: 0) { [self] in
            wordImage.frame = CGRect(x: self.frame.size.width/2 - 120, y: self.frame.size.height/2 - 236, width: 243, height: 373)
            wordImage.alpha = 1
        }
        
        UIView.animate(withDuration: 1 ,delay: 2) { [self] in
            hintImage.alpha = 1
            continueButton.alpha = 1
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
