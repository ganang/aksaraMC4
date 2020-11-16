//
//  QuickStartViewController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 15/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuickStartViewController: UIViewController {
    
    private let pencilStrokeCellId = "PencilStrokeCell_ID"
    var countdownTimer: Timer!
    var totalTime: Int = 30
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let batikBackgroundImageView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    let backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(systemName: "xmark") {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .white
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = .white
        label.text = "Aksara Jawa - Mulai Panduan"
        
        return label
    }()
    
    lazy var progressBar: GradientHorizontalProgressBar = {
        let progressBar = GradientHorizontalProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = .init(white: 1, alpha: 0.2)
        progressBar.progress = 0
        progressBar.gradientColors = [Theme.current.gradientTopGold.cgColor, Theme.current.gradientBottomGold.cgColor]
        
        return progressBar
    }()
    
    lazy var circularProgressBar: GradientCircularProgressBar = {
        let progressBar = GradientCircularProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = .init(white: 1, alpha: 0.2)
        progressBar.progress = 0
        progressBar.gradientColors = [Theme.current.gradientTopGold.cgColor, Theme.current.gradientTopGold.cgColor]
        
        return progressBar
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = .white
        label.text = "12 / 18"
        label.textAlignment = .center
        
        return label
    }()
    
    let quickStartCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.bounces = true
        collectionView.translatesAutoresizingMaskIntoConstraints =  false
        
        return collectionView
    }()
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        startTimer()
    }
    
    func setupNavBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    func setupView() {
        setupViewBackground()
        setupInterfaceComponent()
        setupConstraint()
        registerCV()
        setupDelegate()
    }
    
    func registerCV() {
        quickStartCollectionView.register(PencilStrokeCell.self, forCellWithReuseIdentifier: pencilStrokeCellId)
        quickStartCollectionView.reloadData()
        quickStartCollectionView.layoutIfNeeded()
    }
    
    func setupDelegate() {
        quickStartCollectionView.delegate = self
        quickStartCollectionView.dataSource = self
    }
    
    func setupViewBackground() {
        view.setBackgroundColorGuideQuickStartBlue()
        containerView.insertSubview(batikBackgroundImageView, at: 0)
        batikBackgroundImageView.alpha = 0.16
    }
    
    func setupInterfaceComponent() {
        view.addSubview(containerView)
        view.addSubview(quickStartCollectionView)
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(progressLabel)
        view.addSubview(progressBar)
        view.addSubview(circularProgressBar)
    }
    
    func setupConstraint() {
        containerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 24).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        progressLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        progressLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        
        progressBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        progressBar.trailingAnchor.constraint(equalTo: progressLabel.leadingAnchor, constant: -16).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 120).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        circularProgressBar.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 60).isActive = true
        circularProgressBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        circularProgressBar.widthAnchor.constraint(equalToConstant: 120).isActive = true
        circularProgressBar.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        quickStartCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        quickStartCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        quickStartCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        quickStartCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func handleBackButton() {
        handleProgress(withProgress: 0.7)
    }
    
    func handleProgress(withProgress progress: CGFloat) {
        progressBar.progress = progress
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime != 0 {
            circularProgressBar.progress += 1/30
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        if (countdownTimer != nil) {
            countdownTimer.invalidate()
        }
    }
}

extension QuickStartViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pencilStrokeCellId, for: indexPath) as! PencilStrokeCell
            batikBackgroundImageView.alpha = 0.16
      
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pencilStrokeCellId, for: indexPath) as! QuizViewTypeA
            
            return cell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
