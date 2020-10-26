//
//  DictionaryController.swift
//  aksaraMC4
//
//  Created by Naratama on 22/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class DictionaryController: UIViewController {

    private var dictionaryView: DictionaryView!
    private var konsonanView: KonsonanView!
    private var vokalView: VokalView!
    private var pasanganView: PasanganView!
    
    var regionSelected : String?
    var region : Region? {
        didSet {
            regionSelected = region?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dictionaryView = DictionaryView(frame: self.view.frame)
        self.view = self.dictionaryView
        settingLayoutRegion()
        tapFunction()
    }
    
    func settingLayoutRegion() {
        if regionSelected == "Jawa" {
            dictionaryView.backButtonTitle.text = "Kamus Aksara Jawa"

//            dictionaryView.menuImageIcon.image = UIImage(named: "mainAksaraJawa")
            dictionaryView.konsonanCardTitle.text = "Carakan"
            dictionaryView.konsonanCardSubtitle1.text = "Huruf konsonan"
            dictionaryView.konsonanCardSubtitle2.text = "Memiliki vokal dasar /a/"

//            dictionaryView.kamusImageIcon.image = UIImage(named: "kamusAksaraJawa")
            dictionaryView.vokalisasiCardTitle.text = "Sandhangan"
            dictionaryView.vokalisasiCardSubtitle1.text = "Vokalisasi"
            dictionaryView.vokalisasiCardSubtitle2.text = "Merubah vokal dasar Carakan atau dapat mematikan vokalnya"
            
//            dictionaryView.kamusImageIcon.image = UIImage(named: "kamusAksaraJawa")
            dictionaryView.pasanganCard.alpha = 0.25
            dictionaryView.pasanganCardTitle.text = "Pasangan"
            dictionaryView.pasanganCardSubtitle1.text = "Pasangan"
            dictionaryView.pasanganCardSubtitle2.text = "Mematikan huruf sebelumnya sekaligus menjadi huruf selanjutnya"
        } else if regionSelected == "Sunda" {
            dictionaryView.backButtonTitle.text = "Kamus Akara Sunda"
            
//            dictionaryView.menuImageIcon.image = UIImage(named: "mainAksaraSunda")
            dictionaryView.konsonanCardTitle.text = "Ngalegena"
            dictionaryView.konsonanCardSubtitle1.text = "Huruf konsonan"
            dictionaryView.konsonanCardSubtitle2.text = "Memiliki vokal dasar /a/"
            
//            dictionaryView.kamusImageIcon.image = UIImage(named: "kamusAksaraSunda")
            dictionaryView.vokalisasiCardTitle.text = "Swara"
            dictionaryView.vokalisasiCardSubtitle1.text = "Huruf vokal"
            dictionaryView.vokalisasiCardSubtitle2.text = "Huruf vokal a, i, u, e, o yang dapat berdiri sendiri sebagai suku kata"
            
//            dictionaryView.kamusImageIcon.image = UIImage(named: "kamusAksaraSunda")
            dictionaryView.pasanganCardTitle.text = "Rarangken"
            dictionaryView.pasanganCardSubtitle1.text = "Vokalisasi"
            dictionaryView.pasanganCardSubtitle2.text = "Merubah vokal dasar Ngalegena atau dapat mematikan vokalnya"
        }
    }
    
    func tapFunction() {
            let tapKonsonan = UITapGestureRecognizer(target: self, action: #selector(self.tapKonsonan))
            dictionaryView.konsonanCard.addGestureRecognizer(tapKonsonan)
            
            let tapVokalisasi = UITapGestureRecognizer(target: self, action: #selector(self.tapVokalisasi))
            dictionaryView.vokalisasiCard.addGestureRecognizer(tapVokalisasi)
            
            if regionSelected == "Jawa" {
                
            } else if regionSelected == "Sunda" {
            let tapPasangan = UITapGestureRecognizer(target: self, action: #selector(self.tapPasangan))
            dictionaryView.pasanganCard.addGestureRecognizer(tapPasangan)
            }
        
            dictionaryView.backButton.addTarget(self, action: #selector(backButton), for: .touchUpInside)
        }
        
        @objc func tapKonsonan() {
            let konsonanView = KonsonanView()
            konsonanView.regionSelected = regionSelected
            navigationController?.pushViewController(konsonanView, animated: true)
        }
    
        @objc func tapVokalisasi() {
            let vokalView = VokalView()
            vokalView.regionSelected = regionSelected
            navigationController?.pushViewController(vokalView, animated: true)
        }
    
        @objc func tapPasangan() {
            let pasanganView = PasanganView()
            pasanganView.regionSelected = regionSelected
            navigationController?.pushViewController(pasanganView, animated: true)
        }
    
        @objc func backButton() {
            navigationController?.popViewController(animated: true)
        }

}
