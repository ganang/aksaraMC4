//
//  StageTahap3Cell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 01/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class StageTahap3Cell: UICollectionViewCell {
    
    lazy var containerView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "TahapDoneCard")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
