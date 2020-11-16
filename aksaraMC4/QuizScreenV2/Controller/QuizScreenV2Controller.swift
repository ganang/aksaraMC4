//
//  ViewController.swift
//  QuizDrag&Drop
//
//  Created by Naratama on 13/11/20.
//

import UIKit

class QuizScreenV2Controller: UIViewController {

    private var quizViewTypeAV2: QuizViewTypeAV2!
    private var quizViewTypeBV2: QuizViewTypeBV2!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        self.quizViewTypeAV2 = QuizViewTypeAV2(frame: self.view.frame)
        self.view = self.quizViewTypeAV2
        
    }

    

}

