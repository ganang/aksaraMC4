//
//  QuizDummyController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 26/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuizDummyController: UIViewController {
    
    
    let collectionView : UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 6
        layout.scrollDirection = .horizontal

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear

        cv.bounces = false
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.regionView = RegionView(frame: self.view.frame)
//        self.view = self.regionView
        view.backgroundColor = .darkGray
        settingLayout()
//        cellFunction()
        
        collectionView.register(QuizCellTypeH.self, forCellWithReuseIdentifier: "cellid")
        collectionView.register(QuizCellTypeI.self, forCellWithReuseIdentifier: "cellid2")
        collectionView.register(QuizView.self, forCellWithReuseIdentifier: "cellid3")
        collectionView.register(QuizCellTypeGuide.self, forCellWithReuseIdentifier: "cellid4")
        collectionView.register(NewGuideCell.self, forCellWithReuseIdentifier: "cellid5")
        collectionView.register(NewGuideMLCell.self, forCellWithReuseIdentifier: "cellid6")
        collectionView.register(NewHeadnTailDDCell.self, forCellWithReuseIdentifier: "cellid7")
        collectionView.register(NewSandanganQuizCell.self, forCellWithReuseIdentifier: "cellid8")
        collectionView.register(NewPanduanFirstCell.self, forCellWithReuseIdentifier: "cellid9")
        collectionView.register(NewRewardCell.self, forCellWithReuseIdentifier: "cellid10")
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid2")
//        cellFunction()
        navigationController?.isNavigationBarHidden = true
    }
    
    func settingLayout() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
//    func cellFunction() {
//        let index = IndexPath(item: 0, section: 0)
//
//        let cell = collectionView.cellForItem(at: index) as? TypeNewMix2Cell
//
//        cell!.button1Aksara.addTarget(self, action: #selector(button1AksaraTapped), for: .touchUpInside)
//    }
    
//    @objc func button1AksaraTapped() {
//        print("tapped")
//    }
    
    
}

extension QuizDummyController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid4", for: indexPath) as! QuizCellTypeGuide
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid2", for: indexPath) as! QuizCellTypeI
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid5", for: indexPath) as! NewGuideCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid6", for: indexPath) as! NewGuideMLCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid7", for: indexPath) as! NewHeadnTailDDCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid8", for: indexPath) as! NewSandanganQuizCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid9", for: indexPath) as! NewPanduanFirstCell
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid10", for: indexPath) as! NewRewardCell
        
//        cell.backgroundColor = .red
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("item",indexPath.item)
//        print("section",indexPath.section)
    }
    
    
}
