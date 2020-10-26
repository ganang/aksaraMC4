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
    var regionSelected : String?
    var region : Region? {
        didSet {
            regionSelected = region?.name
        }
    }
    
    var stages : [Stage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regionView = RegionView(frame: self.view.frame)
        self.view = self.regionView
        settingLayoutRegion()
        tapFunction()
    }
    
    func settingLayoutRegion() {
        if regionSelected == "Jawa" {
            regionView.backButtonTitle.text = "Aksara Jawa"

            regionView.menuImageIcon.image = UIImage(named: "mainAksaraJawa")
            regionView.mainCardTitle.text = "Main"
            regionView.mainCardSubtitle1.text = "Berlatih dengan bermain"
            regionView.mainCardSubtitle2.text = "Membaca, mendengar dan menulis"

            regionView.kamusImageIcon.image = UIImage(named: "kamusAksaraJawa")
            regionView.kamusCardTitle.text = "Kamus"
            regionView.kamusCardSubtitle1.text = "Kamus Aksara Jawa"
            regionView.kamusCardSubtitle2.text = "Carakan, Sandhangan, Angka, Swara"
        } else if regionSelected == "Sunda" {
            regionView.backButtonTitle.text = "Akara Sunda"
            
            regionView.menuImageIcon.image = UIImage(named: "mainAksaraSunda")
            regionView.mainCardTitle.text = "Main"
            regionView.mainCardSubtitle1.text = "Berlatih dengan bermain"
            regionView.mainCardSubtitle2.text = "Membaca, mendengar dan menulis"
            
            regionView.kamusImageIcon.image = UIImage(named: "kamusAksaraSunda")
            regionView.kamusCardTitle.text = "Kamus"
            regionView.kamusCardSubtitle1.text = "Kamus Aksara Jawa"
            regionView.kamusCardSubtitle2.text = "Ngalegena, Wilangan, Rarangken, Swara"
        }
    }
    
    func tapFunction() {
        let tapMain = UITapGestureRecognizer(target: self, action: #selector(self.tapMain))
        regionView.menuCard.addGestureRecognizer(tapMain)
        
        let tapKamus = UITapGestureRecognizer(target: self, action: #selector(self.tapKamus))
        regionView.kamusCard.addGestureRecognizer(tapKamus)
        
        regionView.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    
    @objc func tapMain() {
        self.stages = region?.stages?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Stage]
        let levels = stages![0].levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        
        for i in 0...levels!.count-1 {
            let level = levels?[i]
            
//            print(level?.isLocked)
        }
        
        
        let stageScreen = StageController()
        stageScreen.regionSelected = regionSelected
        stageScreen.stages = stages
        navigationController?.pushViewController(stageScreen, animated: true)
    }
    
    
    @objc func tapKamus() {
        let dictionaryScreen = DictionaryController()
        dictionaryScreen.regionSelected = regionSelected
        navigationController?.pushViewController(dictionaryScreen, animated: true)
    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }

}

