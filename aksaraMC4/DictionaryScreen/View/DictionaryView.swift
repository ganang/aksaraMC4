//
//  DictionaryView.swift
//  aksaraMC4
//
//  Created by Naratama on 22/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class DictionaryView: UIView {

    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "backButton"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top:-8, left: -8, bottom:-8, right: -8)
        //button.subviews.first?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    //Konsonan Card
    let konsonanCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let konsonanCardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Carakan"
        label.textColor = Theme.current.textColor1
        return label
    }()
    
    let konsonanImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let konsonanCardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Huruf konsonan"
        return label
    }()
    
    let konsonanCardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 12), NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attributedText = NSMutableAttributedString(string: "")
        attributedText.append(NSAttributedString(string: "Merubah vokal dasar Carakan atau dapat mematikan vokalnya", attributes: attrs as [NSAttributedString.Key : Any]))
        
        label.attributedText = attributedText
        return label
    }()
    
    //Vokalisasi Card
    let vokalisasiCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let vokalisasiCardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Sandhangan"
        label.textColor = Theme.current.textColor1
        return label
    }()
    
    let vokalisasiImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let vokalisasiCardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Vokalisasi"
        return label
    }()
    
    let vokalisasiCardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 12), NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attributedText = NSMutableAttributedString(string: "")
        attributedText.append(NSAttributedString(string: "Merubah vokal dasar Carakan atau dapat mematikan vokalnya", attributes: attrs as [NSAttributedString.Key : Any]))
        
        label.attributedText = attributedText
        return label
    }()
    
    //Pasangan Card
    let pasanganCard : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Theme.current.cardColor1
        view.layer.cornerRadius = 24
        view.addInnerShadow()
        view.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    let pasanganCardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Bold", size: 24)
        label.text = "Pasangan"
        label.textColor = Theme.current.textColor1
        return label
    }()
    
    let pasanganImageIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mainAksaraJawa")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let pasanganCardSubtitle1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 12)
        label.textColor = Theme.current.textColor1
        label.text = "Mematikan huruf sebelumnya"
        return label
    }()
    
    let pasanganCardSubtitle2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        let attrs      = [NSAttributedString.Key.font: UIFont.init(name: "NowAlt-Regular", size: 12), NSAttributedString.Key.foregroundColor: Theme.current.textColor1, NSAttributedString.Key.paragraphStyle: paragraphStyle]
        let attributedText = NSMutableAttributedString(string: "")
        attributedText.append(NSAttributedString(string: "sekaligus menjadi huruf selanjutnya", attributes: attrs as [NSAttributedString.Key : Any]))
        
        label.attributedText = attributedText
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackgroundColor()
        setupView()
    }
    
    func setupView() {
        
        addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.03350083752).isActive = true
        backButton.topAnchor.constraint(equalTo: topAnchor, constant: frame.height * 0.06714628297).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        addSubview(backButtonTitle)
        backButtonTitle.centerYAnchor.constraint(equalTo: backButton.centerYAnchor, constant: 0).isActive = true
        backButtonTitle.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: frame.width * 0.02680067002).isActive = true

        
        //VokalisasiCard
        addSubview(vokalisasiCard)
        vokalisasiCard.heightAnchor.constraint(equalToConstant: 400).isActive = true
        vokalisasiCard.widthAnchor.constraint(equalToConstant: 280).isActive = true
        vokalisasiCard.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        vokalisasiCard.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        vokalisasiCard.addSubview(vokalisasiCardTitle)
        vokalisasiCardTitle.leadingAnchor.constraint(equalTo: vokalisasiCard.leadingAnchor, constant: 24).isActive = true
        vokalisasiCardTitle.topAnchor.constraint(equalTo: vokalisasiCard.topAnchor, constant: 277).isActive = true
        
//        vokalisasiCard.addSubview(vokalisasiImageIcon)
//        vokalisasiImageIcon.heightAnchor.constraint(equalToConstant: 208.73).isActive = true
//        vokalisasiImageIcon.widthAnchor.constraint(equalToConstant: 316).isActive = true
//        vokalisasiImageIcon.leadingAnchor.constraint(equalTo: vokalisasiImageIcon.leadingAnchor, constant: -25).isActive = true
//        vokalisasiImageIcon.topAnchor.constraint(equalTo: vokalisasiImageIcon.topAnchor, constant: 24).isActive = true

        vokalisasiCard.addSubview(vokalisasiCardSubtitle1)
        vokalisasiCardSubtitle1.leadingAnchor.constraint(equalTo: vokalisasiCard.leadingAnchor, constant: 24).isActive = true
        vokalisasiCardSubtitle1.topAnchor.constraint(equalTo: vokalisasiCardTitle.bottomAnchor, constant: 12).isActive = true

        vokalisasiCard.addSubview(vokalisasiCardSubtitle2)
        vokalisasiCardSubtitle2.leadingAnchor.constraint(equalTo: vokalisasiCard.leadingAnchor, constant: 24).isActive = true
        vokalisasiCardSubtitle2.topAnchor.constraint(equalTo: vokalisasiCardSubtitle1.bottomAnchor, constant: 4).isActive = true
        vokalisasiCardSubtitle2.widthAnchor.constraint(equalToConstant: 184).isActive = true
        
        
        //KonsonanCard
        addSubview(konsonanCard)
        konsonanCard.heightAnchor.constraint(equalToConstant: 400).isActive = true
        konsonanCard.widthAnchor.constraint(equalToConstant: 280).isActive = true
        konsonanCard.trailingAnchor.constraint(equalTo: vokalisasiCard.leadingAnchor, constant: -24).isActive = true
        konsonanCard.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        konsonanCard.addSubview(konsonanCardTitle)
        konsonanCardTitle.leadingAnchor.constraint(equalTo: konsonanCard.leadingAnchor, constant: 24).isActive = true
        konsonanCardTitle.topAnchor.constraint(equalTo: konsonanCard.topAnchor, constant: 277).isActive = true
        
        //        konsonanCard.addSubview(konsonanImageIcon)
        //        konsonanImageIcon.heightAnchor.constraint(equalToConstant: 180.22).isActive = true
        //        konsonanImageIcon.widthAnchor.constraint(equalToConstant: 331.54).isActive = true
        //        konsonanImageIcon.leadingAnchor.constraint(equalTo: konsonanCard.leadingAnchor, constant: -43).isActive = true
        //        konsonanImageIcon.topAnchor.constraint(equalTo: konsonanCard.topAnchor, constant: 53).isActive = true
        
        konsonanCard.addSubview(konsonanCardSubtitle1)
        konsonanCardSubtitle1.leadingAnchor.constraint(equalTo: konsonanCard.leadingAnchor, constant: 24).isActive = true
        konsonanCardSubtitle1.topAnchor.constraint(equalTo: konsonanCardTitle.bottomAnchor, constant: 12).isActive = true
        
        konsonanCard.addSubview(konsonanCardSubtitle2)
        konsonanCardSubtitle2.leadingAnchor.constraint(equalTo: konsonanCard.leadingAnchor, constant: 24).isActive = true
        konsonanCardSubtitle2.topAnchor.constraint(equalTo: konsonanCardSubtitle1.bottomAnchor, constant: 4).isActive = true
        
        
        //PasanganCard
        addSubview(pasanganCard)
        pasanganCard.heightAnchor.constraint(equalToConstant: 400).isActive = true
        pasanganCard.widthAnchor.constraint(equalToConstant: 280).isActive = true
        pasanganCard.leadingAnchor.constraint(equalTo: vokalisasiCard.trailingAnchor, constant: 24).isActive = true
        pasanganCard.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        
        pasanganCard.addSubview(pasanganCardTitle)
        pasanganCardTitle.leadingAnchor.constraint(equalTo: pasanganCard.leadingAnchor, constant: 24).isActive = true
        pasanganCardTitle.topAnchor.constraint(equalTo: pasanganCard.topAnchor, constant: 277).isActive = true
        
        //        vokalisasiCard.addSubview(vokalisasiImageIcon)
        //        vokalisasiImageIcon.heightAnchor.constraint(equalToConstant: 208.73).isActive = true
        //        vokalisasiImageIcon.widthAnchor.constraint(equalToConstant: 316).isActive = true
        //        vokalisasiImageIcon.leadingAnchor.constraint(equalTo: vokalisasiImageIcon.leadingAnchor, constant: -25).isActive = true
        //        vokalisasiImageIcon.topAnchor.constraint(equalTo: vokalisasiImageIcon.topAnchor, constant: 24).isActive = true
        
        pasanganCard.addSubview(pasanganCardSubtitle1)
        pasanganCardSubtitle1.leadingAnchor.constraint(equalTo: pasanganCard.leadingAnchor, constant: 24).isActive = true
        pasanganCardSubtitle1.topAnchor.constraint(equalTo: pasanganCardTitle.bottomAnchor, constant: 12).isActive = true
        
        pasanganCard.addSubview(pasanganCardSubtitle2)
        pasanganCardSubtitle2.leadingAnchor.constraint(equalTo: pasanganCard.leadingAnchor, constant: 24).isActive = true
        pasanganCardSubtitle2.topAnchor.constraint(equalTo: pasanganCardSubtitle1.bottomAnchor, constant: 4).isActive = true
        pasanganCardSubtitle2.widthAnchor.constraint(equalToConstant: 204).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
