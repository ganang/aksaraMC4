//
//  LevelView.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 08/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//



import UIKit

class LevelView: UIView {
    

    @objc let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        //button.subviews.first?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill
//        button.contentVerticalAlignment = UIControlContentVerticalAlignmentFill
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
    

    let gununganTotalImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let totalGununganLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 32)
        label.text = "/45"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let currentGununganLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 64)
        label.text = "25"
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let trackImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Track 15")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    //Level1Button
    let level1Button: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan1Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    

    //Level2Button
    let level2Button: UIButton = {
        let button = UIButton()
        button.setTitle("2", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan2Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level3Button
    let level3Button: UIButton = {
        let button = UIButton()
        button.setTitle("3", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan3Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level4Button
    let level4Button: UIButton = {
        let button = UIButton()
        button.setTitle("4", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan4Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    

    
    //Level5Button
    let level5Button: UIButton = {
        let button = UIButton()
        button.setTitle("5", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan5Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level6Button
    let level6Button: UIButton = {
        let button = UIButton()
        button.setTitle("6", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan6Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level7Button
    let level7Button: UIButton = {
        let button = UIButton()
        button.setTitle("7", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan7Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level8Button
    let level8Button: UIButton = {
        let button = UIButton()
        button.setTitle("8", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan8Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level9Button
    let level9Button: UIButton = {
        let button = UIButton()
        button.setTitle("9", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan9Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level10Button
    let level10Button: UIButton = {
        let button = UIButton()
        button.setTitle("10", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan10Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level11Button
    let level11Button: UIButton = {
        let button = UIButton()
        button.setTitle("11", for: .normal)
        button.setImage(UIImage(named: "levelButton Locked"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan11Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level12Button
    let level12Button: UIButton = {
        let button = UIButton()
        button.setTitle("12", for: .normal)
        button.setImage(UIImage(named: "levelButton Onprogress"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan12Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level13Button
    let level13Button: UIButton = {
        let button = UIButton()
        button.setTitle("13", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan13Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level14Button
    let level14Button: UIButton = {
        let button = UIButton()
        button.setTitle("14", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan14Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Level15Button
    let level15Button: UIButton = {
        let button = UIButton()
        button.setTitle("15", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gunungan15Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gunungan3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    
    
    //For Modal
    lazy var backgroundBlurView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.07, alpha: 1.00).withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        
        
        return view
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(displayP3Red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let levelCircleLogoModal: UIButton = {
        let button = UIButton()
        button.setTitle("1", for: .normal)
        button.setImage(UIImage(named: "levelButton Done"), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Bold", size: 40)
        button.titleLabel?.textAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: -94, bottom:10, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let gununganImageModal: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GununganStand3")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let nilaiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 24)
        label.text = "Nilai : 3/5"
        label.textColor = Theme.current.textColor1
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let kuis1LabelModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let firstWord   = ""
        let secondWord = "Kuis 1\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.textColor2]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 18), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Menebak latin dari bentuk aksara"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let kuis2LabelModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let firstWord   = ""
        let secondWord = "Kuis 2\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.textColor2]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 18), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Menebak latin dari bentuk aksara"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let kuis3LabelModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let firstWord   = ""
        let secondWord = "Kuis 3\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.textColor2]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 18), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Menebak latin dari bentuk aksara"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    
    let kuis4LabelModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let firstWord   = ""
        let secondWord = "Kuis 4\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.textColor2]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 18), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Menebak latin dari bentuk aksara"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let kuis5LabelModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let firstWord   = ""
        let secondWord = "Kuis 5\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.textColor2]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 18), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Menebak latin dari bentuk aksara"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    
    let correctOrWrongAnswerImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit

        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        
        return image
    }()
    
    let correctOrWrongAnswerImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let correctOrWrongAnswerImage3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let correctOrWrongAnswerImage4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let correctOrWrongAnswerImage5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let startPlayButton : UIButton = {
        let button = UIButton()
        button.setTitle("Main Lagi", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 20)
        button.setTitleColor(.white, for: .normal)
        
        let colorTop =  UIColor(red: 36/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 54/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: 180, height: 56)
        gradientLayer.cornerRadius = 28
        
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return button
    }()
    
    let backButtonModal : UIButton = {
        let button = UIButton()
        button.setTitle("Kembali", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 20)
        button.setTitleColor(Theme.current.textColor1, for: .normal)
        button.layer.cornerRadius = 28
//        button.layer.borderColor = CGColor.init(red: 29/255, green: 112/255, blue: 188/255, alpha: 1)
        button.layer.borderWidth = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return button
    }()
    

    
    
    
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupLayout()
        isUserInteractionEnabled = true
        print("Ini LevelScreen lur")
    }
    
    func setupLayout() {
        
        addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(backButtonTitle)
        backButtonTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 0).isActive = true
        backButtonTitle.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 32).isActive = true
        
        addSubview(gununganTotalImage)
        gununganTotalImage.topAnchor.constraint(equalTo: topAnchor, constant: 61).isActive = true
        gununganTotalImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant:928 ).isActive = true
        gununganTotalImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        gununganTotalImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(currentGununganLabel)
        currentGununganLabel.centerYAnchor.constraint(equalTo: gununganTotalImage.centerYAnchor, constant: 0).isActive = true
        currentGununganLabel.leadingAnchor.constraint(equalTo: gununganTotalImage.trailingAnchor, constant: 16).isActive = true
        
        addSubview(totalGununganLabel)
        totalGununganLabel.bottomAnchor.constraint(equalTo: currentGununganLabel.bottomAnchor, constant: 0).isActive = true
        totalGununganLabel.leadingAnchor.constraint(equalTo: currentGununganLabel.trailingAnchor, constant: 0).isActive = true
        
        
        
        
        addSubview(trackImage)
        trackImage.topAnchor.constraint(equalTo: topAnchor, constant: 204).isActive = true
        trackImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        trackImage.heightAnchor.constraint(equalToConstant: 520).isActive = true
        trackImage.widthAnchor.constraint(equalToConstant: 800).isActive = true
        
        //Level 1
        addSubview(level1Button)
        level1Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 159).isActive = true
        level1Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80).isActive = true
        level1Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level1Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level1Button.addSubview(gunungan1Image)
        gunungan1Image.centerXAnchor.constraint(equalTo: level1Button.centerXAnchor, constant: 0).isActive = true
        gunungan1Image.bottomAnchor.constraint(equalTo: level1Button.topAnchor, constant: 10).isActive = true
        gunungan1Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan1Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 2
        addSubview(level2Button)
        level2Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 314).isActive = true
        level2Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -195).isActive = true
        level2Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level2Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level2Button.addSubview(gunungan2Image)
        gunungan2Image.centerXAnchor.constraint(equalTo: level2Button.centerXAnchor, constant: 0).isActive = true
        gunungan2Image.bottomAnchor.constraint(equalTo: level2Button.topAnchor, constant: 10).isActive = true
        gunungan2Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan2Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 3
        addSubview(level3Button)
        level3Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 464).isActive = true
        level3Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -195).isActive = true
        level3Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level3Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level3Button.addSubview(gunungan3Image)
        gunungan3Image.centerXAnchor.constraint(equalTo: level3Button.centerXAnchor, constant: 0).isActive = true
        gunungan3Image.bottomAnchor.constraint(equalTo: level3Button.topAnchor, constant: 10).isActive = true
        gunungan3Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan3Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 4
        addSubview(level4Button)
        level4Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 614).isActive = true
        level4Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -155).isActive = true
        level4Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level4Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level4Button.addSubview(gunungan4Image)
        gunungan4Image.centerXAnchor.constraint(equalTo: level4Button.centerXAnchor, constant: 0).isActive = true
        gunungan4Image.bottomAnchor.constraint(equalTo: level4Button.topAnchor, constant: 10).isActive = true
        gunungan4Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan4Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 5
        addSubview(level5Button)
        level5Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 614).isActive = true
        level5Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -315).isActive = true
        level5Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level5Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level5Button.addSubview(gunungan5Image)
        gunungan5Image.centerXAnchor.constraint(equalTo: level5Button.centerXAnchor, constant: 0).isActive = true
        gunungan5Image.bottomAnchor.constraint(equalTo: level5Button.topAnchor, constant: 10).isActive = true
        gunungan5Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan5Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 6
        addSubview(level6Button)
        level6Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 451).isActive = true
        level6Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -390).isActive = true
        level6Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level6Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level6Button.addSubview(gunungan6Image)
        gunungan6Image.centerXAnchor.constraint(equalTo: level6Button.centerXAnchor, constant: 0).isActive = true
        gunungan6Image.bottomAnchor.constraint(equalTo: level6Button.topAnchor, constant: 10).isActive = true
        gunungan6Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan6Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 7
        addSubview(level7Button)
        level7Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 266).isActive = true
        level7Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -390).isActive = true
        level7Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level7Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level7Button.addSubview(gunungan7Image)
        gunungan7Image.centerXAnchor.constraint(equalTo: level7Button.centerXAnchor, constant: 0).isActive = true
        gunungan7Image.bottomAnchor.constraint(equalTo: level7Button.topAnchor, constant: 10).isActive = true
        gunungan7Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan7Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 8
        addSubview(level8Button)
        level8Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 176).isActive = true
        level8Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -505).isActive = true
        level8Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level8Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level1Button.addSubview(gunungan8Image)
        gunungan8Image.centerXAnchor.constraint(equalTo: level8Button.centerXAnchor, constant: 0).isActive = true
        gunungan8Image.bottomAnchor.constraint(equalTo: level8Button.topAnchor, constant: 10).isActive = true
        gunungan8Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan8Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 9
        addSubview(level9Button)
        level9Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 353).isActive = true
        level9Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -580).isActive = true
        level9Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level9Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level9Button.addSubview(gunungan9Image)
        gunungan9Image.centerXAnchor.constraint(equalTo: level9Button.centerXAnchor, constant: 0).isActive = true
        gunungan9Image.bottomAnchor.constraint(equalTo: level9Button.topAnchor, constant: 10).isActive = true
        gunungan9Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan9Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 10
        addSubview(level10Button)
        level10Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 523).isActive = true
        level10Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -493).isActive = true
        level10Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level10Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level10Button.addSubview(gunungan10Image)
        gunungan10Image.centerXAnchor.constraint(equalTo: level10Button.centerXAnchor, constant: 0).isActive = true
        gunungan10Image.bottomAnchor.constraint(equalTo: level10Button.topAnchor, constant: 10).isActive = true
        gunungan10Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan10Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 11
        addSubview(level11Button)
        level11Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 689).isActive = true
        level11Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -430).isActive = true
        level11Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level11Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level11Button.addSubview(gunungan11Image)
        gunungan11Image.centerXAnchor.constraint(equalTo: level11Button.centerXAnchor, constant: 0).isActive = true
        gunungan11Image.bottomAnchor.constraint(equalTo: level11Button.topAnchor, constant: 10).isActive = true
        gunungan11Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan11Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 12
        addSubview(level12Button)
        level12Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 804).isActive = true
        level12Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -338).isActive = true
        level12Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level12Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level12Button.addSubview(gunungan12Image)
        gunungan12Image.centerXAnchor.constraint(equalTo: level12Button.centerXAnchor, constant: 0).isActive = true
        gunungan12Image.bottomAnchor.constraint(equalTo: level12Button.topAnchor, constant: 10).isActive = true
        gunungan12Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan12Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        //Level 13
        addSubview(level13Button)
        level13Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 879).isActive = true
        level13Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200).isActive = true
        level13Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level13Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level13Button.addSubview(gunungan13Image)
        gunungan13Image.centerXAnchor.constraint(equalTo: level13Button.centerXAnchor, constant: 0).isActive = true
        gunungan13Image.bottomAnchor.constraint(equalTo: level13Button.topAnchor, constant: 10).isActive = true
        gunungan13Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan13Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        //Level 14
        addSubview(level14Button)
        level14Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 954).isActive = true
        level14Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -338).isActive = true
        level14Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level14Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level14Button.addSubview(gunungan14Image)
        gunungan14Image.centerXAnchor.constraint(equalTo: level14Button.centerXAnchor, constant: 0).isActive = true
        gunungan14Image.bottomAnchor.constraint(equalTo: level14Button.topAnchor, constant: 10).isActive = true
        gunungan14Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan14Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
        
        
        //Level 15
        addSubview(level15Button)
        level15Button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 879).isActive = true
        level15Button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -505).isActive = true
        level15Button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        level15Button.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        level15Button.addSubview(gunungan15Image)
        gunungan15Image.centerXAnchor.constraint(equalTo: level15Button.centerXAnchor, constant: 0).isActive = true
        gunungan15Image.bottomAnchor.constraint(equalTo: level15Button.topAnchor, constant: 10).isActive = true
        gunungan15Image.widthAnchor.constraint(equalToConstant: 95).isActive = true
        gunungan15Image.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }
    
    func showModal() {

        addSubview(backgroundBlurView)
        backgroundBlurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        backgroundBlurView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: backgroundBlurView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: backgroundBlurView.centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 688).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 472).isActive = true
        
        
        containerView.addSubview(levelCircleLogoModal)
        levelCircleLogoModal.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 41).isActive = true
        levelCircleLogoModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        levelCircleLogoModal.heightAnchor.constraint(equalToConstant: 80).isActive = true
        levelCircleLogoModal.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        containerView.addSubview(gununganImageModal)
        gununganImageModal.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 41).isActive = true
        gununganImageModal.leadingAnchor.constraint(equalTo: levelCircleLogoModal.trailingAnchor, constant: 18).isActive = true
        gununganImageModal.heightAnchor.constraint(equalToConstant: 48).isActive = true
        gununganImageModal.widthAnchor.constraint(equalToConstant: 94).isActive = true
        
        containerView.addSubview(nilaiLabel)
        nilaiLabel.leadingAnchor.constraint(equalTo: levelCircleLogoModal.trailingAnchor, constant: 18).isActive = true
        nilaiLabel.topAnchor.constraint(equalTo: gununganImageModal.bottomAnchor, constant: 6).isActive = true
        
        
        containerView.addSubview(kuis1LabelModal)
        kuis1LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis1LabelModal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -100).isActive = true
        kuis1LabelModal.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 156).isActive = true
        kuis1LabelModal.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
        containerView.addSubview(kuis2LabelModal)
        kuis2LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis2LabelModal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -100).isActive = true
        kuis2LabelModal.topAnchor.constraint(equalTo: kuis1LabelModal.bottomAnchor, constant: 24).isActive = true
        kuis2LabelModal.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
        containerView.addSubview(kuis3LabelModal)
        kuis3LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis3LabelModal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -100).isActive = true
        kuis3LabelModal.topAnchor.constraint(equalTo: kuis2LabelModal.bottomAnchor, constant: 24).isActive = true
        kuis3LabelModal.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
        containerView.addSubview(kuis4LabelModal)
        kuis4LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis4LabelModal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -100).isActive = true
        kuis4LabelModal.topAnchor.constraint(equalTo: kuis3LabelModal.bottomAnchor, constant: 24).isActive = true
        kuis4LabelModal.heightAnchor.constraint(equalToConstant: 58).isActive = true
        
        containerView.addSubview(kuis5LabelModal)
        kuis5LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis5LabelModal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -100).isActive = true
        kuis5LabelModal.topAnchor.constraint(equalTo: kuis4LabelModal.bottomAnchor, constant: 24).isActive = true
        kuis5LabelModal.heightAnchor.constraint(equalToConstant: 58).isActive = true
        

        containerView.addSubview(correctOrWrongAnswerImage1)
        correctOrWrongAnswerImage1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 187).isActive = true
        correctOrWrongAnswerImage1.heightAnchor.constraint(equalToConstant: 48).isActive = true
        correctOrWrongAnswerImage1.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        containerView.addSubview(correctOrWrongAnswerImage2)
        correctOrWrongAnswerImage2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage2.topAnchor.constraint(equalTo: correctOrWrongAnswerImage1.bottomAnchor, constant: 30).isActive = true
        correctOrWrongAnswerImage2.heightAnchor.constraint(equalToConstant: 48).isActive = true
        correctOrWrongAnswerImage2.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        containerView.addSubview(correctOrWrongAnswerImage3)
        correctOrWrongAnswerImage3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage3.topAnchor.constraint(equalTo: correctOrWrongAnswerImage2.bottomAnchor, constant: 30).isActive = true
        correctOrWrongAnswerImage3.heightAnchor.constraint(equalToConstant: 48).isActive = true
        correctOrWrongAnswerImage3.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        containerView.addSubview(correctOrWrongAnswerImage4)
        correctOrWrongAnswerImage4.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage4.topAnchor.constraint(equalTo: correctOrWrongAnswerImage3.bottomAnchor, constant: 30).isActive = true
        correctOrWrongAnswerImage4.heightAnchor.constraint(equalToConstant: 48).isActive = true
        correctOrWrongAnswerImage4.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        containerView.addSubview(correctOrWrongAnswerImage5)
        correctOrWrongAnswerImage5.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage5.topAnchor.constraint(equalTo: correctOrWrongAnswerImage4.bottomAnchor, constant: 30).isActive = true
        correctOrWrongAnswerImage5.heightAnchor.constraint(equalToConstant: 48).isActive = true
        correctOrWrongAnswerImage5.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        containerView.addSubview(startPlayButton)
        startPlayButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        startPlayButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -42).isActive = true
        startPlayButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        startPlayButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        containerView.addSubview(backButtonModal)
        backButtonModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        backButtonModal.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -42).isActive = true
        backButtonModal.heightAnchor.constraint(equalToConstant: 56).isActive = true
        backButtonModal.widthAnchor.constraint(equalToConstant: 180).isActive = true
        

    }
    
    @objc func close() {
        print("must be closed")
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
