//
//  TypeNewMix2Cell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 27/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class QuizCellTypeH: UICollectionViewCell {
    
    var player: AVAudioPlayer?
    var tempLatin: String? = nil
    var tempAksara: String? = nil
    var tempNoLatin: Int? = nil
    var tempNoAksara: Int? = nil
    var tempButtonLatin: ChoiceButton? = nil
    var tempButtonAksara: ChoiceButton? = nil
    var arrayOfButtonLatin : [ChoiceButton]?
    var arrayOfButtonAksara : [ChoiceButton]?
    var arrayOfCheckmarkLatin : [UIImageView]?
    var arrayOfCheckmarkAksara : [UIImageView]?
    var urutanLatin = ["Ha","Na","Ca","Ra"]
    var urutanAksara = ["Na","Ra","Ca","Ha"]
    var correctAnswer : Int? = 0
    
    var delegate : QuizControllerProtocol?
    
    let questionTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.text = "Pasangkan aksara dan latin nya"
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let check1LatinImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button1Latin : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Ha", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        button.setTitleColor(Theme.current.textColor1, for: .normal)
        
        let origImage = UIImage(named: "Jawa Jawaban Ha")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .init(white: 1, alpha: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)
        
        
        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonLatin = 0
        return button
    }()
    
    let check2LatinImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button2Latin : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Na", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        button.setTitleColor(Theme.current.textColor1, for: .normal)
        
        let origImage = UIImage(named: "Jawa Jawaban Ha")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .init(white: 1, alpha: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)
        
        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonLatin = 1
        
        return button
    }()
    
    let check3LatinImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button3Latin : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Ca", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        button.setTitleColor(Theme.current.textColor1, for: .normal)
        
        let origImage = UIImage(named: "Jawa Jawaban Ha")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .init(white: 1, alpha: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)
        
        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonLatin = 2
        
        return button
    }()
    
    
    let check4LatinImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let button4Latin : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Ra", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        button.setTitleColor(Theme.current.textColor1, for: .normal)
        
        let origImage = UIImage(named: "Jawa Jawaban Ha")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = .init(white: 1, alpha: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 50)
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)
        
        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonLatin = 3
        
        return button
    }()
    
    
    let check1AksaraImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let button1Aksara : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let origImage = UIImage(named: "Jawa Jawaban Ka")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = Theme.current.textColor1
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)

        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonAksara = 0
        
        return button
    }()
    
    let check2AksaraImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button2Aksara : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let origImage = UIImage(named: "Jawa Jawaban Ka")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = Theme.current.textColor1
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)

        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonAksara = 1
        
        return button
    }()
    
    
    let check3AksaraImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let button3Aksara : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let origImage = UIImage(named: "Jawa Jawaban Ka")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = Theme.current.textColor1
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)

        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonAksara = 2
        
        return button
    }()
    
    let check4AksaraImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "correctAnswer")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let button4Aksara : ChoiceButton = {
        let button = ChoiceButton()
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let origImage = UIImage(named: "Jawa Jawaban Ka")
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.tintColor = Theme.current.textColor1
        button.imageEdgeInsets = UIEdgeInsets(top: 34, left: 93, bottom: 34, right: 93)

        button.layer.cornerRadius = 16
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.tag = 0
        button.noButtonAksara = 3
        
        return button
    }()
    
    let continueButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Lanjut", for: .normal)
        btn.titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        btn.setTitleColor(Theme.current.accentWhite, for: .normal)
        
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        btn.imageView?.tintColor = Theme.current.accentWhite
        btn.backgroundColor = UIColor.rgb(red: 25, green: 163, blue: 113, alpha: 1)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 130, bottom: 0, right: 0)
        btn.isHidden = true
        
//        btn.setCardTrueBackgroundColor()
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        backgroundColor = .blue
        setupView()
        tagFunction()
        tappedFunction()
    }
    
    func handleTimer() {
        
    }
    
    func tagFunction() {
        button1Latin.nameAksara = urutanLatin[0]
        button2Latin.nameAksara = urutanLatin[1]
        button3Latin.nameAksara = urutanLatin[2]
        button4Latin.nameAksara = urutanLatin[3]
        
        button1Aksara.nameAksara = urutanAksara[0]
        button2Aksara.nameAksara = urutanAksara[1]
        button3Aksara.nameAksara = urutanAksara[2]
        button4Aksara.nameAksara = urutanAksara[3]
        
        self.arrayOfButtonLatin = [button1Latin, button2Latin, button3Latin, button4Latin]
        self.arrayOfButtonAksara = [button1Aksara, button2Aksara, button3Aksara, button4Aksara]
        self.arrayOfCheckmarkLatin = [check1LatinImage, check2LatinImage, check3LatinImage, check4LatinImage]
        self.arrayOfCheckmarkAksara = [check1AksaraImage, check2AksaraImage, check3AksaraImage, check4AksaraImage]
    }
    
    func tappedFunction() {
        button1Latin.addTarget(self, action: #selector(buttonLatinTapped), for: .touchUpInside)
        button2Latin.addTarget(self, action: #selector(buttonLatinTapped), for: .touchUpInside)
        button3Latin.addTarget(self, action: #selector(buttonLatinTapped), for: .touchUpInside)
        button4Latin.addTarget(self, action: #selector(buttonLatinTapped), for: .touchUpInside)
        
        button1Aksara.addTarget(self, action: #selector(buttonAksaraTapped), for: .touchUpInside)
        button2Aksara.addTarget(self, action: #selector(buttonAksaraTapped), for: .touchUpInside)
        button3Aksara.addTarget(self, action: #selector(buttonAksaraTapped), for: .touchUpInside)
        button4Aksara.addTarget(self, action: #selector(buttonAksaraTapped), for: .touchUpInside)
    }
    
    @objc func buttonLatinTapped(_ sender: ChoiceButton) {
        
        if button1Latin.isLocked == false {
            button1Latin.removeLayer(name: "tap")
            button1Latin.setTitleColor(Theme.current.textColor1, for: .normal)
        }
        if button2Latin.isLocked == false {
            button2Latin.removeLayer(name: "tap")
            button2Latin.setTitleColor(Theme.current.textColor1, for: .normal)
        }
        if button3Latin.isLocked == false {
            button3Latin.removeLayer(name: "tap")
            button3Latin.setTitleColor(Theme.current.textColor1, for: .normal)
        }
        if button4Latin.isLocked == false {
            button4Latin.removeLayer(name: "tap")
            button4Latin.setTitleColor(Theme.current.textColor1, for: .normal)
        }

        arrayOfButtonLatin![sender.noButtonLatin!].setChoiceTapBackgroundColor()
        arrayOfButtonLatin![sender.noButtonLatin!].setTitleColor(Theme.current.accentWhite, for: .normal)
        tempLatin = sender.nameAksara
        tempNoLatin = sender.noButtonLatin
        checkAnswerNew()

    }
    
    @objc func buttonAksaraTapped(_ sender: ChoiceButton) {

        
        if button1Aksara.isLocked == false {
            button1Aksara.removeLayer(name: "tap")
            button1Aksara.tintColor = Theme.current.textColor1
        }
        if button2Aksara.isLocked == false {
            button2Aksara.removeLayer(name: "tap")
            button2Aksara.tintColor = Theme.current.textColor1
        }
        if button3Aksara.isLocked == false {
            button3Aksara.removeLayer(name: "tap")
            button3Aksara.tintColor = Theme.current.textColor1
        }
        if button4Aksara.isLocked == false {
            button4Aksara.removeLayer(name: "tap")
            button4Aksara.tintColor = Theme.current.textColor1
        }

        arrayOfButtonAksara![sender.noButtonAksara!].setChoiceTapBackgroundColor()
        arrayOfButtonAksara![sender.noButtonAksara!].tintColor = Theme.current.accentWhite
        tempAksara = sender.nameAksara
        tempNoAksara = sender.noButtonAksara
        checkAnswerNew()


        
    }
    
    func checkAnswerNew() {
        if tempAksara != nil && tempLatin != nil {
            checkNow()
        }
        
    }

    func checkNow() {
        if tempAksara == tempLatin {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // your code here
                self.correctAnswer = self.correctAnswer! + 1
                
                //LATIN
                self.arrayOfButtonLatin![self.tempNoLatin!].removeLayer(name: "tap")
                self.arrayOfButtonLatin![self.tempNoLatin!].setTitle("\(self.tempAksara!) :", for: .normal)
                self.arrayOfButtonLatin![self.tempNoLatin!].titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
                self.arrayOfButtonLatin![self.tempNoLatin!].setTitleColor(Theme.current.accentWhite, for: .normal)
                self.arrayOfButtonLatin![self.tempNoLatin!].titleEdgeInsets = UIEdgeInsets(top: 40, left: 0, bottom: 40, right: 100)
                
                let origImage = UIImage(named: "Jawa Jawaban \(self.tempLatin!)")
                let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
                self.arrayOfButtonLatin![self.tempNoLatin!].setImage(tintedImage, for: .normal)
                self.arrayOfButtonLatin![self.tempNoLatin!].imageEdgeInsets = UIEdgeInsets(top: 38, left: 123, bottom: 38, right: 83)
                self.arrayOfButtonLatin![self.tempNoLatin!].tintColor = Theme.current.accentWhite
                
                self.arrayOfButtonLatin![self.tempNoLatin!].setChoiceTrueBackgroundColor()
                self.arrayOfButtonLatin![self.tempNoLatin!].removeTarget(self, action: #selector(self.buttonLatinTapped), for: .touchUpInside)
                self.arrayOfButtonLatin![self.tempNoLatin!].isLocked = true
                
                self.arrayOfCheckmarkLatin![self.tempNoLatin!].isHidden = false
                
                self.tempNoLatin = nil
                self.tempLatin = nil
                
                
                //AKSARA
                self.arrayOfButtonAksara![self.tempNoAksara!].removeLayer(name: "tap")
                self.arrayOfButtonAksara![self.tempNoAksara!].setChoiceTrueBackgroundColor()
                self.arrayOfButtonAksara![self.tempNoAksara!].tintColor = Theme.current.accentWhite
                self.arrayOfButtonAksara![self.tempNoAksara!].removeTarget(self, action: #selector(self.buttonAksaraTapped), for: .touchUpInside)
                self.arrayOfButtonAksara![self.tempNoAksara!].isLocked = true
                
                //change add hint (add title and image)
                let origImage2 = UIImage(named: "Jawa Jawaban \(self.tempAksara!)")
                let tintedImage2 = origImage2?.withRenderingMode(.alwaysTemplate)
                self.arrayOfButtonAksara![self.tempNoAksara!].setImage(tintedImage2, for: .normal)
                self.arrayOfButtonAksara![self.tempNoAksara!].tintColor = Theme.current.accentWhite
                self.arrayOfButtonAksara![self.tempNoAksara!].imageEdgeInsets = UIEdgeInsets(top: 38, left: 123, bottom: 38, right: 83)

                self.arrayOfButtonAksara![self.tempNoAksara!].setTitle("\(self.tempAksara!) :", for: .normal)
                self.arrayOfButtonAksara![self.tempNoAksara!].titleLabel?.font = UIFont.init(name: "NowAlt-Medium", size: 16)
                self.arrayOfButtonAksara![self.tempNoAksara!].setTitleColor(Theme.current.accentWhite, for: .normal)
                self.arrayOfButtonAksara![self.tempNoAksara!].titleEdgeInsets = UIEdgeInsets(top: 40, left: 0, bottom: 40, right: 100)
                
                self.arrayOfCheckmarkAksara![self.tempNoAksara!].isHidden = false
                
                self.tempNoAksara = nil
                self.tempAksara = nil
                self.playSoundTrue()
                
                if self.correctAnswer == 4 {
                    self.continueButton.isHidden = false
                }
                
            }

        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // your code here

                self.arrayOfButtonLatin![self.tempNoLatin!].removeLayer(name: "tap")
                self.arrayOfButtonLatin![self.tempNoLatin!].setTitleColor(Theme.current.textColor1, for: .normal)
                self.tempNoLatin = nil
                self.tempLatin = nil
                
                
                self.arrayOfButtonAksara![self.tempNoAksara!].removeLayer(name: "tap")
                self.arrayOfButtonAksara![self.tempNoAksara!].tintColor = Theme.current.textColor1
                self.tempNoAksara = nil
                self.tempAksara = nil
                
                self.playSoundFalse()
            }
        }
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
    
    
    func setupView() {
        addSubview(questionTitle)
        questionTitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        questionTitle.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        
        addSubview(button1Latin)
        button1Latin.trailingAnchor.constraint(equalTo: centerXAnchor,constant: -20.5).isActive = true
        button1Latin.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 32).isActive = true
        button1Latin.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button1Latin.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check1LatinImage)
        check1LatinImage.centerYAnchor.constraint(equalTo: button1Latin.centerYAnchor).isActive = true
        check1LatinImage.trailingAnchor.constraint(equalTo: button1Latin.leadingAnchor, constant: -12).isActive = true
        check1LatinImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check1LatinImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check1LatinImage.isHidden = true
        
        addSubview(button2Latin)
        button2Latin.trailingAnchor.constraint(equalTo: centerXAnchor,constant: -20.5).isActive = true
        button2Latin.topAnchor.constraint(equalTo: button1Latin.bottomAnchor, constant: 12).isActive = true
        button2Latin.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button2Latin.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check2LatinImage)
        check2LatinImage.centerYAnchor.constraint(equalTo: button2Latin.centerYAnchor).isActive = true
        check2LatinImage.trailingAnchor.constraint(equalTo: button2Latin.leadingAnchor, constant: -12).isActive = true
        check2LatinImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check2LatinImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check2LatinImage.isHidden = true
        
        addSubview(button3Latin)
        button3Latin.trailingAnchor.constraint(equalTo: centerXAnchor,constant: -20.5).isActive = true
        button3Latin.topAnchor.constraint(equalTo: button2Latin.bottomAnchor, constant: 12).isActive = true
        button3Latin.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button3Latin.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check3LatinImage)
        check3LatinImage.centerYAnchor.constraint(equalTo: button3Latin.centerYAnchor).isActive = true
        check3LatinImage.trailingAnchor.constraint(equalTo: button3Latin.leadingAnchor, constant: -12).isActive = true
        check3LatinImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check3LatinImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check3LatinImage.isHidden = true
        
        addSubview(button4Latin)
        button4Latin.trailingAnchor.constraint(equalTo: centerXAnchor,constant: -20.5).isActive = true
        button4Latin.topAnchor.constraint(equalTo: button3Latin.bottomAnchor, constant: 12).isActive = true
        button4Latin.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button4Latin.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check4LatinImage)
        check4LatinImage.centerYAnchor.constraint(equalTo: button4Latin.centerYAnchor).isActive = true
        check4LatinImage.trailingAnchor.constraint(equalTo: button4Latin.leadingAnchor, constant: -12).isActive = true
        check4LatinImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check4LatinImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check4LatinImage.isHidden = true
        
        addSubview(button1Aksara)
        button1Aksara.leadingAnchor.constraint(equalTo: centerXAnchor,constant: 20.5).isActive = true
        button1Aksara.topAnchor.constraint(equalTo: questionTitle.bottomAnchor, constant: 32).isActive = true
        button1Aksara.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button1Aksara.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check1AksaraImage)
        check1AksaraImage.centerYAnchor.constraint(equalTo: button1Aksara.centerYAnchor).isActive = true
        check1AksaraImage.leadingAnchor.constraint(equalTo: button1Aksara.trailingAnchor, constant: 12).isActive = true
        check1AksaraImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check1AksaraImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check1AksaraImage.isHidden = true
        
        addSubview(button2Aksara)
        button2Aksara.leadingAnchor.constraint(equalTo: centerXAnchor,constant: 20.5).isActive = true
        button2Aksara.topAnchor.constraint(equalTo: button1Aksara.bottomAnchor, constant: 12).isActive = true
        button2Aksara.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button2Aksara.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check2AksaraImage)
        check2AksaraImage.centerYAnchor.constraint(equalTo: button2Aksara.centerYAnchor).isActive = true
        check2AksaraImage.leadingAnchor.constraint(equalTo: button2Aksara.trailingAnchor, constant: 12).isActive = true
        check2AksaraImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check2AksaraImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check2AksaraImage.isHidden = true
        
        addSubview(button3Aksara)
        button3Aksara.leadingAnchor.constraint(equalTo: centerXAnchor,constant: 20.5).isActive = true
        button3Aksara.topAnchor.constraint(equalTo: button2Aksara.bottomAnchor, constant: 12).isActive = true
        button3Aksara.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button3Aksara.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check3AksaraImage)
        check3AksaraImage.centerYAnchor.constraint(equalTo: button3Aksara.centerYAnchor).isActive = true
        check3AksaraImage.leadingAnchor.constraint(equalTo: button3Aksara.trailingAnchor, constant: 12).isActive = true
        check3AksaraImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check3AksaraImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check3AksaraImage.isHidden = true
        
        addSubview(button4Aksara)
        button4Aksara.leadingAnchor.constraint(equalTo: centerXAnchor,constant: 20.5).isActive = true
        button4Aksara.topAnchor.constraint(equalTo: button3Aksara.bottomAnchor, constant: 12).isActive = true
        button4Aksara.widthAnchor.constraint(equalToConstant: 240).isActive = true
        button4Aksara.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(check4AksaraImage)
        check4AksaraImage.centerYAnchor.constraint(equalTo: button4Aksara.centerYAnchor).isActive = true
        check4AksaraImage.leadingAnchor.constraint(equalTo: button4Aksara.trailingAnchor, constant: 12).isActive = true
        check4AksaraImage.widthAnchor.constraint(equalToConstant: 24).isActive = true
        check4AksaraImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        check4AksaraImage.isHidden = true
        
        addSubview(continueButton)
        continueButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        continueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

