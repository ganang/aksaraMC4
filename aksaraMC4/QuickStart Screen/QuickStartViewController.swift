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
    private let newGuideFirstCellId = "NewGuideFirstCell_ID"
    private let anatomiCellId = "AnatomiCell_ID"
    private let newHeadnTailDDCellId = "NewHeadnTailDDCell_ID"
    private let quizViewTypeAV2CellId = "QuizViewTypeAV2_ID"
    private let newGuideMLCellId = "NewGuideMLCell_ID"
    private let newRewardCellId = "NewRewardCell_ID"
    
    var countdownTimer: Timer!
    var totalTime: Int = 30
    var indexCollection: IndexPath? = IndexPath(item: 0, section: 0)
    var progressBarValue = 1.00/7.00
    var currentIndexBar = 1
    
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
        button.addTarget(self, action: #selector(showWarningModal), for: .touchUpInside)
        
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
        progressBar.progress = CGFloat(progressBarValue)
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
        label.text = "1 / 7"
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
    
    
    
    //ForBackModal
    lazy var backBackgroundBlurView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 29/255, green: 112/255, blue: 188/255, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideWarningModal))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    lazy var backContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(displayP3Red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let quitWarningLabel: UILabel = {
        let label = UILabel()
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Now-Medium", size: 20)!,
                          NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle
        ] as [NSAttributedString.Key : Any]
        let attributedText  = NSMutableAttributedString(string: "Anda yakin keluar ? Semua proses tidak akan terhapus", attributes: attributes)
        label.attributedText = attributedText
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let keluarWarningButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "keluarWarningButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(handlePopBack), for: .touchUpInside)
        return button
    }()
    
    
    
    let lanjutWarningButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "lanjutWarningButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(hideWarningModal), for: .touchUpInside)
        return button
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
        quickStartCollectionView.register(NewPanduanFirstCell.self, forCellWithReuseIdentifier: newGuideFirstCellId)
        quickStartCollectionView.register(NewGuideCell.self, forCellWithReuseIdentifier: anatomiCellId)
        quickStartCollectionView.register(NewHeadnTailDDCell.self, forCellWithReuseIdentifier: newHeadnTailDDCellId)
        quickStartCollectionView.register(QuizViewTypeAV2.self, forCellWithReuseIdentifier: quizViewTypeAV2CellId)
        quickStartCollectionView.register(NewGuideMLCell.self, forCellWithReuseIdentifier: newGuideMLCellId)
        quickStartCollectionView.register(NewRewardCell.self, forCellWithReuseIdentifier: newRewardCellId)
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
        
        quickStartCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        quickStartCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        quickStartCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        quickStartCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func handleBackButton() {
        navigationController?.pushViewController(QuickStartReviewViewController(), animated: true)
    }
    
    func handleProgress(withProgress progress: CGFloat) {
        progressBar.progress = progress
    }
    
    func handleProgressLabel(withIndex index: Int) {
        self.progressLabel.text = "\(String(index)) / 7"
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
    
    @objc func handleNextQuiz(_ sender: UIButton) {
        
        let indexPath = IndexPath(item: sender.tag + 1, section: 0)
        self.indexCollection = indexPath
        print("index", indexCollection?.item)
        
        if (indexCollection!.item < 8) {
            
            if self.quickStartCollectionView.dataSource?.collectionView(self.quickStartCollectionView, cellForItemAt: IndexPath(row: 0, section: 0)) != nil {
                let rect = self.quickStartCollectionView.layoutAttributesForItem(at: indexPath)?.frame
                self.quickStartCollectionView.scrollRectToVisible(rect!, animated: true)
            }
            
            self.progressBarValue = Double(indexCollection!.item + 1) / 7.00
            handleProgress(withProgress: CGFloat(progressBarValue))
            handleProgressLabel(withIndex: indexPath.item + 1)
        } else {
            self.progressLabel.isHidden = true
            self.progressBar.isHidden = true
            self.backButton.isHidden = true
            self.titleLabel.isHidden = true
        }
    }
    
    
    //-----Modal----------//
    
    @objc func handlePopBack(){
        // handle progress
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LevelV2Controller.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    
    @objc func showWarningModal() {
        
        view.addSubview(backBackgroundBlurView)
        NSLayoutConstraint.activate([
            backBackgroundBlurView.topAnchor.constraint(equalTo: view.topAnchor),
            backBackgroundBlurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backBackgroundBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backBackgroundBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        backBackgroundBlurView.addSubview(backContainerView)
        NSLayoutConstraint.activate([
            backContainerView.widthAnchor.constraint(equalToConstant: 472),
            backContainerView.heightAnchor.constraint(equalToConstant: 264),
            backContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        backContainerView.addSubview(quitWarningLabel)
        NSLayoutConstraint.activate([
            quitWarningLabel.trailingAnchor.constraint(equalTo: backContainerView.trailingAnchor, constant: -66 ),
            quitWarningLabel.leadingAnchor.constraint(equalTo: backContainerView.leadingAnchor, constant: 65),
            quitWarningLabel.topAnchor.constraint(equalTo: backContainerView.topAnchor, constant: 67)
        ])
        
        backContainerView.addSubview(keluarWarningButton)
        NSLayoutConstraint.activate([
            keluarWarningButton.leadingAnchor.constraint(equalTo: backContainerView.leadingAnchor, constant: 48),
            keluarWarningButton.bottomAnchor.constraint(equalTo: backContainerView.bottomAnchor, constant: -42),
            keluarWarningButton.widthAnchor.constraint(equalToConstant: 180),
            keluarWarningButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        backContainerView.addSubview(lanjutWarningButton)
        NSLayoutConstraint.activate([
            lanjutWarningButton.trailingAnchor.constraint(equalTo: backContainerView.trailingAnchor, constant: -48 ),
            lanjutWarningButton.bottomAnchor.constraint(equalTo: backContainerView.bottomAnchor, constant: -42),
            lanjutWarningButton.widthAnchor.constraint(equalToConstant: 180),
            lanjutWarningButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc func hideWarningModal() {
//        startTimer()
        backBackgroundBlurView.removeFromSuperview()
        
//        if (quizes?[indexCollection!.item].type != "Guide") {
//            handleResumeTimer()
//        }
    }
}

extension QuickStartViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newGuideFirstCellId, for: indexPath) as! NewPanduanFirstCell
            cell.continueButton.tag = indexPath.item
            cell.continueButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            batikBackgroundImageView.alpha = 0.16
            
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: anatomiCellId, for: indexPath) as! NewGuideCell
            cell.continueButton.tag = indexPath.item
            cell.continueButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            
            return cell
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pencilStrokeCellId, for: indexPath) as! PencilStrokeCell
            cell.gotItButton.tag = indexPath.item
            cell.gotItButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            
            return cell
            
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newHeadnTailDDCellId, for: indexPath) as! NewHeadnTailDDCell
            cell.continueButton.tag = indexPath.item
            cell.continueButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            
            return cell
            
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: quizViewTypeAV2CellId, for: indexPath) as! QuizViewTypeAV2
            cell.lanjutStateButton.tag = indexPath.item
            cell.lanjutStateButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            
            return cell
            
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pencilStrokeCellId, for: indexPath) as! PencilStrokeCell
            cell.gotItButton.tag = indexPath.item
            cell.gotItButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            
            return cell
            
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newGuideMLCellId, for: indexPath) as! NewGuideMLCell
            cell.continueButton.tag = indexPath.item
            cell.continueButton.addTarget(self, action: #selector(handleNextQuiz), for: .touchUpInside)
            
            
            return cell
            
        case 7:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newRewardCellId, for: indexPath) as! NewRewardCell
            cell.continueButton.addTarget(self, action: #selector(handlePopBack), for: .touchUpInside)
            cell.layarUtamaButton.addTarget(self, action: #selector(handlePopBack), for: .touchUpInside)
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pencilStrokeCellId, for: indexPath) as! PencilStrokeCell
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
