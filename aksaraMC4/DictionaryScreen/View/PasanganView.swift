//
//  PasanganView.swift
//  aksaraMC4
//
//  Created by Naratama on 23/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class PasanganView: UIViewController {

    private let pasanganCellId = "pasanganCellId"
    private var pasanganView: PasanganView!
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setBackgroundColor()
        self.setupView()
        settingLayoutRegion()
    }
    
    func settingLayoutRegion() {
        if regionSelected == "Jawa" {
            backButtonTitle.text = "Aksara Jawa - Pasangan"
        } else if regionSelected == "Sunda" {
            backButtonTitle.text = "Aksara Sunda - Rarangken"
        }
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
        
    }
    
    @objc func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
}
