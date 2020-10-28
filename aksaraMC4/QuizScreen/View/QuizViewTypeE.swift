//
//  QuizView.swift
//  aksaraMC4
//
//  Created by Naratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import PencilKit

class QuizViewTypeE: UICollectionViewCell, PKToolPickerObserver {

    var toolPicker: PKToolPicker!
    var delegate : QuizControllerProtocol?
    var soalKe : String = "5"
    var alphabet : String?
    var regionSelected : String?
    var quizData: Quiz? {
        didSet {
            self.alphabet = quizData?.question
            let questionString: String = alphabet!
            var imageString: String = "\(regionSelected!) Soal 5 \(questionString)"
            
            if (alphabet == "É") {
                imageString = "\(regionSelected!) Soal 5 \(questionString)É"
            }
                
            quizAnswerLabel.text = "Tulis Aksara \(questionString)"
            answerImage.image = UIImage(named: imageString)
        }
    }
    
    func handleTimer() {
        
        // handle core data
        quizData?.isCorrect = true
        PersistenceService.saveContext()
    }
    
    //Button
    lazy var reloadButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 24.0, weight: .bold, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "arrow.counterclockwise", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(reloadPencilKit), for: .touchUpInside)
        button.tintColor = Theme.current.textColor1
        return button
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "buttonConfirm"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.addTarget(self, action: #selector(konfirmasiCanvas), for: .touchUpInside)
        return button
    }()
    
    let arrowRightButton: UIButton = {
        let button = UIButton()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20.0, weight: .medium, scale: .default)
        button.setBackgroundImage(UIImage(systemName: "chevron.right", withConfiguration: symbolConfig), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = Theme.current.accentTextBlue
        return button
    }()
    
    
    let lewatiButton : UIButton = {
        let button = UIButton(type: .system)
        let custombutton = NSMutableAttributedString(string: "Lanjut", attributes: [ NSAttributedString.Key.foregroundColor: Theme.current.accentTextBlue])
        button.setAttributedTitle(custombutton, for: .normal)
        button.titleLabel?.font = UIFont.init(name: "Now-Medium", size: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
       //Func
       @objc func konfirmasiCanvas() {
           print("ping")
           delegate?.stopTimerChoosen()
        
            // handle core data
            quizData?.isCorrect = true
            PersistenceService.saveContext()
       }
    
    //Image
    let answerImage: UIImageView = {
        let image = UIImageView()
//        image.image = UIImage(named: "Jawa Soal 5 Ha")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //Label
    let quizAnswerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Medium", size: 24)
        label.textColor = Theme.current.textColor1
//        label.text = "Tulis aksara Ha"
        return label
    }()
    
    //Background View
    let answerBgView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    let canvasView: PKCanvasView = {
        let canvasView = PKCanvasView()
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.layer.cornerRadius = 24
        canvasView.backgroundColor = .clear
        canvasView.isOpaque = false
        canvasView.allowsFingerDrawing = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 2)
        
        return canvasView
    }()
    
    func setupPencilKit() {
        if let window = UIApplication.shared.windows.first {
            toolPicker = PKToolPicker.shared(for: window)
            toolPicker.setVisible(false, forFirstResponder: canvasView)
            toolPicker.addObserver(canvasView)
            toolPicker.addObserver(self)
            canvasView.becomeFirstResponder()
        }
    }
    
    @objc func reloadPencilKit() {
        canvasView.drawing = PKDrawing()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupPencilKit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
                       
            //QuizMiddleSection
            addSubview(answerBgView)
            NSLayoutConstraint.activate([
            answerBgView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            answerBgView.centerXAnchor.constraint(equalTo: centerXAnchor),
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
            canvasView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            answerBgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            canvasView.heightAnchor.constraint(equalToConstant: 400),
            canvasView.widthAnchor.constraint(equalToConstant: 400)
            ])
        
            addSubview(reloadButton)
            NSLayoutConstraint.activate([
            reloadButton.heightAnchor.constraint(equalToConstant: 29),
            reloadButton.widthAnchor.constraint(equalToConstant: 25),
            reloadButton.bottomAnchor.constraint(equalTo: answerBgView.topAnchor, constant: -23),
            reloadButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 187)
            ])
            
            addSubview(quizAnswerLabel)
            NSLayoutConstraint.activate([
            quizAnswerLabel.bottomAnchor.constraint(equalTo: answerBgView.topAnchor, constant: -23),
            quizAnswerLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -110)
            ])
            
            //KuisButton
            addSubview(confirmButton)
            NSLayoutConstraint.activate([
            confirmButton.heightAnchor.constraint(equalToConstant: 48),
            confirmButton.widthAnchor.constraint(equalToConstant: 400),
            confirmButton.topAnchor.constraint(equalTo: answerBgView.bottomAnchor, constant: 24),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
        
            //LewatiButton
            addSubview(lewatiButton)
            NSLayoutConstraint.activate([
            lewatiButton.heightAnchor.constraint(equalToConstant: 24),
            lewatiButton.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 25),
            lewatiButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -14)
            ])
            
            addSubview(arrowRightButton)
            NSLayoutConstraint.activate([
            arrowRightButton.heightAnchor.constraint(equalToConstant: 24),
            arrowRightButton.topAnchor.constraint(equalTo: confirmButton.bottomAnchor, constant: 24),
            arrowRightButton.leadingAnchor.constraint(equalTo: lewatiButton.trailingAnchor, constant: 8)
            ])
        }

    
    }


