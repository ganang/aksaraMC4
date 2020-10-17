//
//  QuizView.swift
//  aksaraMC4
//
//  Created by Naratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit

class QuizView: UICollectionViewCell {

    var soalKe : String = "1"
    var alphabet : String?
    var regionSelected : String?
    var imageNameSoal : String?
    var imageNameJawab : String?
    var quizData: Quiz? {
        didSet {
            self.alphabet = quizData?.question!
            
            //quizImage
            imageNameSoal = "\(regionSelected!) Soal \(soalKe) \(alphabet!)"
            quizImage.image = UIImage(named: imageNameSoal!)
            
            //carakanLabel
            carakanLabel.text = "\(alphabet!)"
            
            //aksaraLabel
            aksaraLabel.text = "Aksara \(regionSelected!)"
            
            //answerImage
            imageNameJawab = "\(regionSelected!) Soal 4 \(alphabet!)"
            answerImage.image = UIImage(named: imageNameJawab!)
        }
    }
    
    //Button
    lazy var reloadButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "arrow.counterclockwise", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.textColor1
        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
        return button
    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "info.circle.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.textColor1
        return button
    }()
    
    let soundButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 32.0, weight: .medium, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "speaker.2.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.accentWhite
        return button
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .medium, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "bookmark.fill", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.accentWhite
        return button
    }()
    
    let kuisButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "KuisButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return button
    }()
    
    
    let checkButton : UIButton = {
        let button = UIButton(type: .system)
        let custombutton = NSMutableAttributedString(string: "Cek", attributes: [ NSAttributedString.Key.foregroundColor: Theme.current.accentWhite])
        button.setAttributedTitle(custombutton, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = Theme.current.textColor1
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //Image
    let quizImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HaWhite")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let answerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "HaColor")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //Label
    let carakanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Bold", size: 48)
        label.textColor = Theme.current.accentWhite
        label.text = "Ha"
        return label
    }()
    
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
    
    let soundAksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 24)
        label.textColor = Theme.current.accentWhite
        label.text = "Ha : hawa"
        return label
    }()
    
    let quizAnswerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 24)
        label.textColor = Theme.current.textColor1
        label.text = "Latihan menulis"
        return label
    }()
    
    let confirmButtonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 32)
        label.textColor = Theme.current.accentWhite
        label.text = "Kuis"
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
   
    let answerBgView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    lazy var canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 24
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.alwaysBounceVertical = true
        canvasView.allowsFingerDrawing = true
        
        return canvasView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func reloadPencilKit() {
        canvasView.drawing = PKDrawing()
    }
    
    func setupView(){
        
        let colorTop =  UIColor(red: 36/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 54/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: 440, height: 560)
        gradientLayer.cornerRadius = 24
        
        //QuizLeftSection
        addSubview(quizBgView)
        NSLayoutConstraint.activate([
            quizBgView.topAnchor.constraint(equalTo: topAnchor, constant: 104),
            quizBgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 110),
            quizBgView.heightAnchor.constraint(equalToConstant: 560),
            quizBgView.widthAnchor.constraint(equalToConstant: 440)
        ])
        
        quizBgView.layer.insertSublayer(gradientLayer, at: 0)
        
        quizBgView.addSubview(carakanLabel)
        NSLayoutConstraint.activate([
            carakanLabel.topAnchor.constraint(equalTo: quizBgView.topAnchor, constant: 40),
            carakanLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
        ])
        
        quizBgView.addSubview(aksaraLabel)
        NSLayoutConstraint.activate([
            aksaraLabel.topAnchor.constraint(equalTo: carakanLabel.bottomAnchor, constant: 8),
            aksaraLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
        ])
        
        quizBgView.addSubview(soundButton)
        NSLayoutConstraint.activate([
            soundButton.heightAnchor.constraint(equalToConstant: 38),
            soundButton.widthAnchor.constraint(equalToConstant: 43),
            soundButton.topAnchor.constraint(equalTo: quizBgView.topAnchor, constant: 48),
            soundButton.trailingAnchor.constraint(equalTo: quizBgView.trailingAnchor, constant: -32)
        ])
        
        quizBgView.addSubview(quizImage)
        NSLayoutConstraint.activate([
            quizImage.heightAnchor.constraint(equalToConstant: 200),
            quizImage.widthAnchor.constraint(equalToConstant: 300),
            quizImage.topAnchor.constraint(equalTo: quizBgView.topAnchor, constant: 200),
            quizImage.centerXAnchor.constraint(equalTo: quizBgView.centerXAnchor)
        ])
        
        quizBgView.addSubview(bookmarkButton)
        NSLayoutConstraint.activate([
            bookmarkButton.heightAnchor.constraint(equalToConstant: 29),
            bookmarkButton.widthAnchor.constraint(equalToConstant: 24),
            bookmarkButton.bottomAnchor.constraint(equalTo: quizBgView.bottomAnchor, constant: -40),
            bookmarkButton.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
        ])
        
        quizBgView.addSubview(kelompokLabel)
        NSLayoutConstraint.activate([
            kelompokLabel.topAnchor.constraint(equalTo: quizImage.bottomAnchor, constant: 54),
            kelompokLabel.leadingAnchor.constraint(equalTo: quizBgView.leadingAnchor, constant: 32)
        ])
        
        quizBgView.addSubview(soundAksaraLabel)
        NSLayoutConstraint.activate([
            soundAksaraLabel.bottomAnchor.constraint(equalTo: quizBgView.bottomAnchor, constant: -39),
            soundAksaraLabel.leadingAnchor.constraint(equalTo: bookmarkButton.trailingAnchor, constant: 12)
        ])
        
        //QuizRightSection
        addSubview(answerBgView)
        NSLayoutConstraint.activate([
            answerBgView.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            answerBgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -164),
            answerBgView.heightAnchor.constraint(equalToConstant: 400),
            answerBgView.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        answerBgView.addSubview(answerImage)
        NSLayoutConstraint.activate([
            answerImage.heightAnchor.constraint(equalToConstant: 200),
            answerImage.widthAnchor.constraint(equalToConstant: 300),
            answerImage.centerYAnchor.constraint(equalTo: answerBgView.centerYAnchor),
            answerImage.centerXAnchor.constraint(equalTo: answerBgView.centerXAnchor)
        ])
        
        
        answerBgView.addSubview(canvasView)
        NSLayoutConstraint.activate([
            canvasView.topAnchor.constraint(equalTo: topAnchor, constant: 168),
            canvasView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -164),
            canvasView.heightAnchor.constraint(equalToConstant: 400),
            canvasView.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        addSubview(checkButton)
        NSLayoutConstraint.activate([
            checkButton.heightAnchor.constraint(equalToConstant: 40),
            checkButton.widthAnchor.constraint(equalToConstant: 80),
            checkButton.bottomAnchor.constraint(equalTo: answerBgView.topAnchor, constant: -17),
            checkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -164)
        ])
        
        addSubview(reloadButton)
        NSLayoutConstraint.activate([
            reloadButton.heightAnchor.constraint(equalToConstant: 29),
            reloadButton.widthAnchor.constraint(equalToConstant: 28),
            reloadButton.bottomAnchor.constraint(equalTo: answerBgView.topAnchor, constant: -23),
            reloadButton.trailingAnchor.constraint(equalTo: checkButton.leadingAnchor, constant: -12)
        ])
        
        addSubview(quizAnswerLabel)
        NSLayoutConstraint.activate([
            quizAnswerLabel.bottomAnchor.constraint(equalTo: answerBgView.topAnchor, constant: -22),
            quizAnswerLabel.trailingAnchor.constraint(equalTo: reloadButton.leadingAnchor, constant: -64)
        ])
        
        addSubview(infoButton)
        NSLayoutConstraint.activate([
            infoButton.heightAnchor.constraint(equalToConstant: 29),
            infoButton.widthAnchor.constraint(equalToConstant: 28),
            infoButton.bottomAnchor.constraint(equalTo: answerBgView.topAnchor, constant: -23),
            infoButton.trailingAnchor.constraint(equalTo: quizAnswerLabel.leadingAnchor, constant: -8)
        ])
        
        //KuisButton
        addSubview(kuisButton)
        NSLayoutConstraint.activate([
            kuisButton.heightAnchor.constraint(equalToConstant: 56),
            kuisButton.widthAnchor.constraint(equalToConstant: 400),
            kuisButton.topAnchor.constraint(equalTo: answerBgView.bottomAnchor, constant: 34),
            kuisButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -164)
        ])
    }
    
}


