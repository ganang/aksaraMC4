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
    private var chooseRegionView: ChooseRegionView!
//    private var ulasanView: UlasanView!
    var user : User?
    var username : String?
    
    var stages: [Stage]?
    var regions: [Region]?
    
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.chooseRegionView = ChooseRegionView(frame: self.view.frame)
        self.view = self.chooseRegionView
//        getUserData()
        tapFunction()
        
        
        // handle first setup
//        setupRecord()
        getUserData()
        
    }
    
    override public var shouldAutorotate: Bool {
        return false
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    override public var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .landscapeRight
    }
    
    func setupRecord() {
        if UserDefaults.standard.object(forKey: "FirstLoad") != nil {
            getUserData()
        } else {
            CoreDataRecordV2.shared.saveRecord()
            getUserData()
            UserDefaults.standard.set(true, forKey: "FirstLoad")
        }
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
//        startView.sundaButton.addGestureRecognizer(tapSunda)
        
        let tapJawa = UITapGestureRecognizer(target: self, action: #selector(self.tapJawa))
        chooseRegionView.aksaraView1.addGestureRecognizer(tapJawa)
    }
    
    
    
    @objc func tapSunda() {
        let regionScreen = RegionController()
        regionScreen.region = self.regions![1]
        navigationController?.pushViewController(regionScreen, animated: true)
    }
    
    @objc func tapJawa() {
        
        let levelScreen = LevelV2Controller()
        UserDefaults.standard.set(true, forKey: "FirstLoad")
        levelScreen.region = self.regions![0]
        levelScreen.username = self.username
//        levelScreen.user = self.user
//        print("user", user?.name)
//        print("username", username)
//        UserDefaults.standard.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
        
        
        let regionScreen = RegionController()
        regionScreen.region = self.regions![0]
        
        
//        self.stages = region?.stages?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Stage]
        
        let stages = regions![0].stages?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Stage]
        let levels1 = stages![0].levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        let levels2 = stages![1].levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        let levels3 = stages![2].levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        levelScreen.levelsStage1 = levels1
        levelScreen.levelsStage2 = levels2
        levelScreen.levelsStage3 = levels3
        
        
        navigationController?.pushViewController(levelScreen, animated: true)
        
    }
    
    

}
