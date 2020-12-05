//
//  NewGuideCellJogja.swift
//  aksaraMC4
//
//  Created by Naratama on 03/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//


import UIKit
import PencilKit
import AVFoundation


class NewGuideCellJogja: UICollectionViewCell {
    
    var aksaraNameTopAnchor1 : NSLayoutConstraint?
    var aksaraNameTopAnchor2 : NSLayoutConstraint?
    
    var isAlreadySlashed : Bool? = false
    var player: AVAudioPlayer?
    var timer = Timer()
    
    let aksaraImageJo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Jo")
        image.setImageColor(color: .white)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let aksaraImageGa: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Ga")
        image.setImageColor(color: .white)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let aksaraImageJa: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Ja")
        image.setImageColor(color: .white)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let aksaraNameJo: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 48)
        label.text = "Jo"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    let aksaraNameGa: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 48)
        label.text = "Ga"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    let aksaraNameJa: UILabel = {
        let label = UILabel()
        label.font = UIFont.init(name: "NowAlt-Medium", size: 48)
        label.text = "Ja"
        label.textColor = Theme.current.accentWhite
        
        return label
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
    
    
    let slashingButton: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "slashingImageDownJogja")
        img.alpha = 0
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    
    lazy var slashingCanvas: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 0
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.drawingPolicy = .anyInput
        canvasView.tool = PKInkingTool(.pen, color: .clear, width: 20)
        canvasView.tag = 2
        canvasView.delegate = self
        canvasView.alpha = 1
        
        return canvasView
    }()
    
    
    var hintText : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "hint Jogja")
        img.alpha = 1
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let hintHandImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "hintHandJogja")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        setBackgroundGuide()
        setupView()
        firstAnimation()
        
        setupTimerInactivity()
        setupSlashedAppear()
    }
    
    func firstAnimation() {
        aksaraImageJo.alpha = 0.3
        aksaraImageGa.alpha = 0.3
        aksaraImageJa.alpha = 0.3
        aksaraNameJo.alpha = 0.3
        aksaraNameGa.alpha = 0.3
        aksaraNameJa.alpha = 0.3
        hintText.alpha = 0
        UIView.animate(withDuration: 1.0, delay: 0) { [self] in
            aksaraImageJo.frame = CGRect(x: frame.size.width/2 - 293, y: frame.size.height/2 - 102, width: 255, height: 145)
            aksaraImageGa.frame = CGRect(x: frame.size.width/2 + 2, y: frame.size.height/2 - 102, width: 110, height: 100)
            aksaraImageJa.frame = CGRect(x: frame.size.width/2 + 152, y: frame.size.height/2 - 102, width: 140, height: 100)
            aksaraNameJo.frame = CGRect(x: frame.size.width/2 - 196, y: frame.size.height/2 + 60, width: 100, height: 58)
            aksaraNameGa.frame = CGRect(x: frame.size.width/2 + 27, y: frame.size.height/2 + 60, width: 100, height: 58)
            aksaraNameJa.frame = CGRect(x: frame.size.width/2 + 193, y: frame.size.height/2 + 60, width: 100, height: 58)
            aksaraImageJo.alpha = 1
            aksaraImageGa.alpha = 1
            aksaraImageJa.alpha = 1
            aksaraNameJo.alpha = 1
            aksaraNameGa.alpha = 1
            aksaraNameJa.alpha = 1
        }
        
        UIView.animate(withDuration: 0.8, delay: 0.8) { [self] in
            hintText.frame = CGRect(x: frame.size.width/2 - 319, y: 588, width: 640, height: 71)
            
            hintText.alpha = 1
        }
        
        
        
    }
    
    func setupTimerInactivity() {
        timer = Timer.scheduledTimer(timeInterval: 2.6, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
        let resetTimer = UITapGestureRecognizer(target: self, action: #selector(resetTimers))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(resetTimer)
    }
    
    @objc func doStuff() {
        // perform any action you wish to
        print("User inactive for more than 5 seconds.")
        setupHand()
        timer.invalidate()
    }
    
    @objc func resetTimers() {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
    }
    
    
    
    
    func setupSlashedAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            UIView.animate(withDuration: 0.5) {
                self.slashingButton.alpha = 1
            }
        }
    }
    
    func setupHand() {
        if isAlreadySlashed == false {
            addSubview(hintHandImage)
            hintHandImage.alpha = 1
            self.hintHandImage.frame = CGRect(x: frame.size.width/2 + 90, y: frame.size.height/2 + 20 , width: 42, height: 32)
            UIImageView.animate(withDuration: 1, delay: 0, options: [.repeat] , animations: {
                self.hintHandImage.frame = CGRect(x: self.frame.size.width/2 + 90, y: self.frame.size.height/2 + 120, width: 42, height: 32)
                self.hintHandImage.alpha = 0
            }) { (completed) in
                
            }
        }
        
        
    }
    
    func slashedEvent() {
        isAlreadySlashed = true
        disspaearingHint()
        continueButtonAppear()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            UIImageView.animate(withDuration: 1, delay: 0, options: [.transitionCrossDissolve] , animations:  {
                
                self.aksaraNameGa.text = "G"
                self.aksaraNameGa.frame = CGRect(x: self.frame.size.width/2 + 48, y: self.frame.size.height/2 + 60, width: 100, height: 58)
                self.aksaraImageJa.image = UIImage(named: "PasanganJa")
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            UIImageView.animate(withDuration: 1, delay: 0, options: [.transitionCrossDissolve] , animations:  {
                self.aksaraNameJa.frame = CGRect(x: self.frame.size.width/2 + 93, y: self.frame.size.height/2 + 60, width: 100, height: 58)
                self.aksaraNameJa.alpha = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    UIImageView.animate(withDuration: 1, delay: 0, options: [.transitionCrossDissolve] , animations:  {
                        self.aksaraNameGa.text = "Gja"
                    })
                }
            })
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
            UIImageView.animate(withDuration: 1, delay: 0, options: [.transitionCrossDissolve] , animations:  {
                self.aksaraImageJo.frame = CGRect(x: self.frame.size.width/2 - 216, y: self.frame.size.height/2 - 202, width: 255, height: 145)
                self.aksaraImageGa.frame = CGRect(x: self.frame.size.width/2 + 82, y: self.frame.size.height/2 - 202, width: 110, height: 100)
                self.aksaraImageJa.frame = CGRect(x: self.frame.size.width/2 + 118, y: self.frame.size.height/2 - 72, width: 100, height: 90)
                
                self.aksaraNameGa.frame = CGRect(x: self.frame.size.width/2 + 100, y: self.frame.size.height/2 + 56, width: 100, height: 58)
                self.aksaraNameJo.frame = CGRect(x: self.frame.size.width/2 - 140, y: self.frame.size.height/2 + 56, width: 100, height: 58)
                
            })
        }
        
        //dismiss other view
        hintHandImage.removeFromSuperview()
        slashingButton.removeFromSuperview()
        slashingButton.alpha = 0
        slashingCanvas.removeFromSuperview()
        
    }
    
    func continueButtonAppear() {
        
        continueButton.alpha = 0
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -64).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        UIView.animate(withDuration: 1, delay: 1) {
            self.continueButton.alpha = 1
        }
    }
    
    
    func disspaearingHint() {
        UIImageView.animate(withDuration: 1, delay: 0.0, options: [] , animations: {
            self.hintText.alpha = 0
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
            self.hintText.frame = CGRect(x: self.frame.size.width/2 - 280, y: 466, width: 560, height: 71)
            UIView.animate(withDuration: 1) {
                self.hintText.alpha = 1
                self.hintText.image = UIImage(named: "HintJogja2")
                self.hintText.frame = CGRect(x: self.frame.size.width/2 - 280, y: 546, width: 560, height: 71)
                self.continueButton.alpha = 1
            }
        }
        
    }
    
    
    
    func setupView() {
        aksaraImageJo.frame = CGRect(x: frame.size.width/2 - 293, y: frame.size.height/2 - 182, width: 255, height: 145)
        addSubview(aksaraImageJo)
        
        aksaraImageGa.frame = CGRect(x: frame.size.width/2 + 2, y: frame.size.height/2 - 182, width: 110, height: 100)
        addSubview(aksaraImageGa)
        
        aksaraImageJa.frame = CGRect(x: frame.size.width/2 + 152, y: frame.size.height/2 - 182, width: 140, height: 100)
        addSubview(aksaraImageJa)
        
        
        addSubview(aksaraNameJo)
        aksaraNameJo.frame = CGRect(x: frame.size.width/2 - 196, y: frame.size.height/2 - 4, width: 100, height: 58)
        
        addSubview(aksaraNameGa)
        aksaraNameGa.frame = CGRect(x: frame.size.width/2 + 27, y: frame.size.height/2 - 4, width: 100, height: 58)
        
        addSubview(aksaraNameJa)
        aksaraNameJa.frame = CGRect(x: frame.size.width/2 + 193, y: frame.size.height/2 - 4, width: 100, height: 58)
        
        addSubview(hintText)
        hintText.frame = CGRect(x: frame.size.width/2 - 319, y: 588 - 40, width: 640, height: 71)
        
        addSubview(slashingButton)
        slashingButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 78).isActive = true
        slashingButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 92).isActive = true
        slashingButton.widthAnchor.constraint(equalToConstant: 12).isActive = true
        slashingButton.heightAnchor.constraint(equalToConstant: 114).isActive = true
        
        addSubview(slashingCanvas)
        slashingCanvas.centerXAnchor.constraint(equalTo: slashingButton.centerXAnchor, constant: 0).isActive = true
        slashingCanvas.centerYAnchor.constraint(equalTo: slashingButton.centerYAnchor, constant: 0).isActive = true
        slashingCanvas.widthAnchor.constraint(equalToConstant: 60).isActive = true
        slashingCanvas.heightAnchor.constraint(equalToConstant: 270).isActive = true
        
    }
    
    //SOUND
    func playSoundSlash() {
        guard let url = Bundle.main.url(forResource: "swiping", withExtension: "mp3") else { return }
        
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
        guard let url = Bundle.main.url(forResource: "Hasil_Bagus_B", withExtension: "mp3") else { return }
        
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
    
    func playSoundBell() {
        guard let url = Bundle.main.url(forResource: "BikeBellSFX", withExtension: "mp3") else { return }
        
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


extension NewGuideCellJogja : PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if canvasView.drawing.strokes.count > 0 {
            slashedEvent()
            playSoundSlash()
        }
    }
}
