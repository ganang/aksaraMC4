//
//  LevelV2Controller.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 30/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class LevelV2Controller: UIViewController {

    private var levelV2View: LevelV2View!
    var customContainerViewArray : [CustomUIView]?
    var loadingView : LoadingView!
    var cv1 : UICollectionView? = nil
    var cv2 : UICollectionView? = nil
    var cv3 : UICollectionView? = nil
    var quizes : [Quiz]?
    var level: Level?
    
    var level1Model: Level?
    var currentLevel: Int?
    var currentStage: Int?
    var levelsStage1 : [Level]? {
        didSet {
        }
    }
    
    var levelsStage2 : [Level]?
    var levelsStage3 : [Level]?
    
    var stages : [Stage]? {
        didSet {
        }
    }
    
    var username : String?
    var regionSelected : String?
    var region : Region? {
        didSet {
            regionSelected = region?.name
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.levelV2View = LevelV2View(frame: self.view.frame)
        self.loadingView = LoadingView(frame: self.view.frame)
        self.view = self.levelV2View
        
        showLoading()
//        print(UserDefaults.standard.object)
        // Do any additional setup after loading the view.
        navigationController?.isNavigationBarHidden = true
        navigationItem.title = "Kuis Aksara Jawa"
        customContainerViewArray = [levelV2View.containerViewTahap1, levelV2View.containerViewTahap2, levelV2View.containerViewTahap3]
        
        openAndCloseFunction(container: 0)
        handleData()
        setupCurrentLevelStage1()
        registerCV()
        tapContainerFunction()
        tapContinueButton()
        setupUsername()
    }
    
    func setupUsername() {
        let username: String = (region?.user?.name)!
        
        levelV2View.greetingLabel.text = "Selamat Datang, \(username)"
    }
    
    func tapContinueButton() {
        levelV2View.continueButton.addTarget(self, action: #selector(goToCurrentLevel), for: .touchUpInside)
        
        
    }
    
    @objc func goToCurrentLevel() {
        let quickStart = QuickStartViewController()
        navigationController?.pushViewController(quickStart, animated: true)
        
//        gotoQuizLevelTahap1(index: currentLevel! - 1)
    }
    
    func handleData() {
        
        self.stages = region?.stages?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Stage]
//        levelScreen.levels = tahap1Model?.levels!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        
        //stage 1
        levelV2View.tahap1progresLabel.text = "\(stages![0].currentMedal) / \(stages![0].totalMedal )" ?? ""
        levelV2View.tahap2progresLabel.text = "\(stages![1].currentMedal) / \(stages![1].totalMedal)" ?? ""
        levelV2View.tahap3progresLabel.text = "\(stages![2].currentMedal) / \(stages![2].totalMedal)" ?? ""
        
    }
    
    func setupCurrentLevelStage1() {

        for i in 0...levelsStage1!.count-1 {
            if i == 0 {

                if levelsStage1![1].isLocked == true {
                    self.currentLevel = 1
                    break
                }
            } else if i == 11 {

                if levelsStage1![10].isLocked == false {
                    self.currentLevel = 12
                    break
                }
            } else if i>0 && i<11 {

                if levelsStage1![i-1].isLocked == false && levelsStage1![i+1].isLocked == true {
                    self.currentLevel = i+1
                    break
                }
            }
        }
        
        //for quickstart
        
//        levelV2View.buttonLabel.text = "Lanjutkan Tahap 1 : Tingkat \(currentLevel!)"
    }
    
    func showLoading() {

        view.addSubview(loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.5) { [self] in

            UIView.animate(withDuration: 0.5) {
//                loadingView.alpha = 0
            } completion: { (succes) in
                self.loadingView.removeFromSuperview()
            }
            

        }

    }
    
//    func goToQuizSection() {
//        let quizScreen = QuizController()
//        quizScreen.regionSelected = regionSelected
//
//    }
    
    func registerCV() {
        levelV2View.collectionViewTahap1.delegate = self
        levelV2View.collectionViewTahap1.dataSource = self
        
        levelV2View.collectionViewTahap2.delegate = self
        levelV2View.collectionViewTahap2.dataSource = self
        
        levelV2View.collectionViewTahap3.delegate = self
        levelV2View.collectionViewTahap3.dataSource = self
        
        levelV2View.collectionViewTahap1.register(StageTahap1Cell.self, forCellWithReuseIdentifier: "cellid1")
        levelV2View.collectionViewTahap2.register(StageTahap2Cell.self, forCellWithReuseIdentifier: "cellid2")
        levelV2View.collectionViewTahap3.register(StageTahap3Cell.self, forCellWithReuseIdentifier: "cellid3")
    }
    
    func tapContainerFunction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(openDetailTahap))
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(openDetailTahap))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(openDetailTahap))
        levelV2View.containerViewTahap1.addGestureRecognizer(tap)
    }
    
    func gotoQuizLevelTahap1(index: Int) {

        let quizScreen = QuizController()
 
        self.quizes = levelsStage1![index].quizes!.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Quiz]
        self.level = levelsStage1?[index]
        quizScreen.quizes = quizes
        quizScreen.regionSelected = regionSelected
        quizScreen.levels = levelsStage1
        quizScreen.level = level
        navigationController?.pushViewController(quizScreen, animated: true)
    }
    
    @objc func openDetailTahap(_ sender: UITapGestureRecognizer) {

        openAndCloseFunction(container: sender.view!.tag)
    }
    
    func openAndCloseFunction(container: Int) {

        if container == 0 {
            if customContainerViewArray![0].isOpen == false {
                customContainerViewArray![0].isOpen = true
                customContainerViewArray![1].isOpen = false
                customContainerViewArray![2].isOpen = false
            } else {
                customContainerViewArray![0].isOpen = false
                customContainerViewArray![1].isOpen = false
                customContainerViewArray![2].isOpen = false
            }
        } else if container == 1 {
            if customContainerViewArray![1].isOpen == false {
                customContainerViewArray![0].isOpen = false
                customContainerViewArray![1].isOpen = true
                customContainerViewArray![2].isOpen = false
            } else {
                customContainerViewArray![0].isOpen = false
                customContainerViewArray![1].isOpen = false
                customContainerViewArray![2].isOpen = false
            }
        } else if container == 2 {
            if customContainerViewArray![2].isOpen == false {
                customContainerViewArray![0].isOpen = false
                customContainerViewArray![1].isOpen = false
                customContainerViewArray![2].isOpen = true
            } else {
                customContainerViewArray![0].isOpen = false
                customContainerViewArray![1].isOpen = false
                customContainerViewArray![2].isOpen = false
            }
        }
        
        
        if customContainerViewArray![0].isOpen == false && customContainerViewArray![1].isOpen == false && customContainerViewArray![2].isOpen == false {
            //semua tertutup
            levelV2View.containerViewHeightAnchor2?.isActive = false
            levelV2View.containerViewHeightAnchor1?.isActive = true

            levelV2View.secondContainerTopAnchor2?.isActive = false
            levelV2View.secondContainerTopAnchor1?.isActive = true

            levelV2View.thirdContainerTopAnchor2?.isActive = false
            levelV2View.thirdContainerTopAnchor1?.isActive = true
            
            levelV2View.detailContainerView1.removeFromSuperview()
            levelV2View.detailContainerView2.removeFromSuperview()
            levelV2View.detailContainerView3.removeFromSuperview()
            
        } else if customContainerViewArray![0].isOpen == true && customContainerViewArray![1].isOpen == false && customContainerViewArray![2].isOpen == false {
            //tahap 1 terbuka
            levelV2View.containerViewHeightAnchor1?.isActive = false
            levelV2View.containerViewHeightAnchor2?.isActive = true

            levelV2View.secondContainerTopAnchor1?.isActive = false
            levelV2View.secondContainerTopAnchor2?.isActive = true

            levelV2View.thirdContainerTopAnchor2?.isActive = false
            levelV2View.thirdContainerTopAnchor1?.isActive = true

            
            levelV2View.setupCV1()
            levelV2View.detailContainerView2.removeFromSuperview()
            levelV2View.detailContainerView3.removeFromSuperview()
            
            
        } else if customContainerViewArray![0].isOpen == false && customContainerViewArray![1].isOpen == true && customContainerViewArray![2].isOpen == false {
            //tahap 2 terbuka

            levelV2View.containerViewHeightAnchor1?.isActive = false
            levelV2View.containerViewHeightAnchor2?.isActive = true
            
            levelV2View.secondContainerTopAnchor2?.isActive = false
            levelV2View.secondContainerTopAnchor1?.isActive = true
            
            levelV2View.thirdContainerTopAnchor1?.isActive = false
            levelV2View.thirdContainerTopAnchor2?.isActive = true

            levelV2View.detailContainerView1.removeFromSuperview()
            levelV2View.setupCV2()
            levelV2View.detailContainerView3.removeFromSuperview()
            
        } else if customContainerViewArray![0].isOpen == false && customContainerViewArray![1].isOpen == false && customContainerViewArray![2].isOpen == true {
            //tahap 3 terbuka

            levelV2View.containerViewHeightAnchor1?.isActive = false
            levelV2View.containerViewHeightAnchor2?.isActive = true
            
            levelV2View.secondContainerTopAnchor2?.isActive = false
            levelV2View.secondContainerTopAnchor1?.isActive = true
            
            levelV2View.thirdContainerTopAnchor2?.isActive = false
            levelV2View.thirdContainerTopAnchor1?.isActive = true

            
            levelV2View.detailContainerView1.removeFromSuperview()
            levelV2View.detailContainerView2.removeFromSuperview()
            levelV2View.setupCV3()
            
        }
    }
}

extension LevelV2Controller : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == levelV2View.collectionViewTahap1 {
            return levelsStage1!.count
        } else if collectionView == levelV2View.collectionViewTahap2 {
            return 12
        } else if collectionView == levelV2View.collectionViewTahap3 {
            return 12
        } else {
            return 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == levelV2View.collectionViewTahap1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid1", for: indexPath) as! StageTahap1Cell
            cell.levelData = levelsStage1![indexPath.item]
            cell.currentLevel = self.currentLevel
            cell.indexPath = indexPath.item + 1
            return cell
        } else if collectionView == levelV2View.collectionViewTahap2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! StageTahap2Cell
            
            return cell
        } else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid3", for: indexPath) as! StageTahap3Cell
            
            return cell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width/3 - 60, height: 180)
        return CGSize(width: 303, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("level ke", indexPath.item + 1)
        
        let levelTapped = indexPath.item + 1
//        if indexPath.item == 0 {
//            gotoQuizLevelTahap1(index: indexPath.item)
//        }

        
    }
}
