//
//  QuizCollectionView.swift
//  aksaraMC4
//
//  Created by Naratama on 08/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuizCollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    static let identifier = "QuizCollectionView"
    
//    let collectionView : UICollectionView = {
//
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 0
//        layout.scrollDirection = .vertical
//
//        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
//        cv.backgroundColor = .clear
//
//        cv.bounces = true
//        cv.translatesAutoresizingMaskIntoConstraints =  false
//        return cv
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.setBackgroundColor()
        collectionView?.register(QuizView.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.isPagingEnabled = true
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! QuizView
        print(indexPath.item)
        cell.setBackgroundColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
