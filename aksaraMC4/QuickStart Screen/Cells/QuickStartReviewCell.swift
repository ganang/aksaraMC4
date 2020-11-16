//
//  QuickStartReviewCell.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 16/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuickStartReviewCell: BaseCell {
    
    var isCorrect: Bool? {
        didSet {
            self.correctOrFalseImageView.setImage((isCorrect! ? UIImage(named: "correctAnswer") : UIImage(named: "falseAnswer"))!)
        }
    }
    
    var quizName: String? {
        didSet {
            self.quizTitleLabel.text = quizName
        }
    }
    
    var quizTypeName: String? {
        didSet {
            self.quizTypeLabel.text = quizTypeName
        }
    }
    
    var quizType: String? {
        didSet {
            if (quizType == "anatomi") {
                setupAnatomi()
            }
            
            if (quizType == "latin") {
                setupLatin()
            }
            
            if (quizType == "writing") {
                setupWriting()
            }
        }
    }
    
    //LabelTopCard
    let quizTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.text = "Kuis 1"
        label.textColor = Theme.current.accentWhite
        return label
    }()
    
    let quizTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Aksara Ha ke latin"
        label.textColor = Theme.current.accentWhite
        return label
    }()
    
    //Image
    let correctOrFalseImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .init(white: 1, alpha: 0.2)
        
        return view
    }()
    
    let reviewCardBottomLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bottomLeftPurpleDecoration")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .init(white: 1, alpha: 0)
        
        return imageView
    }()
    
    let reviewCardTopLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "topLeftPurpleDecoration")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .init(white: 1, alpha: 0)
        
        return imageView
    }()
    
    let reviewCardTopRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "topRightPurpleDecoration")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .init(white: 1, alpha: 0)
        
        return imageView
    }()
    
    let reviewCardBottomRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bottomRightPurpleDecoration")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .init(white: 1, alpha: 0)
        
        return imageView
    }()
    
    // handle for anatomi
    let reusableImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.accentWhite
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.accentWhite
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableImageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Jawa Jawaban Ha")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.accentWhite
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableArrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.accentWhite
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusablePlusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.accentWhite
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let reusableLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = ""
        
        return label
    }()
    
    let reusablePencilImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pencil")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    override func setupViews() {
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        contentView.addSubview(quizTitleLabel)
        contentView.addSubview(quizTypeLabel)
        contentView.addSubview(correctOrFalseImageView)
        contentView.addSubview(containerView)
        contentView.addSubview(reviewCardBottomLeftImageView)
        contentView.addSubview(reviewCardTopLeftImageView)
        contentView.addSubview(reviewCardBottomRightImageView)
        contentView.addSubview(reviewCardTopRightImageView)
    }
    
    func setupConstraint() {
        
        quizTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        quizTitleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        quizTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        quizTypeLabel.topAnchor.constraint(equalTo: quizTitleLabel.bottomAnchor, constant: 4).isActive = true
        
        correctOrFalseImageView.leadingAnchor.constraint(equalTo: quizTitleLabel.trailingAnchor, constant: 12).isActive = true
        correctOrFalseImageView.centerYAnchor.constraint(equalTo: quizTitleLabel.centerYAnchor).isActive = true
        correctOrFalseImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        correctOrFalseImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        containerView.topAnchor.constraint(equalTo: quizTypeLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        containerView.addSubview(reviewCardBottomLeftImageView)
        containerView.bringSubviewToFront(reviewCardBottomLeftImageView)
        reviewCardBottomLeftImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16).isActive = true
        reviewCardBottomLeftImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -16).isActive = true
        reviewCardBottomLeftImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        reviewCardBottomLeftImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        containerView.addSubview(reviewCardTopLeftImageView)
        containerView.bringSubviewToFront(reviewCardTopLeftImageView)
        reviewCardTopLeftImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -16).isActive = true
        reviewCardTopLeftImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: -16).isActive = true
        reviewCardTopLeftImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        reviewCardTopLeftImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        containerView.addSubview(reviewCardTopRightImageView)
        containerView.bringSubviewToFront(reviewCardTopRightImageView)
        reviewCardTopRightImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -16).isActive = true
        reviewCardTopRightImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
        reviewCardTopRightImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        reviewCardTopRightImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        containerView.addSubview(reviewCardBottomRightImageView)
        containerView.bringSubviewToFront(reviewCardBottomRightImageView)
        reviewCardBottomRightImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16).isActive = true
        reviewCardBottomRightImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 16).isActive = true
        reviewCardBottomRightImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        reviewCardBottomRightImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func setupAnatomi() {
        let aksaraAnatomiImage = "Jawa Jawaban Wa"
        let headAnatomiImage = "Jawa Kepala Wa"
        let tailAnatomiImage = "Jawa Ekor Wa"
        
        reusableImageView1.image = UIImage(named: aksaraAnatomiImage)?.withRenderingMode(.alwaysTemplate)
        reusableImageView2.image = UIImage(named: headAnatomiImage)?.withRenderingMode(.alwaysTemplate)
        reusableImageView3.image = UIImage(named: tailAnatomiImage)?.withRenderingMode(.alwaysTemplate)
        
        containerView.addSubview(reusableImageView1)
        containerView.addSubview(reusableArrowImageView)
        containerView.addSubview(reusableImageView2)
        containerView.addSubview(reusablePlusImageView)
        containerView.addSubview(reusableImageView3)
        
        reusableImageView3.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableImageView3.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        reusableImageView3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reusableImageView3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        reusableArrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableArrowImageView.trailingAnchor.constraint(equalTo: reusableImageView3.leadingAnchor, constant: -8).isActive = true
        reusableArrowImageView.widthAnchor.constraint(equalToConstant: 40/2).isActive = true
        reusableArrowImageView.heightAnchor.constraint(equalToConstant: 40/2).isActive = true
        
        reusableImageView1.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableImageView1.trailingAnchor.constraint(equalTo: reusableArrowImageView.leadingAnchor, constant: -12).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        reusablePlusImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusablePlusImageView.leadingAnchor.constraint(equalTo: reusableImageView3.trailingAnchor, constant: 8).isActive = true
        reusablePlusImageView.widthAnchor.constraint(equalToConstant: 40/2).isActive = true
        reusablePlusImageView.heightAnchor.constraint(equalToConstant: 40/2).isActive = true
        
        reusableImageView2.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableImageView2.leadingAnchor.constraint(equalTo: reusablePlusImageView.trailingAnchor, constant: 8).isActive = true
        reusableImageView2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reusableImageView2.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupLatin() {
        let aksaraWidth = frame.width / 8
        
        let aksaraImage = "Jawa Jawaban Wa"
        
        reusableImageView1.image = UIImage(named: aksaraImage)?.withRenderingMode(.alwaysTemplate)
        reusableLabel1.text = "Wa"
        
        containerView.addSubview(reusableLabel1)
        containerView.addSubview(reusableImageView1)
        containerView.addSubview(reusableArrowImageView)
        
        reusableArrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableArrowImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        reusableArrowImageView.widthAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        reusableArrowImageView.heightAnchor.constraint(equalToConstant: aksaraWidth/2).isActive = true
        
        reusableImageView1.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableImageView1.trailingAnchor.constraint(equalTo: reusableArrowImageView.leadingAnchor, constant: -8).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: aksaraWidth).isActive = true
        
        reusableLabel1.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableLabel1.leadingAnchor.constraint(equalTo: reusableArrowImageView.trailingAnchor, constant: 8).isActive = true
    }
    
    func setupWriting() {
        let aksaraImage = "Jawa Jawaban Wa"
        
        reusableImageView1.image = UIImage(named: aksaraImage)?.withRenderingMode(.alwaysTemplate)
        
        containerView.addSubview(reusablePencilImageView)
        containerView.addSubview(reusableImageView1)
        
        reusableImageView1.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        reusableImageView1.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        reusableImageView1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        reusableImageView1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        reusablePencilImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -12).isActive = true
        reusablePencilImageView.leadingAnchor.constraint(equalTo: reusableImageView1.trailingAnchor, constant: -20).isActive = true
        reusablePencilImageView.widthAnchor.constraint(equalToConstant: 40 * 2).isActive = true
        reusablePencilImageView.heightAnchor.constraint(equalToConstant: 40 * 2).isActive = true
    }
}

