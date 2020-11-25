//
//  TestingViewB.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 21/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class TestingViewB: BaseView {
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    lazy var switchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("SWITCH", for: .normal)
        
        return button
    }()
    
    override func setupViews() {
        addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(switchButton)
        switchButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        switchButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        switchButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
