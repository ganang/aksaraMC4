//
//  TestingController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 21/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class TestingController: UIViewController {
    
    var viewA: TestingViewA!
    var viewB: TestingViewB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.viewA = TestingViewA(frame: self.view.frame)
        self.viewB = TestingViewB(frame: self.view.frame)
        
        self.view = viewA
        self.viewA.switchButton.addTarget(self, action: #selector(handleSwitchButtonA), for: .touchUpInside)
        self.viewB.switchButton.addTarget(self, action: #selector(handleSwitchButtonB), for: .touchUpInside)
    }
    
    @objc func handleSwitchButtonA() {
        UIView.transition(with: viewA, duration: 1, options: [.transitionCrossDissolve], animations: {
            self.view.alpha = 0.6
        }) { _ in
            UIView.transition(with: self.viewB, duration: 1, options: [.transitionCrossDissolve], animations: {
                self.view = self.viewB
                self.view.alpha = 1
            })
        }
    }
    
    @objc func handleSwitchButtonB() {
        UIView.transition(with: viewB, duration: 1, options: [.transitionCrossDissolve], animations: {
            self.view.alpha = 0.6
        }) { _ in
            UIView.transition(with: self.viewA, duration: 1, options: [.transitionCrossDissolve], animations: {
                self.view = self.viewA
                self.view.alpha = 1
            })
        }
    }
}
