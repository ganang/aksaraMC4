//
//  QuizDragAndDropView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuizDragAndDropView: UIViewController, UIGestureRecognizerDelegate {
    
    let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.width
    let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.height
    
    let originViewAPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 - 4, width: 80, height: 80)
    let originViewBPosition = CGRect(x: 128, y: UIScreen.main.bounds.height/2 - 4, width: 80, height: 80)
    let originViewCPosition = CGRect(x: 40, y: UIScreen.main.bounds.height/2 + 84, width: 80, height: 80)
    let originViewDPosition = CGRect(x: 128, y: UIScreen.main.bounds.height/2 + 84, width: 80, height: 80)
    let originViewEPosition = CGRect(x: UIScreen.main.bounds.width - 128, y: UIScreen.main.bounds.height/2 - 4, width: 80, height: 80)
    let originViewFPosition = CGRect(x: UIScreen.main.bounds.width - 216, y: UIScreen.main.bounds.height/2 - 4, width: 80, height: 80)
    let originViewGPosition = CGRect(x: UIScreen.main.bounds.width - 128, y: UIScreen.main.bounds.height/2 + 84, width: 80, height: 80)
    let originViewHPosition = CGRect(x: UIScreen.main.bounds.width - 216, y: UIScreen.main.bounds.height/2 + 84, width: 80, height: 80)
    
    
    let placeholderViewA: CustomUIView = {
        let view = CustomUIView()
        view.name = "Placeholder"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        
        return view
    }()
    
    let placeholderViewB: CustomUIView = {
        let view = CustomUIView()
        view.name = "Placeholder"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        
        return view
    }()
    
    lazy var moveGS_A: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "A"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_B: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "B"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_C: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "C"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_D: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Head"
        moveGS.viewName = "D"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_E: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "E"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_F: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "F"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_G: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "G"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var moveGS_H: CustomPanGestureRecognizer = {
        let moveGS = CustomPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.name = "Tail"
        moveGS.viewName = "H"
        moveGS.delegate = self
        
        return moveGS
    }()
    
    lazy var viewA: CustomUIView = {
        let view = CustomUIView()
        view.name = "Head"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.addGestureRecognizer(moveGS_A)
        
        return view
    }()
    
    lazy var viewB: CustomUIView = {
        let view = CustomUIView()
        view.name = "Head"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        view.addGestureRecognizer(moveGS_B)
        
        return view
    }()
    
    lazy var viewC: CustomUIView = {
        let view = CustomUIView()
        view.name = "Head"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.addGestureRecognizer(moveGS_C)
        
        return view
    }()
    
    lazy var viewD: CustomUIView = {
        let view = CustomUIView()
        view.name = "Head"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        view.addGestureRecognizer(moveGS_D)
        
        return view
    }()
    
    lazy var viewE: CustomUIView = {
        let view = CustomUIView()
        view.name = "Tail"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        view.addGestureRecognizer(moveGS_E)
        
        return view
    }()
    
    lazy var viewF: CustomUIView = {
        let view = CustomUIView()
        view.name = "Tail"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.addGestureRecognizer(moveGS_F)
        
        return view
    }()
    
    lazy var viewG: CustomUIView = {
        let view = CustomUIView()
        view.name = "Tail"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        
        view.addGestureRecognizer(moveGS_G)
        
        return view
    }()
    
    lazy var viewH: CustomUIView = {
        let view = CustomUIView()
        view.name = "Tail"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .purple
        view.addGestureRecognizer(moveGS_H)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupView()
    }
    
    func setupView() {
        setupInterfaceComponent()
        setupConstraint()
    }
    
    func setupInterfaceComponent() {
        view.addSubview(placeholderViewA)
        view.addSubview(placeholderViewB)
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
        placeholderViewA.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        placeholderViewA.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        placeholderViewA.widthAnchor.constraint(equalToConstant: 80).isActive = true
        placeholderViewA.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        placeholderViewB.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        placeholderViewB.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        placeholderViewB.widthAnchor.constraint(equalToConstant: 80).isActive = true
        placeholderViewB.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
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
        let name =  sender.name
        let viewName = sender.viewName
        
        if sender.state == .ended {
            
            if (name == "Head") {
                if (placeholderViewA.frame.intersects(sender.view!.frame)) {
                    placeholderViewA.backgroundColor = sender.view?.backgroundColor
                    
                    print("VIEW_NAME_A", viewName)
                }
            } else {
                if (placeholderViewB.frame.intersects(sender.view!.frame)) {
                    placeholderViewB.backgroundColor = sender.view?.backgroundColor
                    
                    print("VIEW_NAME_B", viewName)
                }
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
}
