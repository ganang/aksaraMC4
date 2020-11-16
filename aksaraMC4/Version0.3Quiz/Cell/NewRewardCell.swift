//
//  NewRewardCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 15/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import SwiftyGif
import AVFoundation

class NewRewardCell: UICollectionViewCell {
    
    var player: AVAudioPlayer?
    let containerInitialPosition = CGRect(x: (UIScreen.main.bounds.width/2) , y: (UIScreen.main.bounds.height/2), width: 0, height: 0)
    let containerAfterPosition = CGRect(x: (UIScreen.main.bounds.width/2) - 244 , y: (UIScreen.main.bounds.height/2) - 372, width: 490, height: 690)
   
    
    let rewardContainerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rewardContainer3")
        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let rewardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        
        let firstWord   = ""
        let secondWord = "Mulai Panduan\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 24), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: Theme.current.accentWhite]
        let thirdWord   = "Aksara Jawa"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
//        label.textColor = Theme.current.accentWhite
//        label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        label.attributedText = attributedText
        
        
        return label
    }()
    
    let gununganImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Gunungan3New")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let aksaraImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Soal 1 Wa")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Wa"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let hasilLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.text = "Hasil Kamu"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let timeLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Waktu"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let kuisCorrectLabelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Kuis Benar"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = ": 3 Menit 30 Detik"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let kuisCorrectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = ": 3 dari 3 Kuis"
        label.textColor = Theme.current.accentWhite
        label.alpha = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var continueButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(systemName: "arrow.right")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Selanjutnya", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
    
        button.tintColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
//        button.addTarget(self, action: #selector(backToLevel), for: .touchUpInside)
//        button.alpha = 0.4
        button.backgroundColor = UIColor.rgb(red: 255, green: 183, blue: 81, alpha: 1)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -420)
//        button.alpha = 0.4
        
        return button
    }()
    

    
    lazy var ulasanButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(systemName: "book.fill")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Ulasan", for: .normal)
        button.setTitleColor(Theme.current.accentWhite, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
    
        button.tintColor = Theme.current.accentWhite
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
//        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
//        button.alpha = 0.4
        button.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -380)
//        button.alpha = 0.4
        
        return button
    }()
    
    lazy var layarUtamaButton : UIButton = {
        let button = UIButton()
        
        let origImage = UIImage(systemName: "chevron.left")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.setTitle("Layar Utama", for: .normal)
        button.setTitleColor(Theme.current.accentWhite, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 20)
    
        button.tintColor = Theme.current.accentWhite
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
//        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
//        button.alpha = 0.4
        button.backgroundColor = UIColor.init(white: 1, alpha: 0.2)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -430)
//        button.alpha = 0.4
        
        return button
    }()
    
    
    var gifImage1 : UIImageView = {
        let gif = UIImage.gifImageWithName("Explode Animation Big 2")
        let imageView = UIImageView(image: gif)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
//
      playSoundIntro()
        getGif()
        setupInitial()
//        setupCircleLayers()
        setBackgroundReward()

    }
    
    func getGif() {
        do {
            let gif = try UIImage(gifName: "Explode Animation Big 2")
            let imageview2 = UIImageView(gifImage: gif, loopCount: 1000) // Will loop 3 times
            imageview2.translatesAutoresizingMaskIntoConstraints = false
//            gifImage1.image =
//            view.addSubview(imageview)
            addSubview(imageview2)
            imageview2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
            imageview2.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
            imageview2.heightAnchor.constraint(equalToConstant: 360).isActive = true
            imageview2.widthAnchor.constraint(equalToConstant: 360).isActive = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
                let imageview3 = UIImageView(gifImage: gif, loopCount: 1000) // Will loop 3 times
                imageview3.translatesAutoresizingMaskIntoConstraints = false

                addSubview(imageview3)
                imageview3.transform = imageview3.transform.rotated(by: .pi)
                imageview3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
                imageview3.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
                imageview3.heightAnchor.constraint(equalToConstant: 360).isActive = true
                imageview3.widthAnchor.constraint(equalToConstant: 360).isActive = true
            }
            

            

//            gifImage1.image =
//            view.addSubview(imageview)
            
            DispatchQueue.main.asyncAfter(deadline: .now() - 1) { [self] in
                let imageview4 = UIImageView(gifImage: gif, loopCount: 1000) // Will loop 3 times
                imageview4.translatesAutoresizingMaskIntoConstraints = false
                addSubview(imageview4)
                imageview4.transform = imageview4.transform.rotated(by: .pi / 2)
                imageview4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100).isActive = true
                imageview4.topAnchor.constraint(equalTo: topAnchor, constant: -100).isActive = true
                imageview4.heightAnchor.constraint(equalToConstant: 360).isActive = true
                imageview4.widthAnchor.constraint(equalToConstant: 360).isActive = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in
                
                let imageview5 = UIImageView(gifImage: gif, loopCount: 1000) // Will loop 3 times
                imageview5.translatesAutoresizingMaskIntoConstraints = false
                addSubview(imageview5)
                imageview5.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 100).isActive = true
                imageview5.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 100).isActive = true
                imageview5.heightAnchor.constraint(equalToConstant: 360).isActive = true
                imageview5.widthAnchor.constraint(equalToConstant: 360).isActive = true
            }

            
        } catch {
            print(error)
        }
    }
    
    func setupInitial() {
        addSubview(rewardContainerImage)
        rewardContainerImage.frame = containerInitialPosition
        UIView.animate(withDuration: 1) { [self] in
            rewardContainerImage.frame = containerAfterPosition
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in
            setupViewReal()
            
        }
    }
    

    
    func setupViewReal() {
        addSubview(rewardLabel)
        rewardLabel.leadingAnchor.constraint(equalTo: rewardContainerImage.leadingAnchor, constant: 58).isActive = true
        rewardLabel.topAnchor.constraint(equalTo: rewardContainerImage.topAnchor, constant: 61).isActive = true
        
        addSubview(gununganImage)
        gununganImage.trailingAnchor.constraint(equalTo: rewardContainerImage.trailingAnchor, constant: -60).isActive = true
        gununganImage.topAnchor.constraint(equalTo: rewardContainerImage.topAnchor, constant: 61).isActive = true
        gununganImage.heightAnchor.constraint(equalToConstant: 47).isActive = true
        gununganImage.widthAnchor.constraint(equalToConstant: 91).isActive = true
        
        addSubview(aksaraImage)
        aksaraImage.centerXAnchor.constraint(equalTo: rewardContainerImage.centerXAnchor).isActive = true
        aksaraImage.topAnchor.constraint(equalTo: rewardLabel.bottomAnchor, constant: 71).isActive = true
        aksaraImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
        aksaraImage.widthAnchor.constraint(equalToConstant: 77).isActive = true
        
        addSubview(aksaraLabel)
        aksaraLabel.centerXAnchor.constraint(equalTo: rewardContainerImage.centerXAnchor, constant: 0).isActive = true
        aksaraLabel.topAnchor.constraint(equalTo: aksaraImage.bottomAnchor, constant: 16).isActive = true
        
        addSubview(hasilLabel)
        hasilLabel.leadingAnchor.constraint(equalTo: rewardContainerImage.leadingAnchor, constant: 58).isActive = true
        hasilLabel.topAnchor.constraint(equalTo: aksaraLabel.bottomAnchor, constant: 62).isActive = true
        
        addSubview(timeLabelTitle)
        timeLabelTitle.leadingAnchor.constraint(equalTo: rewardContainerImage.leadingAnchor, constant: 85.2).isActive = true
        timeLabelTitle.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        addSubview(kuisCorrectLabelTitle)
        kuisCorrectLabelTitle.leadingAnchor.constraint(equalTo: rewardContainerImage.leadingAnchor, constant: 85.2).isActive = true
        kuisCorrectLabelTitle.topAnchor.constraint(equalTo: timeLabelTitle.bottomAnchor, constant: 13).isActive = true
        
        addSubview(timeLabel)
        timeLabel.leadingAnchor.constraint(equalTo: timeLabelTitle.trailingAnchor, constant: 49).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: timeLabelTitle.centerYAnchor, constant: 0).isActive = true
        
        addSubview(kuisCorrectLabel)
        kuisCorrectLabel.leadingAnchor.constraint(equalTo: kuisCorrectLabelTitle.trailingAnchor, constant: 16).isActive = true
        kuisCorrectLabel.centerYAnchor.constraint(equalTo: kuisCorrectLabelTitle.centerYAnchor, constant: 0).isActive = true
        
        addSubview(continueButton)
        continueButton.centerXAnchor.constraint(equalTo: rewardContainerImage.centerXAnchor).isActive = true
        continueButton.topAnchor.constraint(equalTo: kuisCorrectLabel.bottomAnchor, constant: 32).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
        
        addSubview(ulasanButton)
        ulasanButton.centerXAnchor.constraint(equalTo: rewardContainerImage.centerXAnchor).isActive = true
        ulasanButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 16).isActive = true
        ulasanButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        ulasanButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
        
        addSubview(layarUtamaButton)
        layarUtamaButton.centerXAnchor.constraint(equalTo: rewardContainerImage.centerXAnchor).isActive = true
        layarUtamaButton.topAnchor.constraint(equalTo: ulasanButton.bottomAnchor, constant: 16).isActive = true
        layarUtamaButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        layarUtamaButton.widthAnchor.constraint(equalToConstant: 374).isActive = true
        
//        addSubview(gifImage1)
//        gifImage1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -100).isActive = true
//        gifImage1.topAnchor.constraint(equalTo: topAnchor, constant: -100).isActive = true
//        gifImage1.heightAnchor.constraint(equalToConstant: 500).isActive = true
//        gifImage1.widthAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    
    //SOUND
    func playSoundIntro() {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
