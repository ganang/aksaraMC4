//
//  QuizCellTypeGuide.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 29/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit
import AVFoundation
import CoreML

class QuizCellTypeGuide: UICollectionViewCell {
    
    var player: AVAudioPlayer?
    var regionSelected: String? {
        didSet {
        }
    }
    var questionName: String?
    
    var quizData: Quiz? {
        didSet {
            let questions = quizData?.questions?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Question]
            let questionName: String = (questions?[0].name)!
            let region: String = regionSelected!
            let image1 = UIImage(named: "\(region) Soal 1 \(questionName)")
            let anatomiHead = UIImage(named: "\(region) Kepala \(questionName)")
            let anatomiTail = UIImage(named: "\(region) Ekor \(questionName)")
            
            DispatchQueue.main.async {
                self.guidanceLabel.text = "Aksara \(questionName)"
                self.aksaraName.text = "Aksara \(region) \(questionName)"
                self.aksaraImage.image = image1
                self.shadowImage.image = image1
                self.aksaraNameAnatomi.text = "Anatomi \(questionName)"
                self.anatomiHeadImage.image = anatomiHead
                self.anatomiTailImage.image = anatomiTail
                self.speakerButton.nameAksara = "\(region) Suara \(questionName)"
                self.questionName = questionName
            }
        }
    }
    
    lazy var containerCanvasView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    lazy var containerCanvasImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "frameWritingGuide")
        imageView.backgroundColor = .clear
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let shadowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "HaColor")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = Theme.current.accentWhite
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var infoButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "info.circle.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.accentWhite
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        return button
    }()
    
    let questionLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Latihan Menulis"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    let guidanceLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = ""
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 24
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        canvasView.tag = 0
        canvasView.delegate = self
        
        return canvasView
    }()
    
    let checkmarkImage : UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var checkButton : UIButton = {
        let button = UIButton()
        button.setTitle("Cek", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 16)
        button.tintColor = Theme.current.accentWhite
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.tag = 0
        button.addTarget(self, action: #selector(handleCheckButton), for: .touchUpInside)
        button.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        return button
    }()
    
    lazy var reloadButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(named: "reloadButton")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Ulang", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 16)
        button.tintColor = Theme.current.accentWhite
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.tag = 0
        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
        button.backgroundColor = UIColor(white: 1, alpha: 0.2)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: -120)
        
        return button
    }()
    
    //Question
    lazy var guideCardContainer : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "frameGuide")
        imageView.backgroundColor = .clear
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    lazy var aksaraName : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var aksaraRegion : UILabel = {
        let label = UILabel()
        label.text = "Carakan"
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var speakerButton: ChoiceButton = {
        let button = ChoiceButton()
        button.setImage(UIImage(systemName: "speaker.2.fill"), for: .normal)
        button.tintColor = Theme.current.accentWhite
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(playSoundAksara), for: .touchUpInside)
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //Anatomi
    lazy var anatomiCardContainer : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "frameGuide")
        imageView.backgroundColor = .clear
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    lazy var aksaraNameAnatomi : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var anatomiHeadImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "anatomiHaHead")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var plusImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "plus")
        image.tintColor = Theme.current.accentWhite
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var anatomiTailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "anatomiHaTail")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var headLabel : UILabel = {
        let label = UILabel()
        label.text = "Kepala"
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var tailLabel : UILabel = {
        let label = UILabel()
        label.text = "Ekor"
        label.font = UIFont.init(name: "NowAlt-Regular", size: 16)
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let continueButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "guideContinueButton"), for: .normal)
        
        return btn
    }()
    
    //Modal
    
    lazy var backgroundBlurView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.00, green: 0.00, blue: 0.07, alpha: 1.00).withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.addBlurEffect()
        let tapClose = UITapGestureRecognizer(target: self, action: #selector(hideModal))
        view.addGestureRecognizer(tapClose)
        
        return view
    }()
    
    
    lazy var containerModalView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(white: 1, alpha: 0.8)
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        
        return view
    }()
    
    lazy var infoButtonModal: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "info.circle.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.textColor1
        button.addTarget(self, action: #selector(showModal), for: .touchUpInside)
        return button
    }()
    
    let questionLabelModal : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 20)
        label.text = "Latihan Menulis"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    lazy var descriptionTextModal : UILabel = {
        let label = UILabel()
        label.text = "Kamu dapat menggunakan Apple Pencil atau ujung jari untuk menulis dan cek hasil tulisan aksaramu"
        label.numberOfLines = 3
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = Theme.current.textColor1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let instructionImageModal: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "instructionImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var understandButtonModal : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "guideInfoButton"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.clipsToBounds = true
        btn.addTarget(self, action: #selector(handleUnderstandButton), for: .touchUpInside)
        
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViewCanvas()
        setupViewGuideCard()
        setupViewAnatomiCard()
        setupView()
    }
    
    @objc func playSoundAksara(_ sender: ChoiceButton) {
        guard let url = Bundle.main.url(forResource: sender.nameAksara, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func handleUnderstandButton() {
        hideModal()
    }
    
    func playSoundFalse() {
        guard let url = Bundle.main.url(forResource: "Jawaban_Salah_D", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playSoundTrue() {
        guard let url = Bundle.main.url(forResource: "Jawaban_Benar_A", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @objc func showModal() {
        modalOpened()
    }
    
    @objc func hideModal() {
        //        print("tapped")
        backgroundBlurView.removeFromSuperview()
    }
    
    @objc func reloadPencilKit(_ sender: UIButton) {
        canvasView.drawing = PKDrawing()
    }
    
    func predictAksara1() {
        let canvasViewImage = canvasView.drawing.image(from: canvasView.bounds, scale: 1)
        
        guard let pixelBuffer = canvasViewImage.pixelBuffer() else {
            fatalError("Unexpected runtime error.")
        }
        
        let aksaraModel: AksaraModel = try! AksaraModel(configuration: MLModelConfiguration.init())
        
        guard let checkNumberOutput = try? aksaraModel.prediction(image: pixelBuffer) else {
            fatalError("Unexpected runtime error.")
        }
        
        if questionName == checkNumberOutput.classLabel {
            checkmarkImage.image = UIImage(named: "correctAnswer")
            playSoundTrue()
        } else {
            checkmarkImage.image = UIImage(named: "falseAnswer")
            playSoundFalse()
        }
        
    }
    
    @objc func handleCheckButton() {
        predictAksara1()
    }
    
    func modalOpened() {
        addSubview(backgroundBlurView)
        backgroundBlurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundBlurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundBlurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundBlurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        backgroundBlurView.addSubview(containerModalView)
        containerModalView.centerXAnchor.constraint(equalTo: backgroundBlurView.centerXAnchor).isActive = true
        containerModalView.centerYAnchor.constraint(equalTo: backgroundBlurView.centerYAnchor).isActive = true
        containerModalView.heightAnchor.constraint(equalToConstant: 560).isActive = true
        containerModalView.widthAnchor.constraint(equalToConstant: 440).isActive = true
        
        containerModalView.addSubview(infoButtonModal)
        infoButtonModal.leadingAnchor.constraint(equalTo: containerModalView.leadingAnchor, constant: 36).isActive = true
        infoButtonModal.topAnchor.constraint(equalTo: containerModalView.topAnchor, constant: 38).isActive = true
        infoButtonModal.heightAnchor.constraint(equalToConstant: 28 ).isActive = true
        infoButtonModal.widthAnchor.constraint(equalToConstant: 28 ).isActive = true
        
        containerModalView.addSubview(questionLabelModal)
        questionLabelModal.leadingAnchor.constraint(equalTo: infoButtonModal.trailingAnchor, constant: 12).isActive = true
        questionLabelModal.centerYAnchor.constraint(equalTo: infoButtonModal.centerYAnchor, constant: 0).isActive = true
        
        containerModalView.addSubview(descriptionTextModal)
        descriptionTextModal.leadingAnchor.constraint(equalTo: containerModalView.leadingAnchor, constant: 36).isActive = true
        descriptionTextModal.topAnchor.constraint(equalTo: containerModalView.topAnchor, constant: 80).isActive = true
        descriptionTextModal.heightAnchor.constraint(equalToConstant: 81 ).isActive = true
        descriptionTextModal.widthAnchor.constraint(equalToConstant: 331 ).isActive = true
        
        containerModalView.addSubview(instructionImageModal)
        instructionImageModal.leadingAnchor.constraint(equalTo: containerModalView.leadingAnchor, constant: 145).isActive = true
        instructionImageModal.topAnchor.constraint(equalTo: containerModalView.topAnchor, constant: 206).isActive = true
        instructionImageModal.heightAnchor.constraint(equalToConstant: 178 ).isActive = true
        instructionImageModal.widthAnchor.constraint(equalToConstant: 259 ).isActive = true
        
        containerModalView.addSubview(understandButtonModal)
        understandButtonModal.centerXAnchor.constraint(equalTo: containerModalView.centerXAnchor, constant: 0).isActive = true
        understandButtonModal.bottomAnchor.constraint(equalTo: containerModalView.bottomAnchor, constant: -44).isActive = true
        understandButtonModal.heightAnchor.constraint(equalToConstant: 56).isActive = true
        understandButtonModal.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func setupView() {
        addSubview(continueButton)
        continueButton.leadingAnchor.constraint(equalTo: anatomiCardContainer.leadingAnchor, constant: 8).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: -8).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    func setupViewGuideCard() {
        
        addSubview(guideCardContainer)
        guideCardContainer.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 12).isActive = true
        guideCardContainer.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        guideCardContainer.widthAnchor.constraint(equalToConstant: 472).isActive = true
        guideCardContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        addSubview(guidanceLabel)
        guidanceLabel.leadingAnchor.constraint(equalTo: guideCardContainer.leadingAnchor, constant: 16).isActive = true
        guidanceLabel.bottomAnchor.constraint(equalTo: guideCardContainer.topAnchor).isActive = true
        
        guideCardContainer.addSubview(speakerButton)
        speakerButton.trailingAnchor.constraint(equalTo: guideCardContainer.trailingAnchor, constant: -32).isActive = true
        speakerButton.topAnchor.constraint(equalTo: guideCardContainer.topAnchor, constant: 32).isActive = true
        speakerButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        speakerButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        guideCardContainer.bringSubviewToFront(speakerButton)
    
        guideCardContainer.addSubview(aksaraImage)
        aksaraImage.centerXAnchor.constraint(equalTo: guideCardContainer.centerXAnchor, constant: 0).isActive = true
        aksaraImage.centerYAnchor.constraint(equalTo: guideCardContainer.centerYAnchor, constant: 0).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupViewAnatomiCard() {
        addSubview(anatomiCardContainer)
        anatomiCardContainer.trailingAnchor.constraint(equalTo: centerXAnchor, constant: 12).isActive = true
        anatomiCardContainer.topAnchor.constraint(equalTo: guideCardContainer.bottomAnchor, constant: -12).isActive = true
        anatomiCardContainer.widthAnchor.constraint(equalToConstant: 472).isActive = true
        anatomiCardContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        anatomiCardContainer.addSubview(aksaraNameAnatomi)
        aksaraNameAnatomi.leadingAnchor.constraint(equalTo: anatomiCardContainer.leadingAnchor, constant: 40).isActive = true
        aksaraNameAnatomi.topAnchor.constraint(equalTo: anatomiCardContainer.topAnchor, constant: 40).isActive = true
        
        anatomiCardContainer.addSubview(anatomiHeadImage)
        anatomiHeadImage.leadingAnchor.constraint(equalTo: anatomiCardContainer.leadingAnchor, constant: 162).isActive = true
        anatomiHeadImage.centerYAnchor.constraint(equalTo: anatomiCardContainer.centerYAnchor).isActive = true
        anatomiHeadImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        anatomiHeadImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        anatomiCardContainer.addSubview(plusImage)
        plusImage.centerXAnchor.constraint(equalTo: anatomiCardContainer.centerXAnchor, constant: 0).isActive = true
        plusImage.centerYAnchor.constraint(equalTo: anatomiCardContainer.centerYAnchor).isActive = true
        plusImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        plusImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        anatomiCardContainer.addSubview(anatomiTailImage)
        anatomiTailImage.trailingAnchor.constraint(equalTo: anatomiCardContainer.trailingAnchor, constant: -163).isActive = true
        anatomiTailImage.centerYAnchor.constraint(equalTo: anatomiCardContainer.centerYAnchor).isActive = true
        anatomiTailImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        anatomiTailImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        anatomiCardContainer.addSubview(headLabel)
        headLabel.topAnchor.constraint(equalTo: anatomiHeadImage.bottomAnchor, constant: 12).isActive = true
        headLabel.centerXAnchor.constraint(equalTo: anatomiHeadImage.centerXAnchor).isActive = true
        
        anatomiCardContainer.addSubview(tailLabel)
        tailLabel.topAnchor.constraint(equalTo: anatomiTailImage.bottomAnchor, constant: 12).isActive = true
        tailLabel.centerXAnchor.constraint(equalTo: anatomiTailImage.centerXAnchor).isActive = true
        
    }
    
    func setupViewCanvas() {
        addSubview(containerCanvasView)
        containerCanvasView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 14).isActive = true
        containerCanvasView.topAnchor.constraint(equalTo: topAnchor, constant: 56).isActive = true
        containerCanvasView.widthAnchor.constraint(equalToConstant: 420).isActive = true
        containerCanvasView.heightAnchor.constraint(equalToConstant: 420).isActive = true
        
        containerCanvasView.addSubview(containerCanvasImageView)
        containerCanvasImageView.topAnchor.constraint(equalTo: containerCanvasView.topAnchor).isActive = true
        containerCanvasImageView.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor).isActive = true
        containerCanvasImageView.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor).isActive = true
        containerCanvasImageView.bottomAnchor.constraint(equalTo: containerCanvasView.bottomAnchor).isActive = true
        
        addSubview(infoButton)
        infoButton.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: -16).isActive = true
        infoButton.bottomAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: -4).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 28 ).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 28 ).isActive = true
        
        addSubview(questionLabel)
        questionLabel.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor, constant: 12).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: 0).isActive = true
        
        addSubview(canvasView)
        canvasView.topAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: 16).isActive = true
        canvasView.bottomAnchor.constraint(equalTo: containerCanvasView.bottomAnchor, constant: -16).isActive = true
        canvasView.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor, constant: 16).isActive = true
        canvasView.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: -16).isActive = true
        
        addSubview(checkmarkImage)
        checkmarkImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
        checkmarkImage.widthAnchor.constraint(equalToConstant: 32).isActive = true
        checkmarkImage.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: -32).isActive = true
        checkmarkImage.topAnchor.constraint(equalTo: containerCanvasView.topAnchor, constant: 32).isActive = true
        
        addSubview(checkButton)
        checkButton.leadingAnchor.constraint(equalTo: containerCanvasView.centerXAnchor, constant: 12).isActive = true
        checkButton.trailingAnchor.constraint(equalTo: containerCanvasView.trailingAnchor, constant: -8).isActive = true
        checkButton.topAnchor.constraint(equalTo: containerCanvasView.bottomAnchor, constant: 8).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(reloadButton)
        reloadButton.leadingAnchor.constraint(equalTo: containerCanvasView.leadingAnchor, constant: 12).isActive = true
        reloadButton.trailingAnchor.constraint(equalTo: containerCanvasView.centerXAnchor, constant: -8).isActive = true
        reloadButton.topAnchor.constraint(equalTo: containerCanvasView.bottomAnchor, constant: 8).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension QuizCellTypeGuide : PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
    }
}
