//
//  BaseView.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 13/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func setupViews(){
        
    }
}
