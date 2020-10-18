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
            print("QUIZES SENT",quizes?[2].choices?.count)
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
    
    
    let quizPageFill = [
        QuizPage(navHeaderText: "Panduan", HeaderTimer: 0),
        QuizPage(navHeaderText: "Kuis 1", HeaderTimer: 10),
        QuizPage(navHeaderText: "Kuis 2", HeaderTimer: 10),
        QuizPage(navHeaderText: "Kuis 3", HeaderTimer: 10),
        QuizPage(navHeaderText: "Kuis 4", HeaderTimer: 30),
        QuizPage(navHeaderText: "Kuis 5", HeaderTimer: 30)
    ]
    
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
        label.font = UIFont.init(name: "Now-Medium", size: 32)
        label.textColor = Theme.current.textColor1
        label.text = "Panduan"
        return label
    }()
    
    var countdownTimer: Timer!
    var totalTime = 30
    
    var isTimerRunning = false
    
    let headerTimer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 24)
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
            
            switch self.indexCollection?.row {
            case 1:
                let cellA = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeA
                cellA.handleTimer()
            case 2:
                let cellB = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeB
                cellB.handleTimer()
            case 3:
                let cellC = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeC
                cellC.handleTimer()
            case 4:
                let cellD = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeD
                cellD.handleTimer()
            case 5:
                let cellE = collectionView.cellForItem(at: self.indexCollection!) as! QuizViewTypeE
                cellE.handleTimer()
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
//        let minutes: Int = (totalSeconds / 60) % 60
        //     let hours: Int = totalSeconds / 3600
        return String(format: "%02d", seconds)
    }
    
    let timerLabelButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .medium, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "timer", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.textColor1
        button.isHidden = true
        
        return button
    }()
    
    let previousButton : UIButton = {
        let button = UIButton(type: .custom)
        if let image = UIImage(named: "Back Button") {
            button.setImage(image, for: .normal)
        }
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showWarningModal), for: .touchUpInside)
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return button
    }()
    
     //ProgressiveBar
     let progressiveBar: UIProgressView = {
         let pv = UIProgressView()
         pv.progress = 0.1666666667
         pv.tintColor = UIColor.blue
         pv.trackTintColor = Theme.current.accentLightBlue
         pv.clipsToBounds = true
         pv.layer.cornerRadius = 8
         pv.layer.sublayers![1].cornerRadius = 8
         pv.subviews[1].clipsToBounds = true
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
    
    var valueProgressBar = 0.1666666667
    
    var indexCollection: IndexPath?
    
    @objc func handleProgressBar(_ sender: UIButton) {
        
        // handle progress
        valueProgressBar = valueProgressBar + 0.1666666667
        self.progressiveBar.progress = Float(valueProgressBar)
        
        // handle timer label button
        self.timerLabelButton.isHidden = false
        self.quizTopNumberLabel.text = quizPageFill[sender.tag + 1].navHeaderText
        self.totalTime = quizPageFill[sender.tag + 1].HeaderTimer
        
        // handle timer
        if (countdownTimer != nil) {
            endTimer()
        }
        
        startTimer()
        
        // handle scroll collection
        let indexPath = IndexPath(item: sender.tag + 1, section: 0)
        self.indexCollection = indexPath
//        collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        
        if self.collectionView.dataSource?.collectionView(self.collectionView, cellForItemAt: IndexPath(row: 0, section: 0)) != nil {
            let rect = self.collectionView.layoutAttributesForItem(at: indexPath)?.frame
            self.collectionView.scrollRectToVisible(rect!, animated: false)
        }
    }
    
    @objc func handlePopBack(){
        // handle progress
        for controller in self.navigationController!.viewControllers as Array {
            if controller.isKind(of: LevelController.self) {
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
            headerView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        //Nav Section
        headerView.addSubview(previousButton)
        NSLayoutConstraint.activate([
            previousButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 56),
            previousButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30)
        ])
        
        headerView.addSubview(quizTopNumberLabel)
        NSLayoutConstraint.activate([
            quizTopNumberLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 61),
        quizTopNumberLabel.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor, constant: 32)
        ])
        
        headerView.addSubview(headerTimer)
        NSLayoutConstraint.activate([
        headerTimer.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 66),
        headerTimer.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -110)
        ])
        
        headerView.addSubview(timerLabelButton)
        NSLayoutConstraint.activate([
        timerLabelButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 65),
        timerLabelButton.trailingAnchor.constraint(equalTo: headerTimer.leadingAnchor, constant: -8)
        ])
        
        
        headerView.addSubview(progressiveBar)
        progressiveBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        progressiveBar.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: 24),
        progressiveBar.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 110),
        progressiveBar.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -110),
        progressiveBar.heightAnchor.constraint(equalToConstant: 16)
        ])
        
        let colorTop =  UIColor(red: 36/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 54/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        
        let gradientImage = UIImage.gradientImage(with: progressiveBar.frame,
        colors: [colorTop, colorBottom],
        locations: nil)
        
        progressiveBar.progressImage = gradientImage!
        progressiveBar.setProgress(0.1666666667, animated: true)
        
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
            handleNextLevel()
        } else{
            gununganImageModal.image = UIImage(named: "Gulungan True All")
            selanjutnyaButton.addTarget(self, action: #selector(handleSelanjutnya), for: .touchUpInside)
            totalMedal = 3
            handleNextLevel()
        }
        
        
        let stingStageId : Int = Int((level?.stage!.id)!)
        let stingStageIdString = String(stingStageId)
        
        let stringRegion =  String(regionSelected!)
        
        let stingLevelId : Int = Int(level!.id)
        let stingLevelIdString = String(stingLevelId)
        
        nilaiLabel.text = "Nilai: \(totalQuizCorrect)/5"
        aksaraStepLabel.text = "Aksara \(stringRegion) Tahap \(stingStageIdString)-\(stingLevelIdString)"
        
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
        print("TOTAL MEDAL",totalMedal)
        print("TOTAL MEDAL ON COREDATA", level?.stage?.currentMedal)
        level?.isInitial = false
        PersistenceService.saveContext()
//        NotificationCenter.default.post(name: Notification.Name("updateData"), object: nil, userInfo: ["selectedPodcast": selectedPodcast as Any])
        
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
        
        handleNextLevel()
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
 
//    @objc func restartQuiz() {
//        let quizScreen = QuizController()
//        quizScreen.regionSelected = regionSelected
//        quizScreen.quizes = quizes
//        quizScreen.levels = levels
//
//        navigationController?.pushViewController(quizScreen, animated: true)
//    }
    
    
}

extension UIImage {
    static func gradientImage(with bounds: CGRect,
                            colors: [CGColor],
                            locations: [NSNumber]?) -> UIImage? {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 974, height: 16)
        gradientLayer.colors = colors
        // This makes it horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0,
                                        y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0,
                                        y: 0.5)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}

extension QuizController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizPageFill.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if(indexPath.item == 0) {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewCell, for: indexPath) as! QuizView
            cell.setBackgroundColor()
            cell.kuisButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
//            cell.reloadButton.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
            cell.regionSelected = regionSelected
            cell.quizData = quizTypeGuideModel
            
            cell.kuisButton.tag = indexPath.item
            return cell
        } else if(indexPath.item == 1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeACell, for: indexPath) as! QuizViewTypeA
            cell.setBackgroundColor()
            cell.regionSelected = regionSelected
            cell.quizData = quizTypeAModel
            
            cell.lewatiButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            
            cell.delegate = self
            
            return cell
        } else if(indexPath.item == 2){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeBCell, for: indexPath) as! QuizViewTypeB
            cell.setBackgroundColor()
            cell.lewatiButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            print("QUIZ2", quizes![2].choices?.count)
            cell.quizData = quizes![2]
            
            
            cell.delegate = self
            
            return cell
        } else if(indexPath.item == 3){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeCCell, for: indexPath) as! QuizViewTypeC
            cell.setBackgroundColor()
            cell.lewatiButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizTypeCModel
            
            cell.delegate = self
            
            return cell
        } else if(indexPath.item == 4){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeDCell, for: indexPath) as! QuizViewTypeD
            cell.setBackgroundColor()
            cell.lewatiButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(handleProgressBar), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizTypeDModel
            
            cell.delegate = self
            
            return cell
        } else{
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuizViewTypeECell, for: indexPath) as! QuizViewTypeE
            cell.setBackgroundColor()
            cell.lewatiButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            cell.arrowRightButton.addTarget(self, action: #selector(showModal), for: .touchUpInside)
            cell.lewatiButton.tag = indexPath.item
            cell.arrowRightButton.tag = indexPath.item
            cell.regionSelected = regionSelected
            cell.quizData = quizTypeEModel
            
            cell.delegate = self
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
}

class CustomView: UIView {
    var id : Int?
    var choice : String?
}
