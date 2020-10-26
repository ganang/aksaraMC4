//
//  Extension.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

extension UIView {

    func isPasswordValid(_ password : String) -> Bool {

        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }

    func anchor (
        top : NSLayoutYAxisAnchor?,
        bottom : NSLayoutYAxisAnchor?,
        leading : NSLayoutXAxisAnchor?,
        trailing : NSLayoutXAxisAnchor?,
        marginTop : CGFloat,
        marginBottom : CGFloat,
        marginLeading : CGFloat,
        marginTrailing : CGFloat,
        width : CGFloat,
        height : CGFloat,
        centerX : NSLayoutXAxisAnchor?,
        centerY : NSLayoutYAxisAnchor?,
        marginFromCenterX : CGFloat,
        marginFromCenterY : CGFloat
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top { self.topAnchor.constraint(equalTo: top, constant: marginTop).isActive = true }
        if let bottom = bottom { self.bottomAnchor.constraint(equalTo: bottom, constant: marginBottom).isActive = true }
        if let leading = leading { self.leadingAnchor.constraint(equalTo: leading, constant: marginLeading).isActive = true }
        if let trailing = trailing { self.trailingAnchor.constraint(equalTo: trailing, constant: marginTrailing).isActive = true }

        if width != 0 { widthAnchor.constraint(equalToConstant: width).isActive = true}
        if height != 0 { heightAnchor.constraint(equalToConstant: height).isActive = true}

        if let centerX = centerX { self.centerXAnchor.constraint(equalTo: centerX, constant: marginFromCenterX).isActive = true }
        if let centerY = centerY { self.centerYAnchor.constraint(equalTo: centerY, constant: marginFromCenterY).isActive = true }
    }

    func setCellShadow() {
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        //self.layer.cornerRadius = 15
    }
}


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
         return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension CGColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> CGColor {
         return CGColor(srgbRed: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UIStackView {
    func changeBackgroundColor(color: UIColor) {
        let backgroundLayer = CAShapeLayer()
        layer.insertSublayer(backgroundLayer, at: 0)
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = color.cgColor
    }
}

extension TimeInterval {
    func stringFromTimeInterval() -> String {
        let time = Int(self)

        let seconds = time % 60
        let minutes = (time / 60) % 60
        let hours = (time / 3600)

        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes,seconds)
    }
}

extension UIImageView {

    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }

    func addBlurEffectView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}

extension CALayer {
  func applySketchShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    x: CGFloat = 0,
    y: CGFloat = 2,
    blur: CGFloat = 4,
    spread: CGFloat = 0)
  {
    shadowColor = color.cgColor
    shadowOpacity = alpha
    shadowOffset = CGSize(width: x, height: y)
    shadowRadius = blur / 2.0
    if spread == 0 {
      shadowPath = nil
    } else {
      let dx = -spread
      let rect = bounds.insetBy(dx: dx, dy: dx)
      shadowPath = UIBezierPath(rect: rect).cgPath
    }
  }
}

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        }
    }
}

extension UIAlertController {

    //Set background color of UIAlertController
    func setBackgroundColor(color: UIColor) {
        if let bgView = self.view.subviews.first, let groupView = bgView.subviews.first, let contentView = groupView.subviews.first {
            contentView.backgroundColor = color
        }
    }

    //Set title font and title color
    func setTitle(font: UIFont?, color: UIColor?) {
        guard let title = self.title else { return }
        let attributeString = NSMutableAttributedString(string: title)//1
        if let titleFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : titleFont],//2
                                          range: NSMakeRange(0, title.utf8.count))
        }

        if let titleColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : titleColor],//3
                                          range: NSMakeRange(0, title.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedTitle")//4
    }

    //Set message font and message color
    func setMessage(font: UIFont?, color: UIColor?) {
        guard let message = self.message else { return }
        let attributeString = NSMutableAttributedString(string: message)
        if let messageFont = font {
            attributeString.addAttributes([NSAttributedString.Key.font : messageFont],
                                          range: NSMakeRange(0, message.utf8.count))
        }

        if let messageColorColor = color {
            attributeString.addAttributes([NSAttributedString.Key.foregroundColor : messageColorColor],
                                          range: NSMakeRange(0, message.utf8.count))
        }
        self.setValue(attributeString, forKey: "attributedMessage")
    }

    //Set tint color of UIAlertController
    func setTint(color: UIColor) {
        self.view.tintColor = color
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//convert RGB -> Hex
extension UIColor {
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0

        return NSString(format:"#%06x", rgb) as String
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
     }
}

//View -> UIImage
extension UIView {
    
    func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }

    // Using a function since `var image` might conflict with an existing variable
    // (like on `UIImageView`)
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func setBackgroundColor() {
        let colorTop =  UIColor(red: 243/255.0, green: 250/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 218/255.0, green: 237/255.0, blue: 255/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setCardChooseBackgroundColor() {
        //GradientBlueAnswer
        let colorTop =  UIColor(red: 36/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 54/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: 220, height: 140)
        gradientLayer.cornerRadius = 24
        gradientLayer.name = "xxx"
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setKamusBackgroundColor() {
        let colorTop =  UIColor(red: 243/255.0, green: 250/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 218/255.0, green: 237/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: 1366, height: 924)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setCardTrueBackgroundColor() {
        let colorTop =  UIColor(red: 134/255.0, green: 227/255.0, blue: 145/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 7/255.0, green: 202/255.0, blue: 95/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: -10.0, y: -10.0, width: 240, height: 160)
        gradientLayer.cornerRadius = 24
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setCardFalseBackgroundColor() {
        let colorTop =  UIColor(red: 246/255.0, green: 81/255.0, blue: 100/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 215/255.0, green: 58/255.0, blue: 76/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: 220, height: 140)
        gradientLayer.cornerRadius = 24
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setTextGradientColor() {
        let colorTop =  UIColor(red: 36/255.0, green: 194/255.0, blue: 255/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 54/255.0, green: 159/255.0, blue: 255/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
    
    public func addInnerShadow(topColor: UIColor = UIColor.white.withAlphaComponent(0.6)) {
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.height = 10.0
        shadowLayer.colors = [
            topColor.cgColor,
            UIColor.white.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
}

extension UILabel {
    func setTextColorToGradient(image: UIImage) {
        UIGraphicsBeginImageContext(frame.size)
        image.draw(in: bounds)
        //let myGradient = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.textColor = UIColor(patternImage: UIImage(named: "gradientText")!)
    }
}


