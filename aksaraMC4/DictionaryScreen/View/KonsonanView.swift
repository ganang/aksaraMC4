//
//  KonsonanView.swift
//  aksaraMC4
//
//  Created by Naratama on 23/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class KonsonanView: UIViewController {

    private let konsonanCellId = "konsonanCellId"
    private var konsonanView: KonsonanView!
    
    var regionSelected : String?
    var region : Region? {
        didSet {
            regionSelected = region?.name
        }
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        //button.subviews.first?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        return button
    }()
    
    let backButtonTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 32)
        label.text = "Kamus Aksara"
        label.textColor = Theme.current.textColor1
        //label.setTextColorToGradient(image: UIImage(named: "gradientText")!)
        return label
    }()
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero , collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        cv.isScrollEnabled = false
        cv.bounces = true
        cv.translatesAutoresizingMaskIntoConstraints =  false
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackgroundColor()
        self.setupView()
        registerCV()
        setupDelegate()
        settingLayoutRegion()
    }
    
    func settingLayoutRegion() {
        if regionSelected == "Jawa" {
            backButtonTitle.text = "Aksara Jawa - Carakan"
        } else if regionSelected == "Sunda" {
            backButtonTitle.text = "Aksara Sunda - Ngalegena"
        }
    }
    
    func registerCV() {
        collectionView.register(KonsonanCell.self, forCellWithReuseIdentifier: konsonanCellId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "example")
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupView() {
    
        view.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.03350083752).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.06714628297).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        view.addSubview(backButtonTitle)
        backButtonTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 0).isActive = true
        backButtonTitle.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: view.frame.width * 0.02680067002).isActive = true
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: backButtonTitle.bottomAnchor, constant: view.frame.height * 0.07673860911),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.width * 0.1381909548),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -view.frame.width * 0.1381909548),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension KonsonanView : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: konsonanCellId, for: indexPath) as! KonsonanCell
         return cell
//         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "example", for: indexPath)
//         cell.backgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.6)
//         cell.addInnerShadow()
//         cell.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
//         cell.layer.cornerRadius = 24
//         cell.layer.masksToBounds = false
//         cell.translatesAutoresizingMaskIntoConstraints =  false
         
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//       return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(16)
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 120)
    }
    
    
}
