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
        layout.scrollDirection = .vertical

        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear

        cv.bounces = true
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
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellid2")
//        cellFunction()
        navigationController?.isNavigationBarHidden = true
    }
    
    func settingLayout() {
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid4", for: indexPath) as! QuizCellTypeGuide
        
//        cell.backgroundColor = .red
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("item",indexPath.item)
//        print("section",indexPath.section)
    }
    
    
}
