//
//  StageTahap1Cell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 01/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class StageTahap1Cell: UICollectionViewCell {
    
    var centerImageHeight1 : NSLayoutConstraint?
    var centerImageWidth1 : NSLayoutConstraint?
    var centerImageHeight2 : NSLayoutConstraint?
    var centerImageWidth2 : NSLayoutConstraint?
    
    var bottomAnchorTingkatName1 : NSLayoutConstraint?
    var bottomAnchorTingkatName2 : NSLayoutConstraint?
    
    
    var indexPath : Int? {
        didSet {
            tingkatNameLabel.text = "Mulai Tingkat \(indexPath!)"
//            
            if currentLevel == indexPath {
                //jika status tidak false dan sedang ongoing
                containerView.image = UIImage(named: "TahapOngoingCard")
                tingkatNameLabel.font = UIFont.init(name: "NowAlt-Medium", size: 16)
                tingkatNameLabel.textColor = UIColor.rgb(red: 160, green: 23, blue: 39, alpha: 1)
                
                centerImageWidth2?.isActive = false
                centerImageHeight2?.isActive = false
                
                centerImageWidth1?.isActive = true
                centerImageHeight1?.isActive = true
                
                bottomAnchorTingkatName2?.isActive = false
                bottomAnchorTingkatName1?.isActive = true
//                containerView.contentMode = .scaleAspectFill
            }
        }
    }
    var currentLevel : Int?
    var levelData : Level? {
        didSet {
//            print("islocked", levelData?.isLocked)
            if levelData?.isLocked == false {
                //jika tahap nya done (biru)
                
                tingkatNameLabel.font = UIFont.init(name: "NowAlt-Medium", size: 13)
                tingkatNameLabel.textColor = Theme.current.accentWhite
                
                containerView.image = UIImage(named: "TahapDoneCard")
                centerImageWidth1?.isActive = false
                centerImageHeight1?.isActive = false
                
                centerImageWidth2?.isActive = true
                centerImageHeight2?.isActive = true
                
                bottomAnchorTingkatName2?.isActive = false
                bottomAnchorTingkatName1?.isActive = true
                
                
            } else {
                //jika masih locked
                containerView.image = UIImage(named: "TahapLockedCard")
                tingkatNameLabel.font = UIFont.init(name: "NowAlt-Medium", size: 16)
                tingkatNameLabel.textColor = Theme.current.textColor1
                centerImage.removeFromSuperview()
                bottomAnchorTingkatName1?.isActive = false
                bottomAnchorTingkatName2?.isActive = true
                
            }
        }
    }
    
    lazy var containerView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "TahapDoneCard")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        
        return image
    }()
    
    lazy var gununganImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gununganOngoing0")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var centerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "buttonPlayOngoing")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tingkatNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Mulai Tingkat 1"
        label.textColor = Theme.current.accentColor
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .systemGray
        setupDynamicConstraint()
        setupView()
        setupBasedData()
    }
    
    func setupBasedData() {
//        print("current level", self.currentLevel)
//        print("index", self.indexPath)
//        
    }
    
    func setupDynamicConstraint() {
        
        //jika ongoing
        centerImageHeight1 = centerImage.heightAnchor.constraint(equalToConstant: 64)
        centerImageWidth1 = centerImage.widthAnchor.constraint(equalToConstant: 64)
        
        //jika done
        centerImageHeight2 = centerImage.heightAnchor.constraint(equalToConstant: 20)
        centerImageWidth2 = centerImage.widthAnchor.constraint(equalToConstant: 90)
        
        //botton jika ongoing dan done
        bottomAnchorTingkatName1 = tingkatNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        
        //botton jika locked
        bottomAnchorTingkatName2 = tingkatNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 52)
        
        
    }
    
    func setupView() {
        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        containerView.addSubview(gununganImage)
        gununganImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        gununganImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        gununganImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        gununganImage.widthAnchor.constraint(equalToConstant: 13).isActive = true

        containerView.addSubview(centerImage)
        centerImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0).isActive = true
        centerImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        centerImageHeight1?.isActive = true
        centerImageWidth1?.isActive = true
//        centerImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
//        centerImage.widthAnchor.constraint(equalToConstant: 64).isActive = true

        containerView.addSubview(tingkatNameLabel)
        tingkatNameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        bottomAnchorTingkatName1?.isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
