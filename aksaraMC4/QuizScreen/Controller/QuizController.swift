//
//  QuizController.swift
//  aksaraMC4
//
//  Created by Naratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation
import PencilKit

protocol QuizControllerProtocol {
    func stopTimerChoosen()
    func setTrueStatus()
    func setFalseStatus()
}

class QuizController: UIViewController, QuizControllerProtocol {
    
    var regionSelected : String?
    var quizTypeGuideModel: Quiz?
    var quizTypeAModel: Quiz?
    var quizTypeBModel: Quiz?
    var quizTypeCModel: Quiz?
    var quizTypeDModel: Quiz?
    var quizTypeEModel: Quiz?
    
    var quizes : [Quiz]? {
        didSet {
            quizTypeGuideModel = quizes![0]
            quizTypeAModel = quizes![1]
            quizTypeBModel = quizes![2]
            quizTypeCModel = quizes![3]
            quizTypeDModel = quizes![4]
            quizTypeEModel = quizes![5]
        }
    }
    
    var levels: [Level]? {
        didSet {
            
        }
    }
    
    var level: Level?
    var nextLevel: Level?
    
    private let QuizViewCell = "QuizViewCell"
    private let QuizViewTypeACell = "QuizViewTypeACell"
    private let QuizViewTypeBCell = "QuizViewTypeBCell"
    private let QuizViewTypeCCell = "QuizViewTypeCCell"
    private let QuizViewTypeDCell = "QuizViewTypeDCell"
    private let QuizViewTypeECell = "QuizViewTypeECell"
    
    private let QuizViewTypeGuideCellIdenttifier = "QuizViewTypeGuideCell"
    private let QuizViewTypeHCellIdenttifier = "QuizViewTypeHCell"
    private let QuizViewTypeICellIdenttifier = "QuizViewTypeICell"
    
    private let QuizHeadAndTailCellIdentifier = "QuizHeadAndTailCell_ID"
    private let QuizTypeE2CellIdentifier = "QuizTypeE2Cell_ID"
    private let QuizTypeE3CellIdentifier = "QuizTypeE3Cell_ID"
    
    private var quizView: QuizView!
    
    let backBackgroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //HeaderView
    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let quizTopNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara Baru !"
        return label
    }()
    
    let topDecorationImage1: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FlowerFull")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let topDecorationImage2: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "FlowerFull")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var countdownTimer: Timer!
    var totalTime = 0
    var lastTime = 0
    
    var isTimerRunning = false
    
    let headerTimer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = ""
        return label
    }()
    
    
    func startTimer() {
            countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ( (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func printSecondsToHoursMinutesSeconds(seconds:Int) -> String {
        let (m, s) = secondsToHoursMinutesSeconds (seconds: seconds)
        return "\(m) Menit, \(s) Detik"
    }
    
    @objc func updateTime() {
        headerTimer.text = "\(timeFormatted(totalTime))"
        self.lastTime = totalTime
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
            let type = quizes?[self.indexCollection!.row].type!
            
            switch type {
            case "A":
                let cellA = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeA
                cellA.handleTimer()
            case "B":
                let cellB = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeB
                cellB.handleTimer()
            case "C":
                let cellC = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeC
                cellC.handleTimer()
            case "D":
                let cellD = collectionView.cellForItem(at: self.indexCollection!) as! QuizHeadAndTailCell
                cellD.handleTimer()
            case "E2":
                let cellE2 = collectionView.cellForItem(at: self.indexCollection!) as! QuizTypeE2Cell
                cellE2.handleTimer()
            case "E3":
                let cellE3 = collectionView.cellForItem(at: self.indexCollection!) as! QuizTypeE3Cell
                cellE3.handleTimer()
            case "I1":
                let cellI = collectionView.cellForItem(at: self.indexCollection!) as! QuizCellTypeI
                cellI.handleTimer()
            case "I2":
                let cellI = collectionView.cellForItem(at: self.indexCollection!) as! QuizCellTypeI
                cellI.handleTimer()
            case "I3":
                let cellI = collectionView.cellForItem(at: self.indexCollection!) as! QuizCellTypeI
                cellI.handleTimer()
            case "H":
                let cellH = collectionView.cellForItem(at: self.indexCollection!) as! QuizCellTypeH
                cellH.handleTimer()
            default:
                print("XXX")
            }
            
        }
    }
    
    func endTimer() {
        if (countdownTimer != nil) {
            countdownTimer.invalidate()
        }
    }
    
    func stopTimerChoosen() {
        endTimer()
    }
    
    func handleResumeTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        return String(format: "%02d", seconds)
    }
    
    let timerLabelButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .medium, scale: .default)
        let image = UIImage(systemName: "timer", withConfiguration: symbolConfig)?.withRenderingMode(.alwaysTemplate)
        button.setBackgroundImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.textColor1
        button.isHidden = true
        
        return button
    }()
    
    let backButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showWarningModal), for: .touchUpInside)
        if let image = UIImage(named: "backIcon") {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 10)
        button.tintColor = Theme.current.textColor1
        button.backgroundColor = .init(white: 1, alpha: 0.6)
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 1), alpha: 0.1, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    //ProgressiveBar
    let progressiveBar: UIProgressView = {
        let pv = UIProgressView()
        pv.progress = 1.00/20
        pv.tintColor = UIColor.blue
        pv.trackTintColor = Theme.current.accentLightBlue
        pv.clipsToBounds = true
        pv.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return pv
    }()
    
    let collectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
//        cv.setBackgroundColor()
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    var valueProgressBar = 1.00/20.00
    
    var indexCollection: IndexPath? = IndexPath(item: 0, section: 0)
    
    @objc func handleProgressBar(_ sender: UIButton) {
        resetStatus()
        handleCoreDataTimer(withSender: sender)
        // handle timer
        
        if sender.tag + 1 < 20 {
            if (countdownTimer != nil) {
                endTimer()
            }
            
            startTimer()
            
            // handle progress
            valueProgressBar = valueProgressBar + 1.00/20.00
            self.progressiveBar.progress = Float(valueProgressBar)
            
            // handle timer label button
            self.timerLabelButton.isHidden = false
            self.totalTime = Int((quizes?[sender.tag + 1].time)!)
            
            // handle title
            let stringRegion =  String(regionSelected!)
            let quizName = String((quizes?[sender.tag + 1].title)!)
            let quizesCount = String((quizes!.count - 3))
            
            if (quizName == "Panduan") {
                self.quizTopNumberLabel.text = "Aksara Baru!"
            } else {
                self.quizTopNumberLabel.text = "Aksara \(stringRegion) - \(quizName)/\(quizesCount)"
            }
            
            // handle scroll collection
            let indexPath = IndexPath(item: sender.tag + 1, section: 0)
            self.indexCollection = indexPath
            
            if self.collectionView.dataSource?.collectionView(self.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) != nil {
                let rect = self.collectionView.layoutAttributesForItem(at: indexPath)?.frame
                self.collectionView.scrollRectToVisible(rect!, animated: false)
            }
        } else {
            if (countdownTimer != nil) {
                endTimer()
                showModal()
            }
        }
        
    }
    
    func handleCoreDataTimer(withSender sender: UIButton) {
        let quizType = quizes?[sender.tag].type
        let quiz = quizes?[sender.tag]
        
        if (quizType != "Guide") {
            let quizTime = quiz!.time - Int64(lastTime)
            quiz?.totalTime = Int64(quizTime)
        }
        
    }
    
    @objc func handlePopBack(){
        // handle progress
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LevelV2Controller.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    let batikBackgroundImageView: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        return backgroundImage
    }()
    
    func batikBG() {
        self.backBackgroundView.insertSubview(batikBackgroundImageView, at: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCV()
        registerCV()
        setupDelegate()
        batikBG()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        countdownTimer = nil
    }
    
    func setupCV() {
        view.addSubview(backBackgroundView)
        NSLayoutConstraint.activate([
            backBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        backBackgroundView.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: backBackgroundView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: backBackgroundView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: backBackgroundView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 124)
        ])
        
        //Nav Section
        headerView.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: view.frame.height * 0.0479616307),
            backButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: view.frame.width * 0.03350083752),
            backButton.widthAnchor.constraint(equalToConstant: 48),
            backButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        headerView.addSubview(quizTopNumberLabel)
        NSLayoutConstraint.activate([
            quizTopNumberLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: view.frame.height * 0.06354916067),
            quizTopNumberLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        ])
        
        headerView.addSubview(topDecorationImage1)
        topDecorationImage1.trailingAnchor.constraint(equalTo: quizTopNumberLabel.leadingAnchor, constant: -32).isActive = true
        topDecorationImage1.centerYAnchor.constraint(equalTo: quizTopNumberLabel.centerYAnchor).isActive = true
        topDecorationImage1.heightAnchor.constraint(equalToConstant: 34).isActive = true
        topDecorationImage1.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        headerView.addSubview(topDecorationImage2)
        topDecorationImage2.leadingAnchor.constraint(equalTo: quizTopNumberLabel.trailingAnchor, constant: 32).isActive = true
        topDecorationImage2.centerYAnchor.constraint(equalTo: quizTopNumberLabel.centerYAnchor).isActive = true
        topDecorationImage2.heightAnchor.constraint(equalToConstant: 34).isActive = true
        topDecorationImage2.widthAnchor.constraint(equalToConstant: 34).isActive = true
        
        headerView.addSubview(headerTimer)
        NSLayoutConstraint.activate([
            headerTimer.topAnchor.constraint(equalTo: headerView.topAnchor, constant: view.frame.height * 0.06354916067),
            headerTimer.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -view.frame.width * 0.03350083752)
        ])
        
        headerView.addSubview(timerLabelButton)
        NSLayoutConstraint.activate([
            timerLabelButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: view.frame.height * 0.0623501199),
            timerLabelButton.trailingAnchor.constraint(equalTo: headerTimer.leadingAnchor, constant: -view.frame.width * 0.006700167504)
        ])
        
        
        headerView.addSubview(progressiveBar)
        progressiveBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            progressiveBar.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: view.frame.height * 0.02877697842),
            progressiveBar.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            progressiveBar.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            progressiveBar.heightAnchor.constraint(equalToConstant: view.frame.height * 0.01438848921)
        ])
        
        let colorTop =  Theme.current.gradientTopBlue.cgColor
        let colorBottom = Theme.current.gradientBottomBlue.cgColor
        let gradientImage = UIImage.gradientImage(with: progressiveBar.frame, colors: [colorTop, colorBottom], locations: nil)
        progressiveBar.progressImage = gradientImage!
        progressiveBar.setProgress(1.00/20.00, animated: true)
        
        backBackgroundView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: backBackgroundView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: backBackgroundView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: backBackgroundView.bottomAnchor)
        ])
    }
    
    func registerCV() {
        collectionView.register(QuizView.self, forCellWithReuseIdentifier: QuizViewCell)
        collectionView.register(QuizViewTypeA.self, forCellWithReuseIdentifier: QuizViewTypeACell)
        collectionView.register(QuizViewTypeB.self, forCellWithReuseIdentifier: QuizViewTypeBCell)
        collectionView.register(QuizViewTypeC.self, forCellWithReuseIdentifier: QuizViewTypeCCell)
        collectionView.register(QuizViewTypeD.self, forCellWithReuseIdentifier: QuizViewTypeDCell)
        collectionView.register(QuizViewTypeE.self, forCellWithReuseIdentifier: QuizViewTypeECell)
        collectionView.register(QuizHeadAndTailCell.self, forCellWithReuseIdentifier: QuizHeadAndTailCellIdentifier)
        collectionView.register(QuizTypeE2Cell.self, forCellWithReuseIdentifier: QuizTypeE2CellIdentifier)
        collectionView.register(QuizTypeE3Cell.self, forCellWithReuseIdentifier: QuizTypeE3CellIdentifier)
        
        collectionView.register(QuizCellTypeGuide.self, forCellWithReuseIdentifier: QuizViewTypeGuideCellIdenttifier)
        collectionView.register(QuizCellTypeH.self, forCellWithReuseIdentifier: QuizViewTypeHCellIdenttifier)
        collectionView.register(QuizCellTypeI.self, forCellWithReuseIdentifier: QuizViewTypeICellIdenttifier)
        
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "example")
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
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
    
    @objc func showWarningModal() {
        endTimer()
        
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
        
        if (quizes?[indexCollection!.item].type != "Guide") {
            handleResumeTimer()
        }
    }
    
    //View HandlePanduanInfoMenulis
    lazy var backgroundInfoBlurView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 29/255, green: 112/255, blue: 188/255, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hidePanduanInfoMenulis))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        
        return view
    }()
    
    lazy var containerInfoView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(displayP3Red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let labelPanduan: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 12
        paragraphStyle.lineSpacing = 10
        
        let firstWord   = ""
        let secondWord = "Menulis Aksara\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 18), NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Anda dapat menggunakan Apple Pencil atau ujung jari untuk menuliskan aksara sesuai panduan gambar"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        return label
    }()
    
    let panduanInfo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "panduanInfo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let mengertiButton: UIButton = {
        let button = UIButton()
        let attributedString = NSAttributedString(string: NSLocalizedString("Mengerti", comment: ""), attributes:[
            NSAttributedString.Key.font : UIFont.init(name: "Now-medium", size: 20) as Any,
            NSAttributedString.Key.foregroundColor : Theme.current.textColor2,
            NSAttributedString.Key.underlineStyle: 1.0
        ])
        button.setAttributedTitle(attributedString, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(hidePanduanInfoMenulis), for: .touchUpInside)
        return button
    }()
    
    //HandlePanduanInfoMenulis
    @objc func showPanduanInfoMenulis() {
        view.addSubview(backgroundInfoBlurView)
        backgroundInfoBlurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundInfoBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundInfoBlurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundInfoBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        backgroundInfoBlurView.addSubview(containerInfoView)
        containerInfoView.centerXAnchor.constraint(equalTo: backgroundInfoBlurView.centerXAnchor).isActive = true
        containerInfoView.centerYAnchor.constraint(equalTo: backgroundInfoBlurView.centerYAnchor).isActive = true
        containerInfoView.heightAnchor.constraint(equalToConstant: 560).isActive = true
        containerInfoView.widthAnchor.constraint(equalToConstant: 440).isActive = true
        
        
        containerInfoView.addSubview(labelPanduan)
        labelPanduan.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor, constant: 32).isActive = true
        labelPanduan.topAnchor.constraint(equalTo: containerInfoView.topAnchor, constant: 40).isActive = true
        labelPanduan.trailingAnchor.constraint(equalTo: containerInfoView.trailingAnchor, constant: -40).isActive = true
        
        
        containerInfoView.addSubview(panduanInfo)
        panduanInfo.topAnchor.constraint(equalTo: containerInfoView.topAnchor, constant: 189).isActive = true
        panduanInfo.leadingAnchor.constraint(equalTo: containerInfoView.leadingAnchor, constant: 70).isActive = true
        panduanInfo.heightAnchor.constraint(equalToConstant: 274).isActive = true
        panduanInfo.widthAnchor.constraint(equalToConstant: 462).isActive = true
        
        
        containerInfoView.addSubview(mengertiButton)
        mengertiButton.centerXAnchor.constraint(equalTo: containerInfoView.centerXAnchor).isActive = true
        mengertiButton.bottomAnchor.constraint(equalTo: containerInfoView.bottomAnchor, constant: -40).isActive = true
        
    }
    
    @objc func hidePanduanInfoMenulis() {
        backgroundInfoBlurView.removeFromSuperview()
    }
    
    //For Modal
    lazy var backgroundView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 243/255, green: 250/255, blue: 255/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
//        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
//        let blurEffectView = UIVisualEffectView(effect: blurEffect)
//        blurEffectView.frame = view.bounds
//        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        view.addSubview(blurEffectView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.hideWarningModal))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    
    let aksaraStepLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Tahap 1 - Tingkat 1"
        label.textColor = Theme.current.textColor1
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let gununganImageModal: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "GununganStand0")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let nilaiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Aksara Jawa"
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let hasilLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
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
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
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
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = ": 4 mnt 30 dtk"
        
        return label
    }()
    
    let benarDoneQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    let aksaraLabelInTopCard1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Wa"
        return label
    }()
    
    let aksaraLabelInTopCard2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Ha"
        return label
    }()
    
    let aksaraLabelInTopCard3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Na"
        return label
    }()
    
    let batikBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "decorativeBackground")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let ulasanBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BackgroundUlasan")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let aksaraInTopCard1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"Jawa Jawaban Wa")
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
    let timerLogo: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "timer", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let checkmark: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "checkmark.circle", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var selanjutnyaButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "selanjutnyaButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return button
    }()
    
    // BUTTON KEMBALI, NAMANYA MAIN ULANG
//    @objc let mainUlangButton: UIButton = {
//        let button = UIButton()
//        button.setBackgroundImage(UIImage(named: "mainLagiButton"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
//        button.addTarget(self, action: #selector(handlePopBackFromReward), for: .touchUpInside)
//        return button
//    }()
    
    lazy var ulasanButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Ulasan"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(handleUlasan), for: .touchUpInside)
        return button
    }()
    
    lazy var layarUtamaButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "LayarUtama"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(handlePopBack), for: .touchUpInside)
        return button
    }()
    
    @objc func handleUlasan() {
        
        let ulasanScreen = UlasanController()
        ulasanScreen.level = level
        ulasanScreen.levels = levels
        
        navigationController?.pushViewController(ulasanScreen, animated: true)
    }
    
    var totalQuizCorrect = 0
    var totalMedal = 0
    
    func handleQuizRecord() {
        level?.totalTime = 0
        PersistenceService.saveContext()
        
        for i in 0...quizes!.count - 1 {
            if quizes![i].isCorrect {
                totalQuizCorrect = totalQuizCorrect + 1
            }
            
            if (quizes![i].type != "Guide") {
                level?.totalTime += quizes![i].totalTime
                PersistenceService.saveContext()
            }
        }
        
        waktuDoneQuizLabel.text = ": \(printSecondsToHoursMinutesSeconds(seconds: Int(level!.totalTime)))"
        
        let firstWord   = ""
        let secondWord = ": \(totalQuizCorrect) kuis"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)]
        let attrs2     = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)]
        let thirdWord   = " dari \(quizes!.count - 3) kuis"
        let attributedText = NSMutableAttributedString(string: firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        benarDoneQuizLabel.attributedText = attributedText
        
        if totalQuizCorrect < 1 {
            gununganImageModal.image = UIImage(named: "gununganDone0")
            selanjutnyaButton.setBackgroundImage(UIImage(named: "mainLagiButton"), for: .normal)
            selanjutnyaButton.addTarget(self, action: #selector(handleMainLagi), for: .touchUpInside)
            aksaraStepLabel.textColor = UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1)
            hasilLabel.textColor = UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1)
            aksaraInTopCard1.setImageColor(color: UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1))
            aksaraInTopCard2.setImageColor(color: UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1))
            aksaraInTopCard3.setImageColor(color: UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1))
            totalMedal = 0
        } else if totalQuizCorrect <= 5 {
            gununganImageModal.image = UIImage(named: "gununganDone1")
            selanjutnyaButton.setBackgroundImage(UIImage(named: "mainLagiButton"), for: .normal)
            selanjutnyaButton.addTarget(self, action: #selector(handleMainLagi), for: .touchUpInside)
            aksaraStepLabel.textColor = UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1)
            hasilLabel.textColor = UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1)
            aksaraInTopCard1.setImageColor(color: UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1))
            aksaraInTopCard2.setImageColor(color: UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1))
            aksaraInTopCard3.setImageColor(color: UIColor.rgb(red: 215, green: 58, blue: 76, alpha: 1))
            totalMedal = 1
        } else if totalQuizCorrect <= 10 {
            gununganImageModal.image = UIImage(named: "gununganDone2")
//            selanjutnyaButton.addTarget(self, action: #selector(handleSelanjutnya), for: .touchUpInside)
            aksaraStepLabel.textColor = UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1)
            hasilLabel.textColor = UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1)
            aksaraInTopCard1.setImageColor(color: UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1))
            aksaraInTopCard2.setImageColor(color: UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1))
            aksaraInTopCard3.setImageColor(color: UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1))
            totalMedal = 2
//            handleNextLevel()
        } else{
            gununganImageModal.image = UIImage(named: "gununganDone3")
//            selanjutnyaButton.addTarget(self, action: #selector(handleSelanjutnya), for: .touchUpInside)
            aksaraStepLabel.textColor = UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1)
            hasilLabel.textColor = UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1)
            aksaraInTopCard1.setImageColor(color: UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1))
            aksaraInTopCard2.setImageColor(color: UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1))
            aksaraInTopCard3.setImageColor(color: UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1))
            totalMedal = 3
//            handleNextLevel()
        }
        
        let stingStageId : Int = Int((level?.stage!.id)!)
        let stingStageIdString = String(stingStageId)
        
        let stringRegion =  String(regionSelected!)
        
        let stingLevelId : Int = Int(level!.id)
        let stingLevelIdString = String(stingLevelId)
        
//        nilaiLabel.text = "Nilai: \(totalQuizCorrect)/5"
        aksaraStepLabel.text = "Tahap \(stingStageIdString) - Tingkat \(stingLevelIdString)"
        quizTopNumberLabel.text = "Aksara \(stringRegion) Tahap \(stingStageIdString)-\(stingLevelIdString)"
        
        level?.totalMedal = Int64(totalMedal)
        
        handleUpdateTotalMedalStage()
        PersistenceService.saveContext()
    }
    
    func handleUpdateTotalMedalStage() {
        var totalMedal = 0
        
        for i in 0...levels!.count - 1 {
            let medal = Int((levels?[i].totalMedal)!)
            
            totalMedal = totalMedal + medal
        }
        
        level?.stage?.currentMedal = Int64(totalMedal)
        level?.isInitial = false
        PersistenceService.saveContext()
        
        NotificationCenter.default.post(name: Notification.Name("updateData"), object: nil, userInfo: ["update" : true])
    }
    
    @objc func showModal() {
        
        handleQuizRecord()
        
        view.addSubview(backgroundView)
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundView.addSubview(batikBackground)
        batikBackground.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        batikBackground.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        batikBackground.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        batikBackground.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        
        batikBackground.addSubview(ulasanBackground)
        ulasanBackground.centerXAnchor.constraint(equalTo: batikBackground.centerXAnchor).isActive = true
        ulasanBackground.centerYAnchor.constraint(equalTo: batikBackground.centerYAnchor).isActive = true
        ulasanBackground.heightAnchor.constraint(equalToConstant: 712).isActive = true
        ulasanBackground.widthAnchor.constraint(equalToConstant: 508).isActive = true
        
        ulasanBackground.addSubview(aksaraStepLabel)
        aksaraStepLabel.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        aksaraStepLabel.topAnchor.constraint(equalTo: ulasanBackground.topAnchor, constant: 72).isActive = true
        
        ulasanBackground.addSubview(gununganImageModal)
        gununganImageModal.topAnchor.constraint(equalTo: ulasanBackground.topAnchor, constant: 72).isActive = true
        gununganImageModal.trailingAnchor.constraint(equalTo: ulasanBackground.trailingAnchor, constant: -67).isActive = true
        gununganImageModal.heightAnchor.constraint(equalToConstant: 48).isActive = true
        gununganImageModal.widthAnchor.constraint(equalToConstant: 92).isActive = true
        
        ulasanBackground.addSubview(nilaiLabel)
        nilaiLabel.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        nilaiLabel.topAnchor.constraint(equalTo: aksaraStepLabel.bottomAnchor, constant: 4).isActive = true
        nilaiLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        //ImageAksara
        ulasanBackground.addSubview(aksaraInTopCard2)
        aksaraInTopCard2.centerXAnchor.constraint(equalTo: ulasanBackground.centerXAnchor).isActive = true
        aksaraInTopCard2.topAnchor.constraint(equalTo: nilaiLabel.bottomAnchor, constant: 84).isActive = true
        aksaraInTopCard2.heightAnchor.constraint(equalToConstant: 32).isActive = true
        aksaraInTopCard2.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        ulasanBackground.addSubview(aksaraInTopCard1)
        aksaraInTopCard1.trailingAnchor.constraint(equalTo: aksaraInTopCard2.leadingAnchor,constant: -8).isActive = true
        aksaraInTopCard1.topAnchor.constraint(equalTo: nilaiLabel.bottomAnchor, constant: 84).isActive = true
        aksaraInTopCard1.heightAnchor.constraint(equalToConstant: 32).isActive = true
        aksaraInTopCard1.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        ulasanBackground.addSubview(aksaraInTopCard3)
        aksaraInTopCard3.leadingAnchor.constraint(equalTo: aksaraInTopCard2.trailingAnchor, constant: 8).isActive = true
        aksaraInTopCard3.topAnchor.constraint(equalTo: nilaiLabel.bottomAnchor, constant: 84).isActive = true
        aksaraInTopCard3.heightAnchor.constraint(equalToConstant: 32).isActive = true
        aksaraInTopCard3.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        //LabelAksara
        ulasanBackground.addSubview(aksaraLabelInTopCard1)
        aksaraLabelInTopCard1.centerXAnchor.constraint(equalTo: aksaraInTopCard1.centerXAnchor).isActive = true
        aksaraLabelInTopCard1.topAnchor.constraint(equalTo: aksaraInTopCard1.bottomAnchor, constant: 10).isActive = true
        
        ulasanBackground.addSubview(aksaraLabelInTopCard2)
        aksaraLabelInTopCard2.centerXAnchor.constraint(equalTo: aksaraInTopCard2.centerXAnchor).isActive = true
        aksaraLabelInTopCard2.topAnchor.constraint(equalTo: aksaraInTopCard2.bottomAnchor, constant: 10).isActive = true
        
        ulasanBackground.addSubview(aksaraLabelInTopCard3)
        aksaraLabelInTopCard3.centerXAnchor.constraint(equalTo: aksaraInTopCard3.centerXAnchor).isActive = true
        aksaraLabelInTopCard3.topAnchor.constraint(equalTo: aksaraInTopCard3.bottomAnchor, constant: 10).isActive = true
        
        ulasanBackground.addSubview(hasilLabel)
        hasilLabel.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        hasilLabel.topAnchor.constraint(equalTo: aksaraLabelInTopCard1.bottomAnchor, constant: 87).isActive = true
        
        ulasanBackground.addSubview(timerLogo)
        timerLogo.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        timerLogo.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        ulasanBackground.addSubview(checkmark)
        checkmark.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        checkmark.topAnchor.constraint(equalTo: timerLogo.bottomAnchor, constant: 12).isActive = true

        ulasanBackground.addSubview(waktuQuizLabel)
        waktuQuizLabel.leadingAnchor.constraint(equalTo: timerLogo.trailingAnchor, constant: 8).isActive = true
        waktuQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        ulasanBackground.addSubview(waktuDoneQuizLabel)
        waktuDoneQuizLabel.leadingAnchor.constraint(equalTo: waktuQuizLabel.trailingAnchor, constant: 16).isActive = true
        waktuDoneQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        ulasanBackground.addSubview(benarDoneQuizLabel)
        benarDoneQuizLabel.leadingAnchor.constraint(equalTo: waktuQuizLabel.trailingAnchor, constant: 16).isActive = true
        benarDoneQuizLabel.topAnchor.constraint(equalTo: waktuDoneQuizLabel.bottomAnchor, constant: 13).isActive = true
        
        ulasanBackground.addSubview(selanjutnyaButton)
        selanjutnyaButton.trailingAnchor.constraint(equalTo: ulasanBackground.trailingAnchor, constant: -67).isActive = true
        selanjutnyaButton.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        selanjutnyaButton.topAnchor.constraint(equalTo: benarDoneQuizLabel.bottomAnchor, constant: 32).isActive = true
        selanjutnyaButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        selanjutnyaButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
        
        ulasanBackground.addSubview(ulasanButton)
        ulasanButton.trailingAnchor.constraint(equalTo: ulasanBackground.trailingAnchor, constant: -67).isActive = true
        ulasanButton.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        ulasanButton.topAnchor.constraint(equalTo: selanjutnyaButton.bottomAnchor, constant: 16).isActive = true
        ulasanButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        ulasanButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
        
        ulasanBackground.addSubview(layarUtamaButton)
        layarUtamaButton.trailingAnchor.constraint(equalTo: ulasanBackground.trailingAnchor, constant: -67).isActive = true
        layarUtamaButton.leadingAnchor.constraint(equalTo: ulasanBackground.leadingAnchor, constant: 67).isActive = true
        layarUtamaButton.topAnchor.constraint(equalTo: ulasanButton.bottomAnchor, constant: 16).isActive = true
        layarUtamaButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        layarUtamaButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
    }
    
    @objc func hideRewardModal() {
        backgroundView.removeFromSuperview()
    }
    
    @objc func handleMainLagi() {
        let quizScreen = QuizController()
        quizScreen.regionSelected = regionSelected
        quizScreen.quizes = quizes
        quizScreen.levels = levels
        quizScreen.level = level
        
        navigationController?.pushViewController(quizScreen, animated: true)
    }
    
    @objc func handleSelanjutnya() {
        if (Int(level!.id) < 15) {
            let levelId = Int(level!.id)
            self.quizes = levels![levelId].quizes!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Quiz]
            self.nextLevel = levels![levelId]
            
            let quizScreen = QuizController()
            quizScreen.regionSelected = regionSelected
            quizScreen.quizes = quizes
            quizScreen.levels = levels
            quizScreen.level = nextLevel
            
            level?.isLocked = false
            PersistenceService.saveContext()
            
            navigationController?.pushViewController(quizScreen, animated: true)
        }
        
    }
    
    @objc func handlePopBackFromReward() {
        
        //change become not initial anymore
        level?.isInitial = false
        PersistenceService.saveContext()
        
//        handleNextLevel()
        handlePopBack()
        
    }
    
    func handleNextLevel() {
        if (Int(level!.id) < 15) {
            let levelId = Int(level!.id)
            self.nextLevel = levels![levelId]
            
            nextLevel?.isLocked = false
            PersistenceService.saveContext()
        }
    }
    
    func setTrueStatus() {
        self.backButton.tintColor = Theme.current.accentTextGreen
        self.timerLabelButton.tintColor = Theme.current.accentTextGreen
        self.headerTimer.textColor = Theme.current.accentTextGreen
        self.quizTopNumberLabel.textColor = Theme.current.accentTextGreen
        
        let colorTop =  Theme.current.gradientTopGreen.cgColor
        let colorBottom = Theme.current.gradientBottomGreen.cgColor
        let gradientImage = UIImage.gradientImage(with: progressiveBar.frame, colors: [colorTop, colorBottom], locations: nil)
        progressiveBar.progressImage = gradientImage!
        progressiveBar.trackTintColor = Theme.current.accentLightGreen
    }
    
    func setFalseStatus() {
        self.backButton.tintColor = Theme.current.accentTextRed
        self.timerLabelButton.tintColor = Theme.current.accentTextRed
        self.headerTimer.textColor = Theme.current.accentTextRed
        self.quizTopNumberLabel.textColor = Theme.current.accentTextRed
        
        let colorTop =  Theme.current.gradientTopRed.cgColor
        let colorBottom = Theme.current.gradientBottomRed.cgColor
        let gradientImage = UIImage.gradientImage(with: progressiveBar.frame, colors: [colorTop, colorBottom], locations: nil)
        progressiveBar.progressImage = gradientImage!
        progressiveBar.trackTintColor = Theme.current.accentLightRed
        
    }
    
    func resetStatus() {
        self.backButton.tintColor = Theme.current.textColor1
        self.timerLabelButton.tintColor = Theme.current.textColor1
        self.headerTimer.textColor = Theme.current.textColor1
        self.quizTopNumberLabel.textColor = Theme.current.textColor1
        
        let colorTop =  Theme.current.gradientTopBlue.cgColor
        let colorBottom = Theme.current.gradientBottomBlue.cgColor
        let gradientImage = UIImage.gradientImage(with: progressiveBar.frame, colors: [colorTop, colorBottom], locations: nil)
        progressiveBar.progressImage = gradientImage!
        progressiveBar.trackTintColor = Theme.current.accentLightBlue
    }
    
    //    @objc func restartQuiz() {
    //        let quizScreen = QuizController()
    //        quizScreen.regionSelected = regionSelected
    //        quizScreen.quizes = quizes
    //        quizScreen.levels = levels
    //
    //        navigationController?.pushViewController(quizScreen, animated: true)
    //    }
    
    
}

extension QuizController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizes!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let type = quizes?[indexPath.row].type!
        
        switch type {
        case "A":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeACell, for: indexPath) as! QuizViewTypeA
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.delegate = self
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "B":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeBCell, for: indexPath) as! QuizViewTypeB
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            cell.delegate = self
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "C":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeCCell, for: indexPath) as! QuizViewTypeC
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            cell.delegate = self
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "Guide":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeGuideCellIdenttifier, for: indexPath) as! QuizCellTypeGuide
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            
            backBackgroundView.removeLayer(name: "gradientWhiteQuiz")
            backBackgroundView.setBackgroundColorGuideBlue()
            quizTopNumberLabel.textColor = .white
            batikBackgroundImageView.alpha = 0.16
            
            
            return cell
            
        case "D":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizHeadAndTailCellIdentifier, for: indexPath) as! QuizHeadAndTailCell
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "E2":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizTypeE2CellIdentifier, for: indexPath) as! QuizTypeE2Cell
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "E3":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizTypeE3CellIdentifier, for: indexPath) as! QuizTypeE3Cell
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "I1":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeICellIdenttifier, for: indexPath) as! QuizCellTypeI
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.aksaraCount = 1
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "I2":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeICellIdenttifier, for: indexPath) as! QuizCellTypeI
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.aksaraCount = 2
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "I3":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeICellIdenttifier, for: indexPath) as! QuizCellTypeI
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.aksaraCount = 3
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        case "H":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeHCellIdenttifier, for: indexPath) as! QuizCellTypeH
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            quizTopNumberLabel.textColor = Theme.current.textColor1
            batikBackgroundImageView.alpha = 1.0
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeECell, for: indexPath) as! QuizViewTypeE
            backBackgroundView.removeLayer(name: "blueGuide")
            backBackgroundView.setBackgroundColor()
            cell.lewatiButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes?[indexPath.item]
            cell.delegate = self
            backBackgroundView.backgroundColor = Theme.current.accentWhite
            batikBackgroundImageView.alpha = 1.0
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 124)
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
    
}
