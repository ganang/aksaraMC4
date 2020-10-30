//
//  BaseCell.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 30/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

