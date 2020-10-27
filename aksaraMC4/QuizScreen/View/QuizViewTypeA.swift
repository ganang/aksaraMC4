//
//  QuizView.swift
//  aksaraMC4
//
//  Created by Naratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewTypeA: UICollectionViewCell {
    
    var delegate : QuizControllerProtocol?
    
    var soalKe : String = "1"
    var alphabet : String?
    var regionSelected : String?
    var imageNameSoal : String?
    var imageNameJawab : String?
    var initialClick = false
    lazy var choices = [String]()
    var answersBGView = [CustomView]()
    var answersChoiceLabel = [UILabel]()
    var answersChoiceImage = [UILabel]()
    var stateTrueImage = [UIImageView]()
    var stateFalseImage = [UIImageView]()
    
    var quizData: Quiz? {
        didSet {
            self.alphabet = quizData?.question!
            
            let choices = quizData?.choices?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Choice]
            
            for i in 0...choices!.count - 1 {
                let choice = choices?[i].name
                self.choices.append(choice!)
            }
            
            self.pilgan1Answer.text = self.choices[0]
            self.pilgan2Answer.text = self.choices[1]
            self.pilgan3Answer.text = self.choices[2]
            self.pilgan4Answer.text = self.choices[3]
            
            self.answer1BgView.choice = self.choices[0]
            self.answer2BgView.choice = self.choices[1]
            self.answer3BgView.choice = self.choices[2]
            self.answer4BgView.choice = self.choices[3]
            
            //quizImage
            imageNameSoal = "\(regionSelected!) Soal \(soalKe) \(alphabet!)"
            if (alphabet == "É") {
                imageNameSoal = "\(regionSelected!) Soal \(soalKe) \(alphabet!)É"
            }
            quizImage.image = UIImage(named: imageNameSoal!)
            
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
        answersChoiceImage[index!].textColor = .white
        stateTrueImage[index!].isHidden = false
        arrowRightButton.isHidden = false
        lewatiButton.isHidden = false
    
//        playSound()
        
        // handle core data
        quizData?.isCorrect = false
        PersistenceService.saveContext()
    }
    
    func restartQuiz() {
        print("RESTART")
        answer1BgView.backgroundColor = .red
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
    
       //Func
       @objc func handleNext() {
           print("Next")
       }
   
       
    
    //Image
    let quizImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HaWhite")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let falseState1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "falseState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let falseState2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "falseState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let falseState3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "falseState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let falseState4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "falseState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let trueState1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "trueState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let trueState2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "trueState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let trueState3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "trueState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let trueState4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "trueState")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    //Label
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.accentWhite
        label.text = "Aksara Jawa"
        return label
    }()
    
    let kelompokLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.textColor = Theme.current.accentWhite
        label.text = "Kelompok Carakan"
        return label
    }()
    
    let quizAnswerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "Aksara apakah itu?"
        return label
    }()
    
    let pilgan1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.textColor = Theme.current.textColor1
        label.text = "A."
        return label
    }()
    
    let pilgan2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.textColor = Theme.current.textColor1
        label.text = "B."
        return label
    }()
    
    let pilgan3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.textColor = Theme.current.textColor1
        label.text = "C."
        return label
    }()
    
    let pilgan4: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.textColor = Theme.current.textColor1
        label.text = "D."
        return label
    }()
    
    lazy var pilgan1Answer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = ""
        return label
    }()
    
    let pilgan2Answer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = ""
        return label
    }()
    
    let pilgan3Answer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = ""
        return label
    }()
    
    let pilgan4Answer: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = ""
        return label
    }()
    
    //Background View
    let quizBgView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.accentLightBlue
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.answersBGView[id!].setCardChooseBackgroundColor()
                self.answersChoiceLabel[id!].textColor = .white
                self.answersChoiceImage[id!].textColor = .white
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.answersBGView[id!].removeLayer(name: "xxx")
                if view.choice == self.alphabet {
                    print("True")
                    
                    self.answersBGView[index!].setCardTrueBackgroundColor()
                    self.answersChoiceLabel[index!].textColor = .white
                    self.answersChoiceImage[index!].textColor = .white
                    self.stateTrueImage[index!].isHidden = false
                    //                playSound()
                    var arrayAlpha = [0, 1, 2, 3]
                    arrayAlpha = arrayAlpha.filter { $0 != index}
                    
                    for i in arrayAlpha {
                        self.answersBGView[i].alpha = 0.4
                    }
                    
                    self.delegate?.stopTimerChoosen()
                    
                    // handle core data
                    self.quizData?.isCorrect = true
                    PersistenceService.saveContext()
                }else {
                    print("False")
                    self.answersBGView[id!].setCardFalseBackgroundColor()
                    self.answersChoiceLabel[id!].textColor = .white
                    self.answersChoiceImage[id!].textColor = .white
                    self.stateFalseImage[id!].isHidden = false
                    
                    self.answersBGView[index!].setCardTrueBackgroundColor()
                    self.answersChoiceLabel[index!].textColor = .white
                    self.answersChoiceImage[index!].textColor = .white
                    self.stateTrueImage[index!].isHidden = false
                    //                playSound()
                    var arrayAlpha = [0, 1, 2, 3]
                    arrayAlpha = arrayAlpha.filter { $0 != index}
                    arrayAlpha = arrayAlpha.filter { $0 != id}
                    
                    for i in arrayAlpha {
                        self.answersBGView[i].alpha = 0.4
                    }
                    
                    self.delegate?.stopTimerChoosen()
                    
                    // handle core data
                    self.quizData?.isCorrect = false
                    PersistenceService.saveContext()
                }
            }
            
            arrowRightButton.isHidden = false
            lewatiButton.isHidden = false
            initialClick = true
        }
    }
    
    var player: AVAudioPlayer?
    
    @objc func playSound() {
        print("Hello Dear you are here")

        guard let url = Bundle.main.url(forResource: "motivation", withExtension: "mp3") else { return }

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
        self.stateTrueImage = [trueState1, trueState2, trueState3, trueState4]
        self.stateFalseImage = [falseState1, falseState2, falseState3, falseState4]
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
            quizBgView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.1810551559),
            quizBgView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -260),
            quizBgView.heightAnchor.constraint(equalToConstant: 440),
            quizBgView.widthAnchor.constraint(equalToConstant: 440)
        ])
        
        quizBgView.layer.insertSublayer(gradientLayer, at: 0)
        
        quizBgView.addSubview(aksaraLabel)
        NSLayoutConstraint.activate([
            aksaraLabel.topAnchor.constraint(equalTo: quizBgView.topAnchor, constant: 32),
            aksaraLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
        ])
        
        quizBgView.addSubview(quizImage)
        NSLayoutConstraint.activate([
            quizImage.heightAnchor.constraint(equalToConstant: 100),
            quizImage.widthAnchor.constraint(equalToConstant: 200),
            quizImage.centerYAnchor.constraint(equalTo: quizBgView.centerYAnchor),
            quizImage.centerXAnchor.constraint(equalTo: quizBgView.centerXAnchor)
        ])
        
        quizBgView.addSubview(kelompokLabel)
        NSLayoutConstraint.activate([
            kelompokLabel.bottomAnchor.constraint(equalTo: quizBgView.bottomAnchor, constant: -32),
            kelompokLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
        ])
        
        //QuizRightSection
        
        //Pilgan1
        addSubview(answer1BgView)
        NSLayoutConstraint.activate([
            answer1BgView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.2517985612),
            answer1BgView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 110),
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
            pilgan1Answer.centerYAnchor.constraint(equalTo: answer1BgView.centerYAnchor),
            pilgan1Answer.centerXAnchor.constraint(equalTo: answer1BgView.centerXAnchor)
        ])
        
        //Pilgan2
        addSubview(answer2BgView)
        NSLayoutConstraint.activate([
            answer2BgView.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.2517985612),
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
            pilgan4Answer.centerYAnchor.constraint(equalTo: answer4BgView.centerYAnchor),
            pilgan4Answer.centerXAnchor.constraint(equalTo: answer4BgView.centerXAnchor)
        ])
        
        
        
        
        addSubview(quizAnswerLabel)
        NSLayoutConstraint.activate([
            quizAnswerLabel.bottomAnchor.constraint(equalTo: answer1BgView.topAnchor, constant: -24),
            quizAnswerLabel.leadingAnchor.constraint(equalTo: answer1BgView.leadingAnchor)
        ])
        
        //TrueState
        answer1BgView.addSubview(trueState1)
        NSLayoutConstraint.activate([
            trueState1.trailingAnchor.constraint(equalTo: answer1BgView.trailingAnchor, constant: -10),
            trueState1.topAnchor.constraint(equalTo: answer1BgView.topAnchor, constant: 10),
            trueState1.heightAnchor.constraint(equalToConstant: 20),
            trueState1.widthAnchor.constraint(equalToConstant: 21)
        ])
        
        answer2BgView.addSubview(trueState2)
        NSLayoutConstraint.activate([
            trueState2.trailingAnchor.constraint(equalTo: answer2BgView.trailingAnchor, constant: -10),
            trueState2.topAnchor.constraint(equalTo: answer2BgView.topAnchor, constant: 10),
            trueState2.heightAnchor.constraint(equalToConstant: 20),
            trueState2.widthAnchor.constraint(equalToConstant: 21)
        ])
        
        answer3BgView.addSubview(trueState3)
        NSLayoutConstraint.activate([
            trueState3.trailingAnchor.constraint(equalTo: answer3BgView.trailingAnchor, constant: -10),
            trueState3.topAnchor.constraint(equalTo: answer3BgView.topAnchor, constant: 10),
            trueState3.heightAnchor.constraint(equalToConstant: 20),
            trueState3.widthAnchor.constraint(equalToConstant: 21)
        ])
        
        answer4BgView.addSubview(trueState4)
        NSLayoutConstraint.activate([
            trueState4.trailingAnchor.constraint(equalTo: answer4BgView.trailingAnchor, constant: -10),
            trueState4.topAnchor.constraint(equalTo: answer4BgView.topAnchor, constant: 10),
            trueState4.heightAnchor.constraint(equalToConstant: 20),
            trueState4.widthAnchor.constraint(equalToConstant: 21)
        ])
        
        //FalseState
        answer1BgView.addSubview(falseState1)
        NSLayoutConstraint.activate([
            falseState1.trailingAnchor.constraint(equalTo: answer1BgView.trailingAnchor, constant: -16),
            falseState1.topAnchor.constraint(equalTo: answer1BgView.topAnchor, constant: 16),
            falseState1.heightAnchor.constraint(equalToConstant: 18),
            falseState1.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        answer2BgView.addSubview(falseState2)
        NSLayoutConstraint.activate([
            falseState2.trailingAnchor.constraint(equalTo: answer2BgView.trailingAnchor, constant: -16),
            falseState2.topAnchor.constraint(equalTo: answer2BgView.topAnchor, constant: 16),
            falseState2.heightAnchor.constraint(equalToConstant: 18),
            falseState2.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        answer3BgView.addSubview(falseState3)
        NSLayoutConstraint.activate([
            falseState3.trailingAnchor.constraint(equalTo: answer3BgView.trailingAnchor, constant: -16),
            falseState3.topAnchor.constraint(equalTo: answer3BgView.topAnchor, constant: 16),
            falseState3.heightAnchor.constraint(equalToConstant: 18),
            falseState3.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        answer4BgView.addSubview(falseState4)
        NSLayoutConstraint.activate([
            falseState4.trailingAnchor.constraint(equalTo: answer4BgView.trailingAnchor, constant: -16),
            falseState4.topAnchor.constraint(equalTo: answer4BgView.topAnchor, constant: 16),
            falseState4.heightAnchor.constraint(equalToConstant: 18),
            falseState4.widthAnchor.constraint(equalToConstant: 18)
        ])
        
        //LewatiButton
        addSubview(lewatiButton)
        NSLayoutConstraint.activate([
            lewatiButton.heightAnchor.constraint(equalToConstant: 24),
            lewatiButton.topAnchor.constraint(equalTo: answer4BgView.bottomAnchor, constant: 41),
            lewatiButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 234)
        ])
        
        addSubview(arrowRightButton)
        NSLayoutConstraint.activate([
            arrowRightButton.heightAnchor.constraint(equalToConstant: 24),
            arrowRightButton.topAnchor.constraint(equalTo: answer4BgView.bottomAnchor, constant: 40),
            arrowRightButton.leadingAnchor.constraint(equalTo: lewatiButton.trailingAnchor, constant: 8)
        ])
    }

}

extension UIView {
    func removeLayer(name: String) {
        for item in self.layer.sublayers ?? [] where item.name == name {
            item.removeFromSuperlayer()
        }
    }
}


