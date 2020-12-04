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
    var carakanQuestion: String? {
        didSet {
            questionLabel.text = carakanQuestion
        }
    }
    var player: AVAudioPlayer?
    var indexQuiz: Int?
    
    var countdownTimer: Timer!
    var countdownProgressTimer: Timer!
    var totalTime: Int = 30
    var progressTime = 3000
    
    lazy var circularProgressBar: GradientCircularProgressBar = {
        let progressBar = GradientCircularProgressBar()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.backgroundColor = .init(white: 1, alpha: 0.2)
        progressBar.progress = 0
        progressBar.gradientColors = [Theme.current.gradientTopGold.cgColor, Theme.current.gradientTopGold.cgColor]
        
        return progressBar
    }()
    
    lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "30"
        label.textColor = .white
        label.alpha = 1
        
        return label
    }()
    
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
        label.textColor = Theme.current.accentWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var guideAksaraName: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Ja"
        label.textColor = .white
        label.frame = CGRect(x: frame.width/2 - 56, y: frame.height/2 - 300, width: 52, height: 38)
        label.alpha = 0
        
        return label
    }()
    
    lazy var smallCorrectButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "successImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.frame = CGRect(x: frame.width/2 + 16, y: frame.height/2 - 294, width: 32, height: 32)
        button.alpha = 0
        
        return button
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
        button.alpha = 0.4
        button.isEnabled = false
        
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
        button.isEnabled = false
        
        return button
    }()
    
    let shadowImageAksara: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "shadowImageGreenJa")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var correctLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswerBig")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.frame = CGRect(x: frame.width/2 - 40, y: frame.height/2 - 40, width: 80, height: 80)
        
        return image
    }()
    
    lazy var correctStatement: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswerStatement")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.frame = CGRect(x: frame.width/2 - 118, y: frame.height/2 + 210, width: 240, height: 60)
        
        return image
    }()
    
    lazy var continueButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setCheckButtonBackgroundGoldColor(withOpacity: 1, withHeight: 48, withWidth: 240, withCorner: 24)
        button.setTitle("Lanjut", for: .normal)
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
        button.alpha = 0
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        startTimer()
    }
    

    
    @objc func reloadCanvas() {
        canvasView.drawing = PKDrawing()
        shadowImageAksara.removeFromSuperview()
    }
    
    @objc func checkCanvas() {
//        let status = predictAksara()
        let status = true
        
        if (status == true) {
            QuickStartReviewData.instance.quizesCorrectStatus[2] = true
            correctAnswer()
            playSoundTrue()
        } else {
            QuickStartReviewData.instance.quizesCorrectStatus[2] = false
            wrongAnswer()
            playSoundFalse()
        }
        canvasView.drawingGestureRecognizer.isEnabled = false
        if (countdownTimer != nil) {
            countdownTimer.invalidate()
        }
        
        if (countdownProgressTimer != nil) {
            countdownProgressTimer.invalidate()
        }
        circularProgressBar.isHidden = true
        timerLabel.isHidden = true
    }
    
    func correctAnswer() {
        QuickStartReviewData.instance.quizesTimeStatus[indexQuiz!] = 30 - totalTime
        QuickStartReviewData.instance.quizesCorrectStatus[indexQuiz!] = true
        
        //shadow image
        addSubview(shadowImageAksara)
        shadowImageAksara.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 0).isActive = true
        shadowImageAksara.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor).isActive = true
        shadowImageAksara.heightAnchor.constraint(equalToConstant: 280).isActive = true
        shadowImageAksara.widthAnchor.constraint(equalToConstant: 287).isActive = true
        
        bringSubviewToFront(canvasView)
        
        addSubview(correctLabel)
        
        //correct answer
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.reloadButton.alpha = 0
                self.checkButton.alpha = 0
                self.shadowImageAksara.alpha = 1
                self.correctLabel.alpha = 1
                self.correctLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.7, animations: {
                self.correctLabel.alpha = 0
            })
        }) { (complete) in
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.correctStatement.frame = CGRect(x: self.frame.width/2 - 116, y: self.frame.height/2 + 230, width: 240, height: 60)
                self.correctStatement.alpha = 1
            }, completion: { complete in
                // anim done
            });
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.continueButton.alpha = 1
            }, completion: { complete in
                // anim done
                self.continueButton.isEnabled = true
            });
        }
        
    }
    
    func wrongAnswer() {
        QuickStartReviewData.instance.quizesTimeStatus[indexQuiz!] = 30 - totalTime
        //shadow image
        addSubview(shadowImageAksara)
        shadowImageAksara.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 0).isActive = true
        shadowImageAksara.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor).isActive = true
        shadowImageAksara.heightAnchor.constraint(equalToConstant: 280).isActive = true
        shadowImageAksara.widthAnchor.constraint(equalToConstant: 287).isActive = true
        
        bringSubviewToFront(canvasView)
        
        addSubview(correctLabel)
        
        //correct answer
        correctLabel.image = UIImage(named: "falseAnswer")
        correctStatement.image = UIImage(named: "falseAnswerStatement")
        self.shadowImageAksara.shakeView()
        self.canvasView.shakeView()
        //correct answer
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.6, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.reloadButton.alpha = 0
                self.checkButton.alpha = 0
                self.shadowImageAksara.alpha = 1
                self.correctLabel.alpha = 1
                self.correctLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.7, animations: {
                self.correctLabel.alpha = 0
            })
        }) { (complete) in
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.correctStatement.frame = CGRect(x: self.frame.width/2 - 116, y: self.frame.height/2 + 230, width: 240, height: 60)
                self.correctStatement.alpha = 1
            }, completion: { complete in
                // anim done
            });
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.continueButton.alpha = 1
            }, completion: { complete in
                // anim done
                self.continueButton.isEnabled = true
            });
        }
    }
    
    func endTimer() {
        if (countdownTimer != nil) {
            countdownTimer.invalidate()
        }
        
        if (countdownProgressTimer != nil) {
            countdownProgressTimer.invalidate()
        }
        
        handleTimesUp()
    }
    
    func handleTimesUp() {
        QuickStartReviewData.instance.quizesTimeStatus[indexQuiz!] = 30
        
        playSoundFalse()
        canvasView.drawingGestureRecognizer.isEnabled = false
        //shadow image
        addSubview(shadowImageAksara)
        shadowImageAksara.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 0).isActive = true
        shadowImageAksara.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor).isActive = true
        shadowImageAksara.heightAnchor.constraint(equalToConstant: 280).isActive = true
        shadowImageAksara.widthAnchor.constraint(equalToConstant: 287).isActive = true
        
        bringSubviewToFront(canvasView)
        
        addSubview(correctLabel)
        
        //correct answer
        correctLabel.image = UIImage(named: "falseAnswer")
        correctStatement.image = UIImage(named: "timeUpImage")
        
        //correct answer
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [.beginFromCurrentState], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8, animations: {
                self.reloadButton.alpha = 0
                self.checkButton.alpha = 0
                self.shadowImageAksara.alpha = 1
                self.correctLabel.alpha = 1
                self.correctLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.circularProgressBar.alpha = 0
                self.timerLabel.alpha = 0
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.7, animations: {
                self.correctLabel.alpha = 0
            })
        }) { (complete) in
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.correctStatement.frame = CGRect(x: self.frame.width/2 - 116, y: self.frame.height/2 + 230, width: 240, height: 60)
                self.correctStatement.alpha = 1
            }, completion: { complete in
                // anim done
            });
            
            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn], animations: {
                self.continueButton.alpha = 1
            }, completion: { complete in
                // anim done
                self.continueButton.isEnabled = true
            });
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
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        countdownProgressTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateProgressTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        if totalTime != 0 {
            totalTime -= 1
            timerLabel.text = String(totalTime)
        } else {
            endTimer()
        }
    }
    
    @objc func updateProgressTime() {
        if totalTime != 0 {
            circularProgressBar.progress += 0.01/30
            progressTime -= Int(0.01)
        } else {
            endTimer()
        }
    }
    
    func setupView() {
        
        addSubview(tulisLabel)
        tulisLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -24).isActive = true
        tulisLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        
        addSubview(questionLabel)
        questionLabel.leadingAnchor.constraint(equalTo: tulisLabel.trailingAnchor, constant: 0).isActive = true
        questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        
        addSubview(guideAksaraName)
        addSubview(smallCorrectButton)
        
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
        reloadButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 20).isActive = true
        reloadButton.trailingAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: -6).isActive = true
        reloadButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        reloadButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(checkButton)
        checkButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 20).isActive = true
        checkButton.leadingAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: 6).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        checkButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(correctStatement)
        
        addSubview(circularProgressBar)
        addSubview(timerLabel)
        
        circularProgressBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        circularProgressBar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        circularProgressBar.widthAnchor.constraint(equalToConstant: 48).isActive = true
        circularProgressBar.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        timerLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: circularProgressBar.centerYAnchor).isActive = true
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
            reloadButton.alpha = 1
            checkButton.isEnabled = true
            reloadButton.isEnabled = true
        } else {
            checkButton.alpha = 0.4
            reloadButton.alpha = 0.4
            checkButton.isEnabled = false
            reloadButton.isEnabled = false
        }
    }
}
