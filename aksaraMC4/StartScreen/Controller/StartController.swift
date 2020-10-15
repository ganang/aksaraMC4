//
//  StartController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 10/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class StartController: UIViewController {
    
    private var startView: StartView!
    var stages: [Stage]?
    var regions: [Region]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.startView = StartView(frame: self.view.frame)
        self.view = self.startView
        getUserData()
        tapFunction()
    }
    
    func getUserData() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let idSort = NSSortDescriptor(key:"id", ascending:true)
        fetchRequest.sortDescriptors = [idSort]
        
        do {
            let users = try PersistenceService.context.fetch(fetchRequest)
            
            let user: User = users[0]
            self.regions = user.regions?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Region]
            
            
        } catch {
            print("ERROR")
        }
    }
    
    func tapFunction() {
        let tapSunda = UITapGestureRecognizer(target: self, action: #selector(self.tapSunda))
        startView.sundaButton.addGestureRecognizer(tapSunda)
        
        let tapJawa = UITapGestureRecognizer(target: self, action: #selector(self.tapJawa))
        startView.jawaButton.addGestureRecognizer(tapJawa)
    }
    
    @objc func tapSunda() {
        let regionScreen = RegionController()
        regionScreen.region = self.regions![1]
        navigationController?.pushViewController(regionScreen, animated: true)
    }
    
    @objc func tapJawa() {
        
        let regionScreen = RegionController()
        regionScreen.region = self.regions![0]
        
        let stages = regions![0].stages?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Stage]
        let levels = stages![0].levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        
        for i in 0...levels!.count-1 {
            let level = levels?[i]
            
//            print(level?.isLocked)
        }
        
        navigationController?.pushViewController(regionScreen, animated: true)
        
    }
    
    

}