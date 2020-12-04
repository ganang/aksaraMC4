//
//  NewGuideCellGa.swift
//  aksaraMC4
//
//  Created by Naratama on 01/12/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//


import UIKit
import PencilKit
import AVFoundation


class NewGuideCellGa: UICollectionViewCell {
    
    
    var aksaraImageTopAnchor1 : NSLayoutConstraint?
    var aksaraImageTopAnchor2 : NSLayoutConstraint?
    
    var aksaraNameTopAnchor1 : NSLayoutConstraint?
    var aksaraNameTopAnchor2 : NSLayoutConstraint?
    
    var isAlreadySlashed : Bool? = false
    var player: AVAudioPlayer?
    var timer = Timer()
    
    let aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Ga")
        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    let aksaraName: UILabel = {
        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Ga"
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
        img.image = UIImage(named: "slashingImageDown")
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
        img.image = UIImage(named: "HintGa")
        img.alpha = 1
        img.contentMode = .scaleAspectFit
//        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let hintHandImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "hintHand")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        return image
    }()
    
    //tail
    let tailView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    let tailImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Ga")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailLine: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lineHeadnTail")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let tailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Badan utuh"
        label.textColor = Theme.current.accentWhite
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tailImageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "fullBodyGold")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    

    override init(frame: CGRect) {
        super.init(frame: frame)
//        alpha = 0
//        UIView.animate(withDuration: 5) {
//            self.alpha = 1
//        }

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        setBackgroundGuide()
        setupDynamicLayout()
        setupView()
        firstAnimation()
       
//        disappearingHint()
        setupTimerInactivity()
        setupSlashedAppear()
    }
    
    func setupDynamicLayout() {
        self.aksaraImageTopAnchor1 = aksaraImage.topAnchor.constraint(equalTo: topAnchor, constant: 200)
        self.aksaraImageTopAnchor2 = aksaraImage.topAnchor.constraint(equalTo: topAnchor, constant: 300)
        
//        self.aksaraNameTopAnchor1 =  aksaraName.topAnchor.constraint(equalTo: aksaraImage.bottomAnchor, constant: 48)
//        self.aksaraNameTopAnchor2 = aksaraImage.topAnchor.constraint(equalTo: topAnchor, constant: 300)
        
    }
    
    func firstAnimation() {
        aksaraImage.alpha = 0.3
        aksaraName.alpha = 0.3
        hintText.alpha = 0
//        self.aksaraImageTopAnchor1?.constant = 0
        UIView.animate(withDuration: 1, delay: 0) { [self] in
            aksaraImage.frame = CGRect(x: self.frame.size.width/2 - 88, y: 300, width: 176, height: 160)
            aksaraName.frame = CGRect(x: frame.size.width/2 - 17, y: 480, width: 100, height: 100)
            aksaraImage.alpha = 1
            aksaraName.alpha = 1
        }
        
        UIView.animate(withDuration: 1, delay: 2) { [self] in
            hintText.frame = CGRect(x: frame.size.width/2 - 319, y: 588, width: 640, height: 71)

            hintText.alpha = 1
        }
        


    }
    
    func setupTimerInactivity() {
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            UIView.animate(withDuration: 0.5) {
                self.slashingButton.alpha = 1
            }
        }
    }
    
    func setupHand() {
        if isAlreadySlashed == false {
            addSubview(hintHandImage)
            hintHandImage.alpha = 1
            self.hintHandImage.frame = CGRect(x: frame.size.width/2 - 70, y: 264, width: 200, height: 40)
            UIImageView.animate(withDuration: 1, delay: 0.5, options: [.repeat] , animations: {
                self.hintHandImage.frame = CGRect(x: self.frame.size.width/2 - 80, y: 364, width: 200, height: 40)
                self.hintHandImage.alpha = 0
                }) { (completed) in
                    
                }
        }
        

    }
    
    func slashedEvent() {
        isAlreadySlashed = true
        disspaearingHint()
        continueButtonAppear()
        
        
        
        //TAIL
        addSubview(tailView)
        tailView.alpha = 0
        self.tailView.frame = CGRect(x: frame.size.width/2 + 36, y: 318, width: 140, height: 140)
        tailView.layer.cornerRadius = 70
        addSubview(tailLine)
        tailLine.alpha = 0.2
        self.tailLine.frame = CGRect(x: frame.size.width/2 - 22, y: 388, width: 80, height: 2)
        
        self.addSubview(self.tailImage)
        self.tailImage.alpha = 0
        self.tailImage.frame = CGRect(x: self.frame.size.width/2 + 145, y: 360, width: 62, height: 56)
        
        UIImageView.animate(withDuration: 1, delay: 0, options: [] , animations: {
            self.aksaraName.frame = CGRect(x: self.frame.size.width/2 - 182, y: 480, width: 100, height: 100)
            self.aksaraImage.frame = CGRect(x: self.frame.size.width/2 - 246, y: 300, width: 176, height: 160)
            
            self.tailView.frame = CGRect(x: self.frame.size.width/2 + 106, y: 318, width: 140, height: 140)
            self.tailView.alpha = 0.2
            
            self.tailLine.alpha = 1
        }) { (completed) in
            //head appear after finish
            self.tailLabelAppear()
            self.playSoundTrue()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                UIView.animate(withDuration: 1) {
                    self.tailImage.alpha = 1
                    self.tailImageLogo.alpha = 1
                    self.tailLabel.alpha = 1
                    self.continueButton.alpha = 1
                }
            }
        }
        
        
        //dismiss other view
        hintHandImage.removeFromSuperview()
        slashingButton.removeFromSuperview()
        slashingButton.alpha = 0
        slashingCanvas.removeFromSuperview()
        
    }
    
    func tailLabelAppear() {
        addSubview(tailLabel)
        tailLabel.centerXAnchor.constraint(equalTo: tailView.centerXAnchor).isActive = true
        tailLabel.topAnchor.constraint(equalTo: tailView.bottomAnchor, constant: 16).isActive = true
        
        addSubview(tailImageLogo)
        tailImageLogo.centerXAnchor.constraint(equalTo: tailView.centerXAnchor).isActive = true
        tailImageLogo.bottomAnchor.constraint(equalTo: tailView.topAnchor, constant: -24).isActive = true
        tailImageLogo.widthAnchor.constraint(equalToConstant: 72).isActive = true
        tailImageLogo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
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

        
        UIImageView.animate(withDuration: 1, delay: 0.5, options: [] , animations: {
            self.hintText.alpha = 0
            }) { (completed) in
            UIView.animate(withDuration: 1) {
                self.hintText.alpha = 1
                self.hintText.image = UIImage(named: "hintGaHnT")
            }
            
            }
        
    }
    
    func setupView() {
        
        aksaraImage.frame = CGRect(x: frame.size.width/2 - 88, y: 300 - 136, width: 176, height: 160)
        addSubview(aksaraImage)
        
        addSubview(aksaraName)
        aksaraName.frame = CGRect(x: frame.size.width/2 - 17, y: 480 - 100, width: 100, height: 100)
        
        addSubview(hintText)
        hintText.frame = CGRect(x: frame.size.width/2 - 319, y: 588 - 40, width: 640, height: 71)
        
        addSubview(slashingButton)
        slashingButton.centerXAnchor.constraint(equalTo: aksaraImage.centerXAnchor, constant: 0).isActive = true
        slashingButton.centerYAnchor.constraint(equalTo: aksaraImage.centerYAnchor, constant: 0).isActive = true
        slashingButton.widthAnchor.constraint(equalToConstant: 12).isActive = true
        slashingButton.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        addSubview(slashingCanvas)
        slashingCanvas.centerXAnchor.constraint(equalTo: slashingButton.centerXAnchor, constant: 0).isActive = true
        slashingCanvas.centerYAnchor.constraint(equalTo: slashingButton.centerYAnchor, constant: 0).isActive = true
        slashingCanvas.widthAnchor.constraint(equalToConstant: 60).isActive = true
        slashingCanvas.heightAnchor.constraint(equalToConstant: 270).isActive = true
        
    }
    
    //SOUND
    func playSoundSlash() {
        guard let url = Bundle.main.url(forResource: "SlashSFX", withExtension: "mp3") else { return }
        
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


extension NewGuideCellGa : PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if canvasView.drawing.strokes.count > 0 {
            slashedEvent()
            playSoundSlash()
        }
    }
}
