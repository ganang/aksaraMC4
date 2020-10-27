//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuizDragAndDropView2: UIViewController, UIGestureRecognizerDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originViewAPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 - 84, width: 80, height: 80)
    let originImageViewAPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 - 84, width: 40, height: 40)
    
    let originViewBPosition = CGRect(x: 128, y: UIScreen.main.bounds.height/2 - 84, width: 80, height: 80)
    let originViewCPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 + 4, width: 80, height: 80)
    let originViewDPosition = CGRect(x: 128, y: UIScreen.main.bounds.height/2 + 4, width: 80, height: 80)
    let originViewEPosition = CGRect(x: UIScreen.main.bounds.width - 128, y: UIScreen.main.bounds.height/2 - 84, width: 80, height: 80)
    let originViewFPosition = CGRect(x: UIScreen.main.bounds.width - 216, y: UIScreen.main.bounds.height/2 - 84, width: 80, height: 80)
    let originViewGPosition = CGRect(x: UIScreen.main.bounds.width - 128, y: UIScreen.main.bounds.height/2 + 4, width: 80, height: 80)
    let originViewHPosition = CGRect(x: UIScreen.main.bounds.width - 216, y: UIScreen.main.bounds.height/2 + 4, width: 80, height: 80)
    
    
    lazy var placeholderViewA: UIButton = {
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
    
    lazy var placeholderViewB: UIButton = {
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
    
    lazy var placeholderViewC: UIButton = {
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
    
    lazy var viewA: UIButton = {
        let button = UIButton()
        var image = UIImage(named: "Jawa Jawaban Ha")
        
//        image = image?.resize(toHeight: 20)
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
    
    lazy var viewB: UIButton = {
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
    
    lazy var viewC: UIButton = {
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
    
    lazy var viewD: UIButton = {
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
    
    lazy var viewE: UIButton = {
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
    
    lazy var viewF: UIButton = {
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
    
    lazy var viewG: UIButton = {
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
    
    lazy var viewH: UIButton = {
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
        
        setupView()
    }
    
    func setupView() {
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        view.addSubview(placeholderViewA)
        view.addSubview(placeholderViewB)
        view.addSubview(placeholderViewC)
        view.addSubview(viewA)
        view.addSubview(viewB)
        view.addSubview(viewC)
        view.addSubview(viewD)
        view.addSubview(viewE)
        view.addSubview(viewF)
        view.addSubview(viewG)
        view.addSubview(viewH)
    }
    
    func setupConstraint() {
        placeholderViewA.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderViewA.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -96).isActive = true
        placeholderViewA.widthAnchor.constraint(equalToConstant: 80).isActive = true
        placeholderViewA.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        placeholderViewB.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderViewB.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        placeholderViewB.widthAnchor.constraint(equalToConstant: 80).isActive = true
        placeholderViewB.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        placeholderViewC.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        placeholderViewC.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 96).isActive = true
        placeholderViewC.widthAnchor.constraint(equalToConstant: 80).isActive = true
        placeholderViewC.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        viewA.frame = originViewAPosition
        viewB.frame = originViewBPosition
        viewC.frame = originViewCPosition
        viewD.frame = originViewDPosition
        viewE.frame = originViewEPosition
        viewF.frame = originViewFPosition
        viewG.frame = originViewGPosition
        viewH.frame = originViewHPosition
        
    }
    
    // MARK: Gesture to move selected object
    @objc func gestureMoveObject(_ sender: CustomPanGestureRecognizer){
        let senderView = sender.view
        let viewName = sender.viewName
        
        if sender.state == .ended {
            
            if (placeholderViewA.frame.intersects(sender.view!.frame) && placeholderViewB.frame.intersects(sender.view!.frame)) {
                let percentageA = rectIntersectionInPerc(r1: placeholderViewA.frame, r2: sender.view!.frame)
                let percentageB = rectIntersectionInPerc(r1: placeholderViewB.frame, r2: sender.view!.frame)
                
                if percentageA > 40.1 {
                    placeholderViewA.backgroundColor = sender.view?.backgroundColor
                    placeholderViewA.setImage(UIImage(named: viewName!), for: .normal)
                    placeholderViewA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                } else if (percentageB > 40.1) {
                    placeholderViewB.backgroundColor = sender.view?.backgroundColor
                    placeholderViewB.setImage(UIImage(named: viewName!), for: .normal)
                    placeholderViewB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                } else {
                }
                
            } else if (placeholderViewB.frame.intersects(sender.view!.frame) && placeholderViewC.frame.intersects(sender.view!.frame)) {
                let percentageB = rectIntersectionInPerc(r1: placeholderViewB.frame, r2: sender.view!.frame)
                let percentageC = rectIntersectionInPerc(r1: placeholderViewC.frame, r2: sender.view!.frame)
                
                if percentageB > 40.1 {
                    placeholderViewB.backgroundColor = sender.view?.backgroundColor
                    placeholderViewB.setImage(UIImage(named: viewName!), for: .normal)
                    placeholderViewB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                } else if (percentageC > 40.1) {
                    placeholderViewC.backgroundColor = sender.view?.backgroundColor
                    placeholderViewC.setImage(UIImage(named: viewName!), for: .normal)
                    placeholderViewC.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
                } else {
                }
            } else if (placeholderViewB.frame.intersects(sender.view!.frame)) {
                placeholderViewB.backgroundColor = sender.view?.backgroundColor
                placeholderViewB.setImage(UIImage(named: viewName!), for: .normal)
                placeholderViewB.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            } else if (placeholderViewC.frame.intersects(sender.view!.frame)) {
                placeholderViewC.backgroundColor = sender.view?.backgroundColor
                placeholderViewC.setImage(UIImage(named: viewName!), for: .normal)
                placeholderViewC.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            } else if (placeholderViewA.frame.intersects(sender.view!.frame)){
                placeholderViewA.backgroundColor = sender.view?.backgroundColor
                placeholderViewA.setImage(UIImage(named: viewName!), for: .normal)
                placeholderViewA.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            } else {
            }

            if (senderView == viewA) {
                sender.view?.frame = self.originViewAPosition
            } else if (senderView == viewB) {
                sender.view?.frame = self.originViewBPosition
            } else if (senderView == viewC) {
                sender.view?.frame = self.originViewCPosition
            } else if (senderView == viewD) {
                sender.view?.frame = self.originViewDPosition
            } else if (senderView == viewE) {
                sender.view?.frame = self.originViewEPosition
            } else if (senderView == viewF) {
                sender.view?.frame = self.originViewFPosition
            } else if (senderView == viewG) {
                sender.view?.frame = self.originViewGPosition
            } else {
                sender.view?.frame = self.originViewHPosition
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


