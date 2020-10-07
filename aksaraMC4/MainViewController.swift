//
//  ViewController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Black", size: 18)
        label.textColor = .blue
        label.text = "Nopal"
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.setBackgroundColor()
        view.backgroundColor = .white
        view.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    


}

