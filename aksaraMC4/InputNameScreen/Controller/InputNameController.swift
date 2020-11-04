//
//  InputNameController.swift
//  aksaraMC4
//
//  Created by Mohamad Naufal Nafian on 02/11/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class InputNameController: UIViewController {
    
    var username : String?
    var inputNameView : InputNameView!
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.inputNameView = InputNameView(frame: self.view.frame)
        self.view = self.inputNameView
        inputNameView.usernameLabel.delegate = self
        // Do any additional setup after loading the view.
        
        tapFunction()
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
    
    func getUserData() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let idSort = NSSortDescriptor(key:"id", ascending:true)
        fetchRequest.sortDescriptors = [idSort]
        
        do {
            let users = try PersistenceService.context.fetch(fetchRequest)
            
            self.user = users[0]
//            self.regions = user.regions?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Region]
            
            
        } catch {
            print("ERROR")
        }
    }
    
    func tapFunction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(moveToRegion))
        inputNameView.arrowRight.addGestureRecognizer(tap)
    }
    
    @objc func moveToRegion() {
        let startScreen = StartController()
        
        self.user?.name = username
        PersistenceService.saveContext()
        
//        print("user on input name", user)
        print("username", username)
        
        startScreen.user = self.user
        startScreen.username = username
 
        
        navigationController?.pushViewController(startScreen, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InputNameController : UITextViewDelegate {
    
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText newText: String) -> Bool {
        if newText == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return textView.text.count + (newText.count - range.length) <= 20
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.username = textView.text
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        inputNameView.quizAnswerLabelConstraint.constant = -190
        self.username = textView.text
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        inputNameView.quizAnswerLabelConstraint.constant = -307
        inputNameView.usernameLabel.textColor = UIColor.rgb(red: 23, green: 78, blue: 161, alpha: 1)
        inputNameView.usernameLabel.text = ""
        
    }
}
