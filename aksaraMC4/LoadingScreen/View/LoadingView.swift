//
//  LoadingView.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 02/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
//    var progressBarValue = 1.00/7.00

    lazy var loadingFrameImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "BaseFrameLoading")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var tipsFrameImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "TipsFrame")
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let tipsTitleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Regular", size: 20)
        label.text = "Tips: "
        label.textColor = Theme.current.textColor1
        
        return label
    }()
    
    let tipsLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "NowAlt-Medium", size: 16)
        label.text = "Aksara Carakan dapat lebih mudah dihafalkan dari anatomi bentuknya"
        label.textColor = UIColor.rgb(red: 3, green: 131, blue: 251, alpha: 1)
        
        return label
    }()
    
    
    var progressView : UIProgressView = {
        let progress = UIProgressView()
        progress.layer.applySketchShadow(color: UIColor.init(displayP3Red: 54/255, green: 159/255, blue: 255/255, alpha: 1), alpha: 0.15, x: 0, y: 8, blur: 12, spread: 0)
        progress.layer.borderWidth = 1
        progress.layer.borderColor = CGColor.rgb(red: 4, green: 110, blue: 208, alpha: 1)
        progress.clipsToBounds = true
        progress.trackTintColor = .clear
        progress.progressTintColor = UIColor.rgb(red: 4, green: 110, blue: 208, alpha: 1)
        
        return progress
    }()
    
    let progress = Progress(totalUnitCount: 200)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "decorativeBackground")
        backgroundImage.contentMode = .scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        startProgress()
        
        
        
        setBackgroundColor()
        setupView()
    }
    
    func startProgress() {
        progressView.progress = 0
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            self.progress.completedUnitCount += 1
            
            let progressFloat = Float(self.progress.fractionCompleted)
            self.progressView.setProgress(progressFloat, animated: true)
            
            //        UIView.animate(withDuration: 5) { [self] in
            //            progressView.progress = 1
            //        }
            
        }
    }
    
    
    func setupView() {
        addSubview(loadingFrameImage)
        loadingFrameImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        loadingFrameImage.topAnchor.constraint(equalTo: centerYAnchor, constant: -178).isActive = true
        loadingFrameImage.heightAnchor.constraint(equalToConstant: 304).isActive = true
        loadingFrameImage.widthAnchor.constraint(equalToConstant: 744).isActive = true
        
        addSubview(tipsFrameImage)
        tipsFrameImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        tipsFrameImage.topAnchor.constraint(equalTo: loadingFrameImage.topAnchor, constant: 75).isActive = true
        tipsFrameImage.heightAnchor.constraint(equalToConstant: 24).isActive = true
        tipsFrameImage.widthAnchor.constraint(equalToConstant: 130).isActive = true
        
        addSubview(tipsTitleLabel)
        tipsTitleLabel.centerXAnchor.constraint(equalTo: tipsFrameImage.centerXAnchor, constant: 0).isActive = true
        tipsTitleLabel.centerYAnchor.constraint(equalTo: tipsFrameImage.centerYAnchor, constant: 0).isActive = true
        
        addSubview(tipsLabel)
        tipsLabel.centerXAnchor.constraint(equalTo: tipsFrameImage.centerXAnchor, constant: 0).isActive = true
        tipsLabel.topAnchor.constraint(equalTo: tipsFrameImage.bottomAnchor, constant: 24).isActive = true
        
//        gradientHorizontalProgressBar.translatesAutoresizingMaskIntoConstraints = false
        progressView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(progressView)
        progressView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        progressView.topAnchor.constraint(equalTo: tipsLabel.bottomAnchor, constant: 32).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
