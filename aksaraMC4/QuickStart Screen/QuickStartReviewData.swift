//
//  QuickStartReviewData.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 16/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit

class QuickStartReviewData: NSObject {
    static let instance = QuickStartReviewData()
    
    let quizesNameArray = ["Kuis 1", "Kuis 2", "Kuis 3"]
    let quizesTypeNameArray = ["Anatomi Wa", "Aksara ke latin Wa", "Menulis aksara Wa"]
    let quizesTypeArray = ["anatomi", "latin", "writing"]
    var quizesCorrectStatus = [false, false, false]
}
