//
//  StartController.swift
//  aksaraMC4
//
//  Created by Naratama on 10/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuickStartReviewViewController: UIViewController {
    
    private let ulasanCellId = "ulasanCellId"
    private var ulasanCell: QuickStartReviewCell!
    var containerViewHeightAnchor2: NSLayoutConstraint?
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ( (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func printSecondsToHoursMinutesSeconds(seconds:Int) -> String {
        let (m, s) = secondsToHoursMinutesSeconds (seconds: seconds)
        return "\(m) Menit, \(s) Detik"
    }
    
    func handleTotalCorrectLabel() {
        let firstWord   = ""
        let secondWord = ": \(3) kuis"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)]
        let attrs2     = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)]
        let thirdWord   = " dari \(3) kuis"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        
        benarDoneQuizLabel.attributedText = attributedText
    }
    
    //Label
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.textColor = Theme.current.accentWhite
        label.text = "Mulai Panduan"
        return label
    }()
    
    let carakanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let firstWord   = ""
        let secondWord = "Aksara Jawa\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Carakan"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let hasilLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = "Hasil kamu"
        return label
    }()
    
    let waktuQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 13
        
        let firstWord   = ""
        let secondWord = "Waktu\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Kuis benar"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let waktuDoneQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = ": 4 mnt 30 dtk"
        
        return label
    }()
    
    let benarDoneQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let firstWord   = ""
        let secondWord = ": 14 kuis"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite]
        let attrs2     = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite]
        let thirdWord   = " dari 18 kuis"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        return label
    }()
    
    let aksaraLabelInTopCard1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = "Wa"
        return label
    }()
    
    let aksaraLabelInTopCard2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = "Ha"
        return label
    }()
    
    let aksaraLabelInTopCard3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.text = "Na"
        return label
    }()
    
    let reviewCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.backgroundColor = .init(white: 1, alpha: 0.2)
        
        return imageView
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
    
    let gulunganUlasanTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GununganStand3")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let aksaraInTopCard1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"waCorrectTrackImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let aksaraInTopCard2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Jawaban Ha")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let aksaraInTopCard3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Jawaban Na")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    //SFSymbol
    let timer: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "timer", withConfiguration: symbolConfig)?.withTintColor(Theme.current.accentWhite, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let checkmark: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "checkmark.circle", withConfiguration: symbolConfig)?.withTintColor(Theme.current.accentWhite, renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Button
    lazy var backButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        if let image = UIImage(named: "backIcon") {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 12, bottom: 15, right: 15)
        button.tintColor = Theme.current.accentWhite
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 1), alpha: 0.1, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    lazy var playAgainButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePlayAgainButton), for: .touchUpInside)
        button.setCheckButtonBackgroundGoldColor(withOpacity: 1, withHeight: 44, withWidth: 463, withCorner: 24)
        button.setTitle("Main lagi", for: .normal)
        button.setTitleColor(Theme.current.accentPurple, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let tintedImage = UIImage(systemName: "arrow.counterclockwise", withConfiguration: boldConfig)?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        if let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 150, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        
        return button
    }()
    
    //ScrollView
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
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    let batikBackgroundImageView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    @objc func handlePlayAgainButton() {
        let quickStart = QuickStartViewController()
        navigationController?.pushViewController(quickStart, animated: true)
    }
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        view.setBackgroundColorGuideQuickStartPurple()
        scrollView.insertSubview(batikBackgroundImageView, at: 0)
        batikBackgroundImageView.alpha = 0.16
        
        self.setupScrollView()
        registerCV()
        setupDelegate()
        
        setupViewHeader()
    }
    
    func registerCV() {
        collectionView.register(QuickStartReviewCell.self, forCellWithReuseIdentifier: ulasanCellId)
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupScrollView() {
        
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerViewHeightAnchor2 = containerView.heightAnchor.constraint(equalToConstant: view.frame.height + 424)
        containerViewHeightAnchor2?.isActive = true
    }
    
    func setupViewHeader() {
        containerView.addSubview(aksaraLabel)
        aksaraLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        aksaraLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        
        containerView.addSubview(tahapLabel)
        tahapLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        tahapLabel.topAnchor.constraint(equalTo: aksaraLabel.bottomAnchor, constant: 12).isActive = true
        
        containerView.addSubview(backButton)
        backButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 40).isActive = true
        backButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: view.frame.width * 0.03350083752).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        //CardAksara
        containerView.addSubview(reviewCardImageView)
        reviewCardImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: view.frame.width * 0.08793969849).isActive = true
        reviewCardImageView.topAnchor.constraint(equalTo: tahapLabel.bottomAnchor, constant: 64).isActive = true
        reviewCardImageView.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reviewCardImageView.heightAnchor.constraint(equalToConstant: 332).isActive = true
        
        //ImageAksara
        reviewCardImageView.addSubview(aksaraInTopCard1)
        aksaraInTopCard1.centerXAnchor.constraint(equalTo: reviewCardImageView.centerXAnchor).isActive = true
        aksaraInTopCard1.centerYAnchor.constraint(equalTo: reviewCardImageView.centerYAnchor, constant: -8).isActive = true
        aksaraInTopCard1.heightAnchor.constraint(equalToConstant: 96).isActive = true
        aksaraInTopCard1.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        //LabelAksara
        reviewCardImageView.addSubview(aksaraLabelInTopCard1)
        aksaraLabelInTopCard1.centerXAnchor.constraint(equalTo: aksaraInTopCard1.centerXAnchor).isActive = true
        aksaraLabelInTopCard1.topAnchor.constraint(equalTo: aksaraInTopCard1.bottomAnchor, constant: 8).isActive = true
        
        // decorations
        containerView.addSubview(reviewCardBottomLeftImageView)
        containerView.bringSubviewToFront(reviewCardBottomLeftImageView)
        reviewCardBottomLeftImageView.bottomAnchor.constraint(equalTo: reviewCardImageView.bottomAnchor, constant: 30).isActive = true
        reviewCardBottomLeftImageView.leadingAnchor.constraint(equalTo: reviewCardImageView.leadingAnchor, constant: -30).isActive = true
        reviewCardBottomLeftImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        reviewCardBottomLeftImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerView.addSubview(reviewCardTopLeftImageView)
        containerView.bringSubviewToFront(reviewCardTopLeftImageView)
        reviewCardTopLeftImageView.topAnchor.constraint(equalTo: reviewCardImageView.topAnchor, constant: -30).isActive = true
        reviewCardTopLeftImageView.leadingAnchor.constraint(equalTo: reviewCardImageView.leadingAnchor, constant: -30).isActive = true
        reviewCardTopLeftImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        reviewCardTopLeftImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerView.addSubview(reviewCardTopRightImageView)
        containerView.bringSubviewToFront(reviewCardTopRightImageView)
        reviewCardTopRightImageView.topAnchor.constraint(equalTo: reviewCardImageView.topAnchor, constant: -30).isActive = true
        reviewCardTopRightImageView.trailingAnchor.constraint(equalTo: reviewCardImageView.trailingAnchor, constant: 30).isActive = true
        reviewCardTopRightImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        reviewCardTopRightImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        containerView.addSubview(reviewCardBottomRightImageView)
        containerView.bringSubviewToFront(reviewCardBottomRightImageView)
        reviewCardBottomRightImageView.bottomAnchor.constraint(equalTo: reviewCardImageView.bottomAnchor, constant: 30).isActive = true
        reviewCardBottomRightImageView.trailingAnchor.constraint(equalTo: reviewCardImageView.trailingAnchor, constant: 30).isActive = true
        reviewCardBottomRightImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        reviewCardBottomRightImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        //RightSection
        containerView.addSubview(carakanLabel)
        carakanLabel.leadingAnchor.constraint(equalTo: reviewCardImageView.trailingAnchor, constant: 32).isActive = true
        carakanLabel.topAnchor.constraint(equalTo: reviewCardImageView.topAnchor).isActive = true
        
        containerView.addSubview(hasilLabel)
        hasilLabel.leadingAnchor.constraint(equalTo: reviewCardImageView.trailingAnchor, constant: 32).isActive = true
        hasilLabel.topAnchor.constraint(equalTo: carakanLabel.bottomAnchor, constant: 64).isActive = true
        
        containerView.addSubview(timer)
        timer.leadingAnchor.constraint(equalTo: reviewCardImageView.trailingAnchor, constant: 33).isActive = true
        timer.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        containerView.addSubview(checkmark)
        checkmark.leadingAnchor.constraint(equalTo: reviewCardImageView.trailingAnchor, constant: 33).isActive = true
        checkmark.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 12).isActive = true
        
        containerView.addSubview(waktuQuizLabel)
        waktuQuizLabel.leadingAnchor.constraint(equalTo: timer.trailingAnchor, constant: 8).isActive = true
        waktuQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        containerView.addSubview(waktuDoneQuizLabel)
        waktuDoneQuizLabel.leadingAnchor.constraint(equalTo: waktuQuizLabel.trailingAnchor, constant: 16).isActive = true
        waktuDoneQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        containerView.addSubview(benarDoneQuizLabel)
        benarDoneQuizLabel.leadingAnchor.constraint(equalTo: waktuQuizLabel.trailingAnchor, constant: 16).isActive = true
        benarDoneQuizLabel.topAnchor.constraint(equalTo: waktuDoneQuizLabel.bottomAnchor, constant: 13).isActive = true
        
        containerView.addSubview(playAgainButton)
        playAgainButton.leadingAnchor.constraint(equalTo: checkmark.leadingAnchor).isActive = true
        playAgainButton.bottomAnchor.constraint(equalTo: reviewCardImageView.bottomAnchor).isActive = true
        playAgainButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        playAgainButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -view.frame.width * 0.08793969849).isActive = true
        
        containerView.addSubview(gulunganUlasanTop)
        gulunganUlasanTop.trailingAnchor.constraint(equalTo: playAgainButton.trailingAnchor).isActive = true
        gulunganUlasanTop.topAnchor.constraint(equalTo: carakanLabel.topAnchor).isActive = true
        gulunganUlasanTop.heightAnchor.constraint(equalToConstant: 52).isActive = true
        gulunganUlasanTop.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: reviewCardImageView.bottomAnchor, constant: 60),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: view.frame.width * 0.08793969849),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -view.frame.width * 0.08793969849),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    
}

extension QuickStartReviewViewController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ulasanCellId, for: indexPath) as! QuickStartReviewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(24)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width/3) - 84, height: 196)
    }
    
    
}



