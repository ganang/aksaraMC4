//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuizDragAndDropView3: UIViewController, UIGestureRecognizerDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originCarakanView1Position = CGRect(x: 40, y: UIScreen.main.bounds.height/2 - 106, width: 64, height: 64)
    let originCarakanView2Position = CGRect(x: 112, y: UIScreen.main.bounds.height/2 - 106, width: 64, height: 64)
    let originCarakanView3Position = CGRect(x: 40, y: UIScreen.main.bounds.height/2 - 32, width: 64, height: 64)
    let originCarakanView4Position = CGRect(x: 112, y: UIScreen.main.bounds.height/2 - 32, width: 64, height: 64)
    let originCarakanView5Position = CGRect(x: 40, y: UIScreen.main.bounds.height/2 + 40, width: 64, height: 64)
    let originCarakanView6Position = CGRect(x: 112, y: UIScreen.main.bounds.height/2 + 40, width: 64, height: 64)
    
    let originSandhanganView1Position = CGRect(x: UIScreen.main.bounds.width - 104, y: UIScreen.main.bounds.height/2 - 106, width: 64, height: 64)
    let originSandhanganView2Position = CGRect(x: UIScreen.main.bounds.width - 176, y: UIScreen.main.bounds.height/2 - 106, width: 64, height: 64)
    let originSandhanganView3Position = CGRect(x: UIScreen.main.bounds.width - 104, y: UIScreen.main.bounds.height/2 - 32, width: 64, height: 64)
    let originSandhanganView4Position = CGRect(x: UIScreen.main.bounds.width - 176, y: UIScreen.main.bounds.height/2 - 32, width: 64, height: 64)
    let originSandhanganView5Position = CGRect(x: UIScreen.main.bounds.width - 104, y: UIScreen.main.bounds.height/2 + 40, width: 64, height: 64)
    let originSandhanganView6Position = CGRect(x: UIScreen.main.bounds.width - 176, y: UIScreen.main.bounds.height/2 + 40, width: 64, height: 64)
    
    
    lazy var carakanPlaceholder: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var sandanganTop1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var sandanganTop2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var moveGS_A: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ha"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_B: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Na"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_C: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ca"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_D: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "Jawa Jawaban Ra"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_E: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Ka"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_F: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Da"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_G: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Tha"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_H: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "Jawa Jawaban Sa"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var carakanView1: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ha")
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_A)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        
        return button
    }()
    
    lazy var carakanView2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Na"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_B)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var carakanView3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Ca"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_C)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var carakanView4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Ra"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_D)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    lazy var carakanView5: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Ka"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_E)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var carakanView6: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Da"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_F)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var sandhanganView1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Tha"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_G)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var sandhanganView2: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Sa"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_H)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var sandhanganView3: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Sa"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_H)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var sandhanganView4: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Sa"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_H)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var sandhanganView5: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Sa"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_H)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    lazy var sandhanganView6: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Jawa Jawaban Sa"), for: .normal)
        button.isUserInteractionEnabled = true
        button.addGestureRecognizer(moveGS_H)
        button.imageView?.contentMode = .scaleAspectFit
        button.backgroundColor = .init(white: 1, alpha: 0.8)
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.cornerRadius = 16
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setBackgroundColor()
        navigationController?.navigationBar.isHidden = true
        
        setupView()
    }
    
    func setupView() {
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        view.addSubview(carakanPlaceholder)
        view.addSubview(sandanganTop1)
        view.addSubview(sandanganTop2)
        
        // Add Carakan
        view.addSubview(carakanView1)
        view.addSubview(carakanView2)
        view.addSubview(carakanView3)
        view.addSubview(carakanView4)
        view.addSubview(carakanView5)
        view.addSubview(carakanView6)
        
        // Add Sandhangan
        view.addSubview(sandhanganView1)
        view.addSubview(sandhanganView2)
        view.addSubview(sandhanganView3)
        view.addSubview(sandhanganView4)
        view.addSubview(sandhanganView5)
        view.addSubview(sandhanganView6)
    }
    
    func setupConstraint() {
        // MARK: Placeholder Carakan
        carakanPlaceholder.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        carakanPlaceholder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        carakanPlaceholder.widthAnchor.constraint(equalToConstant: 100).isActive = true
        carakanPlaceholder.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Carakan Frame
        carakanView1.frame = originCarakanView1Position
        carakanView2.frame = originCarakanView2Position
        carakanView3.frame = originCarakanView3Position
        carakanView4.frame = originCarakanView4Position
        carakanView5.frame = originCarakanView5Position
        carakanView6.frame = originCarakanView6Position
        
        // Sandhangan Frame
        sandhanganView1.frame = originSandhanganView1Position
        sandhanganView2.frame = originSandhanganView2Position
        sandhanganView3.frame = originSandhanganView3Position
        sandhanganView4.frame = originSandhanganView4Position
        sandhanganView5.frame = originSandhanganView5Position
        sandhanganView6.frame = originSandhanganView6Position
        
    }
    
    // MARK: Gesture to move selected object
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        let senderView = sender.view
        let viewName = sender.viewName
        
        if sender.state == .ended {
            

            if (senderView == carakanView1) {
                sender.view?.frame = self.originCarakanView1Position
            } else if (senderView == carakanView2) {
                sender.view?.frame = self.originCarakanView2Position
            } else if (senderView == carakanView3) {
                sender.view?.frame = self.originCarakanView3Position
            } else if (senderView == carakanView4) {
                sender.view?.frame = self.originCarakanView4Position
            } else if (senderView == carakanView5) {
                sender.view?.frame = self.originCarakanView5Position
            } else if (senderView == carakanView6) {
                sender.view?.frame = self.originCarakanView6Position
            } else if (senderView == sandhanganView1) {
                sender.view?.frame = self.originSandhanganView1Position
            } else if (senderView == sandhanganView2) {
                sender.view?.frame = self.originSandhanganView2Position
            } else if (senderView == sandhanganView3) {
                sender.view?.frame = self.originSandhanganView3Position
            } else if (senderView == sandhanganView4) {
                sender.view?.frame = self.originSandhanganView4Position
            } else if (senderView == sandhanganView5) {
                sender.view?.frame = self.originSandhanganView5Position
            } else if (senderView == sandhanganView6) {
                sender.view?.frame = self.originSandhanganView6Position
            } else {
            }
            
        } else if sender.state == .began {
        } else {
            sender.view?.center = sender.location(in: view)
        }
    }
    
    //Width and Height of both rects may be different
    func rectIntersectionInPerc(r1:CGRect, r2:CGRect) -> CGFloat {
        if (r1.intersects(r2)) {

           //let interRect:CGRect = r1.rectByIntersecting(r2); //OLD
           let interRect:CGRect = r1.intersection(r2);

           return ((interRect.width * interRect.height) / (((r1.width * r1.height) + (r2.width * r2.height))/2.0) * 100.0)
        }
        return 0;
    }
}


