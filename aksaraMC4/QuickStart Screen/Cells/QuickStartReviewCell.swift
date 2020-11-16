//
//  QuickStartReviewCell.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 16/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuickStartReviewCell: BaseCell {
    
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
}

