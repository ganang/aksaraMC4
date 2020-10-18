//
//  QuizView.swift
//  aksaraMC4
//
//  Created by Naratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewTypeC: UICollectionViewCell {

    var delegate : QuizControllerProtocol?
    
    var player: AVAudioPlayer?
    var alphabet : String?
    var regionSelected : String?
    var imageNameSoal1 : String?
    var imageNameSoal2 : String?
    var imageNameSoal3 : String?
    var imageNameSoal4 : String?
    var soundNameAsset : String?
    var initialClick = false
    lazy var choices = [String]()
    var answersBGView = [CustomView]()
    var answersChoiceLabel = [UILabel]()
    var answersChoiceImage = [UIImageView]()
    
    var quizData: Quiz? {
        didSet {
            self.alphabet = quizData?.question!
            
            let choices = quizData?.choices?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Choice]
            
            for i in 0...choices!.count - 1 {
                let choice = choices?[i].name
                self.choices.append(choice!)
            }
            
            imageNameSoal1 = "\(regionSelected!) Jawaban \(self.choices[0])"
            imageNameSoal2 = "\(regionSelected!) Jawaban \(self.choices[1])"
            imageNameSoal3 = "\(regionSelected!) Jawaban \(self.choices[2])"
            imageNameSoal4 = "\(regionSelected!) Jawaban \(self.choices[3])"
            
            print(imageNameSoal1)
            
            if (self.choices[0] == "É") {
                imageNameSoal1 = "\(regionSelected!) Jawaban \(self.choices[0])É"
            } else if (self.choices[1] == "É"){
                imageNameSoal2 = "\(regionSelected!) Jawaban \(self.choices[1])É"
            } else if (self.choices[2] == "É"){
                imageNameSoal3 = "\(regionSelected!) Jawaban \(self.choices[2])É"
            } else if (self.choices[3] == "É"){
                imageNameSoal4 = "\(regionSelected!) Jawaban \(self.choices[3])É"
            }
            
            self.pilgan1Answer.image = UIImage(named: imageNameSoal1!)
            self.pilgan2Answer.image = UIImage(named: imageNameSoal2!)
            self.pilgan3Answer.image = UIImage(named: imageNameSoal3!)
            self.pilgan4Answer.image = UIImage(named: imageNameSoal4!)
            
            self.answer1BgView.choice = self.choices[0]
            self.answer2BgView.choice = self.choices[1]
            self.answer3BgView.choice = self.choices[2]
            self.answer4BgView.choice = self.choices[3]
            
//            //quizImage
//            imageNameSoal = "\(regionSelected!) Soal \(soalKe) \(alphabet!)"
//            quizImage.image = UIImage(named: imageNameSoal!)
            
            //aksaraLabel
            aksaraLabel.text = "Aksara \(regionSelected!)"
        }
    }
    
    func handleTimer() {
        var arrayAlpha = [0, 1, 2, 3]
        let index = choices.firstIndex(of: alphabet!)
        arrayAlpha = arrayAlpha.filter { $0 != index}
        
        for i in arrayAlpha {
            answersBGView[i].alpha = 0.4
        }
        
        answersBGView[index!].setCardTrueBackgroundColor()
        answersChoiceLabel[index!].textColor = .white
        answersChoiceImage[index!].setImageColor(color: .white)
        arrowRightButton.isHidden = false
        lewatiButton.isHidden = false
        
        // handle core data
        quizData?.isCorrect = false
        PersistenceService.saveContext()
    }
    
    //Button
    let arrowRightButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "chevron.right", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.tintColor = Theme.current.accentTextBlue
        button.isHidden = true
        return button
    }()
    
    
    let lewatiButton : UIButton = {
        let button = UIButton(type: .system)
        let custombutton = NSMutableAttributedString(string: "Lanjut", attributes: [ NSAttributedString.Key.foregroundColor: Theme.current.accentTextBlue])
        button.setAttributedTitle(custombutton, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    let soundButton: UIButton = {
    let button = UIButton()
    let symbolConfig = UIImage.SymbolConfiguration(pointSize: 120.0, weight: .medium, scale: .default)
    button.setBackgroundImage(UIImage(systemName: "speaker.2.fill", withConfiguration: symbolConfig), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
    button.tintColor = Theme.current.accentWhite
    return button
    }()
    
    
       //Func
       @objc func handleNext() {
           print("Next")
       }
   
       
    
    //Image
    let pilgan1Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let pilgan2Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let pilgan3Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let pilgan4Answer: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //Label
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 24)
        label.textColor = Theme.current.accentWhite
        label.text = "Aksara Jawa"
        return label
    }()

    let kelompokLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 24)
        label.textColor = Theme.current.accentWhite
        label.text = "Kelompok Carakan"
        return label
    }()
    
    let quizAnswerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "Bunyi aksara apakah itu?"
        return label
    }()
    
    let pilgan1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "A."
        return label
    }()
    
    let pilgan2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "B."
        return label
    }()
    
    let pilgan3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "C."
        return label
    }()
    
    let pilgan4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "D."
        return label
    }()
    
    
    
    //Background View
    lazy var quizBgView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.accentLightBlue
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)

        let tap = UITapGestureRecognizer(target: self, action: #selector(playSound))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var answer1BgView : CustomView = {
        let view = CustomView()
        view.id = 0
        view.choice = ""
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 32
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(answerPressed(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var answer2BgView : CustomView = {
        let view = CustomView()
        view.id = 1
        view.choice = ""
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 32
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(answerPressed(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var answer3BgView : CustomView = {
        let view = CustomView()
        view.id = 2
        view.choice = ""
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 32
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(answerPressed(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    lazy var answer4BgView : CustomView = {
        let view = CustomView()
        view.id = 3
        view.choice = ""
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 32
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        let tap = UITapGestureRecognizer(target: self, action: #selector(answerPressed(_:)))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        return view
    }()
    
    @objc func answerPressed(_ sender: UITapGestureRecognizer) {
        let view = sender.view as! CustomView
        let index = choices.firstIndex(of: alphabet!)
        let id = view.id
        
        if initialClick == false {
            if view.choice == alphabet {
                print("True")
                answersBGView[index!].setCardTrueBackgroundColor()
                answersChoiceLabel[index!].textColor = .white
                answersChoiceImage[index!].setImageColor(color: .white)
                
                var arrayAlpha = [0, 1, 2, 3]
                arrayAlpha = arrayAlpha.filter { $0 != index}
                
                for i in arrayAlpha {
                    answersBGView[i].alpha = 0.4
                }
                delegate?.stopTimerChoosen()
//                playSound()
                
                // handle core data
                quizData?.isCorrect = true
                PersistenceService.saveContext()
            }else {
                print("False")
                answersBGView[id!].setCardFalseBackgroundColor()
                answersChoiceLabel[id!].textColor = .white
                answersChoiceImage[id!].setImageColor(color: .white)
                
                answersBGView[index!].setCardTrueBackgroundColor()
                answersChoiceLabel[index!].textColor = .white
                answersChoiceImage[index!].setImageColor(color: .white)
                
                var arrayAlpha = [0, 1, 2, 3]
                arrayAlpha = arrayAlpha.filter { $0 != index}
                arrayAlpha = arrayAlpha.filter { $0 != id}
                
                for i in arrayAlpha {
                    answersBGView[i].alpha = 0.4
                }
                delegate?.stopTimerChoosen()
//                playSound()
                
                // handle core data
                quizData?.isCorrect = false
                PersistenceService.saveContext()
            }
            arrowRightButton.isHidden = false
            lewatiButton.isHidden = false
            initialClick = true
        }
    }
    
    @objc func playSound() {
        print("Hello Dear you are here")
        let soundNameAsset = "\(regionSelected!) Suara \(alphabet!)"

        guard let url = Bundle.main.url(forResource: "\(soundNameAsset)", withExtension: "mp3") else { return }

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
        self.answersBGView = [answer1BgView, answer2BgView, answer3BgView, answer4BgView]
        self.answersChoiceLabel = [pilgan1, pilgan2, pilgan3, pilgan4]
        self.answersChoiceImage = [pilgan1Answer, pilgan2Answer, pilgan3Answer, pilgan4Answer]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
            
            let colorTop =  UIColor(red: 36/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0).cgColor
            let colorBottom = UIColor(red: 54/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1.0).cgColor
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: 440, height: 440)
            gradientLayer.cornerRadius = 24
            
            //QuizLeftSection
            addSubview(quizBgView)
            NSLayoutConstraint.activate([
                quizBgView.topAnchor.constraint(equalTo: topAnchor, constant: 151),
                quizBgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),
                quizBgView.heightAnchor.constraint(equalToConstant: 440),
                quizBgView.widthAnchor.constraint(equalToConstant: 440)
            ])
            
            quizBgView.layer.insertSublayer(gradientLayer, at: 0)
        
            quizBgView.addSubview(aksaraLabel)
            NSLayoutConstraint.activate([
            aksaraLabel.topAnchor.constraint(equalTo: quizBgView.topAnchor, constant: 32),
            aksaraLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
            ])
        
            quizBgView.addSubview(soundButton)
            NSLayoutConstraint.activate([
            soundButton.centerYAnchor.constraint(equalTo: quizBgView.centerYAnchor),
            soundButton.centerXAnchor.constraint(equalTo: quizBgView.centerXAnchor)
            ])
        
            quizBgView.addSubview(kelompokLabel)
            NSLayoutConstraint.activate([
            kelompokLabel.bottomAnchor.constraint(equalTo: quizBgView.bottomAnchor, constant: -41),
            kelompokLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
            ])
        
            //QuizRightSection
            
            //Pilgan1
            addSubview(answer1BgView)
            NSLayoutConstraint.activate([
            answer1BgView.topAnchor.constraint(equalTo: topAnchor, constant: 210),
            answer1BgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -346),
            answer1BgView.heightAnchor.constraint(equalToConstant: 140),
            answer1BgView.widthAnchor.constraint(equalToConstant: 220)
            ])
            
            answer1BgView.addSubview(pilgan1)
            NSLayoutConstraint.activate([
            pilgan1.leadingAnchor.constraint(equalTo: answer1BgView.leadingAnchor, constant: 16),
            pilgan1.topAnchor.constraint(equalTo: answer1BgView.topAnchor, constant: 16)
            ])
        
            answer1BgView.addSubview(pilgan1Answer)
            NSLayoutConstraint.activate([
            pilgan1Answer.heightAnchor.constraint(equalToConstant: 40),
            pilgan1Answer.widthAnchor.constraint(equalToConstant: 60),
            pilgan1Answer.centerYAnchor.constraint(equalTo: answer1BgView.centerYAnchor),
            pilgan1Answer.centerXAnchor.constraint(equalTo: answer1BgView.centerXAnchor)
            ])
        
            //Pilgan2
            addSubview(answer2BgView)
            NSLayoutConstraint.activate([
            answer2BgView.topAnchor.constraint(equalTo: topAnchor, constant: 210),
            answer2BgView.leadingAnchor.constraint(equalTo: answer1BgView.trailingAnchor, constant: 24),
            answer2BgView.heightAnchor.constraint(equalToConstant: 140),
            answer2BgView.widthAnchor.constraint(equalToConstant: 220)
            ])
            
            answer2BgView.addSubview(pilgan2)
            NSLayoutConstraint.activate([
            pilgan2.leadingAnchor.constraint(equalTo: answer2BgView.leadingAnchor, constant: 16),
            pilgan2.topAnchor.constraint(equalTo: answer2BgView.topAnchor, constant: 16)
            ])
        
            answer2BgView.addSubview(pilgan2Answer)
            NSLayoutConstraint.activate([
            pilgan2Answer.heightAnchor.constraint(equalToConstant: 40),
            pilgan2Answer.widthAnchor.constraint(equalToConstant: 60),
            pilgan2Answer.centerYAnchor.constraint(equalTo: answer2BgView.centerYAnchor),
            pilgan2Answer.centerXAnchor.constraint(equalTo: answer2BgView.centerXAnchor)
            ])
            
            //Pilgan3
            addSubview(answer3BgView)
            NSLayoutConstraint.activate([
            answer3BgView.topAnchor.constraint(equalTo: answer1BgView.bottomAnchor, constant: 24),
            answer3BgView.trailingAnchor.constraint(equalTo: answer1BgView.trailingAnchor),
            answer3BgView.heightAnchor.constraint(equalToConstant: 140),
            answer3BgView.widthAnchor.constraint(equalToConstant: 220)
            ])
            
            answer3BgView.addSubview(pilgan3)
            NSLayoutConstraint.activate([
            pilgan3.leadingAnchor.constraint(equalTo: answer3BgView.leadingAnchor, constant: 16),
            pilgan3.topAnchor.constraint(equalTo: answer3BgView.topAnchor, constant: 16)
            ])
        
            answer3BgView.addSubview(pilgan3Answer)
            NSLayoutConstraint.activate([
            pilgan3Answer.heightAnchor.constraint(equalToConstant: 40),
            pilgan3Answer.widthAnchor.constraint(equalToConstant: 60),
            pilgan3Answer.centerYAnchor.constraint(equalTo: answer3BgView.centerYAnchor),
            pilgan3Answer.centerXAnchor.constraint(equalTo: answer3BgView.centerXAnchor)
            ])
        
            //Pilgan4
            addSubview(answer4BgView)
            NSLayoutConstraint.activate([
            answer4BgView.topAnchor.constraint(equalTo: answer2BgView.bottomAnchor, constant: 24),
            answer4BgView.trailingAnchor.constraint(equalTo: answer2BgView.trailingAnchor),
            answer4BgView.heightAnchor.constraint(equalToConstant: 140),
            answer4BgView.widthAnchor.constraint(equalToConstant: 220)
            ])
            
            answer4BgView.addSubview(pilgan4)
            NSLayoutConstraint.activate([
            pilgan4.leadingAnchor.constraint(equalTo: answer4BgView.leadingAnchor, constant: 16),
            pilgan4.topAnchor.constraint(equalTo: answer4BgView.topAnchor, constant: 16)
            ])
        
            answer4BgView.addSubview(pilgan4Answer)
            NSLayoutConstraint.activate([
            pilgan4Answer.heightAnchor.constraint(equalToConstant: 40),
            pilgan4Answer.widthAnchor.constraint(equalToConstant: 60),
            pilgan4Answer.centerYAnchor.constraint(equalTo: answer4BgView.centerYAnchor),
            pilgan4Answer.centerXAnchor.constraint(equalTo: answer4BgView.centerXAnchor)
            ])
            
            
            
            
            addSubview(quizAnswerLabel)
            NSLayoutConstraint.activate([
            quizAnswerLabel.bottomAnchor.constraint(equalTo: answer1BgView.topAnchor, constant: -24),
            quizAnswerLabel.leadingAnchor.constraint(equalTo: answer1BgView.leadingAnchor)
            ])
        
            
            
            //LewatiButton
            addSubview(lewatiButton)
            NSLayoutConstraint.activate([
            lewatiButton.heightAnchor.constraint(equalToConstant: 24),
            lewatiButton.topAnchor.constraint(equalTo: answer4BgView.bottomAnchor, constant: 41),
            lewatiButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -315)
            ])
            
            addSubview(arrowRightButton)
            NSLayoutConstraint.activate([
            arrowRightButton.heightAnchor.constraint(equalToConstant: 24),
            arrowRightButton.topAnchor.constraint(equalTo: answer4BgView.bottomAnchor, constant: 40),
            arrowRightButton.leadingAnchor.constraint(equalTo: lewatiButton.trailingAnchor, constant: 8)
            ])
        }

    }


