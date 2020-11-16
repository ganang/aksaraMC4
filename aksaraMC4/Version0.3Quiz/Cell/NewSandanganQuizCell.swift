//
//  NewSandanganQuizCell.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 15/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class NewSandanganQuizCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Batik BackgroundNew")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
//        
//       
//        setupView()
//        setupCircleLayers()
        setBackgroundDragnDrop()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
