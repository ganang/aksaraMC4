//
//  AksaraCell.swift
//  aksaraMC4
//
//  Created by Naratama on 25/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class UlasanCell: UICollectionViewCell {
    
    var questions: [Question]?
    var quiz: Quiz? {
        didSet {
            self.questions = quiz?.questions?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Question]
            
            if (quiz?.type == "A") {
                setupViewTypeA()
            }
            
            if (quiz?.type == "B") {
                setupViewTypeB()
            }
            
            if (quiz?.type == "C") {
                setupViewTypeC()
            }
            
            if (quiz?.type == "D") {
                setupViewTypeD()
            }
            
            if (quiz?.type == "E2" || quiz?.type == "E3") {
                setupViewTypeE()
            }
            
            if (quiz?.type == "I1" || quiz?.type == "I2" || quiz?.type == "I3") {
                setupViewTypeI()
            }
            
            if (quiz?.type == "H") {
                setupViewTypeH()
            }
        }
    }
    
    //Card
    let konsonanCard: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "CardUlasanAnswer")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        image.isUserInteractionEnabled = true
        return image
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
    
    //LabelTopCard
    let LabelTopKuis1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.text = "Kuis 1"
        label.textColor = UIColor(red: 23/255.0, green: 78/255.0, blue: 161/255.0, alpha: 1.0)
        return label
    }()
    
    let LabelTopKuis2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Aksara Ha ke latin"
        label.textColor = UIColor(red: 3/255.0, green: 131/255.0, blue: 251/255.0, alpha: 1.0)
        return label
    }()
    
    //Image
    let correctOrFalseState: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // handle type A
    let reusableLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.text = ""
        return label
    }()
    
    // handle for anatomi
    let reusableImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.textColor1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.textColor1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.textColor1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusablePlusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.textColor1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableSpeakerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "speaker.2.fill")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.textColor1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusablePencilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pencil")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableImageView5: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.textColor1
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    lazy var reusableButtonAksara1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.5)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var reusableButtonAksara2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.5)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var reusableButtonAksara3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.5)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var reusableButtonLatin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(Theme.current.textColor1, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        button.backgroundColor = .init(white: 1, alpha: 0.5)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.layer.masksToBounds = false
        
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewTypeA() {
        let aksaraWidth = frame.width / 8
        
        let region: String = quiz?.level?.stage?.region?.name ?? ""
        let question: String = questions?[0].name ?? ""
        let aksaraImage = "\(region) Jawaban \(question)"
        
        reusableImageView1.image = UIImage(named: aksaraImage)?.withRenderingMode(.alwaysTemplate)
        reusableLabel1.text = "\(question)"
        
        konsonanCard.addSubview(reusableLabel1)
        konsonanCard.addSubview(reusableImageView1)
        konsonanCard.addSubview(reusableArrowImageView)
        
        reusableArrowImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableArrowImageView.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
        reusableArrowImageView.widthAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        reusableArrowImageView.heightAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        
        reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableImageView1.trailingAnchor.constraint(equalTo: reusableArrowImageView.leadingAnchor, constant: -8).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        
        reusableLabel1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableLabel1.leadingAnchor.constraint(equalTo: reusableArrowImageView.trailingAnchor, constant: 8).isActive = true
        
    }
    
    func setupViewTypeB() {
        let aksaraWidth = frame.width / 8
        
        let region: String = quiz?.level?.stage?.region?.name ?? ""
        let question: String = questions?[0].name ?? ""
        let aksaraImage = "\(region) Jawaban \(question)"
        
        reusableImageView1.image = UIImage(named: aksaraImage)?.withRenderingMode(.alwaysTemplate)
        reusableLabel1.text = "\(question)"
        
        konsonanCard.addSubview(reusableLabel1)
        konsonanCard.addSubview(reusableImageView1)
        konsonanCard.addSubview(reusableArrowImageView)
        
        reusableArrowImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableArrowImageView.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
        reusableArrowImageView.widthAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        reusableArrowImageView.heightAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        
        reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableImageView1.leadingAnchor.constraint(equalTo: reusableArrowImageView.trailingAnchor, constant: 8).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        
        reusableLabel1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableLabel1.trailingAnchor.constraint(equalTo: reusableArrowImageView.leadingAnchor, constant: -8).isActive = true
    }
    
    func setupViewTypeC() {
        let aksaraWidth = frame.width / 8
        
        let region: String = quiz?.level?.stage?.region?.name ?? ""
        let question: String = questions?[0].name ?? ""
        let aksaraImage = "\(region) Jawaban \(question)"
        
        reusableImageView1.image = UIImage(named: aksaraImage)?.withRenderingMode(.alwaysTemplate)
        reusableLabel1.text = "\(question)"
        
        konsonanCard.addSubview(reusableSpeakerImageView)
        konsonanCard.addSubview(reusableImageView1)
        konsonanCard.addSubview(reusableArrowImageView)
        
        reusableArrowImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableArrowImageView.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
        reusableArrowImageView.widthAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        reusableArrowImageView.heightAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        
        reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableImageView1.leadingAnchor.constraint(equalTo: reusableArrowImageView.trailingAnchor, constant: 8).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        
        reusableSpeakerImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableSpeakerImageView.trailingAnchor.constraint(equalTo: reusableArrowImageView.leadingAnchor, constant: -8).isActive = true
        reusableSpeakerImageView.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableSpeakerImageView.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
    }
    
    func setupViewTypeD() {
        let aksaraWidth = frame.width / 8
        
        let region: String = quiz?.level?.stage?.region?.name ?? ""
        let question: String = questions?[0].name ?? ""
        let aksaraAnatomiImage = "\(region) Jawaban \(question)"
        let headAnatomiImage = "\(region) Kepala \(question)"
        let tailAnatomiImage = "\(region) Ekor \(question)"
        
        reusableImageView1.image = UIImage(named: aksaraAnatomiImage)?.withRenderingMode(.alwaysTemplate)
        reusableImageView3.image = UIImage(named: headAnatomiImage)?.withRenderingMode(.alwaysTemplate)
        reusableImageView5.image = UIImage(named: tailAnatomiImage)?.withRenderingMode(.alwaysTemplate)
        
        konsonanCard.addSubview(reusableImageView3)
        konsonanCard.addSubview(reusableArrowImageView)
        konsonanCard.addSubview(reusableImageView1)
        konsonanCard.addSubview(reusablePlusImageView)
        konsonanCard.addSubview(reusableImageView5)
        
        reusableImageView3.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableImageView3.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
        reusableImageView3.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView3.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        
        reusableArrowImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableArrowImageView.trailingAnchor.constraint(equalTo: reusableImageView3.leadingAnchor, constant: -8).isActive = true
        reusableArrowImageView.widthAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        reusableArrowImageView.heightAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        
        reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableImageView1.trailingAnchor.constraint(equalTo: reusableArrowImageView.leadingAnchor, constant: -12).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        
        reusablePlusImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusablePlusImageView.leadingAnchor.constraint(equalTo: reusableImageView3.trailingAnchor, constant: 8).isActive = true
        reusablePlusImageView.widthAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        reusablePlusImageView.heightAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        
        reusableImageView5.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableImageView5.leadingAnchor.constraint(equalTo: reusablePlusImageView.trailingAnchor, constant: 8).isActive = true
        reusableImageView5.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView5.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
    }
    
    func setupViewTypeE() {
        let quizType = quiz?.type
        
        if (quizType == "E2") {
            let region: String = quiz?.level?.stage?.region?.name ?? ""
            let question1: String = questions?[0].name ?? ""
            let question2: String = questions?[1].name ?? ""
            let aksaraImage1 = "\(region) Jawaban \(question1)"
            let aksaraImage2 = "\(region) Jawaban \(question2)"
            
            reusableButtonAksara1.setImage(UIImage(named: aksaraImage1)?.withRenderingMode(.alwaysTemplate), for: .normal)
            reusableButtonAksara2.setImage(UIImage(named: aksaraImage2)?.withRenderingMode(.alwaysTemplate), for: .normal)
            
            konsonanCard.addSubview(reusableButtonAksara1)
            konsonanCard.addSubview(reusableButtonAksara2)
        
            reusableButtonAksara1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableButtonAksara1.leadingAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: 8).isActive = true
            reusableButtonAksara1.widthAnchor.constraint(equalToConstant: 48).isActive = true
            reusableButtonAksara1.heightAnchor.constraint(equalToConstant: 48).isActive = true
            
            reusableButtonAksara2.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableButtonAksara2.trailingAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: -8).isActive = true
            reusableButtonAksara2.widthAnchor.constraint(equalToConstant: 48).isActive = true
            reusableButtonAksara2.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
        
        if (quizType == "E3") {
            let region: String = quiz?.level?.stage?.region?.name ?? ""
            let question1: String = questions?[0].name ?? ""
            let question2: String = questions?[1].name ?? ""
            let question3: String = questions?[2].name ?? ""
            let aksaraImage1 = "\(region) Jawaban \(question1)"
            let aksaraImage2 = "\(region) Jawaban \(question2)"
            let aksaraImage3 = "\(region) Jawaban \(question3)"
            
            reusableButtonAksara1.setImage(UIImage(named: aksaraImage1)?.withRenderingMode(.alwaysTemplate), for: .normal)
            reusableButtonAksara2.setImage(UIImage(named: aksaraImage2)?.withRenderingMode(.alwaysTemplate), for: .normal)
            reusableButtonAksara3.setImage(UIImage(named: aksaraImage3)?.withRenderingMode(.alwaysTemplate), for: .normal)
            
            konsonanCard.addSubview(reusableButtonAksara2)
            konsonanCard.addSubview(reusableButtonAksara1)
            konsonanCard.addSubview(reusableButtonAksara3)
        
            reusableButtonAksara2.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableButtonAksara2.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
            reusableButtonAksara2.widthAnchor.constraint(equalToConstant: 48).isActive = true
            reusableButtonAksara2.heightAnchor.constraint(equalToConstant: 48).isActive = true
            
            reusableButtonAksara1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableButtonAksara1.trailingAnchor.constraint(equalTo: reusableButtonAksara2.leadingAnchor, constant: -8).isActive = true
            reusableButtonAksara1.widthAnchor.constraint(equalToConstant: 48).isActive = true
            reusableButtonAksara1.heightAnchor.constraint(equalToConstant: 48).isActive = true
            
            reusableButtonAksara3.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableButtonAksara3.leadingAnchor.constraint(equalTo: reusableButtonAksara2.trailingAnchor, constant: 8).isActive = true
            reusableButtonAksara3.widthAnchor.constraint(equalToConstant: 48).isActive = true
            reusableButtonAksara3.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
        
    }
    
    func setupViewTypeI() {
        let quizType = quiz?.type
        let aksaraWidth = frame.width / 8
        
        if (quizType == "I1") {
            
            let region: String = quiz?.level?.stage?.region?.name ?? ""
            let question: String = questions?[0].name ?? ""
            let aksaraImage = "\(region) Jawaban \(question)"
            
            reusableImageView1.image = UIImage(named: aksaraImage)?.withRenderingMode(.alwaysTemplate)
            
            konsonanCard.addSubview(reusablePencilImageView)
            konsonanCard.addSubview(reusableImageView1)
        
            reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableImageView1.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor).isActive = true
            reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            
            reusablePencilImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor, constant: -12).isActive = true
            reusablePencilImageView.leadingAnchor.constraint(equalTo: reusableImageView1.trailingAnchor, constant: -16).isActive = true
            reusablePencilImageView.widthAnchor.constraint(equalToConstant: aksaraWidth * 2).isActive = true
            reusablePencilImageView.heightAnchor.constraint(equalToConstant: aksaraWidth * 2).isActive = true
        }
        
        if (quizType == "I2") {
            
            let region: String = quiz?.level?.stage?.region?.name ?? ""
            let question1: String = questions?[0].name ?? ""
            let question2: String = questions?[1].name ?? ""
            let aksaraImage1 = "\(region) Jawaban \(question1)"
            let aksaraImage2 = "\(region) Jawaban \(question2)"
            
            reusableImageView1.image = UIImage(named: aksaraImage2)?.withRenderingMode(.alwaysTemplate)
            reusableImageView3.image = UIImage(named: aksaraImage1)?.withRenderingMode(.alwaysTemplate)
            
            konsonanCard.addSubview(reusablePencilImageView)
            konsonanCard.addSubview(reusableImageView1)
            konsonanCard.addSubview(reusableImageView3)
        
            reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableImageView1.leadingAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: 8).isActive = true
            reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            
            reusableImageView3.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableImageView3.trailingAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: -8).isActive = true
            reusableImageView3.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            reusableImageView3.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            
            reusablePencilImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor, constant: -12).isActive = true
            reusablePencilImageView.leadingAnchor.constraint(equalTo: reusableImageView1.trailingAnchor, constant: -16).isActive = true
            reusablePencilImageView.widthAnchor.constraint(equalToConstant: aksaraWidth * 2).isActive = true
            reusablePencilImageView.heightAnchor.constraint(equalToConstant: aksaraWidth * 2).isActive = true
        }
        
        if (quizType == "I3") {
            
            let region: String = quiz?.level?.stage?.region?.name ?? ""
            let question1: String = questions?[0].name ?? ""
            let question2: String = questions?[1].name ?? ""
            let question3: String = questions?[2].name ?? ""
            let aksaraImage1 = "\(region) Jawaban \(question1)"
            let aksaraImage2 = "\(region) Jawaban \(question2)"
            let aksaraImage3 = "\(region) Jawaban \(question3)"
            
            reusableImageView1.image = UIImage(named: aksaraImage1)?.withRenderingMode(.alwaysTemplate)
            reusableImageView3.image = UIImage(named: aksaraImage2)?.withRenderingMode(.alwaysTemplate)
            reusableImageView5.image = UIImage(named: aksaraImage3)?.withRenderingMode(.alwaysTemplate)
            
            konsonanCard.addSubview(reusableImageView3)
            konsonanCard.addSubview(reusableImageView1)
            konsonanCard.addSubview(reusableImageView5)
            konsonanCard.addSubview(reusablePencilImageView)
        
            reusableImageView3.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableImageView3.centerXAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: -4).isActive = true
            reusableImageView3.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            reusableImageView3.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            
            reusableImageView1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableImageView1.trailingAnchor.constraint(equalTo: reusableImageView3.leadingAnchor, constant: -8).isActive = true
            reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            
            reusableImageView5.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
            reusableImageView5.leadingAnchor.constraint(equalTo: reusableImageView3.trailingAnchor, constant: 8).isActive = true
            reusableImageView5.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            reusableImageView5.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
            
            reusablePencilImageView.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor, constant: -12).isActive = true
            reusablePencilImageView.leadingAnchor.constraint(equalTo: reusableImageView5.trailingAnchor, constant: -16).isActive = true
            reusablePencilImageView.widthAnchor.constraint(equalToConstant: aksaraWidth * 2).isActive = true
            reusablePencilImageView.heightAnchor.constraint(equalToConstant: aksaraWidth * 2).isActive = true
        }
    }
    
    func setupViewTypeH() {
        let region: String = quiz?.level?.stage?.region?.name ?? ""
        let question1: String = questions?[0].name ?? ""
        let aksaraImage1 = "\(region) Jawaban \(question1)"
        
        reusableButtonAksara1.setImage(UIImage(named: aksaraImage1)?.withRenderingMode(.alwaysTemplate), for: .normal)
        reusableButtonLatin.setTitle(question1, for: .normal)
        
        konsonanCard.addSubview(reusableButtonAksara1)
        konsonanCard.addSubview(reusableButtonLatin)
    
        reusableButtonAksara1.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableButtonAksara1.leadingAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: 8).isActive = true
        reusableButtonAksara1.widthAnchor.constraint(equalToConstant: 100).isActive = true
        reusableButtonAksara1.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        reusableButtonLatin.centerYAnchor.constraint(equalTo: konsonanCard.centerYAnchor).isActive = true
        reusableButtonLatin.trailingAnchor.constraint(equalTo: konsonanCard.centerXAnchor, constant: -8).isActive = true
        reusableButtonLatin.widthAnchor.constraint(equalToConstant: 100).isActive = true
        reusableButtonLatin.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setupView() {
        
        addSubview(LabelTopKuis1)
        LabelTopKuis1.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        LabelTopKuis1.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(LabelTopKuis2)
        LabelTopKuis2.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        LabelTopKuis2.topAnchor.constraint(equalTo: LabelTopKuis1.bottomAnchor, constant: 4).isActive = true
        
        addSubview(correctOrFalseState)
        correctOrFalseState.leadingAnchor.constraint(equalTo: LabelTopKuis1.trailingAnchor, constant: 12).isActive = true
        correctOrFalseState.centerYAnchor.constraint(equalTo: LabelTopKuis1.centerYAnchor).isActive = true
        correctOrFalseState.widthAnchor.constraint(equalToConstant: 20).isActive = true
        correctOrFalseState.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        addSubview(konsonanCard)
        konsonanCard.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        konsonanCard.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        konsonanCard.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        konsonanCard.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }

}
