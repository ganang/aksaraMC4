//
//  StartController.swift
//  aksaraMC4
//
//  Created by Naratama on 10/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class UlasanController: UIViewController {
    
    private let ulasanCellId = "ulasanCellId"
    private var ulasanCell: UlasanCell!
    
    var stages: [Stage]?
    var regions: [Region]?
    
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    var containerViewHeightAnchor1: NSLayoutConstraint?
    var containerViewHeightAnchor2: NSLayoutConstraint?
    
    //Label
    let aksaraLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Aksara Jawa"
        return label
    }()
    
    let tahapLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Tahap 1 - Tingkat 1"
        return label
    }()
    
    let carakanLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        let firstWord   = ""
        let secondWord = "Aksara Jawa\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Bold", size: 24), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attrs2      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Carakan"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let hasilLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 16)
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        label.text = "Hasil kamu"
        return label
    }()
    
    let waktuQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 13
        
        let firstWord   = ""
        let secondWord = "Waktu\n"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1), NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let thirdWord   = "Kuis benar"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        
        return label
    }()
    
    let waktuDoneQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = ": 4 mnt 30 dtk"
        
        return label
    }()
    
    let benarDoneQuizLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let firstWord   = ""
        let secondWord = ": 14 kuis"
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Medium", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)]
        let attrs2     = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 16), NSAttributedString.Key.foregroundColor: UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)]
        let thirdWord   = " dari 18 kuis"
        let attributedText = NSMutableAttributedString(string:firstWord)
        attributedText.append(NSAttributedString(string: secondWord, attributes: attrs as [NSAttributedString.Key : Any]))
        attributedText.append(NSAttributedString(string: thirdWord, attributes: attrs2 as [NSAttributedString.Key : Any]))
        label.attributedText = attributedText
        return label
    }()
    
    let aksaraLabelInTopCard1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Wa"
        return label
    }()
    
    let aksaraLabelInTopCard2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Ha"
        return label
    }()
    
    let aksaraLabelInTopCard3: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        label.text = "Na"
        return label
    }()
    
    //UIView & Image
    lazy var AksaraCardContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 0
        view.addInnerShadow()
        view.backgroundColor = UIColor.init(white: 1, alpha: 1)
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        return view
    }()
    
    let aksaraInTopCard1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named:"Jawa Jawaban Wa")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let aksaraInTopCard2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Jawaban Ha")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let aksaraInTopCard3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Jawa Jawaban Na")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    //SFSymbol
    let timer: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "timer", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let checkmark: UIImageView = {
        let image = UIImageView()
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 16.0, weight: .medium, scale: .default)
        image.image = UIImage(systemName: "checkmark.circle", withConfiguration: symbolConfig)?.withTintColor(UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1), renderingMode: .alwaysOriginal)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    //Button
    lazy var backButton : UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        if let image = UIImage(named: "backIcon") {
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 10)
        button.tintColor = Theme.current.textColor1
        button.backgroundColor = .init(white: 1, alpha: 0.6)
        button.layer.cornerRadius = 24
        button.clipsToBounds = true
        button.addInnerShadow()
        button.layer.applySketchShadow(color: UIColor.init(displayP3Red: 3/255, green: 131/255, blue: 251/255, alpha: 1), alpha: 0.1, x: 0, y: 8, blur: 12, spread: 0)
        button.layer.masksToBounds = false
        
        return button
    }()
    
    //ScrollView
    lazy var scrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.isUserInteractionEnabled = true
        
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.isUserInteractionEnabled = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    
    @objc func handleBack() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        view.setBackgroundColor()
        self.setupScrollView()
        registerCV()
        setupDelegate()
        
        setupViewHeader()
        
    }
    
    
    func registerCV() {
        collectionView.register(UlasanCell.self, forCellWithReuseIdentifier: ulasanCellId)
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
    }
    
    func setupDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupScrollView() {
        containerViewHeightAnchor1 = containerView.heightAnchor.constraint(equalToConstant: 952)
        containerViewHeightAnchor2 = containerView.heightAnchor.constraint(equalToConstant: 1920)
        
        view.addSubview(scrollView)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerViewHeightAnchor2?.isActive = true
        
        containerView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 499),
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: view.frame.width * 0.08793969849),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -view.frame.width * 0.08793969849),
            collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func setupViewHeader() {
        containerView.addSubview(aksaraLabel)
        aksaraLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        aksaraLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -910).isActive = true
        
        containerView.addSubview(tahapLabel)
        tahapLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        tahapLabel.topAnchor.constraint(equalTo: aksaraLabel.bottomAnchor, constant: 12).isActive = true
        
        containerView.addSubview(backButton)
        backButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: -896).isActive = true
        backButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: view.frame.width * 0.03350083752).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true

        //CardAksara
        containerView.addSubview(AksaraCardContainer)
        AksaraCardContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -247).isActive = true
        AksaraCardContainer.topAnchor.constraint(equalTo: tahapLabel.bottomAnchor, constant: 66).isActive = true
        AksaraCardContainer.widthAnchor.constraint(equalToConstant: 487).isActive = true
        AksaraCardContainer.heightAnchor.constraint(equalToConstant: 280).isActive = true
        
        //ImageAksara
        AksaraCardContainer.addSubview(aksaraInTopCard2)
        aksaraInTopCard2.centerXAnchor.constraint(equalTo: AksaraCardContainer.centerXAnchor).isActive = true
        aksaraInTopCard2.centerYAnchor.constraint(equalTo: AksaraCardContainer.centerYAnchor, constant: -15).isActive = true
        aksaraInTopCard2.heightAnchor.constraint(equalToConstant: 32).isActive = true
        aksaraInTopCard2.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        AksaraCardContainer.addSubview(aksaraInTopCard1)
        aksaraInTopCard1.trailingAnchor.constraint(equalTo: aksaraInTopCard2.leadingAnchor,constant: -8).isActive = true
        aksaraInTopCard1.centerYAnchor.constraint(equalTo: AksaraCardContainer.centerYAnchor, constant: -15).isActive = true
        aksaraInTopCard1.heightAnchor.constraint(equalToConstant: 32).isActive = true
        aksaraInTopCard1.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        AksaraCardContainer.addSubview(aksaraInTopCard3)
        aksaraInTopCard3.leadingAnchor.constraint(equalTo: aksaraInTopCard2.trailingAnchor, constant: 8).isActive = true
        aksaraInTopCard3.centerYAnchor.constraint(equalTo: AksaraCardContainer.centerYAnchor, constant: -15).isActive = true
        aksaraInTopCard3.heightAnchor.constraint(equalToConstant: 32).isActive = true
        aksaraInTopCard3.widthAnchor.constraint(equalToConstant: 52).isActive = true
        
        //LabelAksara
        AksaraCardContainer.addSubview(aksaraLabelInTopCard1)
        aksaraLabelInTopCard1.centerXAnchor.constraint(equalTo: aksaraInTopCard1.centerXAnchor).isActive = true
        aksaraLabelInTopCard1.topAnchor.constraint(equalTo: aksaraInTopCard1.bottomAnchor, constant: 10).isActive = true
        
        AksaraCardContainer.addSubview(aksaraLabelInTopCard2)
        aksaraLabelInTopCard2.centerXAnchor.constraint(equalTo: aksaraInTopCard2.centerXAnchor).isActive = true
        aksaraLabelInTopCard2.topAnchor.constraint(equalTo: aksaraInTopCard2.bottomAnchor, constant: 10).isActive = true
        
        AksaraCardContainer.addSubview(aksaraLabelInTopCard3)
        aksaraLabelInTopCard3.centerXAnchor.constraint(equalTo: aksaraInTopCard3.centerXAnchor).isActive = true
        aksaraLabelInTopCard3.topAnchor.constraint(equalTo: aksaraInTopCard3.bottomAnchor, constant: 10).isActive = true
        
  
        //RightSection
        containerView.addSubview(carakanLabel)
        carakanLabel.leadingAnchor.constraint(equalTo: AksaraCardContainer.trailingAnchor, constant: 33).isActive = true
        carakanLabel.topAnchor.constraint(equalTo: tahapLabel.bottomAnchor, constant: 64).isActive = true

        view.addSubview(hasilLabel)
        hasilLabel.leadingAnchor.constraint(equalTo: AksaraCardContainer.trailingAnchor, constant: 33).isActive = true
        hasilLabel.topAnchor.constraint(equalTo: carakanLabel.bottomAnchor, constant: 64).isActive = true
        
        view.addSubview(timer)
        timer.leadingAnchor.constraint(equalTo: AksaraCardContainer.trailingAnchor, constant: 33).isActive = true
        timer.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        view.addSubview(checkmark)
        checkmark.leadingAnchor.constraint(equalTo: AksaraCardContainer.trailingAnchor, constant: 33).isActive = true
        checkmark.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 12).isActive = true

        view.addSubview(waktuQuizLabel)
        waktuQuizLabel.leadingAnchor.constraint(equalTo: timer.trailingAnchor, constant: 8).isActive = true
        waktuQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        view.addSubview(waktuDoneQuizLabel)
        waktuDoneQuizLabel.leadingAnchor.constraint(equalTo: waktuQuizLabel.trailingAnchor, constant: 16).isActive = true
        waktuDoneQuizLabel.topAnchor.constraint(equalTo: hasilLabel.bottomAnchor, constant: 12).isActive = true
        
        view.addSubview(benarDoneQuizLabel)
        benarDoneQuizLabel.leadingAnchor.constraint(equalTo: waktuQuizLabel.trailingAnchor, constant: 16).isActive = true
        benarDoneQuizLabel.topAnchor.constraint(equalTo: waktuDoneQuizLabel.bottomAnchor, constant: 13).isActive = true
        
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
   
    
}
    
extension UlasanController : UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 18
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ulasanCellId, for: indexPath) as! UlasanCell
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
            return CGFloat(32)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 310, height: 200)
        }
        
        
}
    
    

