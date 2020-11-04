//
//  LoadingController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 02/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class LoadingController: UIViewController {
    
    private var loadingView: LoadingView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView = LoadingView(frame: self.view.frame)
        self.view = self.loadingView
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
