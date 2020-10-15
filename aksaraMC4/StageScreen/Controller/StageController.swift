//
//  StageController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 08/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class StageController: UIViewController {
    
    private var stageView: StageView!
    var regionSelected : String?
    var tahap1Model: Stage?
    var tahap2Model: Stage?
    var tahap3Model: Stage?
    var tahap4Model: Stage?
    var stages : [Stage]? {
        didSet {
            tahap1Model = stages![0]
            tahap2Model = stages![1]
            tahap3Model = stages![2]
            tahap4Model = stages![3]
        }
    }

    var levels : [Level]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.stageView = StageView(frame: self.view.frame)
        self.view = self.stageView
        tapFunction()
        settingLayout()
        

    }
    
    func settingLayout() {
        stageView.backButtonTitle.text = "Main Aksara \(regionSelected ?? "")"
        let view = stageView
        if tahap1Model?.isLocked == true {
            view?.tahap1Card.alpha = 0.3
        } else if tahap2Model?.isLocked == true {
            view?.tahap2Card.alpha = 0.3
        } else if tahap3Model?.isLocked == true {
            view?.tahap3Card.alpha = 0.3
        } else if tahap4Model?.isLocked == true {
            view?.tahap4Card.alpha = 0.3
        }
        
        
        if regionSelected == "Jawa" {
            view?.tahap1progresLabel.text = "\(tahap1Model?.currentMedal ?? 0) / \(tahap1Model?.totalMedal ?? 0)"
            view?.tahap1CardTitle.text = "Tahap 1"
            view?.tahap1ImageIcon.image = UIImage(named: "tahap1CardAksaraJawa")
            view?.tahap1CardSubtitle1.text = "Aksara Jawa"
            view?.tahap1CardSubtitle2.text = "Carakan"
            
            view?.tahap2progresLabel.text = "\(tahap2Model?.currentMedal ?? 0) / \(tahap2Model?.totalMedal ?? 0)"
            view?.tahap2CardTitle.text = "Tahap 2"
            view?.tahap2ImageIcon.image = UIImage(named: "tahap2CardAksaraJawa")
            view?.tahap2CardSubtitle1.text = "Aksara Jawa"
            view?.tahap2CardSubtitle2.text = "Carakan + 1 Sandhangan"
            
            view?.tahap3progresLabel.text = "\(tahap3Model?.currentMedal ?? 0) / \(tahap3Model?.totalMedal ?? 0)"
            view?.tahap3CardTitle.text = "Tahap 3"
            view?.tahap3ImageIcon.image = UIImage(named: "tahap3CardAksaraJawa")
            view?.tahap3CardSubtitle1.text = "Aksara Jawa"
            view?.tahap3CardSubtitle2.text = "Carakan + 2 Sandhangan"
            
            view?.tahap4progresLabel.text = "\(tahap4Model?.currentMedal ?? 0) / \(tahap4Model?.totalMedal ?? 0)"
            view?.tahap4CardTitle.text = "Tahap 4"
            view?.tahap4ImageIcon.image = UIImage(named: "tahap4CardAksaraJawa")
            view?.tahap4CardSubtitle1.text = "Aksara Jawa"
            view?.tahap4CardSubtitle2.text = "2 Carakan + Pasangan + Sandhangan"
            view?.tahap4CardSubtitle2.numberOfLines = 2

            
        } else if regionSelected == "Sunda" {

            view?.tahap1progresLabel.text = "\(tahap1Model?.currentMedal ?? 0) / \(tahap1Model?.totalMedal ?? 0)"
            view?.tahap1CardTitle.text = "Tahap 1"
            view?.tahap1ImageIcon.image = UIImage(named: "tahap1CardAksaraSunda")
            view?.tahap1CardSubtitle1.text = "Ngalagena, Swara"
            view?.tahap1CardSubtitle2.text = "Carakan"
            
            view?.tahap2progresLabel.text = "\(tahap2Model?.currentMedal ?? 0) / \(tahap2Model?.totalMedal ?? 0)"
            view?.tahap2CardTitle.text = "Tahap 2"
            view?.tahap2ImageIcon.image = UIImage(named: "tahap2CardAksaraSunda")
            view?.tahap2CardSubtitle1.text = "Aksara Sunda"
            view?.tahap2CardSubtitle2.text = "Ngalegena + 1 Rarangken"
            
            view?.tahap3progresLabel.text = "\(tahap3Model?.currentMedal ?? 0) / \(tahap3Model?.totalMedal ?? 0)"
            view?.tahap3CardTitle.text = "Tahap 3"
            view?.tahap3ImageIcon.image = UIImage(named: "tahap3CardAksaraSunda")
            view?.tahap3CardSubtitle1.text = "Aksara Sunda"
            view?.tahap3CardSubtitle2.text = "Ngalegena + 2 Rarangken"
            
            view?.tahap4progresLabel.text = "\(tahap4Model?.currentMedal ?? 0) / \(tahap4Model?.totalMedal ?? 0)"
            view?.tahap4CardTitle.text = "Tahap 4"
            view?.tahap4ImageIcon.image = UIImage(named: "tahap4CardAksaraSunda")
            view?.tahap4CardSubtitle1.text = "Aksara Sunda"
            view?.tahap4CardSubtitle2.text = "2 Ngalegena + 1&2 Rarangken"
            view?.tahap4CardSubtitle2.numberOfLines = 2

        }
    }
    
    func tapFunction() {
        let tapTahap1 = UITapGestureRecognizer(target: self, action: #selector(self.tapTahap1))
        stageView.tahap1Card.addGestureRecognizer(tapTahap1)
        
        let tapTahap2 = UITapGestureRecognizer(target: self, action: #selector(self.tapTahap2))
        stageView.tahap2Card.addGestureRecognizer(tapTahap2)
        
        let tapTahap3 = UITapGestureRecognizer(target: self, action: #selector(self.tapTahap3))
        stageView.tahap3Card.addGestureRecognizer(tapTahap3)
        
        let tapTahap4 = UITapGestureRecognizer(target: self, action: #selector(self.tapTahap4))
        stageView.tahap4Card.addGestureRecognizer(tapTahap4)
        
        stageView.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
    }
    
    @objc func tapTahap1() {
        let levelScreen = LevelController()
        levelScreen.levelCurrentMedal = Int64(tahap1Model!.currentMedal)
        levelScreen.currentStage = 1
        
        levelScreen.levels = tahap1Model?.levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        
        levelScreen.regionSelected = regionSelected
        navigationController?.pushViewController(levelScreen, animated: true)
    }
    
    @objc func tapTahap2() {
        let levelScreen = LevelController()
        levelScreen.levelCurrentMedal = Int64(tahap2Model!.currentMedal)
        levelScreen.currentStage = 2
        levelScreen.levels = tahap2Model?.levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        levelScreen.regionSelected = regionSelected
        navigationController?.pushViewController(levelScreen, animated: true)
    }

    @objc func tapTahap3() {
        let levelScreen = LevelController()
        levelScreen.levelCurrentMedal = Int64(tahap3Model!.currentMedal)
        levelScreen.currentStage = 3
        levelScreen.levels = tahap3Model?.levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        levelScreen.regionSelected = regionSelected
        navigationController?.pushViewController(levelScreen, animated: true)
    }
    
    @objc func tapTahap4() {
        let levelScreen = LevelController()
        levelScreen.levelCurrentMedal = Int64(tahap4Model!.currentMedal)
        levelScreen.currentStage = 4
        levelScreen.levels = tahap4Model?.levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        levelScreen.regionSelected = regionSelected
        navigationController?.pushViewController(levelScreen, animated: true)
    }
    
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }

}

