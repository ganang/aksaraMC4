//
//  RegionController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class RegionController: UIViewController {
    
    private var regionView: RegionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.setBackgroundColor()
        self.regionView = RegionView(frame: self.view.frame)
        self.view = self.regionView

    }
    
    
    
    


}

