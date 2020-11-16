//
//  Levelv2View.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 30/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class LevelV2View: UIView {
    
    var secondContainerTopAnchor1 : NSLayoutConstraint?
    var secondContainerTopAnchor2 : NSLayoutConstraint?
    var thirdContainerTopAnchor1 : NSLayoutConstraint?
    var thirdContainerTopAnchor2 : NSLayoutConstraint?
    var containerViewHeightAnchor1 : NSLayoutConstraint?
    var containerViewHeightAnchor2 : NSLayoutConstraint?
    
    lazy var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.isUserInteractionEnabled = true
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var detailContainerView1 : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var detailContainerView2 : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var detailContainerView3 : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //Greeting
    
    let greetingLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 32)
        label.text = "Selamat Datang, Nopal"
        label.textColor = Theme.current.textColor2
        
        return label
    }()
    
    let tipsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        let firstWord   = ""
        let secondWord = "Tips: "
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Aksara Carakan dapat lebih mudah dihafalkan dari anatomi bentuknya"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText

        return label
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "continueButton3"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Quick Start : Tutorial"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    //navbarLike Button
    
    lazy var profilButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profilButton"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0.4
        return button
    }()

    lazy var kamusButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(systemName: "book.fill")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Kamus", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        button.tintColor = Theme.current.accentWhite
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 28
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
//        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
        button.backgroundColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -140)
        button.alpha = 0.4
        
        return button
    }()
    
    lazy var topDecorationImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "topDecoration")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var namaAksaraButton: UIButton = {
        let btn = UIButton()
        
//        btn.backgroundColor = .gray
        btn.setTitle("Aksara Jawa", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        btn.setTitleColor(Theme.current.textColor1, for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        btn.imageView?.tintColor = Theme.current.textColor1
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 150, bottom: 0, right: 0)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 20)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    
    
    
    //Tahap 1 BigButton
    lazy var containerViewTahap1 : CustomUIView = {
        let view = CustomUIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.tag = 0
        view.isOpen = false
        return view
    }()
    
    lazy var pointerImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pointStageOn")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let tahap1Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Tahap 1 - Aksara Jawa"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let tahap1TitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Carakan"
        label.textColor = Theme.current.textColor2
        
        return label
    }()
    
    
    let tahap1DescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        let firstWord   = ""
        let secondWord = "Carakan: "
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Huruf konsonan yang Memiliki vokal dasar /a/"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let gununganTahap1Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GununganNew")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap1progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "5/30"
        label.textColor = Theme.current.textColor2
        return label
    }()
    
    
    let collectionViewTahap1 : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 28
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
//        flow.minimumLineSpacing = 0;

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = false
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    

    //Tahap 2 BigButton
    lazy var containerViewTahap2 : CustomUIView = {
        let view = CustomUIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 1
        view.isOpen = false
        view.alpha = 0.4
        
        return view
    }()
    
    lazy var pointerImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pointStageOn")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tahap2Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Tahap 2 - Aksara Jawa"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let tahap2TitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Carakan + Sandhangan"
        label.textColor = Theme.current.textColor2
        
        return label
    }()
    
    
    let tahap2DescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        let firstWord   = ""
        let secondWord = "Sandhangan: "
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Merubah vokal dasar Carakan atau dapat mematikan vokalnya"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let gununganTahap2Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GununganNew")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap2progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "5/30"
        label.textColor = Theme.current.textColor2
        return label
    }()
    
    let collectionViewTahap2 : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear

        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    //Tahap 3 BigButton
    let containerViewTahap3 : CustomUIView = {
        let view = CustomUIView()
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tag = 2
        view.isOpen = false
        view.alpha = 0.4
        
        return view
    }()
    
    let tahap3Label : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Tahap 3 - Aksara Jawa"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var pointerImage3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pointStageOn")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let tahap3TitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Carakan + Sandhangan + Pasangan"
        label.textColor = Theme.current.textColor2
        
        return label
    }()
    
    
    let tahap3DescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        
        let firstWord   = ""
        let secondWord = "Pasangan: "
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1]
        let thirdWord   = "Mematikan huruf sebelumnya sekaligus menjadi huruf selanjutnya"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let gununganTahap3Image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GununganNew")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let tahap3progresLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "5/30"
        label.textColor = Theme.current.textColor2
        return label
    }()
    
    let collectionViewTahap3 : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear

        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        
        setBackgroundColor()
        setupDynamicConstraint()
        setupBaseView()
        setupTahap1Card()
        setupTahap2Card()
        setupTahap3Card()
    }
    
    func setupDynamicConstraint() {
        
        containerViewHeightAnchor1 = containerView.heightAnchor.constraint(equalToConstant: 952)
        containerViewHeightAnchor2 = containerView.heightAnchor.constraint(equalToConstant: 1780)
        
        
        secondContainerTopAnchor1 = containerViewTahap2.topAnchor.constraint(equalTo: containerViewTahap1.bottomAnchor, constant: 29)
        secondContainerTopAnchor2 = containerViewTahap2.topAnchor.constraint(equalTo: containerViewTahap1.bottomAnchor, constant: 852)
        
        thirdContainerTopAnchor1 =  containerViewTahap3.topAnchor.constraint(equalTo: containerViewTahap2.bottomAnchor, constant: 29)
        thirdContainerTopAnchor2 = containerViewTahap3.topAnchor.constraint(equalTo: containerViewTahap2.bottomAnchor, constant: 852)
    }
    
    func setupBaseView() {
        addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        scrollView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerViewHeightAnchor1?.isActive = true
        
        
        containerView.addSubview(profilButton)
        profilButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40).isActive = true
        profilButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        profilButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        profilButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
        containerView.addSubview(kamusButton)
        kamusButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40).isActive = true
        kamusButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        kamusButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        kamusButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        containerView.addSubview(topDecorationImage)
        topDecorationImage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0).isActive = true
        topDecorationImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50).isActive = true
        topDecorationImage.heightAnchor.constraint(equalToConstant: 34).isActive = true
        topDecorationImage.widthAnchor.constraint(equalToConstant: 289).isActive = true
        
        containerView.addSubview(namaAksaraButton)
        namaAksaraButton.centerXAnchor.constraint(equalTo: topDecorationImage.centerXAnchor, constant: 0).isActive = true
        namaAksaraButton.centerYAnchor.constraint(equalTo: topDecorationImage.centerYAnchor, constant: 0).isActive = true
        
    
        containerView.addSubview(greetingLabel)
        greetingLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 115).isActive = true
        greetingLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 162).isActive = true
        
        containerView.addSubview(tipsLabel)
        tipsLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 115).isActive = true
        tipsLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 16).isActive = true
        
        containerView.addSubview(continueButton)
        continueButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 115).isActive = true
        continueButton.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 64).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 455).isActive = true
        
        continueButton.addSubview(buttonLabel)
        buttonLabel.centerXAnchor.constraint(equalTo: continueButton.centerXAnchor).isActive = true
        buttonLabel.centerYAnchor.constraint(equalTo: continueButton.centerYAnchor).isActive = true
    }
    
    func setupTahap1Card() {
        
//        tahap 1
        containerView.addSubview(containerViewTahap1)
        containerViewTahap1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 446).isActive = true
        containerViewTahap1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 84).isActive = true
        containerViewTahap1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -78).isActive = true
        containerViewTahap1.heightAnchor.constraint(equalToConstant: 127).isActive = true

        containerViewTahap1.addSubview(tahap1Label)
        tahap1Label.leadingAnchor.constraint(equalTo: containerViewTahap1.leadingAnchor, constant: 35).isActive = true
        tahap1Label.topAnchor.constraint(equalTo: containerViewTahap1.topAnchor, constant: 20).isActive = true
        
        containerViewTahap1.addSubview(pointerImage1)
        pointerImage1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 52).isActive = true
        pointerImage1.centerYAnchor.constraint(equalTo: tahap1Label.centerYAnchor, constant: 0).isActive = true
        pointerImage1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        pointerImage1.widthAnchor.constraint(equalToConstant: 24).isActive = true

        containerViewTahap1.addSubview(tahap1TitleLabel)
        tahap1TitleLabel.leadingAnchor.constraint(equalTo: containerViewTahap1.leadingAnchor, constant: 35).isActive = true
        tahap1TitleLabel.topAnchor.constraint(equalTo: tahap1Label.bottomAnchor, constant: 16).isActive = true

        containerViewTahap1.addSubview(tahap1DescriptionLabel)
        tahap1DescriptionLabel.leadingAnchor.constraint(equalTo: containerViewTahap1.leadingAnchor, constant: 35).isActive = true
        tahap1DescriptionLabel.topAnchor.constraint(equalTo: tahap1TitleLabel.bottomAnchor, constant: 8).isActive = true

        containerViewTahap1.addSubview(gununganTahap1Image)
        gununganTahap1Image.trailingAnchor.constraint(equalTo: containerViewTahap1.trailingAnchor, constant: -18).isActive = true
        gununganTahap1Image.topAnchor.constraint(equalTo: containerViewTahap1.topAnchor, constant: 43).isActive = true
        gununganTahap1Image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        gununganTahap1Image.widthAnchor.constraint(equalToConstant: 34).isActive = true

        containerViewTahap1.addSubview(tahap1progresLabel)
        tahap1progresLabel.trailingAnchor.constraint(equalTo: gununganTahap1Image.leadingAnchor, constant: -12).isActive = true
        tahap1progresLabel.topAnchor.constraint(equalTo: containerViewTahap1.topAnchor, constant: 78).isActive = true
    }
    
    func setupTahap2Card() {
        
//        tahap 2
        containerView.addSubview(containerViewTahap2)
        secondContainerTopAnchor1?.isActive = true
        containerViewTahap2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 84).isActive = true
        containerViewTahap2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -78).isActive = true
        containerViewTahap2.heightAnchor.constraint(equalToConstant: 127).isActive = true
        


        containerViewTahap2.addSubview(tahap2Label)
        tahap2Label.leadingAnchor.constraint(equalTo: containerViewTahap2.leadingAnchor, constant: 35).isActive = true
        tahap2Label.topAnchor.constraint(equalTo: containerViewTahap2.topAnchor, constant: 20).isActive = true
        
        containerViewTahap2.addSubview(pointerImage2)
        pointerImage2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 52).isActive = true
        pointerImage2.centerYAnchor.constraint(equalTo: tahap2Label.centerYAnchor, constant: 0).isActive = true
        pointerImage2.heightAnchor.constraint(equalToConstant: 24).isActive = true
        pointerImage2.widthAnchor.constraint(equalToConstant: 24).isActive = true

        containerViewTahap2.addSubview(tahap2TitleLabel)
        tahap2TitleLabel.leadingAnchor.constraint(equalTo: containerViewTahap2.leadingAnchor, constant: 35).isActive = true
        tahap2TitleLabel.topAnchor.constraint(equalTo: tahap2Label.bottomAnchor, constant: 16).isActive = true

        containerViewTahap2.addSubview(tahap2DescriptionLabel)
        tahap2DescriptionLabel.leadingAnchor.constraint(equalTo: containerViewTahap2.leadingAnchor, constant: 35).isActive = true
        tahap2DescriptionLabel.topAnchor.constraint(equalTo: tahap2TitleLabel.bottomAnchor, constant: 8).isActive = true

        containerViewTahap2.addSubview(gununganTahap2Image)
        gununganTahap2Image.trailingAnchor.constraint(equalTo: containerViewTahap2.trailingAnchor, constant: -18).isActive = true
        gununganTahap2Image.topAnchor.constraint(equalTo: containerViewTahap2.topAnchor, constant: 43).isActive = true
        gununganTahap2Image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        gununganTahap2Image.widthAnchor.constraint(equalToConstant: 34).isActive = true

        containerViewTahap2.addSubview(tahap2progresLabel)
        tahap2progresLabel.trailingAnchor.constraint(equalTo: gununganTahap2Image.leadingAnchor, constant: -12).isActive = true
        tahap2progresLabel.topAnchor.constraint(equalTo: containerViewTahap2.topAnchor, constant: 78).isActive = true
    }
    
    func setupTahap3Card() {
        
//        tahap 3
        containerView.addSubview(containerViewTahap3)
        thirdContainerTopAnchor1?.isActive = true
        containerViewTahap3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 84).isActive = true
        containerViewTahap3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -78).isActive = true
        containerViewTahap3.heightAnchor.constraint(equalToConstant: 127).isActive = true

        containerViewTahap3.addSubview(tahap3Label)
        tahap3Label.leadingAnchor.constraint(equalTo: containerViewTahap3.leadingAnchor, constant: 35).isActive = true
        tahap3Label.topAnchor.constraint(equalTo: containerViewTahap3.topAnchor, constant: 20).isActive = true
        
        containerViewTahap3.addSubview(pointerImage3)
        pointerImage3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 52).isActive = true
        pointerImage3.centerYAnchor.constraint(equalTo: tahap3Label.centerYAnchor, constant: 0).isActive = true
        pointerImage3.heightAnchor.constraint(equalToConstant: 24).isActive = true
        pointerImage3.widthAnchor.constraint(equalToConstant: 24).isActive = true

        containerViewTahap3.addSubview(tahap3TitleLabel)
        tahap3TitleLabel.leadingAnchor.constraint(equalTo: containerViewTahap3.leadingAnchor, constant: 35).isActive = true
        tahap3TitleLabel.topAnchor.constraint(equalTo: tahap3Label.bottomAnchor, constant: 16).isActive = true

        containerViewTahap3.addSubview(tahap3DescriptionLabel)
        tahap3DescriptionLabel.leadingAnchor.constraint(equalTo: containerViewTahap3.leadingAnchor, constant: 35).isActive = true
        tahap3DescriptionLabel.topAnchor.constraint(equalTo: tahap3TitleLabel.bottomAnchor, constant: 8).isActive = true

        containerViewTahap3.addSubview(gununganTahap3Image)
        gununganTahap3Image.trailingAnchor.constraint(equalTo: containerViewTahap3.trailingAnchor, constant: -18).isActive = true
        gununganTahap3Image.topAnchor.constraint(equalTo: containerViewTahap3.topAnchor, constant: 43).isActive = true
        gununganTahap3Image.heightAnchor.constraint(equalToConstant: 64).isActive = true
        gununganTahap3Image.widthAnchor.constraint(equalToConstant: 34).isActive = true

        containerViewTahap3.addSubview(tahap3progresLabel)
        tahap3progresLabel.trailingAnchor.constraint(equalTo: gununganTahap3Image.leadingAnchor, constant: -12).isActive = true
        tahap3progresLabel.topAnchor.constraint(equalTo: containerViewTahap3.topAnchor, constant: 78).isActive = true
    }
    
    func setupCV1() {
        containerView.addSubview(detailContainerView1)
        detailContainerView1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 115).isActive = true
        detailContainerView1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -138).isActive = true
        detailContainerView1.topAnchor.constraint(equalTo: containerViewTahap1.bottomAnchor, constant: 22).isActive = true
        detailContainerView1.heightAnchor.constraint(equalToConstant: 816).isActive = true
        
        detailContainerView1.addSubview(collectionViewTahap1)
        collectionViewTahap1.leadingAnchor.constraint(equalTo: detailContainerView1.leadingAnchor, constant: 0).isActive = true
        collectionViewTahap1.trailingAnchor.constraint(equalTo: detailContainerView1.trailingAnchor, constant: 0).isActive = true
        collectionViewTahap1.topAnchor.constraint(equalTo: detailContainerView1.topAnchor, constant: 0).isActive = true
        collectionViewTahap1.bottomAnchor.constraint(equalTo: detailContainerView1.bottomAnchor, constant: 0).isActive = true
    }

    func setupCV2() {
        containerView.addSubview(detailContainerView2)
        detailContainerView2.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 110).isActive = true
        detailContainerView2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -78).isActive = true
        detailContainerView2.topAnchor.constraint(equalTo: containerViewTahap2.bottomAnchor, constant: 22).isActive = true
        detailContainerView2.heightAnchor.constraint(equalToConstant: 816).isActive = true
        
        detailContainerView2.addSubview(collectionViewTahap2)
        collectionViewTahap2.leadingAnchor.constraint(equalTo: detailContainerView2.leadingAnchor, constant: 0).isActive = true
        collectionViewTahap2.trailingAnchor.constraint(equalTo: detailContainerView2.trailingAnchor, constant: 0).isActive = true
        collectionViewTahap2.topAnchor.constraint(equalTo: detailContainerView2.topAnchor, constant: 0).isActive = true
        collectionViewTahap2.bottomAnchor.constraint(equalTo: detailContainerView2.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupCV3() {
        containerView.addSubview(detailContainerView3)
        detailContainerView3.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 110).isActive = true
        detailContainerView3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -78).isActive = true
        detailContainerView3.topAnchor.constraint(equalTo: containerViewTahap3.bottomAnchor, constant: 22).isActive = true
        detailContainerView3.heightAnchor.constraint(equalToConstant: 816).isActive = true
        
        detailContainerView3.addSubview(collectionViewTahap3)
        collectionViewTahap3.leadingAnchor.constraint(equalTo: detailContainerView3.leadingAnchor, constant: 0).isActive = true
        collectionViewTahap3.trailingAnchor.constraint(equalTo: detailContainerView3.trailingAnchor, constant: 0).isActive = true
        collectionViewTahap3.topAnchor.constraint(equalTo: detailContainerView3.topAnchor, constant: 0).isActive = true
        collectionViewTahap3.bottomAnchor.constraint(equalTo: detailContainerView3.bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
