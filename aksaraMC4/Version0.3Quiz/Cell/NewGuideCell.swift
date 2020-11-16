//
//  NewGuideCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 13/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//


//

import UIKit
import PencilKit
import AVFoundation


class NewGuideCell: UICollectionViewCell {
    
    var isAlreadySlashed : Bool? = false
    var player: AVAudioPlayer?
    var timer = Timer()
    
    let aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 4 Wa")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    let aksaraName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Wa"
        label.textColor = Theme.current.accentWhite
        
        return label
    }()
    
    lazy var continueButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(systemName: "arrow.right")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Mengerti", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
    
        button.tintColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 28
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.backgroundColor = UIColor.rgb(red: 255, green: 183, blue: 81, alpha: 1)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -220)
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
        image.image = UIImage(named: "Jawa Ekor Wa")
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
        label.text = "Ekor"
        label.textColor = Theme.current.accentWhite
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let tailImageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "tailImage")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //head
    let headView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0
        return view
    }()
    
    let headImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Kepala Wa")
        image.contentMode = .scaleAspectFit
        image.alpha = 1
        return image
    }()
    
    let lineHead: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "lineHeadnTail")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        return image
    }()
    
    let headLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Kepala"
        label.textColor = Theme.current.accentWhite
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let headImageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "headImage")
        image.contentMode = .scaleAspectFit
        image.alpha = 0
        image.translatesAutoresizingMaskIntoConstraints = false
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
        setupTimerInactivity()
        setupSlashedAppear()
    }
    
    func setupTimerInactivity() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
        let resetTimer = UITapGestureRecognizer(target: self, action: #selector(resetTimers))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(resetTimer)
    }
    
    @objc func doStuff() {
       // perform any action you wish to
        print("User inactive for more than 5 seconds .")
        setupHand()
        timer.invalidate()
    }
    
    @objc func resetTimers() {
       timer.invalidate()
       timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(doStuff), userInfo: nil, repeats: true)
    }
    
    

    
    func setupSlashedAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 0.5) {
                self.slashingButton.alpha = 1
            }
        }
    }
    
    func setupHand() {
        if isAlreadySlashed == false {
            addSubview(hintHandImage)
            hintHandImage.alpha = 1
            self.hintHandImage.frame = CGRect(x: frame.size.width/2 - 70, y: 160, width: 200, height: 40)
            UIImageView.animate(withDuration: 1, delay: 0.5, options: [.repeat] , animations: {
                self.hintHandImage.frame = CGRect(x: self.frame.size.width/2 - 80, y: 280, width: 200, height: 40)
                self.hintHandImage.alpha = 0
                }) { (completed) in
                    
                }
        }
        

    }
    
    func slashedEvent() {
        isAlreadySlashed = true
        
        //TAIL
        addSubview(tailView)
        tailView.alpha = 0
        self.tailView.frame = CGRect(x: frame.size.width/2 + 100, y: 230, width: 140, height: 140)
        tailView.layer.cornerRadius = 70
        addSubview(tailLine)
        tailLine.alpha = 0.2
        self.tailLine.frame = CGRect(x: frame.size.width/2 + 100, y: 300, width: 80, height: 2)
        
        self.addSubview(self.tailImage)
        self.tailImage.alpha = 0
        self.tailImage.frame = CGRect(x: self.frame.size.width/2 + 270, y: 245, width: 100, height: 100)
        
        UIImageView.animate(withDuration: 1, delay: 0, options: [] , animations: {
            self.tailView.frame = CGRect(x: self.frame.size.width/2 + 250, y: 230, width: 140, height: 140)
            self.tailView.alpha = 0.2
            
            self.tailLine.alpha = 1
            self.tailLine.frame = CGRect(x: self.frame.size.width/2 + 140, y: 300, width: 80, height: 2)
        }) { (completed) in
            //head appear after finish
            self.tailLabelAppear()
            self.playSoundTrue()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                UIView.animate(withDuration: 1) {
                    self.tailImage.alpha = 1
                    self.tailImageLogo.alpha = 1
                    self.tailLabel.alpha = 1
                }
            }
        }
        
        
        //HEAD
        addSubview(headView)
        headView.alpha = 0
        self.headView.frame = CGRect(x: frame.size.width/2 - 240, y: 230, width: 140, height: 140)
        headView.layer.cornerRadius = 70
        
        addSubview(lineHead)
        lineHead.alpha = 0.2
        self.lineHead.frame = CGRect(x: frame.size.width/2 - 160, y: 300, width: 80, height: 2)
        
        self.addSubview(self.headImage)
        self.headImage.alpha = 0
        self.headImage.frame = CGRect(x: self.frame.size.width/2 - 370, y: 250, width: 100, height: 100)
        
        UIImageView.animate(withDuration: 1, delay: 0, options: [] , animations: {
            self.headView.frame = CGRect(x: self.frame.size.width/2 - 390, y: 230, width: 140, height: 140)
            self.headView.alpha = 0.2
            
            self.lineHead.alpha = 1
            self.lineHead.frame = CGRect(x: self.frame.size.width/2 - 220, y: 300, width: 80, height: 2)
            
        }) { (completed) in
            
            self.headLabelAppear()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                UIView.animate(withDuration: 1) {
                    self.headImage.alpha = 1
                    self.headImageLogo.alpha = 1
                    self.headLabel.alpha = 1
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
    
    func headLabelAppear() {
        addSubview(headLabel)
        headLabel.centerXAnchor.constraint(equalTo: headView.centerXAnchor).isActive = true
        headLabel.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 16).isActive = true
        
        addSubview(headImageLogo)
        headImageLogo.centerXAnchor.constraint(equalTo: headView.centerXAnchor).isActive = true
        headImageLogo.bottomAnchor.constraint(equalTo: headView.topAnchor, constant: -16).isActive = true
        headImageLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        headImageLogo.heightAnchor.constraint(equalToConstant: 51).isActive = true
        
    }
    
    func tailLabelAppear() {
        addSubview(tailLabel)
        tailLabel.centerXAnchor.constraint(equalTo: tailView.centerXAnchor).isActive = true
        tailLabel.topAnchor.constraint(equalTo: tailView.bottomAnchor, constant: 16).isActive = true
        
        addSubview(tailImageLogo)
        tailImageLogo.centerXAnchor.constraint(equalTo: tailView.centerXAnchor).isActive = true
        tailImageLogo.bottomAnchor.constraint(equalTo: tailView.topAnchor, constant: -16).isActive = true
        tailImageLogo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        tailImageLogo.heightAnchor.constraint(equalToConstant: 27).isActive = true
        
    }
    
    func setupView() {
        addSubview(aksaraImage)
        aksaraImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        aksaraImage.topAnchor.constraint(equalTo: topAnchor, constant: 220).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 192).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        addSubview(aksaraName)
        aksaraName.topAnchor.constraint(equalTo: aksaraImage.bottomAnchor, constant: 80).isActive = true
        aksaraName.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 240).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(slashingButton)
        slashingButton.centerXAnchor.constraint(equalTo: aksaraImage.centerXAnchor, constant: 0).isActive = true
        slashingButton.centerYAnchor.constraint(equalTo: aksaraImage.centerYAnchor, constant: 0).isActive = true
        slashingButton.widthAnchor.constraint(equalToConstant: 12).isActive = true
        slashingButton.heightAnchor.constraint(equalToConstant: 270).isActive = true
        
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


extension NewGuideCell : PKCanvasViewDelegate {
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        if canvasView.drawing.strokes.count > 0 {
            slashedEvent()
            playSoundSlash()
        }
    }
}
