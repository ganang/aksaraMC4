//
//  ThemeProtocol.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//
import UIKit

protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var cardColor1: UIColor { get }
    var textColor1: UIColor { get }
    var textColor2: UIColor { get }
    var accentColor: UIColor { get }
    var purpleColor: UIColor { get }
    var accentWhite: UIColor { get }
    var accentLightBlue: UIColor { get }
    var accentLightRed: UIColor { get }
    var accentLightGreen: UIColor { get }
    var accentTextBlue: UIColor { get }
    var accentTextGreen: UIColor { get }
    var accentTextRed: UIColor { get }
    var gradientTopBlue: UIColor { get }
    var gradientBottomBlue: UIColor { get }
    var gradientTopGreen: UIColor { get }
    var gradientBottomGreen: UIColor { get }
    var gradientTopRed: UIColor { get }
    var gradientBottomRed: UIColor { get }
    var gradientTopGold: UIColor { get }
    var gradientBottomGold: UIColor { get }
}
