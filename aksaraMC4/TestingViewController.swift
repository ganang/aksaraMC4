//
//  TestingViewController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 08/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class TestingViewController: UIViewController {
    
    var delegate: MainViewProtocol?
    var stages: [Stage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        stages?[3].isLocked = true
//        PersistenceService.saveContext()
        delegate?.updateData()
    }
}
