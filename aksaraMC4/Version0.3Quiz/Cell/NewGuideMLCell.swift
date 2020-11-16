//
//  NewGuideML.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 13/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit
import CoreML
import AVFoundation

class NewGuideMLCell: UICollectionViewCell {
    var canvasViewImage: UIImage?
    var carakanQuestion: String? = "Wa"
    var player: AVAudioPlayer?
    
    let tulisLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 32)
        label.text = "Tulis : "
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Wa"
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 0
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .white, width: 20)
        canvasView.tag = 2
        canvasView.delegate = self
        canvasView.alpha = 1
        
        return canvasView
    }()
    
    
    let plusCanvas: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "plusCanvas")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    
    lazy var reloadButton : UIButton = {
        let button = UIButton()

        button.setTitle("Ulang", for: .normal)
        button.setTitleColor(Theme.current.accentWhite, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
    
        button.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.addTarget(self, action: #selector(reloadCanvas), for: .touchUpInside)

        
        return button
    }()

    
    lazy var checkButton : UIButton = {
        let button = UIButton()

        button.setTitle("Cek", for: .normal)
        button.setTitleColor(Theme.current.accentWhite, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
    
        button.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 22
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.addTarget(self, action: #selector(checkCanvas), for: .touchUpInside)
        button.alpha = 0.4

        
        return button
    }()
    
    let shadowImageAksara: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shadowImageWaGreen")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let correctLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswerBig")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        
        return image
    }()
    
    let correctStatement: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctStatement")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var continueButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCheckButtonBackgroundGoldColor(withOpacity: 1, withHeight: 48, withWidth: 240, withCorner: 24)
        button.setTitle("Mengerti", for: .normal)
        button.setTitleColor(Theme.current.accentPurple, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
        let tintedImage = UIImage(systemName: "arrow.right", withConfiguration: boldConfig)?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        if let imageView = button.imageView {
            button.bringSubviewToFront(imageView)
        }
        button.tag = 0
        button.imageView?.tintColor = Theme.current.purpleColor
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 200, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        button.alpha = 0.4
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        setBackgroundDragnDrop()
        setupView()
    }
    

    
    @objc func reloadCanvas() {
        canvasView.drawing = PKDrawing()
        shadowImageAksara.removeFromSuperview()
    }
    
    @objc func checkCanvas() {
        let status = predictAksara()
        
        if (status == true) {
            QuickStartReviewData.instance.quizesCorrectStatus[2] = true
            print("quick", QuickStartReviewData.instance.quizesCorrectStatus[2])
            correctAnswer()
            playSoundTrue()
        } else {
            QuickStartReviewData.instance.quizesCorrectStatus[2] = false
            wrongAnswer()
            playSoundFalse()
        }
        canvasView.drawingGestureRecognizer.isEnabled = false
    }
    
    func correctAnswer() {
        //shadow image
        addSubview(shadowImageAksara)
        shadowImageAksara.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 0).isActive = true
        shadowImageAksara.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor).isActive = true
        shadowImageAksara.heightAnchor.constraint(equalToConstant: 280).isActive = true
        shadowImageAksara.widthAnchor.constraint(equalToConstant: 287).isActive = true
        
        bringSubviewToFront(canvasView)
        
        UIView.animate(withDuration: 0.5) {
            self.shadowImageAksara.alpha = 1
        }
        
        //correct answer
        addSubview(correctLabel)
        self.correctLabel.frame = CGRect(x: frame.size.width/2 - 20, y: 360, width: 40, height: 40)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse], animations: {
            self.correctLabel.alpha = 1
            self.correctLabel.frame = CGRect(x: self.frame.size.width/2 - 50, y: 330, width: 100, height: 100)

        }) { (completed) in
            self.correctLabel.alpha = 0
        }
        
        //change button repeat and check
        addSubview(correctStatement)
        correctStatement.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 24).isActive = true
        correctStatement.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor).isActive = true
        correctStatement.heightAnchor.constraint(equalToConstant: 40).isActive = true
        correctStatement.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        
        UIView.animate(withDuration: 1) {
            self.reloadButton.alpha = 0
            self.checkButton.alpha = 0
            self.correctStatement.alpha = 1
            self.continueButton.alpha = 1
        }
        

        
    }
    
    func wrongAnswer() {
        //shadow image
        addSubview(shadowImageAksara)
        shadowImageAksara.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 0).isActive = true
        shadowImageAksara.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor).isActive = true
        shadowImageAksara.heightAnchor.constraint(equalToConstant: 280).isActive = true
        shadowImageAksara.widthAnchor.constraint(equalToConstant: 287).isActive = true
        
        bringSubviewToFront(canvasView)
        
        UIView.animate(withDuration: 0.5) {
            self.shadowImageAksara.alpha = 1
        }
        
        //correct answer
        addSubview(correctLabel)
        correctLabel.image = UIImage(named: "falseAnswer")
//        self.correctLabel.alpha = 1
        self.correctLabel.frame = CGRect(x: frame.size.width/2 - 20, y: 290, width: 40, height: 40)
        
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse], animations: {
            self.correctLabel.alpha = 1
            self.correctLabel.frame = CGRect(x: self.frame.size.width/2 - 50, y: 260, width: 100, height: 100)

        }) { (completed) in
            self.correctLabel.alpha = 0
        }
        
        //change button repeat and check
        
        addSubview(correctStatement)
        correctStatement.image = UIImage(named: "wrongStatement")
        correctStatement.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 24).isActive = true
        correctStatement.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor).isActive = true
        correctStatement.heightAnchor.constraint(equalToConstant: 40).isActive = true
        correctStatement.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        
        UIView.animate(withDuration: 1) {
            self.reloadButton.alpha = 0
            self.checkButton.alpha = 0
            self.correctStatement.alpha = 1
            self.continueButton.alpha = 1
        }
        

        
    }
    
    
    
    func predictAksara() -> Bool {
        canvasViewImage = canvasView.drawing.image(from: canvasView.bounds, scale: 1)
        
        guard let pixelBuffer = canvasViewImage?.pixelBuffer() else {
            fatalError("Unexpected runtime error.")
        }
        
        let aksaraModel: AksaraModel = try! AksaraModel(configuration: MLModelConfiguration.init())
        
        guard let checkNumberOutput = try? aksaraModel.prediction(image: pixelBuffer) else {
            fatalError("Unexpected runtime error.")
        }
        
        if carakanQuestion == checkNumberOutput.classLabel {
            let probs = checkNumberOutput.classLabelProbs
            let carakanProbs = probs[carakanQuestion!]
            return true
        } else {
            return false
        }
        
    }
    
    func setupView() {
        
        addSubview(tulisLabel)
        tulisLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -24).isActive = true
        tulisLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        
        addSubview(questionLabel)
        questionLabel.leadingAnchor.constraint(equalTo: tulisLabel.trailingAnchor, constant: 0).isActive = true
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        
        addSubview(canvasView)
        canvasView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        canvasView.topAnchor.constraint(equalTo: tulisLabel.bottomAnchor, constant: 19).isActive = true
        canvasView.heightAnchor.constraint(equalToConstant: 420).isActive = true
        canvasView.widthAnchor.constraint(equalToConstant: 420).isActive = true
        
        addSubview(plusCanvas)
        plusCanvas.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor).isActive = true
        plusCanvas.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor).isActive = true
        plusCanvas.heightAnchor.constraint(equalToConstant: 402).isActive = true
        plusCanvas.widthAnchor.constraint(equalToConstant: 402).isActive = true
        
        addSubview(reloadButton)
        reloadButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 38).isActive = true
        reloadButton.trailingAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: -6).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        reloadButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(checkButton)
        checkButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 38).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 6).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
    //SOUND
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension NewGuideMLCell: PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if canvasView.drawing.strokes.count > 0 {
            checkButton.alpha = 1
            
        }
    }
}
