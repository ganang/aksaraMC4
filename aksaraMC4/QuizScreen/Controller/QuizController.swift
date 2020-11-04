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
    
    //HeaderView
    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.accentWhite
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
    
    var countdownTimer: Timer!
    var totalTime = 30
    
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
    
    @objc func updateTime() {
        headerTimer.text = "\(timeFormatted(totalTime))"
        
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
        countdownTimer.invalidate()
        
    }
    
    func stopTimerChoosen() {
        endTimer()
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
        cv.setBackgroundColor()
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    var valueProgressBar = 1.00/20.00
    
    var indexCollection: IndexPath?
    
    @objc func handleProgressBar(_ sender: UIButton) {
        resetStatus()
        
        if sender.tag + 1 < 20 {
            // handle progress
            valueProgressBar = valueProgressBar + 1.00/20.00
            self.progressiveBar.progress = Float(valueProgressBar)
            
            // handle timer label button
            self.timerLabelButton.isHidden = false
            self.totalTime = Int((quizes?[sender.tag + 1].time)!)
            
            // handle title
            let stringRegion =  String(regionSelected!)
            let quizName = String((quizes?[sender.tag + 1].title)!)
            let quizesCount = String((quizes!.count - 4))
            
            if (quizName == "Panduan") {
                self.quizTopNumberLabel.text = "Aksara Baru!"
            } else {
                self.quizTopNumberLabel.text = "Aksara \(stringRegion) - \(quizName)/\(quizesCount)"
            }
            
            
            
            // handle timer
            if (countdownTimer != nil) {
                endTimer()
            }
            
            startTimer()
            
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
    
    @objc func handlePopBack(){
        // handle progress
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LevelV2Controller.self) {
                self.navigationController!.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCV()
        registerCV()
        setupDelegate()
        
        //print("REGION", regionSelected)
        
        
    }
    
    
    func setupCV() {
        view.addSubview(headerView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        backBackgroundBlurView.removeFromSuperview()
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
    lazy var backgroundBlurView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(displayP3Red: 0/255, green: 51/255, blue: 97/255, alpha: 0.5)
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
    
    let aksaraStepLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 16)
        label.text = "Aksara Jawa Tahap 1-1"
        label.textColor = Theme.current.textColor1
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let gununganImageModal: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Gulungan True All")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let nilaiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 24)
        label.text = "Nilai : 5/5"
        label.textColor = Theme.current.textColor1
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let kuis1LabelModal: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        
        let firstWord   = ""
        let secondWord = "Kuis 1\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 20), NSAttributedString.Key.foregroundColor: Theme.current.textColor2, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle]
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
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        
        let firstWord   = ""
        let secondWord = "Kuis 2\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 20), NSAttributedString.Key.foregroundColor: Theme.current.textColor2,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1,
                           NSAttributedString.Key.paragraphStyle: paragraphStyle]
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
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        
        let firstWord   = ""
        let secondWord = "Kuis 3\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 20), NSAttributedString.Key.foregroundColor: Theme.current.textColor2,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1,
                           NSAttributedString.Key.paragraphStyle: paragraphStyle]
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
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        
        let firstWord   = ""
        let secondWord = "Kuis 4\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 20), NSAttributedString.Key.foregroundColor: Theme.current.textColor2,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1,
                           NSAttributedString.Key.paragraphStyle: paragraphStyle]
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
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        
        let firstWord   = ""
        let secondWord = "Kuis 5\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Bold", size: 20), NSAttributedString.Key.foregroundColor: Theme.current.textColor2,
                          NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "Now-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.textColor1,
                           NSAttributedString.Key.paragraphStyle: paragraphStyle]
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
    
    let selanjutnyaButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "selanjutnyaButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return button
    }()
    
    // BUTTON KEMBALI, NAMANYA MAIN ULANG
    @objc let mainUlangButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "mainUlangButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(handlePopBackFromReward), for: .touchUpInside)
        return button
    }()
    
    let bagikanButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "bagikanButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(hideRewardModal), for: .touchUpInside)
        return button
    }()
    
    var totalQuizCorrect = 0
    var totalMedal = 0
    
    func handleQuizRecord() {
        let isCorrectQuiz1 = quizes?[1].isCorrect
        let isCorrectQuiz2 = quizes?[2].isCorrect
        let isCorrectQuiz3 = quizes?[3].isCorrect
        let isCorrectQuiz4 = quizes?[4].isCorrect
        let isCorrectQuiz5 = quizes?[5].isCorrect
        
        if isCorrectQuiz1! {
            correctOrWrongAnswerImage1.image = UIImage(named: "correctAnswer")
        } else {
            correctOrWrongAnswerImage1.image = UIImage(named: "falseAnswer")
        }
        
        if isCorrectQuiz2! {
            correctOrWrongAnswerImage2.image = UIImage(named: "correctAnswer")
        } else {
            correctOrWrongAnswerImage2.image = UIImage(named: "falseAnswer")
        }
        
        if isCorrectQuiz3! {
            correctOrWrongAnswerImage3.image = UIImage(named: "correctAnswer")
        } else {
            correctOrWrongAnswerImage3.image = UIImage(named: "falseAnswer")
        }
        
        if isCorrectQuiz4! {
            correctOrWrongAnswerImage4.image = UIImage(named: "correctAnswer")
        } else {
            correctOrWrongAnswerImage4.image = UIImage(named: "falseAnswer")
        }
        
        if isCorrectQuiz5! {
            correctOrWrongAnswerImage5.image = UIImage(named: "correctAnswer")
        } else {
            correctOrWrongAnswerImage5.image = UIImage(named: "falseAnswer")
        }
        
        
        
        for i in 0...quizes!.count - 1{
            if quizes![i].isCorrect {
                totalQuizCorrect = totalQuizCorrect + 1
            }
        }
        
        if totalQuizCorrect == 0 {
            gununganImageModal.image = UIImage(named: "Gulungan True 0")
            selanjutnyaButton.setBackgroundImage(UIImage(named: "mainLagiButton"), for: .normal)
            selanjutnyaButton.addTarget(self, action: #selector(handleMainLagi), for: .touchUpInside)
            totalMedal = 0
        } else if totalQuizCorrect == 1 || totalQuizCorrect == 2{
            gununganImageModal.image = UIImage(named: "Gulungan True 1")
            selanjutnyaButton.setBackgroundImage(UIImage(named: "mainLagiButton"), for: .normal)
            selanjutnyaButton.addTarget(self, action: #selector(handleMainLagi), for: .touchUpInside)
            totalMedal = 1
        } else if totalQuizCorrect == 3 || totalQuizCorrect == 4{
            gununganImageModal.image = UIImage(named: "Gulungan True 2")
            selanjutnyaButton.addTarget(self, action: #selector(handleSelanjutnya), for: .touchUpInside)
            totalMedal = 2
//            handleNextLevel()
        } else{
            gununganImageModal.image = UIImage(named: "Gulungan True All")
            selanjutnyaButton.addTarget(self, action: #selector(handleSelanjutnya), for: .touchUpInside)
            totalMedal = 3
//            handleNextLevel()
        }
        
        
        let stingStageId : Int = Int((level?.stage!.id)!)
        let stingStageIdString = String(stingStageId)
        
        let stringRegion =  String(regionSelected!)
        
        let stingLevelId : Int = Int(level!.id)
        let stingLevelIdString = String(stingLevelId)
        
        nilaiLabel.text = "Nilai: \(totalQuizCorrect)/5"
        aksaraStepLabel.text = "Aksara \(stringRegion) Tahap \(stingStageIdString)-\(stingLevelIdString)"
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
        
        view.addSubview(backgroundBlurView)
        backgroundBlurView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        backgroundBlurView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: backgroundBlurView.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: backgroundBlurView.centerYAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 720).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 472).isActive = true
        
        
        containerView.addSubview(aksaraStepLabel)
        aksaraStepLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        aksaraStepLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 56).isActive = true
        
        
        containerView.addSubview(gununganImageModal)
        gununganImageModal.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -18).isActive = true
        gununganImageModal.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        gununganImageModal.heightAnchor.constraint(equalToConstant: 128).isActive = true
        gununganImageModal.widthAnchor.constraint(equalToConstant: 208).isActive = true
        
        
        containerView.addSubview(nilaiLabel)
        nilaiLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        nilaiLabel.topAnchor.constraint(equalTo: aksaraStepLabel.bottomAnchor, constant: 5).isActive = true
        nilaiLabel.heightAnchor.constraint(equalToConstant: 29).isActive = true
        
        
        containerView.addSubview(kuis1LabelModal)
        kuis1LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis1LabelModal.topAnchor.constraint(equalTo: nilaiLabel.bottomAnchor, constant: 32).isActive = true
        
        
        containerView.addSubview(kuis2LabelModal)
        kuis2LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis2LabelModal.topAnchor.constraint(equalTo: kuis1LabelModal.bottomAnchor, constant: 24).isActive = true
        
        
        containerView.addSubview(kuis3LabelModal)
        kuis3LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis3LabelModal.topAnchor.constraint(equalTo: kuis2LabelModal.bottomAnchor, constant: 24).isActive = true
        
        
        containerView.addSubview(kuis4LabelModal)
        kuis4LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis4LabelModal.topAnchor.constraint(equalTo: kuis3LabelModal.bottomAnchor, constant: 24).isActive = true
        
        containerView.addSubview(kuis5LabelModal)
        kuis5LabelModal.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        kuis5LabelModal.topAnchor.constraint(equalTo: kuis4LabelModal.bottomAnchor, constant: 24).isActive = true
        
        
        containerView.addSubview(correctOrWrongAnswerImage1)
        correctOrWrongAnswerImage1.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 158).isActive = true
        correctOrWrongAnswerImage1.heightAnchor.constraint(equalToConstant: 24).isActive = true
        correctOrWrongAnswerImage1.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        containerView.addSubview(correctOrWrongAnswerImage2)
        correctOrWrongAnswerImage2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage2.topAnchor.constraint(equalTo: correctOrWrongAnswerImage1.bottomAnchor, constant: 46).isActive = true
        correctOrWrongAnswerImage2.heightAnchor.constraint(equalToConstant: 24).isActive = true
        correctOrWrongAnswerImage2.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        containerView.addSubview(correctOrWrongAnswerImage3)
        correctOrWrongAnswerImage3.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage3.topAnchor.constraint(equalTo: correctOrWrongAnswerImage2.bottomAnchor, constant: 46).isActive = true
        correctOrWrongAnswerImage3.heightAnchor.constraint(equalToConstant: 24).isActive = true
        correctOrWrongAnswerImage3.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        containerView.addSubview(correctOrWrongAnswerImage4)
        correctOrWrongAnswerImage4.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage4.topAnchor.constraint(equalTo: correctOrWrongAnswerImage3.bottomAnchor, constant: 46).isActive = true
        correctOrWrongAnswerImage4.heightAnchor.constraint(equalToConstant: 24).isActive = true
        correctOrWrongAnswerImage4.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        containerView.addSubview(correctOrWrongAnswerImage5)
        correctOrWrongAnswerImage5.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        correctOrWrongAnswerImage5.topAnchor.constraint(equalTo: correctOrWrongAnswerImage4.bottomAnchor, constant: 46).isActive = true
        correctOrWrongAnswerImage5.heightAnchor.constraint(equalToConstant: 24).isActive = true
        correctOrWrongAnswerImage5.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        containerView.addSubview(selanjutnyaButton)
        selanjutnyaButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        selanjutnyaButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        selanjutnyaButton.topAnchor.constraint(equalTo: kuis5LabelModal.bottomAnchor, constant: 40).isActive = true
        selanjutnyaButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        selanjutnyaButton.widthAnchor.constraint(equalToConstant: 376).isActive = true
        
        
        containerView.addSubview(mainUlangButton)
        mainUlangButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        mainUlangButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        mainUlangButton.topAnchor.constraint(equalTo: selanjutnyaButton.bottomAnchor, constant: 12).isActive = true
        mainUlangButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        mainUlangButton.widthAnchor.constraint(equalToConstant: 376).isActive = true
        
        
        containerView.addSubview(bagikanButton)
        bagikanButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -48).isActive = true
        bagikanButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 48).isActive = true
        bagikanButton.topAnchor.constraint(equalTo: mainUlangButton.bottomAnchor, constant: 12).isActive = true
        bagikanButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        bagikanButton.widthAnchor.constraint(equalToConstant: 376).isActive = true
    }
    
    @objc func hideRewardModal() {
        backgroundBlurView.removeFromSuperview()
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
            cell.setBackgroundColor()
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.delegate = self
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "B":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeBCell, for: indexPath) as! QuizViewTypeB
            cell.setBackgroundColor()
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            cell.delegate = self
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "C":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeCCell, for: indexPath) as! QuizViewTypeC
            cell.setBackgroundColor()
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            cell.delegate = self
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "Guide":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeGuideCellIdenttifier, for: indexPath) as! QuizCellTypeGuide
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            
            view.backgroundColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
            headerView.backgroundColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
            quizTopNumberLabel.textColor = .white
            
            return cell
            
        case "D":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizHeadAndTailCellIdentifier, for: indexPath) as! QuizHeadAndTailCell
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.setBackgroundColor()
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "E2":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizTypeE2CellIdentifier, for: indexPath) as! QuizTypeE2Cell
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.setBackgroundColor()
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "E3":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizTypeE3CellIdentifier, for: indexPath) as! QuizTypeE3Cell
            
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.setBackgroundColor()
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "I1":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeICellIdenttifier, for: indexPath) as! QuizCellTypeI
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.aksaraCount = 1
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "I2":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeICellIdenttifier, for: indexPath) as! QuizCellTypeI
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.aksaraCount = 2
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "I3":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeICellIdenttifier, for: indexPath) as! QuizCellTypeI
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.aksaraCount = 3
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        case "H":
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeHCellIdenttifier, for: indexPath) as! QuizCellTypeH
            cell.continueButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.continueButton.tag = indexPath.item
            cell.delegate = self
            cell.regionSelected = regionSelected
            cell.quizData = quizes![indexPath.item]
            headerView.backgroundColor = Theme.current.accentWhite
            quizTopNumberLabel.textColor = Theme.current.textColor1
            
            return cell
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeECell, for: indexPath) as! QuizViewTypeE
            cell.setBackgroundColor()
            cell.lewatiButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizes?[indexPath.item]
            cell.delegate = self
            headerView.backgroundColor = Theme.current.accentWhite
            
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
