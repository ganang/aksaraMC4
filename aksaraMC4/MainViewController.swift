//
//  ViewController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

protocol MainViewProtocol: class {
    func updateData()
}

class MainViewController: UIViewController {
    
    var stages: [Stage]?
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Now-Black", size: 18)
        label.textColor = .blue
        label.text = "Nopal"
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.setBackgroundColor()
        view.backgroundColor = .white
        view.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
//        deleteRecord()
//        setupRecord()
        getRecord()
    }
    
    func deleteRecord() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let idSort = NSSortDescriptor(key:"id", ascending:true)
        fetchRequest.sortDescriptors = [idSort]
        
        do {
            let users = try PersistenceService.context.fetch(fetchRequest)
            
            for user in users {
                PersistenceService.context.delete(user)
                PersistenceService.saveContext()
            }
            
        } catch {
            print("ERROR")
        }
    }
    
    func getRecord() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        let idSort = NSSortDescriptor(key:"id", ascending:true)
        fetchRequest.sortDescriptors = [idSort]
        
        do {
            let users = try PersistenceService.context.fetch(fetchRequest)
            
            let user: User = users[0]
            let regions: [Region] = user.regions?.sortedArray(using: [.init(key: "id", ascending: true)]) as! [Region]
            self.stages = regions[0].stages?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Stage]
            
            let testingVC = TestingViewController()
            testingVC.stages = stages
            testingVC.delegate = self
            
            self.navigationController?.pushViewController(testingVC, animated: false)
            
        } catch {
            print("ERROR")
        }
    }
    
    func setupRecord() {
        
        // MARK: Quiz for Level 1 Stage 1 Jawa
        let quiz1_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level1_stage1_Jawa.id = 1
        quiz1_level1_stage1_Jawa.name = "Panduan"
        quiz1_level1_stage1_Jawa.type = "Panduan"
        quiz1_level1_stage1_Jawa.isCorrect = false
        quiz1_level1_stage1_Jawa.question = "Ha"
        quiz1_level1_stage1_Jawa.choices = []
        quiz1_level1_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level1_Stage1_Jawa.id = 1
        choice1_Quiz2_Level1_Stage1_Jawa.name = "Ha"
        
        let choice2_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level1_Stage1_Jawa.id = 2
        choice2_Quiz2_Level1_Stage1_Jawa.name = "Na"
        
        let choice3_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level1_Stage1_Jawa.id = 3
        choice3_Quiz2_Level1_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level1_Stage1_Jawa.id = 4
        choice4_Quiz2_Level1_Stage1_Jawa.name = "Ra"
        
        //MARK: Image
        let image1_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level1_Stage1_Jawa.id = 1
        image1_Quiz2_Level1_Stage1_Jawa.name = "Ha_Aksara_Jawa"
        
        let image2_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level1_Stage1_Jawa.id = 2
        image2_Quiz2_Level1_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image3_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level1_Stage1_Jawa.id = 3
        image3_Quiz2_Level1_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level1_Stage1_Jawa.id = 4
        image4_Quiz2_Level1_Stage1_Jawa.name = "Ra_Aksara_Jawa"
    
        let quiz2_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level1_stage1_Jawa.id = 2
        quiz2_level1_stage1_Jawa.name = "Kuis 1"
        quiz2_level1_stage1_Jawa.type = "A"
        quiz2_level1_stage1_Jawa.isCorrect = false
        quiz2_level1_stage1_Jawa.question = "Ha"
        quiz2_level1_stage1_Jawa.choices = [choice1_Quiz2_Level1_Stage1_Jawa, choice2_Quiz2_Level1_Stage1_Jawa, choice3_Quiz2_Level1_Stage1_Jawa, choice4_Quiz2_Level1_Stage1_Jawa]
        quiz2_level1_stage1_Jawa.images = [image1_Quiz2_Level1_Stage1_Jawa, image2_Quiz2_Level1_Stage1_Jawa, image3_Quiz2_Level1_Stage1_Jawa, image4_Quiz2_Level1_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level1_Stage1_Jawa.id = 1
        choice1_Quiz3_Level1_Stage1_Jawa.name = "Ha"
        
        let choice2_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level1_Stage1_Jawa.id = 2
        choice2_Quiz3_Level1_Stage1_Jawa.name = "Na"
        
        let choice3_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level1_Stage1_Jawa.id = 3
        choice3_Quiz3_Level1_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level1_Stage1_Jawa.id = 4
        choice4_Quiz3_Level1_Stage1_Jawa.name = "Ra"
        
        //MARK: Image
        let image1_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level1_Stage1_Jawa.id = 1
        image1_Quiz3_Level1_Stage1_Jawa.name = "Ha_Aksara_Jawa"
        
        let image2_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level1_Stage1_Jawa.id = 2
        image2_Quiz3_Level1_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image3_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level1_Stage1_Jawa.id = 3
        image3_Quiz3_Level1_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level1_Stage1_Jawa.id = 4
        image4_Quiz3_Level1_Stage1_Jawa.name = "Ra_Aksara_Jawa"
        
        let quiz3_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level1_stage1_Jawa.id = 3
        quiz3_level1_stage1_Jawa.name = "Kuis 2"
        quiz3_level1_stage1_Jawa.type = "B"
        quiz3_level1_stage1_Jawa.isCorrect = false
        quiz3_level1_stage1_Jawa.question = "Ha"
        quiz3_level1_stage1_Jawa.choices = [choice1_Quiz3_Level1_Stage1_Jawa, choice2_Quiz3_Level1_Stage1_Jawa, choice3_Quiz3_Level1_Stage1_Jawa, choice4_Quiz3_Level1_Stage1_Jawa]
        quiz3_level1_stage1_Jawa.images = [image1_Quiz3_Level1_Stage1_Jawa, image2_Quiz3_Level1_Stage1_Jawa, image3_Quiz3_Level1_Stage1_Jawa, image4_Quiz3_Level1_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level1_Stage1_Jawa.id = 1
        choice1_Quiz4_Level1_Stage1_Jawa.name = "Ha"
        
        let choice2_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level1_Stage1_Jawa.id = 2
        choice2_Quiz4_Level1_Stage1_Jawa.name = "Na"
        
        let choice3_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level1_Stage1_Jawa.id = 3
        choice3_Quiz4_Level1_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level1_Stage1_Jawa.id = 4
        choice4_Quiz4_Level1_Stage1_Jawa.name = "Ra"
        
        //MARK: Image
        let image1_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level1_Stage1_Jawa.id = 1
        image1_Quiz4_Level1_Stage1_Jawa.name = "Ha_Aksara_Jawa"
        
        let image2_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level1_Stage1_Jawa.id = 2
        image2_Quiz4_Level1_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image3_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level1_Stage1_Jawa.id = 3
        image3_Quiz4_Level1_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level1_Stage1_Jawa.id = 4
        image4_Quiz4_Level1_Stage1_Jawa.name = "Ra_Aksara_Jawa"
        
        let quiz4_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level1_stage1_Jawa.id = 4
        quiz4_level1_stage1_Jawa.name = "Kuis 3"
        quiz4_level1_stage1_Jawa.type = "C"
        quiz4_level1_stage1_Jawa.isCorrect = false
        quiz4_level1_stage1_Jawa.question = "Ha"
        quiz4_level1_stage1_Jawa.choices = [choice1_Quiz4_Level1_Stage1_Jawa, choice2_Quiz4_Level1_Stage1_Jawa, choice3_Quiz4_Level1_Stage1_Jawa, choice4_Quiz4_Level1_Stage1_Jawa]
        quiz4_level1_stage1_Jawa.images = [image1_Quiz4_Level1_Stage1_Jawa, image2_Quiz4_Level1_Stage1_Jawa, image3_Quiz4_Level1_Stage1_Jawa, image4_Quiz4_Level1_Stage1_Jawa]
        
        let quiz5_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level1_stage1_Jawa.id = 5
        quiz5_level1_stage1_Jawa.name = "Kuis 4"
        quiz5_level1_stage1_Jawa.type = "D"
        quiz5_level1_stage1_Jawa.isCorrect = false
        quiz5_level1_stage1_Jawa.question = "Ha"
        quiz5_level1_stage1_Jawa.choices = []
        quiz5_level1_stage1_Jawa.images = []
        
        let quiz6_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level1_stage1_Jawa.id = 6
        quiz6_level1_stage1_Jawa.name = "Kuis 5"
        quiz6_level1_stage1_Jawa.type = "E"
        quiz6_level1_stage1_Jawa.isCorrect = false
        quiz6_level1_stage1_Jawa.question = "Ha"
        quiz6_level1_stage1_Jawa.choices = []
        quiz6_level1_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 2 Stage 1 Jawa
        let quiz1_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level2_stage1_Jawa.id = 1
        quiz1_level2_stage1_Jawa.name = "Panduan"
        quiz1_level2_stage1_Jawa.type = "Panduan"
        quiz1_level2_stage1_Jawa.isCorrect = false
        quiz1_level2_stage1_Jawa.question = "Na"
        quiz1_level2_stage1_Jawa.choices = []
        quiz1_level2_stage1_Jawa.images = []
        
        let quiz2_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level2_stage1_Jawa.id = 2
        quiz2_level2_stage1_Jawa.name = "Kuis 1"
        quiz2_level2_stage1_Jawa.type = "A"
        quiz2_level2_stage1_Jawa.isCorrect = false
        quiz2_level2_stage1_Jawa.question = "Na"
        quiz2_level2_stage1_Jawa.choices = []
        quiz2_level2_stage1_Jawa.images = []
        
        let quiz3_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level2_stage1_Jawa.id = 3
        quiz3_level2_stage1_Jawa.name = "Kuis 2"
        quiz3_level2_stage1_Jawa.type = "B"
        quiz3_level2_stage1_Jawa.isCorrect = false
        quiz3_level2_stage1_Jawa.question = "Na"
        quiz3_level2_stage1_Jawa.choices = []
        quiz3_level2_stage1_Jawa.images = []
        
        let quiz4_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level2_stage1_Jawa.id = 4
        quiz4_level2_stage1_Jawa.name = "Kuis 3"
        quiz4_level2_stage1_Jawa.type = "C"
        quiz4_level2_stage1_Jawa.isCorrect = false
        quiz4_level2_stage1_Jawa.question = "Na"
        quiz4_level2_stage1_Jawa.choices = []
        quiz4_level2_stage1_Jawa.images = []
        
        let quiz5_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level2_stage1_Jawa.id = 5
        quiz5_level2_stage1_Jawa.name = "Kuis 4"
        quiz5_level2_stage1_Jawa.type = "D"
        quiz5_level2_stage1_Jawa.isCorrect = false
        quiz5_level2_stage1_Jawa.question = "Na"
        quiz5_level2_stage1_Jawa.choices = []
        quiz5_level2_stage1_Jawa.images = []
        
        let quiz6_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level2_stage1_Jawa.id = 6
        quiz6_level2_stage1_Jawa.name = "Kuis 5"
        quiz6_level2_stage1_Jawa.type = "E"
        quiz6_level2_stage1_Jawa.isCorrect = false
        quiz6_level2_stage1_Jawa.question = "Na"
        quiz6_level2_stage1_Jawa.choices = []
        quiz6_level2_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 3 Stage 1 Jawa
        let quiz1_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level3_stage1_Jawa.id = 1
        quiz1_level3_stage1_Jawa.name = "Panduan"
        quiz1_level3_stage1_Jawa.type = "Panduan"
        quiz1_level3_stage1_Jawa.isCorrect = false
        quiz1_level3_stage1_Jawa.question = "Ca"
        quiz1_level3_stage1_Jawa.choices = []
        quiz1_level3_stage1_Jawa.images = []
        
        let quiz2_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level3_stage1_Jawa.id = 2
        quiz2_level3_stage1_Jawa.name = "Kuis 1"
        quiz2_level3_stage1_Jawa.type = "A"
        quiz2_level3_stage1_Jawa.isCorrect = false
        quiz2_level3_stage1_Jawa.question = "Ca"
        quiz2_level3_stage1_Jawa.choices = []
        quiz2_level3_stage1_Jawa.images = []
        
        let quiz3_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage1_Jawa.id = 3
        quiz3_level3_stage1_Jawa.name = "Kuis 2"
        quiz3_level3_stage1_Jawa.type = "B"
        quiz3_level3_stage1_Jawa.isCorrect = false
        quiz3_level3_stage1_Jawa.question = "Ca"
        quiz3_level3_stage1_Jawa.choices = []
        quiz3_level3_stage1_Jawa.images = []
        
        let quiz4_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level3_stage1_Jawa.id = 4
        quiz4_level3_stage1_Jawa.name = "Kuis 3"
        quiz4_level3_stage1_Jawa.type = "C"
        quiz4_level3_stage1_Jawa.isCorrect = false
        quiz4_level3_stage1_Jawa.question = "Ca"
        quiz4_level3_stage1_Jawa.choices = []
        quiz4_level3_stage1_Jawa.images = []
        
        let quiz5_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level3_stage1_Jawa.id = 5
        quiz5_level3_stage1_Jawa.name = "Kuis 4"
        quiz5_level3_stage1_Jawa.type = "D"
        quiz5_level3_stage1_Jawa.isCorrect = false
        quiz5_level3_stage1_Jawa.question = "Ca"
        quiz5_level3_stage1_Jawa.choices = []
        quiz5_level3_stage1_Jawa.images = []
        
        let quiz6_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level3_stage1_Jawa.id = 6
        quiz6_level3_stage1_Jawa.name = "Kuis 5"
        quiz6_level3_stage1_Jawa.type = "E"
        quiz6_level3_stage1_Jawa.isCorrect = false
        quiz6_level3_stage1_Jawa.question = "Ca"
        quiz6_level3_stage1_Jawa.choices = []
        quiz6_level3_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 4 Stage 1 Jawa
        let quiz1_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level4_stage1_Jawa.id = 1
        quiz1_level4_stage1_Jawa.name = "Panduan"
        quiz1_level4_stage1_Jawa.type = "Panduan"
        quiz1_level4_stage1_Jawa.isCorrect = false
        quiz1_level4_stage1_Jawa.question = "Ca"
        quiz1_level4_stage1_Jawa.choices = []
        quiz1_level4_stage1_Jawa.images = []
        
        let quiz2_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level4_stage1_Jawa.id = 2
        quiz2_level4_stage1_Jawa.name = "Kuis 1"
        quiz2_level4_stage1_Jawa.type = "A"
        quiz2_level4_stage1_Jawa.isCorrect = false
        quiz2_level4_stage1_Jawa.question = "Ca"
        quiz2_level4_stage1_Jawa.choices = []
        quiz2_level4_stage1_Jawa.images = []
        
        let quiz3_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level4_stage1_Jawa.id = 3
        quiz3_level4_stage1_Jawa.name = "Kuis 2"
        quiz3_level4_stage1_Jawa.type = "B"
        quiz3_level4_stage1_Jawa.isCorrect = false
        quiz3_level4_stage1_Jawa.question = "Ca"
        quiz3_level4_stage1_Jawa.choices = []
        quiz3_level4_stage1_Jawa.images = []
        
        let quiz4_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level4_stage1_Jawa.id = 4
        quiz4_level4_stage1_Jawa.name = "Kuis 3"
        quiz4_level4_stage1_Jawa.type = "C"
        quiz4_level4_stage1_Jawa.isCorrect = false
        quiz4_level4_stage1_Jawa.question = "Ca"
        quiz4_level4_stage1_Jawa.choices = []
        quiz4_level4_stage1_Jawa.images = []
        
        let quiz5_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level4_stage1_Jawa.id = 5
        quiz5_level4_stage1_Jawa.name = "Kuis 4"
        quiz5_level4_stage1_Jawa.type = "D"
        quiz5_level4_stage1_Jawa.isCorrect = false
        quiz5_level4_stage1_Jawa.question = "Ca"
        quiz5_level4_stage1_Jawa.choices = []
        quiz5_level4_stage1_Jawa.images = []
        
        let quiz6_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level4_stage1_Jawa.id = 6
        quiz6_level4_stage1_Jawa.name = "Kuis 5"
        quiz6_level4_stage1_Jawa.type = "E"
        quiz6_level4_stage1_Jawa.isCorrect = false
        quiz6_level4_stage1_Jawa.question = "Ca"
        quiz6_level4_stage1_Jawa.choices = []
        quiz6_level4_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 5 Stage 1 Jawa
        let quiz1_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level5_stage1_Jawa.id = 1
        quiz1_level5_stage1_Jawa.name = "Panduan"
        quiz1_level5_stage1_Jawa.type = "Panduan"
        quiz1_level5_stage1_Jawa.isCorrect = false
        quiz1_level5_stage1_Jawa.question = "Ca"
        quiz1_level5_stage1_Jawa.choices = []
        quiz1_level5_stage1_Jawa.images = []
        
        let quiz2_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage1_Jawa.id = 2
        quiz2_level5_stage1_Jawa.name = "Kuis 1"
        quiz2_level5_stage1_Jawa.type = "A"
        quiz2_level5_stage1_Jawa.isCorrect = false
        quiz2_level5_stage1_Jawa.question = "Ca"
        quiz2_level5_stage1_Jawa.choices = []
        quiz2_level5_stage1_Jawa.images = []
        
        let quiz3_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level5_stage1_Jawa.id = 3
        quiz3_level5_stage1_Jawa.name = "Kuis 2"
        quiz3_level5_stage1_Jawa.type = "B"
        quiz3_level5_stage1_Jawa.isCorrect = false
        quiz3_level5_stage1_Jawa.question = "Ca"
        quiz3_level5_stage1_Jawa.choices = []
        quiz3_level5_stage1_Jawa.images = []
        
        let quiz4_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level5_stage1_Jawa.id = 4
        quiz4_level5_stage1_Jawa.name = "Kuis 3"
        quiz4_level5_stage1_Jawa.type = "C"
        quiz4_level5_stage1_Jawa.isCorrect = false
        quiz4_level5_stage1_Jawa.question = "Ca"
        quiz4_level5_stage1_Jawa.choices = []
        quiz4_level5_stage1_Jawa.images = []
        
        let quiz5_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level5_stage1_Jawa.id = 5
        quiz5_level5_stage1_Jawa.name = "Kuis 4"
        quiz5_level5_stage1_Jawa.type = "D"
        quiz5_level5_stage1_Jawa.isCorrect = false
        quiz5_level5_stage1_Jawa.question = "Ca"
        quiz5_level5_stage1_Jawa.choices = []
        quiz5_level5_stage1_Jawa.images = []
        
        let quiz6_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level5_stage1_Jawa.id = 6
        quiz6_level5_stage1_Jawa.name = "Kuis 5"
        quiz6_level5_stage1_Jawa.type = "E"
        quiz6_level5_stage1_Jawa.isCorrect = false
        quiz6_level5_stage1_Jawa.question = "Ca"
        quiz6_level5_stage1_Jawa.choices = []
        quiz6_level5_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 6 Stage 1 Jawa
        let quiz1_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level6_stage1_Jawa.id = 1
        quiz1_level6_stage1_Jawa.name = "Panduan"
        quiz1_level6_stage1_Jawa.type = "Panduan"
        quiz1_level6_stage1_Jawa.isCorrect = false
        quiz1_level6_stage1_Jawa.question = "Ca"
        quiz1_level6_stage1_Jawa.choices = []
        quiz1_level6_stage1_Jawa.images = []
        
        let quiz2_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level6_stage1_Jawa.id = 2
        quiz2_level6_stage1_Jawa.name = "Kuis 1"
        quiz2_level6_stage1_Jawa.type = "A"
        quiz2_level6_stage1_Jawa.isCorrect = false
        quiz2_level6_stage1_Jawa.question = "Ca"
        quiz2_level6_stage1_Jawa.choices = []
        quiz2_level6_stage1_Jawa.images = []
        
        let quiz3_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level6_stage1_Jawa.id = 3
        quiz3_level6_stage1_Jawa.name = "Kuis 2"
        quiz3_level6_stage1_Jawa.type = "B"
        quiz3_level6_stage1_Jawa.isCorrect = false
        quiz3_level6_stage1_Jawa.question = "Ca"
        quiz3_level6_stage1_Jawa.choices = []
        quiz3_level6_stage1_Jawa.images = []
        
        let quiz4_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level6_stage1_Jawa.id = 4
        quiz4_level6_stage1_Jawa.name = "Kuis 3"
        quiz4_level6_stage1_Jawa.type = "C"
        quiz4_level6_stage1_Jawa.isCorrect = false
        quiz4_level6_stage1_Jawa.question = "Ca"
        quiz4_level6_stage1_Jawa.choices = []
        quiz4_level6_stage1_Jawa.images = []
        
        let quiz5_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level6_stage1_Jawa.id = 5
        quiz5_level6_stage1_Jawa.name = "Kuis 4"
        quiz5_level6_stage1_Jawa.type = "D"
        quiz5_level6_stage1_Jawa.isCorrect = false
        quiz5_level6_stage1_Jawa.question = "Ca"
        quiz5_level6_stage1_Jawa.choices = []
        quiz5_level6_stage1_Jawa.images = []
        
        let quiz6_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level6_stage1_Jawa.id = 6
        quiz6_level6_stage1_Jawa.name = "Kuis 5"
        quiz6_level6_stage1_Jawa.type = "E"
        quiz6_level6_stage1_Jawa.isCorrect = false
        quiz6_level6_stage1_Jawa.question = "Ca"
        quiz6_level6_stage1_Jawa.choices = []
        quiz6_level6_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 7 Stage 1 Jawa
        let quiz1_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level7_stage1_Jawa.id = 1
        quiz1_level7_stage1_Jawa.name = "Panduan"
        quiz1_level7_stage1_Jawa.type = "Panduan"
        quiz1_level7_stage1_Jawa.isCorrect = false
        quiz1_level7_stage1_Jawa.question = "Ca"
        quiz1_level7_stage1_Jawa.choices = []
        quiz1_level7_stage1_Jawa.images = []
        
        let quiz2_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level7_stage1_Jawa.id = 2
        quiz2_level7_stage1_Jawa.name = "Kuis 1"
        quiz2_level7_stage1_Jawa.type = "A"
        quiz2_level7_stage1_Jawa.isCorrect = false
        quiz2_level7_stage1_Jawa.question = "Ca"
        quiz2_level7_stage1_Jawa.choices = []
        quiz2_level7_stage1_Jawa.images = []
        
        let quiz3_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level7_stage1_Jawa.id = 3
        quiz3_level7_stage1_Jawa.name = "Kuis 2"
        quiz3_level7_stage1_Jawa.type = "B"
        quiz3_level7_stage1_Jawa.isCorrect = false
        quiz3_level7_stage1_Jawa.question = "Ca"
        quiz3_level7_stage1_Jawa.choices = []
        quiz3_level7_stage1_Jawa.images = []
        
        let quiz4_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level7_stage1_Jawa.id = 4
        quiz4_level7_stage1_Jawa.name = "Kuis 3"
        quiz4_level7_stage1_Jawa.type = "C"
        quiz4_level7_stage1_Jawa.isCorrect = false
        quiz4_level7_stage1_Jawa.question = "Ca"
        quiz4_level7_stage1_Jawa.choices = []
        quiz4_level7_stage1_Jawa.images = []
        
        let quiz5_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level7_stage1_Jawa.id = 5
        quiz5_level7_stage1_Jawa.name = "Kuis 4"
        quiz5_level7_stage1_Jawa.type = "D"
        quiz5_level7_stage1_Jawa.isCorrect = false
        quiz5_level7_stage1_Jawa.question = "Ca"
        quiz5_level7_stage1_Jawa.choices = []
        quiz5_level7_stage1_Jawa.images = []
        
        let quiz6_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level7_stage1_Jawa.id = 6
        quiz6_level7_stage1_Jawa.name = "Kuis 5"
        quiz6_level7_stage1_Jawa.type = "E"
        quiz6_level7_stage1_Jawa.isCorrect = false
        quiz6_level7_stage1_Jawa.question = "Ca"
        quiz6_level7_stage1_Jawa.choices = []
        quiz6_level7_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 8 Stage 1 Jawa
        let quiz1_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level8_stage1_Jawa.id = 1
        quiz1_level8_stage1_Jawa.name = "Panduan"
        quiz1_level8_stage1_Jawa.type = "Panduan"
        quiz1_level8_stage1_Jawa.isCorrect = false
        quiz1_level8_stage1_Jawa.question = "Ca"
        quiz1_level8_stage1_Jawa.choices = []
        quiz1_level8_stage1_Jawa.images = []
        
        let quiz2_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level8_stage1_Jawa.id = 2
        quiz2_level8_stage1_Jawa.name = "Kuis 1"
        quiz2_level8_stage1_Jawa.type = "A"
        quiz2_level8_stage1_Jawa.isCorrect = false
        quiz2_level8_stage1_Jawa.question = "Ca"
        quiz2_level8_stage1_Jawa.choices = []
        quiz2_level8_stage1_Jawa.images = []
        
        let quiz3_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level8_stage1_Jawa.id = 3
        quiz3_level8_stage1_Jawa.name = "Kuis 2"
        quiz3_level8_stage1_Jawa.type = "B"
        quiz3_level8_stage1_Jawa.isCorrect = false
        quiz3_level8_stage1_Jawa.question = "Ca"
        quiz3_level8_stage1_Jawa.choices = []
        quiz3_level8_stage1_Jawa.images = []
        
        let quiz4_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level8_stage1_Jawa.id = 4
        quiz4_level8_stage1_Jawa.name = "Kuis 3"
        quiz4_level8_stage1_Jawa.type = "C"
        quiz4_level8_stage1_Jawa.isCorrect = false
        quiz4_level8_stage1_Jawa.question = "Ca"
        quiz4_level8_stage1_Jawa.choices = []
        quiz4_level8_stage1_Jawa.images = []
        
        let quiz5_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level8_stage1_Jawa.id = 5
        quiz5_level8_stage1_Jawa.name = "Kuis 4"
        quiz5_level8_stage1_Jawa.type = "D"
        quiz5_level8_stage1_Jawa.isCorrect = false
        quiz5_level8_stage1_Jawa.question = "Ca"
        quiz5_level8_stage1_Jawa.choices = []
        quiz5_level8_stage1_Jawa.images = []
        
        let quiz6_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level8_stage1_Jawa.id = 6
        quiz6_level8_stage1_Jawa.name = "Kuis 5"
        quiz6_level8_stage1_Jawa.type = "E"
        quiz6_level8_stage1_Jawa.isCorrect = false
        quiz6_level8_stage1_Jawa.question = "Ca"
        quiz6_level8_stage1_Jawa.choices = []
        quiz6_level8_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 9 Stage 1 Jawa
        let quiz1_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level9_stage1_Jawa.id = 1
        quiz1_level9_stage1_Jawa.name = "Panduan"
        quiz1_level9_stage1_Jawa.type = "Panduan"
        quiz1_level9_stage1_Jawa.isCorrect = false
        quiz1_level9_stage1_Jawa.question = "Ca"
        quiz1_level9_stage1_Jawa.choices = []
        quiz1_level9_stage1_Jawa.images = []
        
        let quiz2_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level9_stage1_Jawa.id = 2
        quiz2_level9_stage1_Jawa.name = "Kuis 1"
        quiz2_level9_stage1_Jawa.type = "A"
        quiz2_level9_stage1_Jawa.isCorrect = false
        quiz2_level9_stage1_Jawa.question = "Ca"
        quiz2_level9_stage1_Jawa.choices = []
        quiz2_level9_stage1_Jawa.images = []
        
        let quiz3_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level9_stage1_Jawa.id = 3
        quiz3_level9_stage1_Jawa.name = "Kuis 2"
        quiz3_level9_stage1_Jawa.type = "B"
        quiz3_level9_stage1_Jawa.isCorrect = false
        quiz3_level9_stage1_Jawa.question = "Ca"
        quiz3_level9_stage1_Jawa.choices = []
        quiz3_level9_stage1_Jawa.images = []
        
        let quiz4_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level9_stage1_Jawa.id = 4
        quiz4_level9_stage1_Jawa.name = "Kuis 3"
        quiz4_level9_stage1_Jawa.type = "C"
        quiz4_level9_stage1_Jawa.isCorrect = false
        quiz4_level9_stage1_Jawa.question = "Ca"
        quiz4_level9_stage1_Jawa.choices = []
        quiz4_level9_stage1_Jawa.images = []
        
        let quiz5_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level9_stage1_Jawa.id = 5
        quiz5_level9_stage1_Jawa.name = "Kuis 4"
        quiz5_level9_stage1_Jawa.type = "D"
        quiz5_level9_stage1_Jawa.isCorrect = false
        quiz5_level9_stage1_Jawa.question = "Ca"
        quiz5_level9_stage1_Jawa.choices = []
        quiz5_level9_stage1_Jawa.images = []
        
        let quiz6_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level9_stage1_Jawa.id = 6
        quiz6_level9_stage1_Jawa.name = "Kuis 5"
        quiz6_level9_stage1_Jawa.type = "E"
        quiz6_level9_stage1_Jawa.isCorrect = false
        quiz6_level9_stage1_Jawa.question = "Ca"
        quiz6_level9_stage1_Jawa.choices = []
        quiz6_level9_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 10 Stage 1 Jawa
        let quiz1_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level10_stage1_Jawa.id = 1
        quiz1_level10_stage1_Jawa.name = "Panduan"
        quiz1_level10_stage1_Jawa.type = "Panduan"
        quiz1_level10_stage1_Jawa.isCorrect = false
        quiz1_level10_stage1_Jawa.question = "Ca"
        quiz1_level10_stage1_Jawa.choices = []
        quiz1_level10_stage1_Jawa.images = []
        
        let quiz2_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level10_stage1_Jawa.id = 2
        quiz2_level10_stage1_Jawa.name = "Kuis 1"
        quiz2_level10_stage1_Jawa.type = "A"
        quiz2_level10_stage1_Jawa.isCorrect = false
        quiz2_level10_stage1_Jawa.question = "Ca"
        quiz2_level10_stage1_Jawa.choices = []
        quiz2_level10_stage1_Jawa.images = []
        
        let quiz3_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level10_stage1_Jawa.id = 3
        quiz3_level10_stage1_Jawa.name = "Kuis 2"
        quiz3_level10_stage1_Jawa.type = "B"
        quiz3_level10_stage1_Jawa.isCorrect = false
        quiz3_level10_stage1_Jawa.question = "Ca"
        quiz3_level10_stage1_Jawa.choices = []
        quiz3_level10_stage1_Jawa.images = []
        
        let quiz4_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level10_stage1_Jawa.id = 4
        quiz4_level10_stage1_Jawa.name = "Kuis 3"
        quiz4_level10_stage1_Jawa.type = "C"
        quiz4_level10_stage1_Jawa.isCorrect = false
        quiz4_level10_stage1_Jawa.question = "Ca"
        quiz4_level10_stage1_Jawa.choices = []
        quiz4_level10_stage1_Jawa.images = []
        
        let quiz5_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level10_stage1_Jawa.id = 5
        quiz5_level10_stage1_Jawa.name = "Kuis 4"
        quiz5_level10_stage1_Jawa.type = "D"
        quiz5_level10_stage1_Jawa.isCorrect = false
        quiz5_level10_stage1_Jawa.question = "Ca"
        quiz5_level10_stage1_Jawa.choices = []
        quiz5_level10_stage1_Jawa.images = []
        
        let quiz6_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level10_stage1_Jawa.id = 6
        quiz6_level10_stage1_Jawa.name = "Kuis 5"
        quiz6_level10_stage1_Jawa.type = "E"
        quiz6_level10_stage1_Jawa.isCorrect = false
        quiz6_level10_stage1_Jawa.question = "Ca"
        quiz6_level10_stage1_Jawa.choices = []
        quiz6_level10_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 11 Stage 1 Jawa
        let quiz1_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level11_stage1_Jawa.id = 1
        quiz1_level11_stage1_Jawa.name = "Panduan"
        quiz1_level11_stage1_Jawa.type = "Panduan"
        quiz1_level11_stage1_Jawa.isCorrect = false
        quiz1_level11_stage1_Jawa.question = "Ca"
        quiz1_level11_stage1_Jawa.choices = []
        quiz1_level11_stage1_Jawa.images = []
        
        let quiz2_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level11_stage1_Jawa.id = 2
        quiz2_level11_stage1_Jawa.name = "Kuis 1"
        quiz2_level11_stage1_Jawa.type = "A"
        quiz2_level11_stage1_Jawa.isCorrect = false
        quiz2_level11_stage1_Jawa.question = "Ca"
        quiz2_level11_stage1_Jawa.choices = []
        quiz2_level11_stage1_Jawa.images = []
        
        let quiz3_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level11_stage1_Jawa.id = 3
        quiz3_level11_stage1_Jawa.name = "Kuis 2"
        quiz3_level11_stage1_Jawa.type = "B"
        quiz3_level11_stage1_Jawa.isCorrect = false
        quiz3_level11_stage1_Jawa.question = "Ca"
        quiz3_level11_stage1_Jawa.choices = []
        quiz3_level11_stage1_Jawa.images = []
        
        let quiz4_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level11_stage1_Jawa.id = 4
        quiz4_level11_stage1_Jawa.name = "Kuis 3"
        quiz4_level11_stage1_Jawa.type = "C"
        quiz4_level11_stage1_Jawa.isCorrect = false
        quiz4_level11_stage1_Jawa.question = "Ca"
        quiz4_level11_stage1_Jawa.choices = []
        quiz4_level11_stage1_Jawa.images = []
        
        let quiz5_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level11_stage1_Jawa.id = 5
        quiz5_level11_stage1_Jawa.name = "Kuis 4"
        quiz5_level11_stage1_Jawa.type = "D"
        quiz5_level11_stage1_Jawa.isCorrect = false
        quiz5_level11_stage1_Jawa.question = "Ca"
        quiz5_level11_stage1_Jawa.choices = []
        quiz5_level11_stage1_Jawa.images = []
        
        let quiz6_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level11_stage1_Jawa.id = 6
        quiz6_level11_stage1_Jawa.name = "Kuis 5"
        quiz6_level11_stage1_Jawa.type = "E"
        quiz6_level11_stage1_Jawa.isCorrect = false
        quiz6_level11_stage1_Jawa.question = "Ca"
        quiz6_level11_stage1_Jawa.choices = []
        quiz6_level11_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 12 Stage 1 Jawa
        let quiz1_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level12_stage1_Jawa.id = 1
        quiz1_level12_stage1_Jawa.name = "Panduan"
        quiz1_level12_stage1_Jawa.type = "Panduan"
        quiz1_level12_stage1_Jawa.isCorrect = false
        quiz1_level12_stage1_Jawa.question = "Ca"
        quiz1_level12_stage1_Jawa.choices = []
        quiz1_level12_stage1_Jawa.images = []
        
        let quiz2_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level12_stage1_Jawa.id = 2
        quiz2_level12_stage1_Jawa.name = "Kuis 1"
        quiz2_level12_stage1_Jawa.type = "A"
        quiz2_level12_stage1_Jawa.isCorrect = false
        quiz2_level12_stage1_Jawa.question = "Ca"
        quiz2_level12_stage1_Jawa.choices = []
        quiz2_level12_stage1_Jawa.images = []
        
        let quiz3_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level12_stage1_Jawa.id = 3
        quiz3_level12_stage1_Jawa.name = "Kuis 2"
        quiz3_level12_stage1_Jawa.type = "B"
        quiz3_level12_stage1_Jawa.isCorrect = false
        quiz3_level12_stage1_Jawa.question = "Ca"
        quiz3_level12_stage1_Jawa.choices = []
        quiz3_level12_stage1_Jawa.images = []
        
        let quiz4_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level12_stage1_Jawa.id = 4
        quiz4_level12_stage1_Jawa.name = "Kuis 3"
        quiz4_level12_stage1_Jawa.type = "C"
        quiz4_level12_stage1_Jawa.isCorrect = false
        quiz4_level12_stage1_Jawa.question = "Ca"
        quiz4_level12_stage1_Jawa.choices = []
        quiz4_level12_stage1_Jawa.images = []
        
        let quiz5_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level12_stage1_Jawa.id = 5
        quiz5_level12_stage1_Jawa.name = "Kuis 4"
        quiz5_level12_stage1_Jawa.type = "D"
        quiz5_level12_stage1_Jawa.isCorrect = false
        quiz5_level12_stage1_Jawa.question = "Ca"
        quiz5_level12_stage1_Jawa.choices = []
        quiz5_level12_stage1_Jawa.images = []
        
        let quiz6_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level12_stage1_Jawa.id = 6
        quiz6_level12_stage1_Jawa.name = "Kuis 5"
        quiz6_level12_stage1_Jawa.type = "E"
        quiz6_level12_stage1_Jawa.isCorrect = false
        quiz6_level12_stage1_Jawa.question = "Ca"
        quiz6_level12_stage1_Jawa.choices = []
        quiz6_level12_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 13 Stage 1 Jawa
        let quiz1_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level13_stage1_Jawa.id = 1
        quiz1_level13_stage1_Jawa.name = "Panduan"
        quiz1_level13_stage1_Jawa.type = "Panduan"
        quiz1_level13_stage1_Jawa.isCorrect = false
        quiz1_level13_stage1_Jawa.question = "Ca"
        quiz1_level13_stage1_Jawa.choices = []
        quiz1_level13_stage1_Jawa.images = []
        
        let quiz2_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level13_stage1_Jawa.id = 2
        quiz2_level13_stage1_Jawa.name = "Kuis 1"
        quiz2_level13_stage1_Jawa.type = "A"
        quiz2_level13_stage1_Jawa.isCorrect = false
        quiz2_level13_stage1_Jawa.question = "Ca"
        quiz2_level13_stage1_Jawa.choices = []
        quiz2_level13_stage1_Jawa.images = []
        
        let quiz3_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level13_stage1_Jawa.id = 3
        quiz3_level13_stage1_Jawa.name = "Kuis 2"
        quiz3_level13_stage1_Jawa.type = "B"
        quiz3_level13_stage1_Jawa.isCorrect = false
        quiz3_level13_stage1_Jawa.question = "Ca"
        quiz3_level13_stage1_Jawa.choices = []
        quiz3_level13_stage1_Jawa.images = []
        
        let quiz4_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level13_stage1_Jawa.id = 4
        quiz4_level13_stage1_Jawa.name = "Kuis 3"
        quiz4_level13_stage1_Jawa.type = "C"
        quiz4_level13_stage1_Jawa.isCorrect = false
        quiz4_level13_stage1_Jawa.question = "Ca"
        quiz4_level13_stage1_Jawa.choices = []
        quiz4_level13_stage1_Jawa.images = []
        
        let quiz5_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level13_stage1_Jawa.id = 5
        quiz5_level13_stage1_Jawa.name = "Kuis 4"
        quiz5_level13_stage1_Jawa.type = "D"
        quiz5_level13_stage1_Jawa.isCorrect = false
        quiz5_level13_stage1_Jawa.question = "Ca"
        quiz5_level13_stage1_Jawa.choices = []
        quiz5_level13_stage1_Jawa.images = []
        
        let quiz6_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level13_stage1_Jawa.id = 6
        quiz6_level13_stage1_Jawa.name = "Kuis 5"
        quiz6_level13_stage1_Jawa.type = "E"
        quiz6_level13_stage1_Jawa.isCorrect = false
        quiz6_level13_stage1_Jawa.question = "Ca"
        quiz6_level13_stage1_Jawa.choices = []
        quiz6_level13_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 14 Stage 1 Jawa
        let quiz1_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level14_stage1_Jawa.id = 1
        quiz1_level14_stage1_Jawa.name = "Panduan"
        quiz1_level14_stage1_Jawa.type = "Panduan"
        quiz1_level14_stage1_Jawa.isCorrect = false
        quiz1_level14_stage1_Jawa.question = "Ca"
        quiz1_level14_stage1_Jawa.choices = []
        quiz1_level14_stage1_Jawa.images = []
        
        let quiz2_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level14_stage1_Jawa.id = 2
        quiz2_level14_stage1_Jawa.name = "Kuis 1"
        quiz2_level14_stage1_Jawa.type = "A"
        quiz2_level14_stage1_Jawa.isCorrect = false
        quiz2_level14_stage1_Jawa.question = "Ca"
        quiz2_level14_stage1_Jawa.choices = []
        quiz2_level14_stage1_Jawa.images = []
        
        let quiz3_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage1_Jawa.id = 3
        quiz3_level14_stage1_Jawa.name = "Kuis 2"
        quiz3_level14_stage1_Jawa.type = "B"
        quiz3_level14_stage1_Jawa.isCorrect = false
        quiz3_level14_stage1_Jawa.question = "Ca"
        quiz3_level14_stage1_Jawa.choices = []
        quiz3_level14_stage1_Jawa.images = []
        
        let quiz4_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level14_stage1_Jawa.id = 4
        quiz4_level14_stage1_Jawa.name = "Kuis 3"
        quiz4_level14_stage1_Jawa.type = "C"
        quiz4_level14_stage1_Jawa.isCorrect = false
        quiz4_level14_stage1_Jawa.question = "Ca"
        quiz4_level14_stage1_Jawa.choices = []
        quiz4_level14_stage1_Jawa.images = []
        
        let quiz5_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage1_Jawa.id = 5
        quiz5_level14_stage1_Jawa.name = "Kuis 4"
        quiz5_level14_stage1_Jawa.type = "D"
        quiz5_level14_stage1_Jawa.isCorrect = false
        quiz5_level14_stage1_Jawa.question = "Ca"
        quiz5_level14_stage1_Jawa.choices = []
        quiz5_level14_stage1_Jawa.images = []
        
        let quiz6_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage1_Jawa.id = 6
        quiz6_level14_stage1_Jawa.name = "Kuis 5"
        quiz6_level14_stage1_Jawa.type = "E"
        quiz6_level14_stage1_Jawa.isCorrect = false
        quiz6_level14_stage1_Jawa.question = "Ca"
        quiz6_level14_stage1_Jawa.choices = []
        quiz6_level14_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 15 Stage 1 Jawa
        let quiz1_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level15_stage1_Jawa.id = 1
        quiz1_level15_stage1_Jawa.name = "Panduan"
        quiz1_level15_stage1_Jawa.type = "Panduan"
        quiz1_level15_stage1_Jawa.isCorrect = false
        quiz1_level15_stage1_Jawa.question = "Ca"
        quiz1_level15_stage1_Jawa.choices = []
        quiz1_level15_stage1_Jawa.images = []
        
        let quiz2_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level15_stage1_Jawa.id = 2
        quiz2_level15_stage1_Jawa.name = "Kuis 1"
        quiz2_level15_stage1_Jawa.type = "A"
        quiz2_level15_stage1_Jawa.isCorrect = false
        quiz2_level15_stage1_Jawa.question = "Ca"
        quiz2_level15_stage1_Jawa.choices = []
        quiz2_level15_stage1_Jawa.images = []
        
        let quiz3_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level15_stage1_Jawa.id = 3
        quiz3_level15_stage1_Jawa.name = "Kuis 2"
        quiz3_level15_stage1_Jawa.type = "B"
        quiz3_level15_stage1_Jawa.isCorrect = false
        quiz3_level15_stage1_Jawa.question = "Ca"
        quiz3_level15_stage1_Jawa.choices = []
        quiz3_level15_stage1_Jawa.images = []
        
        let quiz4_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level15_stage1_Jawa.id = 4
        quiz4_level15_stage1_Jawa.name = "Kuis 3"
        quiz4_level15_stage1_Jawa.type = "C"
        quiz4_level15_stage1_Jawa.isCorrect = false
        quiz4_level15_stage1_Jawa.question = "Ca"
        quiz4_level15_stage1_Jawa.choices = []
        quiz4_level15_stage1_Jawa.images = []
        
        let quiz5_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level15_stage1_Jawa.id = 5
        quiz5_level15_stage1_Jawa.name = "Kuis 4"
        quiz5_level15_stage1_Jawa.type = "D"
        quiz5_level15_stage1_Jawa.isCorrect = false
        quiz5_level15_stage1_Jawa.question = "Ca"
        quiz5_level15_stage1_Jawa.choices = []
        quiz5_level15_stage1_Jawa.images = []
        
        let quiz6_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level15_stage1_Jawa.id = 6
        quiz6_level15_stage1_Jawa.name = "Kuis 5"
        quiz6_level15_stage1_Jawa.type = "E"
        quiz6_level15_stage1_Jawa.isCorrect = false
        quiz6_level15_stage1_Jawa.question = "Ca"
        quiz6_level15_stage1_Jawa.choices = []
        quiz6_level15_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 1 Stage 2 Jawa
        let quiz1_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level1_stage2_Jawa.id = 1
        quiz1_level1_stage2_Jawa.name = "Panduan"
        quiz1_level1_stage2_Jawa.type = "Panduan"
        quiz1_level1_stage2_Jawa.isCorrect = false
        quiz1_level1_stage2_Jawa.question = "Ha"
        quiz1_level1_stage2_Jawa.choices = []
        quiz1_level1_stage2_Jawa.images = []
        
        let quiz2_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level1_stage2_Jawa.id = 2
        quiz2_level1_stage2_Jawa.name = "Kuis 1"
        quiz2_level1_stage2_Jawa.type = "A"
        quiz2_level1_stage2_Jawa.isCorrect = false
        quiz2_level1_stage2_Jawa.question = "Ha"
        quiz2_level1_stage2_Jawa.choices = []
        quiz2_level1_stage2_Jawa.images = []
        
        let quiz3_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level1_stage2_Jawa.id = 3
        quiz3_level1_stage2_Jawa.name = "Kuis 2"
        quiz3_level1_stage2_Jawa.type = "B"
        quiz3_level1_stage2_Jawa.isCorrect = false
        quiz3_level1_stage2_Jawa.question = "Ha"
        quiz3_level1_stage2_Jawa.choices = []
        quiz3_level1_stage2_Jawa.images = []
        
        let quiz4_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level1_stage2_Jawa.id = 4
        quiz4_level1_stage2_Jawa.name = "Kuis 3"
        quiz4_level1_stage2_Jawa.type = "C"
        quiz4_level1_stage2_Jawa.isCorrect = false
        quiz4_level1_stage2_Jawa.question = "Ha"
        quiz4_level1_stage2_Jawa.choices = []
        quiz4_level1_stage2_Jawa.images = []
        
        let quiz5_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level1_stage2_Jawa.id = 5
        quiz5_level1_stage2_Jawa.name = "Kuis 4"
        quiz5_level1_stage2_Jawa.type = "D"
        quiz5_level1_stage2_Jawa.isCorrect = false
        quiz5_level1_stage2_Jawa.question = "Ha"
        quiz5_level1_stage2_Jawa.choices = []
        quiz5_level1_stage2_Jawa.images = []
        
        let quiz6_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level1_stage2_Jawa.id = 6
        quiz6_level1_stage2_Jawa.name = "Kuis 5"
        quiz6_level1_stage2_Jawa.type = "E"
        quiz6_level1_stage2_Jawa.isCorrect = false
        quiz6_level1_stage2_Jawa.question = "Ha"
        quiz6_level1_stage2_Jawa.choices = []
        quiz6_level1_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 2 Stage 2 Jawa
        let quiz1_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level2_stage2_Jawa.id = 1
        quiz1_level2_stage2_Jawa.name = "Panduan"
        quiz1_level2_stage2_Jawa.type = "Panduan"
        quiz1_level2_stage2_Jawa.isCorrect = false
        quiz1_level2_stage2_Jawa.question = "Na"
        quiz1_level2_stage2_Jawa.choices = []
        quiz1_level2_stage2_Jawa.images = []
        
        let quiz2_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level2_stage2_Jawa.id = 2
        quiz2_level2_stage2_Jawa.name = "Kuis 1"
        quiz2_level2_stage2_Jawa.type = "A"
        quiz2_level2_stage2_Jawa.isCorrect = false
        quiz2_level2_stage2_Jawa.question = "Na"
        quiz2_level2_stage2_Jawa.choices = []
        quiz2_level2_stage2_Jawa.images = []
        
        let quiz3_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level2_stage2_Jawa.id = 3
        quiz3_level2_stage2_Jawa.name = "Kuis 2"
        quiz3_level2_stage2_Jawa.type = "B"
        quiz3_level2_stage2_Jawa.isCorrect = false
        quiz3_level2_stage2_Jawa.question = "Na"
        quiz3_level2_stage2_Jawa.choices = []
        quiz3_level2_stage2_Jawa.images = []
        
        let quiz4_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level2_stage2_Jawa.id = 4
        quiz4_level2_stage2_Jawa.name = "Kuis 3"
        quiz4_level2_stage2_Jawa.type = "C"
        quiz4_level2_stage2_Jawa.isCorrect = false
        quiz4_level2_stage2_Jawa.question = "Na"
        quiz4_level2_stage2_Jawa.choices = []
        quiz4_level2_stage2_Jawa.images = []
        
        let quiz5_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level2_stage2_Jawa.id = 5
        quiz5_level2_stage2_Jawa.name = "Kuis 4"
        quiz5_level2_stage2_Jawa.type = "D"
        quiz5_level2_stage2_Jawa.isCorrect = false
        quiz5_level2_stage2_Jawa.question = "Na"
        quiz5_level2_stage2_Jawa.choices = []
        quiz5_level2_stage2_Jawa.images = []
        
        let quiz6_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level2_stage2_Jawa.id = 6
        quiz6_level2_stage2_Jawa.name = "Kuis 5"
        quiz6_level2_stage2_Jawa.type = "E"
        quiz6_level2_stage2_Jawa.isCorrect = false
        quiz6_level2_stage2_Jawa.question = "Na"
        quiz6_level2_stage2_Jawa.choices = []
        quiz6_level2_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 3 Stage 2 Jawa
        let quiz1_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level3_stage2_Jawa.id = 1
        quiz1_level3_stage2_Jawa.name = "Panduan"
        quiz1_level3_stage2_Jawa.type = "Panduan"
        quiz1_level3_stage2_Jawa.isCorrect = false
        quiz1_level3_stage2_Jawa.question = "Ca"
        quiz1_level3_stage2_Jawa.choices = []
        quiz1_level3_stage2_Jawa.images = []
        
        let quiz2_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level3_stage2_Jawa.id = 2
        quiz2_level3_stage2_Jawa.name = "Kuis 1"
        quiz2_level3_stage2_Jawa.type = "A"
        quiz2_level3_stage2_Jawa.isCorrect = false
        quiz2_level3_stage2_Jawa.question = "Ca"
        quiz2_level3_stage2_Jawa.choices = []
        quiz2_level3_stage2_Jawa.images = []
        
        let quiz3_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage2_Jawa.id = 3
        quiz3_level3_stage2_Jawa.name = "Kuis 2"
        quiz3_level3_stage2_Jawa.type = "B"
        quiz3_level3_stage2_Jawa.isCorrect = false
        quiz3_level3_stage2_Jawa.question = "Ca"
        quiz3_level3_stage2_Jawa.choices = []
        quiz3_level3_stage2_Jawa.images = []
        
        let quiz4_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level3_stage2_Jawa.id = 4
        quiz4_level3_stage2_Jawa.name = "Kuis 3"
        quiz4_level3_stage2_Jawa.type = "C"
        quiz4_level3_stage2_Jawa.isCorrect = false
        quiz4_level3_stage2_Jawa.question = "Ca"
        quiz4_level3_stage2_Jawa.choices = []
        quiz4_level3_stage2_Jawa.images = []
        
        let quiz5_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level3_stage2_Jawa.id = 5
        quiz5_level3_stage2_Jawa.name = "Kuis 4"
        quiz5_level3_stage2_Jawa.type = "D"
        quiz5_level3_stage2_Jawa.isCorrect = false
        quiz5_level3_stage2_Jawa.question = "Ca"
        quiz5_level3_stage2_Jawa.choices = []
        quiz5_level3_stage2_Jawa.images = []
        
        let quiz6_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level3_stage2_Jawa.id = 6
        quiz6_level3_stage2_Jawa.name = "Kuis 5"
        quiz6_level3_stage2_Jawa.type = "E"
        quiz6_level3_stage2_Jawa.isCorrect = false
        quiz6_level3_stage2_Jawa.question = "Ca"
        quiz6_level3_stage2_Jawa.choices = []
        quiz6_level3_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 4 Stage 2 Jawa
        let quiz1_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level4_stage2_Jawa.id = 1
        quiz1_level4_stage2_Jawa.name = "Panduan"
        quiz1_level4_stage2_Jawa.type = "Panduan"
        quiz1_level4_stage2_Jawa.isCorrect = false
        quiz1_level4_stage2_Jawa.question = "Ca"
        quiz1_level4_stage2_Jawa.choices = []
        quiz1_level4_stage2_Jawa.images = []
        
        let quiz2_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level4_stage2_Jawa.id = 2
        quiz2_level4_stage2_Jawa.name = "Kuis 1"
        quiz2_level4_stage2_Jawa.type = "A"
        quiz2_level4_stage2_Jawa.isCorrect = false
        quiz2_level4_stage2_Jawa.question = "Ca"
        quiz2_level4_stage2_Jawa.choices = []
        quiz2_level4_stage2_Jawa.images = []
        
        let quiz3_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level4_stage2_Jawa.id = 3
        quiz3_level4_stage2_Jawa.name = "Kuis 2"
        quiz3_level4_stage2_Jawa.type = "B"
        quiz3_level4_stage2_Jawa.isCorrect = false
        quiz3_level4_stage2_Jawa.question = "Ca"
        quiz3_level4_stage2_Jawa.choices = []
        quiz3_level4_stage2_Jawa.images = []
        
        let quiz4_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level4_stage2_Jawa.id = 4
        quiz4_level4_stage2_Jawa.name = "Kuis 3"
        quiz4_level4_stage2_Jawa.type = "C"
        quiz4_level4_stage2_Jawa.isCorrect = false
        quiz4_level4_stage2_Jawa.question = "Ca"
        quiz4_level4_stage2_Jawa.choices = []
        quiz4_level4_stage2_Jawa.images = []
        
        let quiz5_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level4_stage2_Jawa.id = 5
        quiz5_level4_stage2_Jawa.name = "Kuis 4"
        quiz5_level4_stage2_Jawa.type = "D"
        quiz5_level4_stage2_Jawa.isCorrect = false
        quiz5_level4_stage2_Jawa.question = "Ca"
        quiz5_level4_stage2_Jawa.choices = []
        quiz5_level4_stage2_Jawa.images = []
        
        let quiz6_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level4_stage2_Jawa.id = 6
        quiz6_level4_stage2_Jawa.name = "Kuis 5"
        quiz6_level4_stage2_Jawa.type = "E"
        quiz6_level4_stage2_Jawa.isCorrect = false
        quiz6_level4_stage2_Jawa.question = "Ca"
        quiz6_level4_stage2_Jawa.choices = []
        quiz6_level4_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 5 Stage 2 Jawa
        let quiz1_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level5_stage2_Jawa.id = 1
        quiz1_level5_stage2_Jawa.name = "Panduan"
        quiz1_level5_stage2_Jawa.type = "Panduan"
        quiz1_level5_stage2_Jawa.isCorrect = false
        quiz1_level5_stage2_Jawa.question = "Ca"
        quiz1_level5_stage2_Jawa.choices = []
        quiz1_level5_stage2_Jawa.images = []
        
        let quiz2_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage2_Jawa.id = 2
        quiz2_level5_stage1_Jawa.name = "Kuis 1"
        quiz2_level5_stage1_Jawa.type = "A"
        quiz2_level5_stage1_Jawa.isCorrect = false
        quiz2_level5_stage1_Jawa.question = "Ca"
        quiz2_level5_stage1_Jawa.choices = []
        quiz2_level5_stage1_Jawa.images = []
        
        let quiz3_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level5_stage2_Jawa.id = 3
        quiz3_level5_stage2_Jawa.name = "Kuis 2"
        quiz3_level5_stage2_Jawa.type = "B"
        quiz3_level5_stage2_Jawa.isCorrect = false
        quiz3_level5_stage2_Jawa.question = "Ca"
        quiz3_level5_stage2_Jawa.choices = []
        quiz3_level5_stage2_Jawa.images = []
        
        let quiz4_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level5_stage2_Jawa.id = 4
        quiz4_level5_stage2_Jawa.name = "Kuis 3"
        quiz4_level5_stage2_Jawa.type = "C"
        quiz4_level5_stage2_Jawa.isCorrect = false
        quiz4_level5_stage2_Jawa.question = "Ca"
        quiz4_level5_stage2_Jawa.choices = []
        quiz4_level5_stage2_Jawa.images = []
        
        let quiz5_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level5_stage2_Jawa.id = 5
        quiz5_level5_stage2_Jawa.name = "Kuis 4"
        quiz5_level5_stage2_Jawa.type = "D"
        quiz5_level5_stage2_Jawa.isCorrect = false
        quiz5_level5_stage2_Jawa.question = "Ca"
        quiz5_level5_stage2_Jawa.choices = []
        quiz5_level5_stage2_Jawa.images = []
        
        let quiz6_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level5_stage2_Jawa.id = 6
        quiz6_level5_stage2_Jawa.name = "Kuis 5"
        quiz6_level5_stage2_Jawa.type = "E"
        quiz6_level5_stage2_Jawa.isCorrect = false
        quiz6_level5_stage2_Jawa.question = "Ca"
        quiz6_level5_stage2_Jawa.choices = []
        quiz6_level5_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 6 Stage 2 Jawa
        let quiz1_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level6_stage2_Jawa.id = 1
        quiz1_level6_stage2_Jawa.name = "Panduan"
        quiz1_level6_stage2_Jawa.type = "Panduan"
        quiz1_level6_stage2_Jawa.isCorrect = false
        quiz1_level6_stage2_Jawa.question = "Ca"
        quiz1_level6_stage2_Jawa.choices = []
        quiz1_level6_stage2_Jawa.images = []
        
        let quiz2_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level6_stage2_Jawa.id = 2
        quiz2_level6_stage2_Jawa.name = "Kuis 1"
        quiz2_level6_stage2_Jawa.type = "A"
        quiz2_level6_stage2_Jawa.isCorrect = false
        quiz2_level6_stage2_Jawa.question = "Ca"
        quiz2_level6_stage2_Jawa.choices = []
        quiz2_level6_stage2_Jawa.images = []
        
        let quiz3_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level6_stage2_Jawa.id = 3
        quiz3_level6_stage2_Jawa.name = "Kuis 2"
        quiz3_level6_stage2_Jawa.type = "B"
        quiz3_level6_stage2_Jawa.isCorrect = false
        quiz3_level6_stage2_Jawa.question = "Ca"
        quiz3_level6_stage2_Jawa.choices = []
        quiz3_level6_stage2_Jawa.images = []
        
        let quiz4_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level6_stage2_Jawa.id = 4
        quiz4_level6_stage2_Jawa.name = "Kuis 3"
        quiz4_level6_stage2_Jawa.type = "C"
        quiz4_level6_stage2_Jawa.isCorrect = false
        quiz4_level6_stage2_Jawa.question = "Ca"
        quiz4_level6_stage2_Jawa.choices = []
        quiz4_level6_stage2_Jawa.images = []
        
        let quiz5_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level6_stage2_Jawa.id = 5
        quiz5_level6_stage2_Jawa.name = "Kuis 4"
        quiz5_level6_stage2_Jawa.type = "D"
        quiz5_level6_stage2_Jawa.isCorrect = false
        quiz5_level6_stage2_Jawa.question = "Ca"
        quiz5_level6_stage2_Jawa.choices = []
        quiz5_level6_stage2_Jawa.images = []
        
        let quiz6_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level6_stage2_Jawa.id = 6
        quiz6_level6_stage2_Jawa.name = "Kuis 5"
        quiz6_level6_stage2_Jawa.type = "E"
        quiz6_level6_stage2_Jawa.isCorrect = false
        quiz6_level6_stage2_Jawa.question = "Ca"
        quiz6_level6_stage2_Jawa.choices = []
        quiz6_level6_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 7 Stage 2 Jawa
        let quiz1_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level7_stage2_Jawa.id = 1
        quiz1_level7_stage2_Jawa.name = "Panduan"
        quiz1_level7_stage2_Jawa.type = "Panduan"
        quiz1_level7_stage2_Jawa.isCorrect = false
        quiz1_level7_stage2_Jawa.question = "Ca"
        quiz1_level7_stage2_Jawa.choices = []
        quiz1_level7_stage2_Jawa.images = []
        
        let quiz2_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level7_stage2_Jawa.id = 2
        quiz2_level7_stage2_Jawa.name = "Kuis 1"
        quiz2_level7_stage2_Jawa.type = "A"
        quiz2_level7_stage2_Jawa.isCorrect = false
        quiz2_level7_stage2_Jawa.question = "Ca"
        quiz2_level7_stage2_Jawa.choices = []
        quiz2_level7_stage2_Jawa.images = []
        
        let quiz3_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level7_stage2_Jawa.id = 3
        quiz3_level7_stage2_Jawa.name = "Kuis 2"
        quiz3_level7_stage2_Jawa.type = "B"
        quiz3_level7_stage2_Jawa.isCorrect = false
        quiz3_level7_stage2_Jawa.question = "Ca"
        quiz3_level7_stage2_Jawa.choices = []
        quiz3_level7_stage2_Jawa.images = []
        
        let quiz4_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level7_stage2_Jawa.id = 4
        quiz4_level7_stage2_Jawa.name = "Kuis 3"
        quiz4_level7_stage2_Jawa.type = "C"
        quiz4_level7_stage2_Jawa.isCorrect = false
        quiz4_level7_stage2_Jawa.question = "Ca"
        quiz4_level7_stage2_Jawa.choices = []
        quiz4_level7_stage2_Jawa.images = []
        
        let quiz5_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level7_stage2_Jawa.id = 5
        quiz5_level7_stage2_Jawa.name = "Kuis 4"
        quiz5_level7_stage2_Jawa.type = "D"
        quiz5_level7_stage2_Jawa.isCorrect = false
        quiz5_level7_stage2_Jawa.question = "Ca"
        quiz5_level7_stage2_Jawa.choices = []
        quiz5_level7_stage2_Jawa.images = []
        
        let quiz6_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level7_stage2_Jawa.id = 6
        quiz6_level7_stage2_Jawa.name = "Kuis 5"
        quiz6_level7_stage2_Jawa.type = "E"
        quiz6_level7_stage2_Jawa.isCorrect = false
        quiz6_level7_stage2_Jawa.question = "Ca"
        quiz6_level7_stage2_Jawa.choices = []
        quiz6_level7_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 8 Stage 2 Jawa
        let quiz1_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level8_stage2_Jawa.id = 1
        quiz1_level8_stage2_Jawa.name = "Panduan"
        quiz1_level8_stage2_Jawa.type = "Panduan"
        quiz1_level8_stage2_Jawa.isCorrect = false
        quiz1_level8_stage2_Jawa.question = "Ca"
        quiz1_level8_stage2_Jawa.choices = []
        quiz1_level8_stage2_Jawa.images = []
        
        let quiz2_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level8_stage2_Jawa.id = 2
        quiz2_level8_stage2_Jawa.name = "Kuis 1"
        quiz2_level8_stage2_Jawa.type = "A"
        quiz2_level8_stage2_Jawa.isCorrect = false
        quiz2_level8_stage2_Jawa.question = "Ca"
        quiz2_level8_stage2_Jawa.choices = []
        quiz2_level8_stage2_Jawa.images = []
        
        let quiz3_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level8_stage2_Jawa.id = 3
        quiz3_level8_stage2_Jawa.name = "Kuis 2"
        quiz3_level8_stage2_Jawa.type = "B"
        quiz3_level8_stage2_Jawa.isCorrect = false
        quiz3_level8_stage2_Jawa.question = "Ca"
        quiz3_level8_stage2_Jawa.choices = []
        quiz3_level8_stage2_Jawa.images = []
        
        let quiz4_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level8_stage2_Jawa.id = 4
        quiz4_level8_stage2_Jawa.name = "Kuis 3"
        quiz4_level8_stage2_Jawa.type = "C"
        quiz4_level8_stage2_Jawa.isCorrect = false
        quiz4_level8_stage2_Jawa.question = "Ca"
        quiz4_level8_stage2_Jawa.choices = []
        quiz4_level8_stage2_Jawa.images = []
        
        let quiz5_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level8_stage2_Jawa.id = 5
        quiz5_level8_stage2_Jawa.name = "Kuis 4"
        quiz5_level8_stage2_Jawa.type = "D"
        quiz5_level8_stage2_Jawa.isCorrect = false
        quiz5_level8_stage2_Jawa.question = "Ca"
        quiz5_level8_stage2_Jawa.choices = []
        quiz5_level8_stage2_Jawa.images = []
        
        let quiz6_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level8_stage2_Jawa.id = 6
        quiz6_level8_stage2_Jawa.name = "Kuis 5"
        quiz6_level8_stage2_Jawa.type = "E"
        quiz6_level8_stage2_Jawa.isCorrect = false
        quiz6_level8_stage2_Jawa.question = "Ca"
        quiz6_level8_stage2_Jawa.choices = []
        quiz6_level8_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 9 Stage 2 Jawa
        let quiz1_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level9_stage2_Jawa.id = 1
        quiz1_level9_stage2_Jawa.name = "Panduan"
        quiz1_level9_stage2_Jawa.type = "Panduan"
        quiz1_level9_stage2_Jawa.isCorrect = false
        quiz1_level9_stage2_Jawa.question = "Ca"
        quiz1_level9_stage2_Jawa.choices = []
        quiz1_level9_stage2_Jawa.images = []
        
        let quiz2_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level9_stage2_Jawa.id = 2
        quiz2_level9_stage2_Jawa.name = "Kuis 1"
        quiz2_level9_stage2_Jawa.type = "A"
        quiz2_level9_stage2_Jawa.isCorrect = false
        quiz2_level9_stage2_Jawa.question = "Ca"
        quiz2_level9_stage2_Jawa.choices = []
        quiz2_level9_stage2_Jawa.images = []
        
        let quiz3_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level9_stage2_Jawa.id = 3
        quiz3_level9_stage2_Jawa.name = "Kuis 2"
        quiz3_level9_stage2_Jawa.type = "B"
        quiz3_level9_stage2_Jawa.isCorrect = false
        quiz3_level9_stage2_Jawa.question = "Ca"
        quiz3_level9_stage2_Jawa.choices = []
        quiz3_level9_stage2_Jawa.images = []
        
        let quiz4_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level9_stage2_Jawa.id = 4
        quiz4_level9_stage2_Jawa.name = "Kuis 3"
        quiz4_level9_stage2_Jawa.type = "C"
        quiz4_level9_stage2_Jawa.isCorrect = false
        quiz4_level9_stage2_Jawa.question = "Ca"
        quiz4_level9_stage2_Jawa.choices = []
        quiz4_level9_stage2_Jawa.images = []
        
        let quiz5_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level9_stage2_Jawa.id = 5
        quiz5_level9_stage2_Jawa.name = "Kuis 4"
        quiz5_level9_stage2_Jawa.type = "D"
        quiz5_level9_stage2_Jawa.isCorrect = false
        quiz5_level9_stage2_Jawa.question = "Ca"
        quiz5_level9_stage2_Jawa.choices = []
        quiz5_level9_stage2_Jawa.images = []
        
        let quiz6_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level9_stage2_Jawa.id = 6
        quiz6_level9_stage2_Jawa.name = "Kuis 5"
        quiz6_level9_stage2_Jawa.type = "E"
        quiz6_level9_stage2_Jawa.isCorrect = false
        quiz6_level9_stage2_Jawa.question = "Ca"
        quiz6_level9_stage2_Jawa.choices = []
        quiz6_level9_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 10 Stage 2 Jawa
        let quiz1_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level10_stage2_Jawa.id = 1
        quiz1_level10_stage2_Jawa.name = "Panduan"
        quiz1_level10_stage2_Jawa.type = "Panduan"
        quiz1_level10_stage2_Jawa.isCorrect = false
        quiz1_level10_stage2_Jawa.question = "Ca"
        quiz1_level10_stage2_Jawa.choices = []
        quiz1_level10_stage2_Jawa.images = []
        
        let quiz2_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level10_stage2_Jawa.id = 2
        quiz2_level10_stage2_Jawa.name = "Kuis 1"
        quiz2_level10_stage2_Jawa.type = "A"
        quiz2_level10_stage2_Jawa.isCorrect = false
        quiz2_level10_stage2_Jawa.question = "Ca"
        quiz2_level10_stage2_Jawa.choices = []
        quiz2_level10_stage2_Jawa.images = []
        
        let quiz3_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level10_stage2_Jawa.id = 3
        quiz3_level10_stage2_Jawa.name = "Kuis 2"
        quiz3_level10_stage2_Jawa.type = "B"
        quiz3_level10_stage2_Jawa.isCorrect = false
        quiz3_level10_stage2_Jawa.question = "Ca"
        quiz3_level10_stage2_Jawa.choices = []
        quiz3_level10_stage2_Jawa.images = []
        
        let quiz4_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level10_stage2_Jawa.id = 4
        quiz4_level10_stage2_Jawa.name = "Kuis 3"
        quiz4_level10_stage2_Jawa.type = "C"
        quiz4_level10_stage2_Jawa.isCorrect = false
        quiz4_level10_stage2_Jawa.question = "Ca"
        quiz4_level10_stage2_Jawa.choices = []
        quiz4_level10_stage2_Jawa.images = []
        
        let quiz5_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level10_stage2_Jawa.id = 5
        quiz5_level10_stage2_Jawa.name = "Kuis 4"
        quiz5_level10_stage2_Jawa.type = "D"
        quiz5_level10_stage2_Jawa.isCorrect = false
        quiz5_level10_stage2_Jawa.question = "Ca"
        quiz5_level10_stage2_Jawa.choices = []
        quiz5_level10_stage2_Jawa.images = []
        
        let quiz6_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level10_stage2_Jawa.id = 6
        quiz6_level10_stage2_Jawa.name = "Kuis 5"
        quiz6_level10_stage2_Jawa.type = "E"
        quiz6_level10_stage2_Jawa.isCorrect = false
        quiz6_level10_stage2_Jawa.question = "Ca"
        quiz6_level10_stage2_Jawa.choices = []
        quiz6_level10_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 11 Stage 2 Jawa
        let quiz1_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level11_stage2_Jawa.id = 1
        quiz1_level11_stage2_Jawa.name = "Panduan"
        quiz1_level11_stage2_Jawa.type = "Panduan"
        quiz1_level11_stage2_Jawa.isCorrect = false
        quiz1_level11_stage2_Jawa.question = "Ca"
        quiz1_level11_stage2_Jawa.choices = []
        quiz1_level11_stage2_Jawa.images = []
        
        let quiz2_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level11_stage2_Jawa.id = 2
        quiz2_level11_stage2_Jawa.name = "Kuis 1"
        quiz2_level11_stage2_Jawa.type = "A"
        quiz2_level11_stage2_Jawa.isCorrect = false
        quiz2_level11_stage2_Jawa.question = "Ca"
        quiz2_level11_stage2_Jawa.choices = []
        quiz2_level11_stage2_Jawa.images = []
        
        let quiz3_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level11_stage2_Jawa.id = 3
        quiz3_level11_stage2_Jawa.name = "Kuis 2"
        quiz3_level11_stage2_Jawa.type = "B"
        quiz3_level11_stage2_Jawa.isCorrect = false
        quiz3_level11_stage2_Jawa.question = "Ca"
        quiz3_level11_stage2_Jawa.choices = []
        quiz3_level11_stage2_Jawa.images = []
        
        let quiz4_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level11_stage2_Jawa.id = 4
        quiz4_level11_stage2_Jawa.name = "Kuis 3"
        quiz4_level11_stage2_Jawa.type = "C"
        quiz4_level11_stage2_Jawa.isCorrect = false
        quiz4_level11_stage2_Jawa.question = "Ca"
        quiz4_level11_stage2_Jawa.choices = []
        quiz4_level11_stage2_Jawa.images = []
        
        let quiz5_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level11_stage2_Jawa.id = 5
        quiz5_level11_stage2_Jawa.name = "Kuis 4"
        quiz5_level11_stage2_Jawa.type = "D"
        quiz5_level11_stage2_Jawa.isCorrect = false
        quiz5_level11_stage2_Jawa.question = "Ca"
        quiz5_level11_stage2_Jawa.choices = []
        quiz5_level11_stage2_Jawa.images = []
        
        let quiz6_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level11_stage2_Jawa.id = 6
        quiz6_level11_stage2_Jawa.name = "Kuis 5"
        quiz6_level11_stage2_Jawa.type = "E"
        quiz6_level11_stage2_Jawa.isCorrect = false
        quiz6_level11_stage2_Jawa.question = "Ca"
        quiz6_level11_stage2_Jawa.choices = []
        quiz6_level11_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 12 Stage 2 Jawa
        let quiz1_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level12_stage2_Jawa.id = 1
        quiz1_level12_stage2_Jawa.name = "Panduan"
        quiz1_level12_stage2_Jawa.type = "Panduan"
        quiz1_level12_stage2_Jawa.isCorrect = false
        quiz1_level12_stage2_Jawa.question = "Ca"
        quiz1_level12_stage2_Jawa.choices = []
        quiz1_level12_stage2_Jawa.images = []
        
        let quiz2_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level12_stage2_Jawa.id = 2
        quiz2_level12_stage2_Jawa.name = "Kuis 1"
        quiz2_level12_stage2_Jawa.type = "A"
        quiz2_level12_stage2_Jawa.isCorrect = false
        quiz2_level12_stage2_Jawa.question = "Ca"
        quiz2_level12_stage2_Jawa.choices = []
        quiz2_level12_stage2_Jawa.images = []
        
        let quiz3_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level12_stage2_Jawa.id = 3
        quiz3_level12_stage2_Jawa.name = "Kuis 2"
        quiz3_level12_stage2_Jawa.type = "B"
        quiz3_level12_stage2_Jawa.isCorrect = false
        quiz3_level12_stage2_Jawa.question = "Ca"
        quiz3_level12_stage2_Jawa.choices = []
        quiz3_level12_stage2_Jawa.images = []
        
        let quiz4_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level12_stage2_Jawa.id = 4
        quiz4_level12_stage2_Jawa.name = "Kuis 3"
        quiz4_level12_stage2_Jawa.type = "C"
        quiz4_level12_stage2_Jawa.isCorrect = false
        quiz4_level12_stage2_Jawa.question = "Ca"
        quiz4_level12_stage2_Jawa.choices = []
        quiz4_level12_stage2_Jawa.images = []
        
        let quiz5_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level12_stage2_Jawa.id = 5
        quiz5_level12_stage2_Jawa.name = "Kuis 4"
        quiz5_level12_stage2_Jawa.type = "D"
        quiz5_level12_stage2_Jawa.isCorrect = false
        quiz5_level12_stage2_Jawa.question = "Ca"
        quiz5_level12_stage2_Jawa.choices = []
        quiz5_level12_stage2_Jawa.images = []
        
        let quiz6_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level12_stage2_Jawa.id = 6
        quiz6_level12_stage2_Jawa.name = "Kuis 5"
        quiz6_level12_stage2_Jawa.type = "E"
        quiz6_level12_stage2_Jawa.isCorrect = false
        quiz6_level12_stage2_Jawa.question = "Ca"
        quiz6_level12_stage2_Jawa.choices = []
        quiz6_level12_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 13 Stage 1 Jawa
        let quiz1_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level13_stage2_Jawa.id = 1
        quiz1_level13_stage2_Jawa.name = "Panduan"
        quiz1_level13_stage2_Jawa.type = "Panduan"
        quiz1_level13_stage2_Jawa.isCorrect = false
        quiz1_level13_stage2_Jawa.question = "Ca"
        quiz1_level13_stage2_Jawa.choices = []
        quiz1_level13_stage2_Jawa.images = []
        
        let quiz2_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level13_stage2_Jawa.id = 2
        quiz2_level13_stage2_Jawa.name = "Kuis 1"
        quiz2_level13_stage2_Jawa.type = "A"
        quiz2_level13_stage2_Jawa.isCorrect = false
        quiz2_level13_stage2_Jawa.question = "Ca"
        quiz2_level13_stage2_Jawa.choices = []
        quiz2_level13_stage2_Jawa.images = []
        
        let quiz3_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level13_stage2_Jawa.id = 3
        quiz3_level13_stage2_Jawa.name = "Kuis 2"
        quiz3_level13_stage2_Jawa.type = "B"
        quiz3_level13_stage2_Jawa.isCorrect = false
        quiz3_level13_stage2_Jawa.question = "Ca"
        quiz3_level13_stage2_Jawa.choices = []
        quiz3_level13_stage2_Jawa.images = []
        
        let quiz4_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level13_stage2_Jawa.id = 4
        quiz4_level13_stage2_Jawa.name = "Kuis 3"
        quiz4_level13_stage2_Jawa.type = "C"
        quiz4_level13_stage2_Jawa.isCorrect = false
        quiz4_level13_stage2_Jawa.question = "Ca"
        quiz4_level13_stage2_Jawa.choices = []
        quiz4_level13_stage2_Jawa.images = []
        
        let quiz5_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level13_stage2_Jawa.id = 5
        quiz5_level13_stage2_Jawa.name = "Kuis 4"
        quiz5_level13_stage2_Jawa.type = "D"
        quiz5_level13_stage2_Jawa.isCorrect = false
        quiz5_level13_stage2_Jawa.question = "Ca"
        quiz5_level13_stage2_Jawa.choices = []
        quiz5_level13_stage2_Jawa.images = []
        
        let quiz6_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level13_stage2_Jawa.id = 6
        quiz6_level13_stage2_Jawa.name = "Kuis 5"
        quiz6_level13_stage2_Jawa.type = "E"
        quiz6_level13_stage2_Jawa.isCorrect = false
        quiz6_level13_stage2_Jawa.question = "Ca"
        quiz6_level13_stage2_Jawa.choices = []
        quiz6_level13_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 14 Stage 2 Jawa
        let quiz1_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level14_stage2_Jawa.id = 1
        quiz1_level14_stage2_Jawa.name = "Panduan"
        quiz1_level14_stage2_Jawa.type = "Panduan"
        quiz1_level14_stage2_Jawa.isCorrect = false
        quiz1_level14_stage2_Jawa.question = "Ca"
        quiz1_level14_stage2_Jawa.choices = []
        quiz1_level14_stage2_Jawa.images = []
        
        let quiz2_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level14_stage2_Jawa.id = 2
        quiz2_level14_stage2_Jawa.name = "Kuis 1"
        quiz2_level14_stage2_Jawa.type = "A"
        quiz2_level14_stage2_Jawa.isCorrect = false
        quiz2_level14_stage2_Jawa.question = "Ca"
        quiz2_level14_stage2_Jawa.choices = []
        quiz2_level14_stage2_Jawa.images = []
        
        let quiz3_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage2_Jawa.id = 3
        quiz3_level14_stage2_Jawa.name = "Kuis 2"
        quiz3_level14_stage2_Jawa.type = "B"
        quiz3_level14_stage2_Jawa.isCorrect = false
        quiz3_level14_stage2_Jawa.question = "Ca"
        quiz3_level14_stage2_Jawa.choices = []
        quiz3_level14_stage2_Jawa.images = []
        
        let quiz4_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level14_stage2_Jawa.id = 4
        quiz4_level14_stage2_Jawa.name = "Kuis 3"
        quiz4_level14_stage2_Jawa.type = "C"
        quiz4_level14_stage2_Jawa.isCorrect = false
        quiz4_level14_stage2_Jawa.question = "Ca"
        quiz4_level14_stage2_Jawa.choices = []
        quiz4_level14_stage2_Jawa.images = []
        
        let quiz5_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage2_Jawa.id = 5
        quiz5_level14_stage2_Jawa.name = "Kuis 4"
        quiz5_level14_stage2_Jawa.type = "D"
        quiz5_level14_stage2_Jawa.isCorrect = false
        quiz5_level14_stage2_Jawa.question = "Ca"
        quiz5_level14_stage2_Jawa.choices = []
        quiz5_level14_stage2_Jawa.images = []
        
        let quiz6_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage2_Jawa.id = 6
        quiz6_level14_stage2_Jawa.name = "Kuis 5"
        quiz6_level14_stage2_Jawa.type = "E"
        quiz6_level14_stage2_Jawa.isCorrect = false
        quiz6_level14_stage2_Jawa.question = "Ca"
        quiz6_level14_stage2_Jawa.choices = []
        quiz6_level14_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 15 Stage 2 Jawa
        let quiz1_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level15_stage2_Jawa.id = 1
        quiz1_level15_stage2_Jawa.name = "Panduan"
        quiz1_level15_stage2_Jawa.type = "Panduan"
        quiz1_level15_stage2_Jawa.isCorrect = false
        quiz1_level15_stage2_Jawa.question = "Ca"
        quiz1_level15_stage2_Jawa.choices = []
        quiz1_level15_stage2_Jawa.images = []
        
        let quiz2_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level15_stage2_Jawa.id = 2
        quiz2_level15_stage2_Jawa.name = "Kuis 1"
        quiz2_level15_stage2_Jawa.type = "A"
        quiz2_level15_stage2_Jawa.isCorrect = false
        quiz2_level15_stage2_Jawa.question = "Ca"
        quiz2_level15_stage2_Jawa.choices = []
        quiz2_level15_stage2_Jawa.images = []
        
        let quiz3_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level15_stage2_Jawa.id = 3
        quiz3_level15_stage2_Jawa.name = "Kuis 2"
        quiz3_level15_stage2_Jawa.type = "B"
        quiz3_level15_stage2_Jawa.isCorrect = false
        quiz3_level15_stage2_Jawa.question = "Ca"
        quiz3_level15_stage2_Jawa.choices = []
        quiz3_level15_stage2_Jawa.images = []
        
        let quiz4_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level15_stage2_Jawa.id = 4
        quiz4_level15_stage2_Jawa.name = "Kuis 3"
        quiz4_level15_stage2_Jawa.type = "C"
        quiz4_level15_stage2_Jawa.isCorrect = false
        quiz4_level15_stage2_Jawa.question = "Ca"
        quiz4_level15_stage2_Jawa.choices = []
        quiz4_level15_stage2_Jawa.images = []
        
        let quiz5_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level15_stage2_Jawa.id = 5
        quiz5_level15_stage2_Jawa.name = "Kuis 4"
        quiz5_level15_stage2_Jawa.type = "D"
        quiz5_level15_stage2_Jawa.isCorrect = false
        quiz5_level15_stage2_Jawa.question = "Ca"
        quiz5_level15_stage2_Jawa.choices = []
        quiz5_level15_stage2_Jawa.images = []
        
        let quiz6_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level15_stage2_Jawa.id = 6
        quiz6_level15_stage2_Jawa.name = "Kuis 5"
        quiz6_level15_stage2_Jawa.type = "E"
        quiz6_level15_stage2_Jawa.isCorrect = false
        quiz6_level15_stage2_Jawa.question = "Ca"
        quiz6_level15_stage2_Jawa.choices = []
        quiz6_level15_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 1 Stage 3 Jawa
        let quiz1_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level1_stage3_Jawa.id = 1
        quiz1_level1_stage3_Jawa.name = "Panduan"
        quiz1_level1_stage3_Jawa.type = "Panduan"
        quiz1_level1_stage3_Jawa.isCorrect = false
        quiz1_level1_stage3_Jawa.question = "Ha"
        quiz1_level1_stage3_Jawa.choices = []
        quiz1_level1_stage3_Jawa.images = []
        
        let quiz2_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level1_stage3_Jawa.id = 2
        quiz2_level1_stage3_Jawa.name = "Kuis 1"
        quiz2_level1_stage3_Jawa.type = "A"
        quiz2_level1_stage3_Jawa.isCorrect = false
        quiz2_level1_stage3_Jawa.question = "Ha"
        quiz2_level1_stage3_Jawa.choices = []
        quiz2_level1_stage3_Jawa.images = []
        
        let quiz3_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level1_stage3_Jawa.id = 3
        quiz3_level1_stage3_Jawa.name = "Kuis 2"
        quiz3_level1_stage3_Jawa.type = "B"
        quiz3_level1_stage3_Jawa.isCorrect = false
        quiz3_level1_stage3_Jawa.question = "Ha"
        quiz3_level1_stage3_Jawa.choices = []
        quiz3_level1_stage3_Jawa.images = []
        
        let quiz4_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level1_stage3_Jawa.id = 4
        quiz4_level1_stage3_Jawa.name = "Kuis 3"
        quiz4_level1_stage3_Jawa.type = "C"
        quiz4_level1_stage3_Jawa.isCorrect = false
        quiz4_level1_stage3_Jawa.question = "Ha"
        quiz4_level1_stage3_Jawa.choices = []
        quiz4_level1_stage3_Jawa.images = []
        
        let quiz5_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level1_stage3_Jawa.id = 5
        quiz5_level1_stage3_Jawa.name = "Kuis 4"
        quiz5_level1_stage3_Jawa.type = "D"
        quiz5_level1_stage3_Jawa.isCorrect = false
        quiz5_level1_stage3_Jawa.question = "Ha"
        quiz5_level1_stage3_Jawa.choices = []
        quiz5_level1_stage3_Jawa.images = []
        
        let quiz6_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level1_stage3_Jawa.id = 6
        quiz6_level1_stage3_Jawa.name = "Kuis 5"
        quiz6_level1_stage3_Jawa.type = "E"
        quiz6_level1_stage3_Jawa.isCorrect = false
        quiz6_level1_stage3_Jawa.question = "Ha"
        quiz6_level1_stage3_Jawa.choices = []
        quiz6_level1_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 2 Stage 3 Jawa
        let quiz1_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level2_stage3_Jawa.id = 1
        quiz1_level2_stage3_Jawa.name = "Panduan"
        quiz1_level2_stage3_Jawa.type = "Panduan"
        quiz1_level2_stage3_Jawa.isCorrect = false
        quiz1_level2_stage3_Jawa.question = "Na"
        quiz1_level2_stage3_Jawa.choices = []
        quiz1_level2_stage3_Jawa.images = []
        
        let quiz2_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level2_stage3_Jawa.id = 2
        quiz2_level2_stage3_Jawa.name = "Kuis 1"
        quiz2_level2_stage3_Jawa.type = "A"
        quiz2_level2_stage3_Jawa.isCorrect = false
        quiz2_level2_stage3_Jawa.question = "Na"
        quiz2_level2_stage3_Jawa.choices = []
        quiz2_level2_stage3_Jawa.images = []
        
        let quiz3_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level2_stage3_Jawa.id = 3
        quiz3_level2_stage3_Jawa.name = "Kuis 2"
        quiz3_level2_stage3_Jawa.type = "B"
        quiz3_level2_stage3_Jawa.isCorrect = false
        quiz3_level2_stage3_Jawa.question = "Na"
        quiz3_level2_stage3_Jawa.choices = []
        quiz3_level2_stage3_Jawa.images = []
        
        let quiz4_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level2_stage3_Jawa.id = 4
        quiz4_level2_stage3_Jawa.name = "Kuis 3"
        quiz4_level2_stage3_Jawa.type = "C"
        quiz4_level2_stage3_Jawa.isCorrect = false
        quiz4_level2_stage3_Jawa.question = "Na"
        quiz4_level2_stage3_Jawa.choices = []
        quiz4_level2_stage3_Jawa.images = []
        
        let quiz5_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level2_stage3_Jawa.id = 5
        quiz5_level2_stage3_Jawa.name = "Kuis 4"
        quiz5_level2_stage3_Jawa.type = "D"
        quiz5_level2_stage3_Jawa.isCorrect = false
        quiz5_level2_stage3_Jawa.question = "Na"
        quiz5_level2_stage3_Jawa.choices = []
        quiz5_level2_stage3_Jawa.images = []
        
        let quiz6_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level2_stage3_Jawa.id = 6
        quiz6_level2_stage3_Jawa.name = "Kuis 5"
        quiz6_level2_stage3_Jawa.type = "E"
        quiz6_level2_stage3_Jawa.isCorrect = false
        quiz6_level2_stage3_Jawa.question = "Na"
        quiz6_level2_stage3_Jawa.choices = []
        quiz6_level2_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 3 Stage 2 Jawa
        let quiz1_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level3_stage3_Jawa.id = 1
        quiz1_level3_stage3_Jawa.name = "Panduan"
        quiz1_level3_stage3_Jawa.type = "Panduan"
        quiz1_level3_stage3_Jawa.isCorrect = false
        quiz1_level3_stage3_Jawa.question = "Ca"
        quiz1_level3_stage3_Jawa.choices = []
        quiz1_level3_stage3_Jawa.images = []
        
        let quiz2_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level3_stage3_Jawa.id = 2
        quiz2_level3_stage3_Jawa.name = "Kuis 1"
        quiz2_level3_stage3_Jawa.type = "A"
        quiz2_level3_stage3_Jawa.isCorrect = false
        quiz2_level3_stage3_Jawa.question = "Ca"
        quiz2_level3_stage3_Jawa.choices = []
        quiz2_level3_stage3_Jawa.images = []
        
        let quiz3_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage3_Jawa.id = 3
        quiz3_level3_stage3_Jawa.name = "Kuis 2"
        quiz3_level3_stage3_Jawa.type = "B"
        quiz3_level3_stage3_Jawa.isCorrect = false
        quiz3_level3_stage3_Jawa.question = "Ca"
        quiz3_level3_stage3_Jawa.choices = []
        quiz3_level3_stage3_Jawa.images = []
        
        let quiz4_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level3_stage3_Jawa.id = 4
        quiz4_level3_stage3_Jawa.name = "Kuis 3"
        quiz4_level3_stage3_Jawa.type = "C"
        quiz4_level3_stage3_Jawa.isCorrect = false
        quiz4_level3_stage3_Jawa.question = "Ca"
        quiz4_level3_stage3_Jawa.choices = []
        quiz4_level3_stage3_Jawa.images = []
        
        let quiz5_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level3_stage3_Jawa.id = 5
        quiz5_level3_stage3_Jawa.name = "Kuis 4"
        quiz5_level3_stage3_Jawa.type = "D"
        quiz5_level3_stage3_Jawa.isCorrect = false
        quiz5_level3_stage3_Jawa.question = "Ca"
        quiz5_level3_stage3_Jawa.choices = []
        quiz5_level3_stage3_Jawa.images = []
        
        let quiz6_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level3_stage3_Jawa.id = 6
        quiz6_level3_stage3_Jawa.name = "Kuis 5"
        quiz6_level3_stage3_Jawa.type = "E"
        quiz6_level3_stage3_Jawa.isCorrect = false
        quiz6_level3_stage3_Jawa.question = "Ca"
        quiz6_level3_stage3_Jawa.choices = []
        quiz6_level3_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 4 Stage 2 Jawa
        let quiz1_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level4_stage3_Jawa.id = 1
        quiz1_level4_stage3_Jawa.name = "Panduan"
        quiz1_level4_stage3_Jawa.type = "Panduan"
        quiz1_level4_stage3_Jawa.isCorrect = false
        quiz1_level4_stage3_Jawa.question = "Ca"
        quiz1_level4_stage3_Jawa.choices = []
        quiz1_level4_stage3_Jawa.images = []
        
        let quiz2_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level4_stage3_Jawa.id = 2
        quiz2_level4_stage3_Jawa.name = "Kuis 1"
        quiz2_level4_stage3_Jawa.type = "A"
        quiz2_level4_stage3_Jawa.isCorrect = false
        quiz2_level4_stage3_Jawa.question = "Ca"
        quiz2_level4_stage3_Jawa.choices = []
        quiz2_level4_stage3_Jawa.images = []
        
        let quiz3_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level4_stage3_Jawa.id = 3
        quiz3_level4_stage3_Jawa.name = "Kuis 2"
        quiz3_level4_stage3_Jawa.type = "B"
        quiz3_level4_stage3_Jawa.isCorrect = false
        quiz3_level4_stage3_Jawa.question = "Ca"
        quiz3_level4_stage3_Jawa.choices = []
        quiz3_level4_stage3_Jawa.images = []
        
        let quiz4_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level4_stage3_Jawa.id = 4
        quiz4_level4_stage3_Jawa.name = "Kuis 3"
        quiz4_level4_stage3_Jawa.type = "C"
        quiz4_level4_stage3_Jawa.isCorrect = false
        quiz4_level4_stage3_Jawa.question = "Ca"
        quiz4_level4_stage3_Jawa.choices = []
        quiz4_level4_stage3_Jawa.images = []
        
        let quiz5_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level4_stage3_Jawa.id = 5
        quiz5_level4_stage3_Jawa.name = "Kuis 4"
        quiz5_level4_stage3_Jawa.type = "D"
        quiz5_level4_stage3_Jawa.isCorrect = false
        quiz5_level4_stage3_Jawa.question = "Ca"
        quiz5_level4_stage3_Jawa.choices = []
        quiz5_level4_stage3_Jawa.images = []
        
        let quiz6_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level4_stage3_Jawa.id = 6
        quiz6_level4_stage3_Jawa.name = "Kuis 5"
        quiz6_level4_stage3_Jawa.type = "E"
        quiz6_level4_stage3_Jawa.isCorrect = false
        quiz6_level4_stage3_Jawa.question = "Ca"
        quiz6_level4_stage3_Jawa.choices = []
        quiz6_level4_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 5 Stage 3 Jawa
        let quiz1_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level5_stage3_Jawa.id = 1
        quiz1_level5_stage3_Jawa.name = "Panduan"
        quiz1_level5_stage3_Jawa.type = "Panduan"
        quiz1_level5_stage3_Jawa.isCorrect = false
        quiz1_level5_stage3_Jawa.question = "Ca"
        quiz1_level5_stage3_Jawa.choices = []
        quiz1_level5_stage3_Jawa.images = []
        
        let quiz2_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage3_Jawa.id = 2
        quiz2_level5_stage3_Jawa.name = "Kuis 1"
        quiz2_level5_stage3_Jawa.type = "A"
        quiz2_level5_stage3_Jawa.isCorrect = false
        quiz2_level5_stage3_Jawa.question = "Ca"
        quiz2_level5_stage3_Jawa.choices = []
        quiz2_level5_stage3_Jawa.images = []
        
        let quiz3_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level5_stage3_Jawa.id = 3
        quiz3_level5_stage3_Jawa.name = "Kuis 2"
        quiz3_level5_stage3_Jawa.type = "B"
        quiz3_level5_stage3_Jawa.isCorrect = false
        quiz3_level5_stage3_Jawa.question = "Ca"
        quiz3_level5_stage3_Jawa.choices = []
        quiz3_level5_stage3_Jawa.images = []
        
        let quiz4_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level5_stage3_Jawa.id = 4
        quiz4_level5_stage3_Jawa.name = "Kuis 3"
        quiz4_level5_stage3_Jawa.type = "C"
        quiz4_level5_stage3_Jawa.isCorrect = false
        quiz4_level5_stage3_Jawa.question = "Ca"
        quiz4_level5_stage3_Jawa.choices = []
        quiz4_level5_stage3_Jawa.images = []
        
        let quiz5_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level5_stage3_Jawa.id = 5
        quiz5_level5_stage3_Jawa.name = "Kuis 4"
        quiz5_level5_stage3_Jawa.type = "D"
        quiz5_level5_stage3_Jawa.isCorrect = false
        quiz5_level5_stage3_Jawa.question = "Ca"
        quiz5_level5_stage3_Jawa.choices = []
        quiz5_level5_stage3_Jawa.images = []
        
        let quiz6_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level5_stage3_Jawa.id = 6
        quiz6_level5_stage3_Jawa.name = "Kuis 5"
        quiz6_level5_stage3_Jawa.type = "E"
        quiz6_level5_stage3_Jawa.isCorrect = false
        quiz6_level5_stage3_Jawa.question = "Ca"
        quiz6_level5_stage3_Jawa.choices = []
        quiz6_level5_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 6 Stage 3 Jawa
        let quiz1_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level6_stage3_Jawa.id = 1
        quiz1_level6_stage3_Jawa.name = "Panduan"
        quiz1_level6_stage3_Jawa.type = "Panduan"
        quiz1_level6_stage3_Jawa.isCorrect = false
        quiz1_level6_stage3_Jawa.question = "Ca"
        quiz1_level6_stage3_Jawa.choices = []
        quiz1_level6_stage3_Jawa.images = []
        
        let quiz2_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level6_stage3_Jawa.id = 2
        quiz2_level6_stage3_Jawa.name = "Kuis 1"
        quiz2_level6_stage3_Jawa.type = "A"
        quiz2_level6_stage3_Jawa.isCorrect = false
        quiz2_level6_stage3_Jawa.question = "Ca"
        quiz2_level6_stage3_Jawa.choices = []
        quiz2_level6_stage3_Jawa.images = []
        
        let quiz3_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level6_stage3_Jawa.id = 3
        quiz3_level6_stage3_Jawa.name = "Kuis 2"
        quiz3_level6_stage3_Jawa.type = "B"
        quiz3_level6_stage3_Jawa.isCorrect = false
        quiz3_level6_stage3_Jawa.question = "Ca"
        quiz3_level6_stage3_Jawa.choices = []
        quiz3_level6_stage3_Jawa.images = []
        
        let quiz4_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level6_stage3_Jawa.id = 4
        quiz4_level6_stage3_Jawa.name = "Kuis 3"
        quiz4_level6_stage3_Jawa.type = "C"
        quiz4_level6_stage3_Jawa.isCorrect = false
        quiz4_level6_stage3_Jawa.question = "Ca"
        quiz4_level6_stage3_Jawa.choices = []
        quiz4_level6_stage3_Jawa.images = []
        
        let quiz5_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level6_stage3_Jawa.id = 5
        quiz5_level6_stage3_Jawa.name = "Kuis 4"
        quiz5_level6_stage3_Jawa.type = "D"
        quiz5_level6_stage3_Jawa.isCorrect = false
        quiz5_level6_stage3_Jawa.question = "Ca"
        quiz5_level6_stage3_Jawa.choices = []
        quiz5_level6_stage3_Jawa.images = []
        
        let quiz6_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level6_stage3_Jawa.id = 6
        quiz6_level6_stage3_Jawa.name = "Kuis 5"
        quiz6_level6_stage3_Jawa.type = "E"
        quiz6_level6_stage3_Jawa.isCorrect = false
        quiz6_level6_stage3_Jawa.question = "Ca"
        quiz6_level6_stage3_Jawa.choices = []
        quiz6_level6_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 7 Stage 3 Jawa
        let quiz1_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level7_stage3_Jawa.id = 1
        quiz1_level7_stage3_Jawa.name = "Panduan"
        quiz1_level7_stage3_Jawa.type = "Panduan"
        quiz1_level7_stage3_Jawa.isCorrect = false
        quiz1_level7_stage3_Jawa.question = "Ca"
        quiz1_level7_stage3_Jawa.choices = []
        quiz1_level7_stage3_Jawa.images = []
        
        let quiz2_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level7_stage3_Jawa.id = 2
        quiz2_level7_stage3_Jawa.name = "Kuis 1"
        quiz2_level7_stage3_Jawa.type = "A"
        quiz2_level7_stage3_Jawa.isCorrect = false
        quiz2_level7_stage3_Jawa.question = "Ca"
        quiz2_level7_stage3_Jawa.choices = []
        quiz2_level7_stage3_Jawa.images = []
        
        let quiz3_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level7_stage3_Jawa.id = 3
        quiz3_level7_stage3_Jawa.name = "Kuis 2"
        quiz3_level7_stage3_Jawa.type = "B"
        quiz3_level7_stage3_Jawa.isCorrect = false
        quiz3_level7_stage3_Jawa.question = "Ca"
        quiz3_level7_stage3_Jawa.choices = []
        quiz3_level7_stage3_Jawa.images = []
        
        let quiz4_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level7_stage3_Jawa.id = 4
        quiz4_level7_stage3_Jawa.name = "Kuis 3"
        quiz4_level7_stage3_Jawa.type = "C"
        quiz4_level7_stage3_Jawa.isCorrect = false
        quiz4_level7_stage3_Jawa.question = "Ca"
        quiz4_level7_stage3_Jawa.choices = []
        quiz4_level7_stage3_Jawa.images = []
        
        let quiz5_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level7_stage3_Jawa.id = 5
        quiz5_level7_stage3_Jawa.name = "Kuis 4"
        quiz5_level7_stage3_Jawa.type = "D"
        quiz5_level7_stage3_Jawa.isCorrect = false
        quiz5_level7_stage3_Jawa.question = "Ca"
        quiz5_level7_stage3_Jawa.choices = []
        quiz5_level7_stage3_Jawa.images = []
        
        let quiz6_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level7_stage3_Jawa.id = 6
        quiz6_level7_stage3_Jawa.name = "Kuis 5"
        quiz6_level7_stage3_Jawa.type = "E"
        quiz6_level7_stage3_Jawa.isCorrect = false
        quiz6_level7_stage3_Jawa.question = "Ca"
        quiz6_level7_stage3_Jawa.choices = []
        quiz6_level7_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 8 Stage 3 Jawa
        let quiz1_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level8_stage3_Jawa.id = 1
        quiz1_level8_stage3_Jawa.name = "Panduan"
        quiz1_level8_stage3_Jawa.type = "Panduan"
        quiz1_level8_stage3_Jawa.isCorrect = false
        quiz1_level8_stage3_Jawa.question = "Ca"
        quiz1_level8_stage3_Jawa.choices = []
        quiz1_level8_stage3_Jawa.images = []
        
        let quiz2_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level8_stage3_Jawa.id = 2
        quiz2_level8_stage3_Jawa.name = "Kuis 1"
        quiz2_level8_stage3_Jawa.type = "A"
        quiz2_level8_stage3_Jawa.isCorrect = false
        quiz2_level8_stage3_Jawa.question = "Ca"
        quiz2_level8_stage3_Jawa.choices = []
        quiz2_level8_stage3_Jawa.images = []
        
        let quiz3_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level8_stage3_Jawa.id = 3
        quiz3_level8_stage3_Jawa.name = "Kuis 2"
        quiz3_level8_stage3_Jawa.type = "B"
        quiz3_level8_stage3_Jawa.isCorrect = false
        quiz3_level8_stage3_Jawa.question = "Ca"
        quiz3_level8_stage3_Jawa.choices = []
        quiz3_level8_stage3_Jawa.images = []
        
        let quiz4_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level8_stage3_Jawa.id = 4
        quiz4_level8_stage3_Jawa.name = "Kuis 3"
        quiz4_level8_stage3_Jawa.type = "C"
        quiz4_level8_stage3_Jawa.isCorrect = false
        quiz4_level8_stage3_Jawa.question = "Ca"
        quiz4_level8_stage3_Jawa.choices = []
        quiz4_level8_stage3_Jawa.images = []
        
        let quiz5_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level8_stage3_Jawa.id = 5
        quiz5_level8_stage3_Jawa.name = "Kuis 4"
        quiz5_level8_stage3_Jawa.type = "D"
        quiz5_level8_stage3_Jawa.isCorrect = false
        quiz5_level8_stage3_Jawa.question = "Ca"
        quiz5_level8_stage3_Jawa.choices = []
        quiz5_level8_stage3_Jawa.images = []
        
        let quiz6_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level8_stage3_Jawa.id = 6
        quiz6_level8_stage3_Jawa.name = "Kuis 5"
        quiz6_level8_stage3_Jawa.type = "E"
        quiz6_level8_stage3_Jawa.isCorrect = false
        quiz6_level8_stage3_Jawa.question = "Ca"
        quiz6_level8_stage3_Jawa.choices = []
        quiz6_level8_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 9 Stage 2 Jawa
        let quiz1_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level9_stage3_Jawa.id = 1
        quiz1_level9_stage3_Jawa.name = "Panduan"
        quiz1_level9_stage3_Jawa.type = "Panduan"
        quiz1_level9_stage3_Jawa.isCorrect = false
        quiz1_level9_stage3_Jawa.question = "Ca"
        quiz1_level9_stage3_Jawa.choices = []
        quiz1_level9_stage3_Jawa.images = []
        
        let quiz2_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level9_stage3_Jawa.id = 2
        quiz2_level9_stage3_Jawa.name = "Kuis 1"
        quiz2_level9_stage3_Jawa.type = "A"
        quiz2_level9_stage3_Jawa.isCorrect = false
        quiz2_level9_stage3_Jawa.question = "Ca"
        quiz2_level9_stage3_Jawa.choices = []
        quiz2_level9_stage3_Jawa.images = []
        
        let quiz3_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level9_stage3_Jawa.id = 3
        quiz3_level9_stage3_Jawa.name = "Kuis 2"
        quiz3_level9_stage3_Jawa.type = "B"
        quiz3_level9_stage3_Jawa.isCorrect = false
        quiz3_level9_stage3_Jawa.question = "Ca"
        quiz3_level9_stage3_Jawa.choices = []
        quiz3_level9_stage3_Jawa.images = []
        
        let quiz4_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level9_stage3_Jawa.id = 4
        quiz4_level9_stage3_Jawa.name = "Kuis 3"
        quiz4_level9_stage3_Jawa.type = "C"
        quiz4_level9_stage3_Jawa.isCorrect = false
        quiz4_level9_stage3_Jawa.question = "Ca"
        quiz4_level9_stage3_Jawa.choices = []
        quiz4_level9_stage3_Jawa.images = []
        
        let quiz5_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level9_stage3_Jawa.id = 5
        quiz5_level9_stage3_Jawa.name = "Kuis 4"
        quiz5_level9_stage3_Jawa.type = "D"
        quiz5_level9_stage3_Jawa.isCorrect = false
        quiz5_level9_stage3_Jawa.question = "Ca"
        quiz5_level9_stage3_Jawa.choices = []
        quiz5_level9_stage3_Jawa.images = []
        
        let quiz6_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level9_stage3_Jawa.id = 6
        quiz6_level9_stage3_Jawa.name = "Kuis 5"
        quiz6_level9_stage3_Jawa.type = "E"
        quiz6_level9_stage3_Jawa.isCorrect = false
        quiz6_level9_stage3_Jawa.question = "Ca"
        quiz6_level9_stage3_Jawa.choices = []
        quiz6_level9_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 10 Stage 3 Jawa
        let quiz1_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level10_stage3_Jawa.id = 1
        quiz1_level10_stage3_Jawa.name = "Panduan"
        quiz1_level10_stage3_Jawa.type = "Panduan"
        quiz1_level10_stage3_Jawa.isCorrect = false
        quiz1_level10_stage3_Jawa.question = "Ca"
        quiz1_level10_stage3_Jawa.choices = []
        quiz1_level10_stage3_Jawa.images = []
        
        let quiz2_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level10_stage3_Jawa.id = 2
        quiz2_level10_stage3_Jawa.name = "Kuis 1"
        quiz2_level10_stage3_Jawa.type = "A"
        quiz2_level10_stage3_Jawa.isCorrect = false
        quiz2_level10_stage3_Jawa.question = "Ca"
        quiz2_level10_stage3_Jawa.choices = []
        quiz2_level10_stage3_Jawa.images = []
        
        let quiz3_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level10_stage3_Jawa.id = 3
        quiz3_level10_stage3_Jawa.name = "Kuis 2"
        quiz3_level10_stage3_Jawa.type = "B"
        quiz3_level10_stage3_Jawa.isCorrect = false
        quiz3_level10_stage3_Jawa.question = "Ca"
        quiz3_level10_stage3_Jawa.choices = []
        quiz3_level10_stage3_Jawa.images = []
        
        let quiz4_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level10_stage3_Jawa.id = 4
        quiz4_level10_stage3_Jawa.name = "Kuis 3"
        quiz4_level10_stage3_Jawa.type = "C"
        quiz4_level10_stage3_Jawa.isCorrect = false
        quiz4_level10_stage3_Jawa.question = "Ca"
        quiz4_level10_stage3_Jawa.choices = []
        quiz4_level10_stage3_Jawa.images = []
        
        let quiz5_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level10_stage3_Jawa.id = 5
        quiz5_level10_stage3_Jawa.name = "Kuis 4"
        quiz5_level10_stage3_Jawa.type = "D"
        quiz5_level10_stage3_Jawa.isCorrect = false
        quiz5_level10_stage3_Jawa.question = "Ca"
        quiz5_level10_stage3_Jawa.choices = []
        quiz5_level10_stage3_Jawa.images = []
        
        let quiz6_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level10_stage3_Jawa.id = 6
        quiz6_level10_stage3_Jawa.name = "Kuis 5"
        quiz6_level10_stage3_Jawa.type = "E"
        quiz6_level10_stage3_Jawa.isCorrect = false
        quiz6_level10_stage3_Jawa.question = "Ca"
        quiz6_level10_stage3_Jawa.choices = []
        quiz6_level10_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 11 Stage 3 Jawa
        let quiz1_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level11_stage3_Jawa.id = 1
        quiz1_level11_stage3_Jawa.name = "Panduan"
        quiz1_level11_stage3_Jawa.type = "Panduan"
        quiz1_level11_stage3_Jawa.isCorrect = false
        quiz1_level11_stage3_Jawa.question = "Ca"
        quiz1_level11_stage3_Jawa.choices = []
        quiz1_level11_stage3_Jawa.images = []
        
        let quiz2_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level11_stage3_Jawa.id = 2
        quiz2_level11_stage3_Jawa.name = "Kuis 1"
        quiz2_level11_stage3_Jawa.type = "A"
        quiz2_level11_stage3_Jawa.isCorrect = false
        quiz2_level11_stage3_Jawa.question = "Ca"
        quiz2_level11_stage3_Jawa.choices = []
        quiz2_level11_stage3_Jawa.images = []
        
        let quiz3_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level11_stage3_Jawa.id = 3
        quiz3_level11_stage3_Jawa.name = "Kuis 2"
        quiz3_level11_stage3_Jawa.type = "B"
        quiz3_level11_stage3_Jawa.isCorrect = false
        quiz3_level11_stage3_Jawa.question = "Ca"
        quiz3_level11_stage3_Jawa.choices = []
        quiz3_level11_stage3_Jawa.images = []
        
        let quiz4_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level11_stage3_Jawa.id = 4
        quiz4_level11_stage3_Jawa.name = "Kuis 3"
        quiz4_level11_stage3_Jawa.type = "C"
        quiz4_level11_stage3_Jawa.isCorrect = false
        quiz4_level11_stage3_Jawa.question = "Ca"
        quiz4_level11_stage3_Jawa.choices = []
        quiz4_level11_stage3_Jawa.images = []
        
        let quiz5_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level11_stage3_Jawa.id = 5
        quiz5_level11_stage3_Jawa.name = "Kuis 4"
        quiz5_level11_stage3_Jawa.type = "D"
        quiz5_level11_stage3_Jawa.isCorrect = false
        quiz5_level11_stage3_Jawa.question = "Ca"
        quiz5_level11_stage3_Jawa.choices = []
        quiz5_level11_stage3_Jawa.images = []
        
        let quiz6_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level11_stage3_Jawa.id = 6
        quiz6_level11_stage3_Jawa.name = "Kuis 5"
        quiz6_level11_stage3_Jawa.type = "E"
        quiz6_level11_stage3_Jawa.isCorrect = false
        quiz6_level11_stage3_Jawa.question = "Ca"
        quiz6_level11_stage3_Jawa.choices = []
        quiz6_level11_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 12 Stage 3 Jawa
        let quiz1_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level12_stage3_Jawa.id = 1
        quiz1_level12_stage3_Jawa.name = "Panduan"
        quiz1_level12_stage3_Jawa.type = "Panduan"
        quiz1_level12_stage3_Jawa.isCorrect = false
        quiz1_level12_stage3_Jawa.question = "Ca"
        quiz1_level12_stage3_Jawa.choices = []
        quiz1_level12_stage3_Jawa.images = []
        
        let quiz2_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level12_stage3_Jawa.id = 2
        quiz2_level12_stage3_Jawa.name = "Kuis 1"
        quiz2_level12_stage3_Jawa.type = "A"
        quiz2_level12_stage3_Jawa.isCorrect = false
        quiz2_level12_stage3_Jawa.question = "Ca"
        quiz2_level12_stage3_Jawa.choices = []
        quiz2_level12_stage3_Jawa.images = []
        
        let quiz3_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level12_stage3_Jawa.id = 3
        quiz3_level12_stage3_Jawa.name = "Kuis 2"
        quiz3_level12_stage3_Jawa.type = "B"
        quiz3_level12_stage3_Jawa.isCorrect = false
        quiz3_level12_stage3_Jawa.question = "Ca"
        quiz3_level12_stage3_Jawa.choices = []
        quiz3_level12_stage3_Jawa.images = []
        
        let quiz4_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level12_stage3_Jawa.id = 4
        quiz4_level12_stage3_Jawa.name = "Kuis 3"
        quiz4_level12_stage3_Jawa.type = "C"
        quiz4_level12_stage3_Jawa.isCorrect = false
        quiz4_level12_stage3_Jawa.question = "Ca"
        quiz4_level12_stage3_Jawa.choices = []
        quiz4_level12_stage3_Jawa.images = []
        
        let quiz5_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level12_stage3_Jawa.id = 5
        quiz5_level12_stage3_Jawa.name = "Kuis 4"
        quiz5_level12_stage3_Jawa.type = "D"
        quiz5_level12_stage3_Jawa.isCorrect = false
        quiz5_level12_stage3_Jawa.question = "Ca"
        quiz5_level12_stage3_Jawa.choices = []
        quiz5_level12_stage3_Jawa.images = []
        
        let quiz6_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level12_stage3_Jawa.id = 6
        quiz6_level12_stage3_Jawa.name = "Kuis 5"
        quiz6_level12_stage3_Jawa.type = "E"
        quiz6_level12_stage3_Jawa.isCorrect = false
        quiz6_level12_stage3_Jawa.question = "Ca"
        quiz6_level12_stage3_Jawa.choices = []
        quiz6_level12_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 13 Stage 3 Jawa
        let quiz1_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level13_stage3_Jawa.id = 1
        quiz1_level13_stage3_Jawa.name = "Panduan"
        quiz1_level13_stage3_Jawa.type = "Panduan"
        quiz1_level13_stage3_Jawa.isCorrect = false
        quiz1_level13_stage3_Jawa.question = "Ca"
        quiz1_level13_stage3_Jawa.choices = []
        quiz1_level13_stage3_Jawa.images = []
        
        let quiz2_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level13_stage3_Jawa.id = 2
        quiz2_level13_stage3_Jawa.name = "Kuis 1"
        quiz2_level13_stage3_Jawa.type = "A"
        quiz2_level13_stage3_Jawa.isCorrect = false
        quiz2_level13_stage3_Jawa.question = "Ca"
        quiz2_level13_stage3_Jawa.choices = []
        quiz2_level13_stage3_Jawa.images = []
        
        let quiz3_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level13_stage3_Jawa.id = 3
        quiz3_level13_stage3_Jawa.name = "Kuis 2"
        quiz3_level13_stage3_Jawa.type = "B"
        quiz3_level13_stage3_Jawa.isCorrect = false
        quiz3_level13_stage3_Jawa.question = "Ca"
        quiz3_level13_stage3_Jawa.choices = []
        quiz3_level13_stage3_Jawa.images = []
        
        let quiz4_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level13_stage3_Jawa.id = 4
        quiz4_level13_stage3_Jawa.name = "Kuis 3"
        quiz4_level13_stage3_Jawa.type = "C"
        quiz4_level13_stage3_Jawa.isCorrect = false
        quiz4_level13_stage3_Jawa.question = "Ca"
        quiz4_level13_stage3_Jawa.choices = []
        quiz4_level13_stage3_Jawa.images = []
        
        let quiz5_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level13_stage3_Jawa.id = 5
        quiz5_level13_stage3_Jawa.name = "Kuis 4"
        quiz5_level13_stage3_Jawa.type = "D"
        quiz5_level13_stage3_Jawa.isCorrect = false
        quiz5_level13_stage3_Jawa.question = "Ca"
        quiz5_level13_stage3_Jawa.choices = []
        quiz5_level13_stage3_Jawa.images = []
        
        let quiz6_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level13_stage3_Jawa.id = 6
        quiz6_level13_stage3_Jawa.name = "Kuis 5"
        quiz6_level13_stage3_Jawa.type = "E"
        quiz6_level13_stage3_Jawa.isCorrect = false
        quiz6_level13_stage3_Jawa.question = "Ca"
        quiz6_level13_stage3_Jawa.choices = []
        quiz6_level13_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 14 Stage 3 Jawa
        let quiz1_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level14_stage3_Jawa.id = 1
        quiz1_level14_stage3_Jawa.name = "Panduan"
        quiz1_level14_stage3_Jawa.type = "Panduan"
        quiz1_level14_stage3_Jawa.isCorrect = false
        quiz1_level14_stage3_Jawa.question = "Ca"
        quiz1_level14_stage3_Jawa.choices = []
        quiz1_level14_stage3_Jawa.images = []
        
        let quiz2_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level14_stage3_Jawa.id = 2
        quiz2_level14_stage3_Jawa.name = "Kuis 1"
        quiz2_level14_stage3_Jawa.type = "A"
        quiz2_level14_stage3_Jawa.isCorrect = false
        quiz2_level14_stage3_Jawa.question = "Ca"
        quiz2_level14_stage3_Jawa.choices = []
        quiz2_level14_stage3_Jawa.images = []
        
        let quiz3_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage3_Jawa.id = 3
        quiz3_level14_stage3_Jawa.name = "Kuis 2"
        quiz3_level14_stage3_Jawa.type = "B"
        quiz3_level14_stage3_Jawa.isCorrect = false
        quiz3_level14_stage3_Jawa.question = "Ca"
        quiz3_level14_stage3_Jawa.choices = []
        quiz3_level14_stage3_Jawa.images = []
        
        let quiz4_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level14_stage3_Jawa.id = 4
        quiz4_level14_stage3_Jawa.name = "Kuis 3"
        quiz4_level14_stage3_Jawa.type = "C"
        quiz4_level14_stage3_Jawa.isCorrect = false
        quiz4_level14_stage3_Jawa.question = "Ca"
        quiz4_level14_stage3_Jawa.choices = []
        quiz4_level14_stage3_Jawa.images = []
        
        let quiz5_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage3_Jawa.id = 5
        quiz5_level14_stage3_Jawa.name = "Kuis 4"
        quiz5_level14_stage3_Jawa.type = "D"
        quiz5_level14_stage3_Jawa.isCorrect = false
        quiz5_level14_stage3_Jawa.question = "Ca"
        quiz5_level14_stage3_Jawa.choices = []
        quiz5_level14_stage3_Jawa.images = []
        
        let quiz6_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage3_Jawa.id = 6
        quiz6_level14_stage3_Jawa.name = "Kuis 5"
        quiz6_level14_stage3_Jawa.type = "E"
        quiz6_level14_stage3_Jawa.isCorrect = false
        quiz6_level14_stage3_Jawa.question = "Ca"
        quiz6_level14_stage3_Jawa.choices = []
        quiz6_level14_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 15 Stage 3 Jawa
        let quiz1_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level15_stage3_Jawa.id = 1
        quiz1_level15_stage3_Jawa.name = "Panduan"
        quiz1_level15_stage3_Jawa.type = "Panduan"
        quiz1_level15_stage3_Jawa.isCorrect = false
        quiz1_level15_stage3_Jawa.question = "Ca"
        quiz1_level15_stage3_Jawa.choices = []
        quiz1_level15_stage3_Jawa.images = []
        
        let quiz2_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level15_stage3_Jawa.id = 2
        quiz2_level15_stage3_Jawa.name = "Kuis 1"
        quiz2_level15_stage3_Jawa.type = "A"
        quiz2_level15_stage3_Jawa.isCorrect = false
        quiz2_level15_stage3_Jawa.question = "Ca"
        quiz2_level15_stage3_Jawa.choices = []
        quiz2_level15_stage3_Jawa.images = []
        
        let quiz3_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level15_stage3_Jawa.id = 3
        quiz3_level15_stage3_Jawa.name = "Kuis 2"
        quiz3_level15_stage3_Jawa.type = "B"
        quiz3_level15_stage3_Jawa.isCorrect = false
        quiz3_level15_stage3_Jawa.question = "Ca"
        quiz3_level15_stage3_Jawa.choices = []
        quiz3_level15_stage3_Jawa.images = []
        
        let quiz4_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level15_stage3_Jawa.id = 4
        quiz4_level15_stage3_Jawa.name = "Kuis 3"
        quiz4_level15_stage3_Jawa.type = "C"
        quiz4_level15_stage3_Jawa.isCorrect = false
        quiz4_level15_stage3_Jawa.question = "Ca"
        quiz4_level15_stage3_Jawa.choices = []
        quiz4_level15_stage3_Jawa.images = []
        
        let quiz5_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level15_stage3_Jawa.id = 5
        quiz5_level15_stage3_Jawa.name = "Kuis 4"
        quiz5_level15_stage3_Jawa.type = "D"
        quiz5_level15_stage3_Jawa.isCorrect = false
        quiz5_level15_stage3_Jawa.question = "Ca"
        quiz5_level15_stage3_Jawa.choices = []
        quiz5_level15_stage3_Jawa.images = []
        
        let quiz6_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level15_stage3_Jawa.id = 6
        quiz6_level15_stage3_Jawa.name = "Kuis 5"
        quiz6_level15_stage3_Jawa.type = "E"
        quiz6_level15_stage3_Jawa.isCorrect = false
        quiz6_level15_stage3_Jawa.question = "Ca"
        quiz6_level15_stage3_Jawa.choices = []
        quiz6_level15_stage3_Jawa.images = []
        
        
        // MARK: Level for Stage 1 Jawa
        let firstLevelStage1Jawa = Level(context: PersistenceService.context)
        firstLevelStage1Jawa.id = 1
        firstLevelStage1Jawa.name = "Level 1"
        firstLevelStage1Jawa.isLocked = false
        firstLevelStage1Jawa.totalMedal = 0
        firstLevelStage1Jawa.quizes = [quiz1_level1_stage1_Jawa, quiz2_level1_stage1_Jawa, quiz3_level1_stage1_Jawa, quiz4_level1_stage1_Jawa, quiz5_level1_stage1_Jawa, quiz6_level1_stage1_Jawa]
        
        let secondLevelStage1Jawa = Level(context: PersistenceService.context)
        secondLevelStage1Jawa.id = 2
        secondLevelStage1Jawa.name = "Level 2"
        secondLevelStage1Jawa.isLocked = true
        secondLevelStage1Jawa.totalMedal = 0
        secondLevelStage1Jawa.quizes = [quiz1_level2_stage1_Jawa, quiz2_level2_stage1_Jawa, quiz3_level2_stage1_Jawa, quiz4_level2_stage1_Jawa, quiz5_level2_stage1_Jawa, quiz6_level2_stage1_Jawa]
        
        let thirdLevelStage1Jawa = Level(context: PersistenceService.context)
        thirdLevelStage1Jawa.id = 3
        thirdLevelStage1Jawa.name = "Level 3"
        thirdLevelStage1Jawa.isLocked = true
        thirdLevelStage1Jawa.totalMedal = 0
        thirdLevelStage1Jawa.quizes = [quiz1_level3_stage1_Jawa, quiz2_level3_stage1_Jawa, quiz3_level3_stage1_Jawa, quiz4_level3_stage1_Jawa, quiz5_level3_stage1_Jawa, quiz6_level3_stage1_Jawa]
        
        let fourthLevelStage1Jawa = Level(context: PersistenceService.context)
        fourthLevelStage1Jawa.id = 4
        fourthLevelStage1Jawa.name = "Level 4"
        fourthLevelStage1Jawa.isLocked = true
        fourthLevelStage1Jawa.totalMedal = 0
        fourthLevelStage1Jawa.quizes = [quiz1_level4_stage1_Jawa, quiz2_level4_stage1_Jawa, quiz3_level4_stage1_Jawa, quiz4_level4_stage1_Jawa, quiz5_level4_stage1_Jawa, quiz6_level4_stage1_Jawa]
        
        let fifthLevelStage1Jawa = Level(context: PersistenceService.context)
        fifthLevelStage1Jawa.id = 5
        fifthLevelStage1Jawa.name = "Level 5"
        fifthLevelStage1Jawa.isLocked = true
        fifthLevelStage1Jawa.totalMedal = 0
        fifthLevelStage1Jawa.quizes = [quiz1_level5_stage1_Jawa, quiz2_level5_stage1_Jawa, quiz3_level5_stage1_Jawa, quiz4_level5_stage1_Jawa, quiz5_level5_stage1_Jawa, quiz6_level5_stage1_Jawa]
        
        let sixthLevelStage1Jawa = Level(context: PersistenceService.context)
        sixthLevelStage1Jawa.id = 6
        sixthLevelStage1Jawa.name = "Level 6"
        sixthLevelStage1Jawa.isLocked = true
        sixthLevelStage1Jawa.totalMedal = 0
        sixthLevelStage1Jawa.quizes = [quiz1_level6_stage1_Jawa, quiz2_level6_stage1_Jawa, quiz3_level6_stage1_Jawa, quiz4_level6_stage1_Jawa, quiz5_level6_stage1_Jawa, quiz6_level6_stage1_Jawa]
        
        let seventhLevelStage1Jawa = Level(context: PersistenceService.context)
        seventhLevelStage1Jawa.id = 7
        seventhLevelStage1Jawa.name = "Level 7"
        seventhLevelStage1Jawa.isLocked = true
        seventhLevelStage1Jawa.totalMedal = 0
        seventhLevelStage1Jawa.quizes = [quiz1_level7_stage1_Jawa, quiz2_level7_stage1_Jawa, quiz3_level7_stage1_Jawa, quiz4_level7_stage1_Jawa, quiz5_level7_stage1_Jawa, quiz6_level7_stage1_Jawa]
        
        let eightLevelStage1Jawa = Level(context: PersistenceService.context)
        eightLevelStage1Jawa.id = 8
        eightLevelStage1Jawa.name = "Level 8"
        eightLevelStage1Jawa.isLocked = true
        eightLevelStage1Jawa.totalMedal = 0
        eightLevelStage1Jawa.quizes = [quiz1_level8_stage1_Jawa, quiz2_level8_stage1_Jawa, quiz3_level8_stage1_Jawa, quiz4_level8_stage1_Jawa, quiz5_level8_stage1_Jawa, quiz6_level8_stage1_Jawa]
        
        let ninthLevelStage1Jawa = Level(context: PersistenceService.context)
        ninthLevelStage1Jawa.id = 9
        ninthLevelStage1Jawa.name = "Level 9"
        ninthLevelStage1Jawa.isLocked = true
        ninthLevelStage1Jawa.totalMedal = 0
        ninthLevelStage1Jawa.quizes = [quiz1_level9_stage1_Jawa, quiz2_level9_stage1_Jawa, quiz3_level9_stage1_Jawa, quiz4_level9_stage1_Jawa, quiz5_level9_stage1_Jawa, quiz6_level9_stage1_Jawa]
        
        let tenthLevelStage1Jawa = Level(context: PersistenceService.context)
        tenthLevelStage1Jawa.id = 10
        tenthLevelStage1Jawa.name = "Level 10"
        tenthLevelStage1Jawa.isLocked = true
        tenthLevelStage1Jawa.totalMedal = 0
        tenthLevelStage1Jawa.quizes = [quiz1_level10_stage1_Jawa, quiz2_level10_stage1_Jawa, quiz3_level10_stage1_Jawa, quiz4_level10_stage1_Jawa, quiz5_level10_stage1_Jawa, quiz6_level10_stage1_Jawa]
        
        let eleventhLevelStage1Jawa = Level(context: PersistenceService.context)
        eleventhLevelStage1Jawa.id = 11
        eleventhLevelStage1Jawa.name = "Level 11"
        eleventhLevelStage1Jawa.isLocked = true
        eleventhLevelStage1Jawa.totalMedal = 0
        eleventhLevelStage1Jawa.quizes = [quiz1_level11_stage1_Jawa, quiz2_level11_stage1_Jawa, quiz3_level11_stage1_Jawa, quiz4_level11_stage1_Jawa, quiz5_level11_stage1_Jawa, quiz6_level11_stage1_Jawa]
        
        let twelfthLevelStage1Jawa = Level(context: PersistenceService.context)
        twelfthLevelStage1Jawa.id = 12
        twelfthLevelStage1Jawa.name = "Level 12"
        twelfthLevelStage1Jawa.isLocked = true
        twelfthLevelStage1Jawa.totalMedal = 0
        twelfthLevelStage1Jawa.quizes = [quiz1_level12_stage1_Jawa, quiz2_level12_stage1_Jawa, quiz3_level12_stage1_Jawa, quiz4_level12_stage1_Jawa, quiz5_level12_stage1_Jawa, quiz6_level12_stage1_Jawa]
        
        let thirteenthLevelStage1Jawa = Level(context: PersistenceService.context)
        thirteenthLevelStage1Jawa.id = 13
        thirteenthLevelStage1Jawa.name = "Level 13"
        thirteenthLevelStage1Jawa.isLocked = true
        thirteenthLevelStage1Jawa.totalMedal = 0
        thirteenthLevelStage1Jawa.quizes = [quiz1_level13_stage1_Jawa, quiz2_level13_stage1_Jawa, quiz3_level13_stage1_Jawa, quiz4_level13_stage1_Jawa, quiz5_level13_stage1_Jawa, quiz6_level13_stage1_Jawa]
        
        let fourteenthLevelStage1Jawa = Level(context: PersistenceService.context)
        fourteenthLevelStage1Jawa.id = 14
        fourteenthLevelStage1Jawa.name = "Level 14"
        fourteenthLevelStage1Jawa.isLocked = true
        fourteenthLevelStage1Jawa.totalMedal = 0
        fourteenthLevelStage1Jawa.quizes = [quiz1_level14_stage1_Jawa, quiz2_level14_stage1_Jawa, quiz3_level14_stage1_Jawa, quiz4_level14_stage1_Jawa, quiz5_level14_stage1_Jawa, quiz6_level14_stage1_Jawa]
        
        let fifteenthLevelStage1Jawa = Level(context: PersistenceService.context)
        fifteenthLevelStage1Jawa.id = 15
        fifteenthLevelStage1Jawa.name = "Level 15"
        fifteenthLevelStage1Jawa.isLocked = true
        fifteenthLevelStage1Jawa.totalMedal = 0
        fifteenthLevelStage1Jawa.quizes = [quiz1_level15_stage1_Jawa, quiz2_level15_stage1_Jawa, quiz3_level15_stage1_Jawa, quiz4_level15_stage1_Jawa, quiz5_level15_stage1_Jawa, quiz6_level15_stage1_Jawa]
        
        // MARK: Level for Stage 2 Jawa
        let firstLevelStage2Jawa = Level(context: PersistenceService.context)
        firstLevelStage2Jawa.id = 1
        firstLevelStage2Jawa.name = "Level 1"
        firstLevelStage2Jawa.isLocked = false
        firstLevelStage2Jawa.totalMedal = 0
        firstLevelStage2Jawa.quizes = [quiz1_level1_stage2_Jawa, quiz2_level1_stage2_Jawa, quiz3_level1_stage2_Jawa, quiz4_level1_stage2_Jawa, quiz5_level1_stage2_Jawa, quiz6_level1_stage2_Jawa]
        
        let secondLevelStage2Jawa = Level(context: PersistenceService.context)
        secondLevelStage2Jawa.id = 2
        secondLevelStage2Jawa.name = "Level 2"
        secondLevelStage2Jawa.isLocked = true
        secondLevelStage2Jawa.totalMedal = 0
        secondLevelStage2Jawa.quizes = [quiz1_level2_stage2_Jawa, quiz2_level2_stage2_Jawa, quiz3_level2_stage2_Jawa, quiz4_level2_stage2_Jawa, quiz5_level2_stage2_Jawa, quiz6_level2_stage2_Jawa]
        
        let thirdLevelStage2Jawa = Level(context: PersistenceService.context)
        thirdLevelStage2Jawa.id = 3
        thirdLevelStage2Jawa.name = "Level 3"
        thirdLevelStage2Jawa.isLocked = true
        thirdLevelStage2Jawa.totalMedal = 0
        thirdLevelStage2Jawa.quizes = [quiz1_level3_stage2_Jawa, quiz2_level3_stage2_Jawa, quiz3_level3_stage2_Jawa, quiz4_level3_stage2_Jawa, quiz5_level3_stage2_Jawa, quiz6_level3_stage2_Jawa]
        
        let fourthLevelStage2Jawa = Level(context: PersistenceService.context)
        fourthLevelStage2Jawa.id = 4
        fourthLevelStage2Jawa.name = "Level 4"
        fourthLevelStage2Jawa.isLocked = true
        fourthLevelStage2Jawa.totalMedal = 0
        fourthLevelStage2Jawa.quizes = [quiz1_level4_stage2_Jawa, quiz2_level4_stage2_Jawa, quiz3_level4_stage2_Jawa, quiz4_level4_stage2_Jawa, quiz5_level4_stage2_Jawa, quiz6_level4_stage2_Jawa]
        
        let fifthLevelStage2Jawa = Level(context: PersistenceService.context)
        fifthLevelStage2Jawa.id = 5
        fifthLevelStage2Jawa.name = "Level 5"
        fifthLevelStage2Jawa.isLocked = true
        fifthLevelStage2Jawa.totalMedal = 0
        fifthLevelStage2Jawa.quizes = [quiz1_level5_stage2_Jawa, quiz2_level5_stage2_Jawa, quiz3_level5_stage2_Jawa, quiz4_level5_stage2_Jawa, quiz5_level5_stage2_Jawa, quiz6_level5_stage2_Jawa]
        
        let sixthLevelStage2Jawa = Level(context: PersistenceService.context)
        sixthLevelStage2Jawa.id = 6
        sixthLevelStage2Jawa.name = "Level 6"
        sixthLevelStage2Jawa.isLocked = true
        sixthLevelStage2Jawa.totalMedal = 0
        sixthLevelStage2Jawa.quizes = [quiz1_level6_stage2_Jawa, quiz2_level6_stage2_Jawa, quiz3_level6_stage2_Jawa, quiz4_level6_stage2_Jawa, quiz5_level6_stage2_Jawa, quiz6_level6_stage2_Jawa]
        
        let seventhLevelStage2Jawa = Level(context: PersistenceService.context)
        seventhLevelStage2Jawa.id = 7
        seventhLevelStage2Jawa.name = "Level 7"
        seventhLevelStage2Jawa.isLocked = true
        seventhLevelStage2Jawa.totalMedal = 0
        seventhLevelStage2Jawa.quizes = [quiz1_level7_stage2_Jawa, quiz2_level7_stage2_Jawa, quiz3_level7_stage2_Jawa, quiz4_level7_stage2_Jawa, quiz5_level7_stage2_Jawa, quiz6_level7_stage2_Jawa]
        
        let eightLevelStage2Jawa = Level(context: PersistenceService.context)
        eightLevelStage2Jawa.id = 8
        eightLevelStage2Jawa.name = "Level 8"
        eightLevelStage2Jawa.isLocked = true
        eightLevelStage2Jawa.totalMedal = 0
        eightLevelStage2Jawa.quizes = [quiz1_level8_stage2_Jawa, quiz2_level8_stage2_Jawa, quiz3_level8_stage2_Jawa, quiz4_level8_stage2_Jawa, quiz5_level8_stage2_Jawa, quiz6_level8_stage2_Jawa]
        
        let ninthLevelStage2Jawa = Level(context: PersistenceService.context)
        ninthLevelStage2Jawa.id = 9
        ninthLevelStage2Jawa.name = "Level 9"
        ninthLevelStage2Jawa.isLocked = true
        ninthLevelStage2Jawa.totalMedal = 0
        ninthLevelStage2Jawa.quizes = [quiz1_level9_stage2_Jawa, quiz2_level9_stage2_Jawa, quiz3_level9_stage2_Jawa, quiz4_level9_stage2_Jawa, quiz5_level9_stage2_Jawa, quiz6_level9_stage2_Jawa]
        
        let tenthLevelStage2Jawa = Level(context: PersistenceService.context)
        tenthLevelStage2Jawa.id = 10
        tenthLevelStage2Jawa.name = "Level 10"
        tenthLevelStage2Jawa.isLocked = true
        tenthLevelStage2Jawa.totalMedal = 0
        tenthLevelStage2Jawa.quizes = [quiz1_level10_stage2_Jawa, quiz2_level10_stage2_Jawa, quiz3_level10_stage2_Jawa, quiz4_level10_stage2_Jawa, quiz5_level10_stage2_Jawa, quiz6_level10_stage2_Jawa]
        
        let eleventhLevelStage2Jawa = Level(context: PersistenceService.context)
        eleventhLevelStage2Jawa.id = 11
        eleventhLevelStage2Jawa.name = "Level 11"
        eleventhLevelStage2Jawa.isLocked = true
        eleventhLevelStage2Jawa.totalMedal = 0
        eleventhLevelStage2Jawa.quizes = [quiz1_level11_stage2_Jawa, quiz2_level11_stage2_Jawa, quiz3_level11_stage2_Jawa, quiz4_level11_stage2_Jawa, quiz5_level11_stage2_Jawa, quiz6_level11_stage2_Jawa]
        
        let twelfthLevelStage2Jawa = Level(context: PersistenceService.context)
        twelfthLevelStage2Jawa.id = 12
        twelfthLevelStage2Jawa.name = "Level 12"
        twelfthLevelStage2Jawa.isLocked = true
        twelfthLevelStage2Jawa.totalMedal = 0
        twelfthLevelStage2Jawa.quizes = [quiz1_level12_stage2_Jawa, quiz2_level12_stage2_Jawa, quiz3_level12_stage2_Jawa, quiz4_level12_stage2_Jawa, quiz5_level12_stage2_Jawa, quiz6_level12_stage2_Jawa]
        
        let thirteenthLevelStage2Jawa = Level(context: PersistenceService.context)
        thirteenthLevelStage2Jawa.id = 13
        thirteenthLevelStage2Jawa.name = "Level 13"
        thirteenthLevelStage2Jawa.isLocked = true
        thirteenthLevelStage2Jawa.totalMedal = 0
        thirteenthLevelStage2Jawa.quizes = [quiz1_level13_stage2_Jawa, quiz2_level13_stage2_Jawa, quiz3_level13_stage2_Jawa, quiz4_level13_stage2_Jawa, quiz5_level13_stage2_Jawa, quiz6_level13_stage2_Jawa]
        
        let fourteenthLevelStage2Jawa = Level(context: PersistenceService.context)
        fourteenthLevelStage2Jawa.id = 14
        fourteenthLevelStage2Jawa.name = "Level 14"
        fourteenthLevelStage2Jawa.isLocked = true
        fourteenthLevelStage2Jawa.totalMedal = 0
        fourteenthLevelStage2Jawa.quizes = [quiz1_level14_stage2_Jawa, quiz2_level14_stage2_Jawa, quiz3_level14_stage2_Jawa, quiz4_level14_stage2_Jawa, quiz5_level14_stage2_Jawa, quiz6_level14_stage2_Jawa]
        
        let fifteenthLevelStage2Jawa = Level(context: PersistenceService.context)
        fifteenthLevelStage2Jawa.id = 15
        fifteenthLevelStage2Jawa.name = "Level 15"
        fifteenthLevelStage2Jawa.isLocked = true
        fifteenthLevelStage2Jawa.totalMedal = 0
        fifteenthLevelStage2Jawa.quizes = [quiz1_level15_stage2_Jawa, quiz2_level15_stage2_Jawa, quiz3_level15_stage2_Jawa, quiz4_level15_stage2_Jawa, quiz5_level15_stage2_Jawa, quiz6_level15_stage2_Jawa]
        
        // MARK: Level for Stage 3 Jawa
        let firstLevelStage3Jawa = Level(context: PersistenceService.context)
        firstLevelStage3Jawa.id = 1
        firstLevelStage3Jawa.name = "Level 1"
        firstLevelStage3Jawa.isLocked = false
        firstLevelStage3Jawa.totalMedal = 0
        firstLevelStage3Jawa.quizes = [quiz1_level1_stage3_Jawa, quiz2_level1_stage3_Jawa, quiz3_level1_stage3_Jawa, quiz4_level1_stage3_Jawa, quiz5_level1_stage3_Jawa, quiz6_level1_stage3_Jawa]
        
        let secondLevelStage3Jawa = Level(context: PersistenceService.context)
        secondLevelStage3Jawa.id = 2
        secondLevelStage3Jawa.name = "Level 2"
        secondLevelStage3Jawa.isLocked = true
        secondLevelStage3Jawa.totalMedal = 0
        secondLevelStage3Jawa.quizes = [quiz1_level2_stage3_Jawa, quiz2_level2_stage3_Jawa, quiz3_level2_stage3_Jawa, quiz4_level2_stage3_Jawa, quiz5_level2_stage3_Jawa, quiz6_level2_stage3_Jawa]
        
        let thirdLevelStage3Jawa = Level(context: PersistenceService.context)
        thirdLevelStage3Jawa.id = 3
        thirdLevelStage3Jawa.name = "Level 3"
        thirdLevelStage3Jawa.isLocked = true
        thirdLevelStage3Jawa.totalMedal = 0
        thirdLevelStage3Jawa.quizes = [quiz1_level3_stage3_Jawa, quiz2_level3_stage3_Jawa, quiz3_level3_stage3_Jawa, quiz4_level3_stage3_Jawa, quiz5_level3_stage3_Jawa, quiz6_level3_stage3_Jawa]
        
        let fourthLevelStage3Jawa = Level(context: PersistenceService.context)
        fourthLevelStage3Jawa.id = 4
        fourthLevelStage3Jawa.name = "Level 4"
        fourthLevelStage3Jawa.isLocked = true
        fourthLevelStage3Jawa.totalMedal = 0
        fourthLevelStage3Jawa.quizes = [quiz1_level4_stage3_Jawa, quiz2_level4_stage3_Jawa, quiz3_level4_stage3_Jawa, quiz4_level4_stage3_Jawa, quiz5_level4_stage3_Jawa, quiz6_level4_stage3_Jawa]
        
        let fifthLevelStage3Jawa = Level(context: PersistenceService.context)
        fifthLevelStage3Jawa.id = 5
        fifthLevelStage3Jawa.name = "Level 5"
        fifthLevelStage3Jawa.isLocked = true
        fifthLevelStage3Jawa.totalMedal = 0
        fifthLevelStage3Jawa.quizes = [quiz1_level5_stage3_Jawa, quiz2_level5_stage3_Jawa, quiz3_level5_stage3_Jawa, quiz4_level5_stage3_Jawa, quiz5_level5_stage3_Jawa, quiz6_level5_stage3_Jawa]
        
        let sixthLevelStage3Jawa = Level(context: PersistenceService.context)
        sixthLevelStage3Jawa.id = 6
        sixthLevelStage3Jawa.name = "Level 6"
        sixthLevelStage3Jawa.isLocked = true
        sixthLevelStage3Jawa.totalMedal = 0
        sixthLevelStage3Jawa.quizes = [quiz1_level6_stage3_Jawa, quiz2_level6_stage3_Jawa, quiz3_level6_stage3_Jawa, quiz4_level6_stage3_Jawa, quiz5_level6_stage3_Jawa, quiz6_level6_stage3_Jawa]
        
        let seventhLevelStage3Jawa = Level(context: PersistenceService.context)
        seventhLevelStage3Jawa.id = 7
        seventhLevelStage3Jawa.name = "Level 7"
        seventhLevelStage3Jawa.isLocked = true
        seventhLevelStage3Jawa.totalMedal = 0
        seventhLevelStage3Jawa.quizes = [quiz1_level7_stage3_Jawa, quiz2_level7_stage3_Jawa, quiz3_level7_stage3_Jawa, quiz4_level7_stage3_Jawa, quiz5_level7_stage3_Jawa, quiz6_level7_stage3_Jawa]
        
        let eightLevelStage3Jawa = Level(context: PersistenceService.context)
        eightLevelStage3Jawa.id = 8
        eightLevelStage3Jawa.name = "Level 8"
        eightLevelStage3Jawa.isLocked = true
        eightLevelStage3Jawa.totalMedal = 0
        eightLevelStage3Jawa.quizes = [quiz1_level8_stage3_Jawa, quiz2_level8_stage3_Jawa, quiz3_level8_stage3_Jawa, quiz4_level8_stage3_Jawa, quiz5_level8_stage3_Jawa, quiz6_level8_stage3_Jawa]
        
        let ninthLevelStage3Jawa = Level(context: PersistenceService.context)
        ninthLevelStage3Jawa.id = 9
        ninthLevelStage3Jawa.name = "Level 9"
        ninthLevelStage3Jawa.isLocked = true
        ninthLevelStage3Jawa.totalMedal = 0
        ninthLevelStage3Jawa.quizes = [quiz1_level9_stage3_Jawa, quiz2_level9_stage3_Jawa, quiz3_level9_stage3_Jawa, quiz4_level9_stage3_Jawa, quiz5_level9_stage3_Jawa, quiz6_level9_stage3_Jawa]
        
        let tenthLevelStage3Jawa = Level(context: PersistenceService.context)
        tenthLevelStage3Jawa.id = 10
        tenthLevelStage3Jawa.name = "Level 10"
        tenthLevelStage3Jawa.isLocked = true
        tenthLevelStage3Jawa.totalMedal = 0
        tenthLevelStage3Jawa.quizes = [quiz1_level10_stage3_Jawa, quiz2_level10_stage3_Jawa, quiz3_level10_stage3_Jawa, quiz4_level10_stage3_Jawa, quiz5_level10_stage3_Jawa, quiz6_level10_stage3_Jawa]
        
        let eleventhLevelStage3Jawa = Level(context: PersistenceService.context)
        eleventhLevelStage3Jawa.id = 11
        eleventhLevelStage3Jawa.name = "Level 11"
        eleventhLevelStage3Jawa.isLocked = true
        eleventhLevelStage3Jawa.totalMedal = 0
        eleventhLevelStage3Jawa.quizes = [quiz1_level11_stage3_Jawa, quiz2_level11_stage3_Jawa, quiz3_level11_stage3_Jawa, quiz4_level11_stage3_Jawa, quiz5_level11_stage3_Jawa, quiz6_level11_stage3_Jawa]
        
        let twelfthLevelStage3Jawa = Level(context: PersistenceService.context)
        twelfthLevelStage3Jawa.id = 12
        twelfthLevelStage3Jawa.name = "Level 12"
        twelfthLevelStage3Jawa.isLocked = true
        twelfthLevelStage3Jawa.totalMedal = 0
        twelfthLevelStage3Jawa.quizes = [quiz1_level12_stage3_Jawa, quiz2_level12_stage3_Jawa, quiz3_level12_stage3_Jawa, quiz4_level12_stage3_Jawa, quiz5_level12_stage3_Jawa, quiz6_level12_stage3_Jawa]
        
        let thirteenthLevelStage3Jawa = Level(context: PersistenceService.context)
        thirteenthLevelStage3Jawa.id = 13
        thirteenthLevelStage3Jawa.name = "Level 13"
        thirteenthLevelStage3Jawa.isLocked = true
        thirteenthLevelStage3Jawa.totalMedal = 0
        thirteenthLevelStage3Jawa.quizes = [quiz1_level13_stage3_Jawa, quiz2_level13_stage3_Jawa, quiz3_level13_stage3_Jawa, quiz4_level13_stage3_Jawa, quiz5_level13_stage3_Jawa, quiz6_level13_stage3_Jawa]
        
        let fourteenthLevelStage3Jawa = Level(context: PersistenceService.context)
        fourteenthLevelStage3Jawa.id = 14
        fourteenthLevelStage3Jawa.name = "Level 14"
        fourteenthLevelStage3Jawa.isLocked = true
        fourteenthLevelStage3Jawa.totalMedal = 0
        fourteenthLevelStage3Jawa.quizes = [quiz1_level14_stage3_Jawa, quiz2_level14_stage3_Jawa, quiz3_level14_stage3_Jawa, quiz4_level14_stage3_Jawa, quiz5_level14_stage3_Jawa, quiz6_level14_stage3_Jawa]
        
        let fifteenthLevelStage3Jawa = Level(context: PersistenceService.context)
        fifteenthLevelStage3Jawa.id = 15
        fifteenthLevelStage3Jawa.name = "Level 15"
        fifteenthLevelStage3Jawa.isLocked = true
        fifteenthLevelStage3Jawa.totalMedal = 0
        fifteenthLevelStage3Jawa.quizes = [quiz1_level15_stage3_Jawa, quiz2_level15_stage3_Jawa, quiz3_level15_stage3_Jawa, quiz4_level15_stage3_Jawa, quiz5_level15_stage3_Jawa, quiz6_level15_stage3_Jawa]
        
        // MARK: Level for Stage 1 Sunda
        let firstLevelStage1Sunda = Level(context: PersistenceService.context)
        firstLevelStage1Sunda.id = 1
        firstLevelStage1Sunda.name = "Level 1"
        firstLevelStage1Sunda.isLocked = false
        firstLevelStage1Sunda.totalMedal = 0
        firstLevelStage1Sunda.quizes = []
        
        let secondLevelStage1Sunda = Level(context: PersistenceService.context)
        secondLevelStage1Sunda.id = 2
        secondLevelStage1Sunda.name = "Level 2"
        secondLevelStage1Sunda.isLocked = true
        secondLevelStage1Sunda.totalMedal = 0
        secondLevelStage1Sunda.quizes = []
        
        let thirdLevelStage1Sunda = Level(context: PersistenceService.context)
        thirdLevelStage1Sunda.id = 3
        thirdLevelStage1Sunda.name = "Level 3"
        thirdLevelStage1Sunda.isLocked = true
        thirdLevelStage1Sunda.totalMedal = 0
        thirdLevelStage1Sunda.quizes = []
        
        let fourthLevelStage1Sunda = Level(context: PersistenceService.context)
        fourthLevelStage1Sunda.id = 4
        fourthLevelStage1Sunda.name = "Level 4"
        fourthLevelStage1Sunda.isLocked = true
        fourthLevelStage1Sunda.totalMedal = 0
        fourthLevelStage1Sunda.quizes = []
        
        let fifthLevelStage1Sunda = Level(context: PersistenceService.context)
        fifthLevelStage1Sunda.id = 5
        fifthLevelStage1Sunda.name = "Level 5"
        fifthLevelStage1Sunda.isLocked = true
        fifthLevelStage1Sunda.totalMedal = 0
        fifthLevelStage1Sunda.quizes = []
        
        let sixthLevelStage1Sunda = Level(context: PersistenceService.context)
        sixthLevelStage1Sunda.id = 6
        sixthLevelStage1Sunda.name = "Level 6"
        sixthLevelStage1Sunda.isLocked = true
        sixthLevelStage1Sunda.totalMedal = 0
        sixthLevelStage1Sunda.quizes = []
        
        let seventhLevelStage1Sunda = Level(context: PersistenceService.context)
        seventhLevelStage1Sunda.id = 7
        seventhLevelStage1Sunda.name = "Level 7"
        seventhLevelStage1Sunda.isLocked = true
        seventhLevelStage1Sunda.totalMedal = 0
        seventhLevelStage1Sunda.quizes = []
        
        let eightLevelStage1Sunda = Level(context: PersistenceService.context)
        eightLevelStage1Sunda.id = 8
        eightLevelStage1Sunda.name = "Level 8"
        eightLevelStage1Sunda.isLocked = true
        eightLevelStage1Sunda.totalMedal = 0
        eightLevelStage1Sunda.quizes = []
        
        let ninthLevelStage1Sunda = Level(context: PersistenceService.context)
        ninthLevelStage1Sunda.id = 9
        ninthLevelStage1Sunda.name = "Level 9"
        ninthLevelStage1Sunda.isLocked = true
        ninthLevelStage1Sunda.totalMedal = 0
        ninthLevelStage1Sunda.quizes = []
        
        let tenthLevelStage1Sunda = Level(context: PersistenceService.context)
        tenthLevelStage1Sunda.id = 10
        tenthLevelStage1Sunda.name = "Level 10"
        tenthLevelStage1Sunda.isLocked = true
        tenthLevelStage1Sunda.totalMedal = 0
        tenthLevelStage1Sunda.quizes = []
        
        let eleventhLevelStage1Sunda = Level(context: PersistenceService.context)
        eleventhLevelStage1Sunda.id = 11
        eleventhLevelStage1Sunda.name = "Level 11"
        eleventhLevelStage1Sunda.isLocked = true
        eleventhLevelStage1Sunda.totalMedal = 0
        eleventhLevelStage1Sunda.quizes = []
        
        let twelfthLevelStage1Sunda = Level(context: PersistenceService.context)
        twelfthLevelStage1Sunda.id = 12
        twelfthLevelStage1Sunda.name = "Level 12"
        twelfthLevelStage1Sunda.isLocked = true
        twelfthLevelStage1Sunda.totalMedal = 0
        twelfthLevelStage1Sunda.quizes = []
        
        let thirteenthLevelStage1Sunda = Level(context: PersistenceService.context)
        thirteenthLevelStage1Sunda.id = 13
        thirteenthLevelStage1Sunda.name = "Level 13"
        thirteenthLevelStage1Sunda.isLocked = true
        thirteenthLevelStage1Sunda.totalMedal = 0
        thirteenthLevelStage1Sunda.quizes = []
        
        let fourteenthLevelStage1Sunda = Level(context: PersistenceService.context)
        fourteenthLevelStage1Sunda.id = 14
        fourteenthLevelStage1Sunda.name = "Level 14"
        fourteenthLevelStage1Sunda.isLocked = true
        fourteenthLevelStage1Sunda.totalMedal = 0
        fourteenthLevelStage1Sunda.quizes = []
        
        let fifteenthLevelStage1Sunda = Level(context: PersistenceService.context)
        fifteenthLevelStage1Sunda.id = 15
        fifteenthLevelStage1Sunda.name = "Level 15"
        fifteenthLevelStage1Sunda.isLocked = true
        fifteenthLevelStage1Sunda.totalMedal = 0
        fifteenthLevelStage1Sunda.quizes = []
        
        // MARK: Level for Stage 2 Jawa
        let firstLevelStage2Sunda = Level(context: PersistenceService.context)
        firstLevelStage2Sunda.id = 1
        firstLevelStage2Sunda.name = "Level 1"
        firstLevelStage2Sunda.isLocked = false
        firstLevelStage2Sunda.totalMedal = 0
        firstLevelStage2Sunda.quizes = []
        
        let secondLevelStage2Sunda = Level(context: PersistenceService.context)
        secondLevelStage2Sunda.id = 2
        secondLevelStage2Sunda.name = "Level 2"
        secondLevelStage2Sunda.isLocked = true
        secondLevelStage2Sunda.totalMedal = 0
        secondLevelStage2Sunda.quizes = []
        
        let thirdLevelStage2Sunda = Level(context: PersistenceService.context)
        thirdLevelStage2Sunda.id = 3
        thirdLevelStage2Sunda.name = "Level 3"
        thirdLevelStage2Sunda.isLocked = true
        thirdLevelStage2Sunda.totalMedal = 0
        thirdLevelStage2Sunda.quizes = []
        
        let fourthLevelStage2Sunda = Level(context: PersistenceService.context)
        fourthLevelStage2Sunda.id = 4
        fourthLevelStage2Sunda.name = "Level 4"
        fourthLevelStage2Sunda.isLocked = true
        fourthLevelStage2Sunda.totalMedal = 0
        fourthLevelStage2Sunda.quizes = []
        
        let fifthLevelStage2Sunda = Level(context: PersistenceService.context)
        fifthLevelStage2Sunda.id = 5
        fifthLevelStage2Sunda.name = "Level 5"
        fifthLevelStage2Sunda.isLocked = true
        fifthLevelStage2Sunda.totalMedal = 0
        fifthLevelStage2Sunda.quizes = []
        
        let sixthLevelStage2Sunda = Level(context: PersistenceService.context)
        sixthLevelStage2Sunda.id = 6
        sixthLevelStage2Sunda.name = "Level 6"
        sixthLevelStage2Sunda.isLocked = true
        sixthLevelStage2Sunda.totalMedal = 0
        sixthLevelStage2Sunda.quizes = []
        
        let seventhLevelStage2Sunda = Level(context: PersistenceService.context)
        seventhLevelStage2Sunda.id = 7
        seventhLevelStage2Sunda.name = "Level 7"
        seventhLevelStage2Sunda.isLocked = true
        seventhLevelStage2Sunda.totalMedal = 0
        seventhLevelStage2Sunda.quizes = []
        
        let eightLevelStage2Sunda = Level(context: PersistenceService.context)
        eightLevelStage2Sunda.id = 8
        eightLevelStage2Sunda.name = "Level 8"
        eightLevelStage2Sunda.isLocked = true
        eightLevelStage2Sunda.totalMedal = 0
        eightLevelStage2Sunda.quizes = []
        
        let ninthLevelStage2Sunda = Level(context: PersistenceService.context)
        ninthLevelStage2Sunda.id = 9
        ninthLevelStage2Sunda.name = "Level 9"
        ninthLevelStage2Sunda.isLocked = true
        ninthLevelStage2Sunda.totalMedal = 0
        ninthLevelStage2Sunda.quizes = []
        
        let tenthLevelStage2Sunda = Level(context: PersistenceService.context)
        tenthLevelStage2Sunda.id = 10
        tenthLevelStage2Sunda.name = "Level 10"
        tenthLevelStage2Sunda.isLocked = true
        tenthLevelStage2Sunda.totalMedal = 0
        tenthLevelStage2Sunda.quizes = []
        
        let eleventhLevelStage2Sunda = Level(context: PersistenceService.context)
        eleventhLevelStage2Sunda.id = 11
        eleventhLevelStage2Sunda.name = "Level 11"
        eleventhLevelStage2Sunda.isLocked = true
        eleventhLevelStage2Sunda.totalMedal = 0
        eleventhLevelStage2Sunda.quizes = []
        
        let twelfthLevelStage2Sunda = Level(context: PersistenceService.context)
        twelfthLevelStage2Sunda.id = 12
        twelfthLevelStage2Sunda.name = "Level 12"
        twelfthLevelStage2Sunda.isLocked = true
        twelfthLevelStage2Sunda.totalMedal = 0
        twelfthLevelStage2Sunda.quizes = []
        
        let thirteenthLevelStage2Sunda = Level(context: PersistenceService.context)
        thirteenthLevelStage2Sunda.id = 13
        thirteenthLevelStage2Sunda.name = "Level 13"
        thirteenthLevelStage2Sunda.isLocked = true
        thirteenthLevelStage2Sunda.totalMedal = 0
        thirteenthLevelStage2Sunda.quizes = []
        
        let fourteenthLevelStage2Sunda = Level(context: PersistenceService.context)
        fourteenthLevelStage2Sunda.id = 14
        fourteenthLevelStage2Sunda.name = "Level 14"
        fourteenthLevelStage2Sunda.isLocked = true
        fourteenthLevelStage2Sunda.totalMedal = 0
        fourteenthLevelStage2Sunda.quizes = []
        
        let fifteenthLevelStage2Sunda = Level(context: PersistenceService.context)
        fifteenthLevelStage2Sunda.id = 15
        fifteenthLevelStage2Sunda.name = "Level 15"
        fifteenthLevelStage2Sunda.isLocked = true
        fifteenthLevelStage2Sunda.totalMedal = 0
        fifteenthLevelStage2Sunda.quizes = []
        
        // MARK: Level for Stage 3 Jawa
        let firstLevelStage3Sunda = Level(context: PersistenceService.context)
        firstLevelStage3Sunda.id = 1
        firstLevelStage3Sunda.name = "Level 1"
        firstLevelStage3Sunda.isLocked = false
        firstLevelStage3Sunda.totalMedal = 0
        firstLevelStage3Sunda.quizes = []
        
        let secondLevelStage3Sunda = Level(context: PersistenceService.context)
        secondLevelStage3Sunda.id = 2
        secondLevelStage3Sunda.name = "Level 2"
        secondLevelStage3Sunda.isLocked = true
        secondLevelStage3Sunda.totalMedal = 0
        secondLevelStage3Sunda.quizes = []
        
        let thirdLevelStage3Sunda = Level(context: PersistenceService.context)
        thirdLevelStage3Sunda.id = 3
        thirdLevelStage3Sunda.name = "Level 3"
        thirdLevelStage3Sunda.isLocked = true
        thirdLevelStage3Sunda.totalMedal = 0
        thirdLevelStage3Sunda.quizes = []
        
        let fourthLevelStage3Sunda = Level(context: PersistenceService.context)
        fourthLevelStage3Sunda.id = 4
        fourthLevelStage3Sunda.name = "Level 4"
        fourthLevelStage3Sunda.isLocked = true
        fourthLevelStage3Sunda.totalMedal = 0
        fourthLevelStage3Sunda.quizes = []
        
        let fifthLevelStage3Sunda = Level(context: PersistenceService.context)
        fifthLevelStage3Sunda.id = 5
        fifthLevelStage3Sunda.name = "Level 5"
        fifthLevelStage3Sunda.isLocked = true
        fifthLevelStage3Sunda.totalMedal = 0
        fifthLevelStage3Sunda.quizes = []
        
        let sixthLevelStage3Sunda = Level(context: PersistenceService.context)
        sixthLevelStage3Sunda.id = 6
        sixthLevelStage3Sunda.name = "Level 6"
        sixthLevelStage3Sunda.isLocked = true
        sixthLevelStage3Sunda.totalMedal = 0
        sixthLevelStage3Sunda.quizes = []
        
        let seventhLevelStage3Sunda = Level(context: PersistenceService.context)
        seventhLevelStage3Sunda.id = 7
        seventhLevelStage3Sunda.name = "Level 7"
        seventhLevelStage3Sunda.isLocked = true
        seventhLevelStage3Sunda.totalMedal = 0
        seventhLevelStage3Sunda.quizes = []
        
        let eightLevelStage3Sunda = Level(context: PersistenceService.context)
        eightLevelStage3Sunda.id = 8
        eightLevelStage3Sunda.name = "Level 8"
        eightLevelStage3Sunda.isLocked = true
        eightLevelStage3Sunda.totalMedal = 0
        eightLevelStage3Sunda.quizes = []
        
        let ninthLevelStage3Sunda = Level(context: PersistenceService.context)
        ninthLevelStage3Sunda.id = 9
        ninthLevelStage3Sunda.name = "Level 9"
        ninthLevelStage3Sunda.isLocked = true
        ninthLevelStage3Sunda.totalMedal = 0
        ninthLevelStage3Sunda.quizes = []
        
        let tenthLevelStage3Sunda = Level(context: PersistenceService.context)
        tenthLevelStage3Sunda.id = 10
        tenthLevelStage3Sunda.name = "Level 10"
        tenthLevelStage3Sunda.isLocked = true
        tenthLevelStage3Sunda.totalMedal = 0
        tenthLevelStage3Sunda.quizes = []
        
        let eleventhLevelStage3Sunda = Level(context: PersistenceService.context)
        eleventhLevelStage3Sunda.id = 11
        eleventhLevelStage3Sunda.name = "Level 11"
        eleventhLevelStage3Sunda.isLocked = true
        eleventhLevelStage3Sunda.totalMedal = 0
        eleventhLevelStage3Sunda.quizes = []
        
        let twelfthLevelStage3Sunda = Level(context: PersistenceService.context)
        twelfthLevelStage3Sunda.id = 12
        twelfthLevelStage3Sunda.name = "Level 12"
        twelfthLevelStage3Sunda.isLocked = true
        twelfthLevelStage3Sunda.totalMedal = 0
        twelfthLevelStage3Sunda.quizes = []
        
        let thirteenthLevelStage3Sunda = Level(context: PersistenceService.context)
        thirteenthLevelStage3Sunda.id = 13
        thirteenthLevelStage3Sunda.name = "Level 13"
        thirteenthLevelStage3Sunda.isLocked = true
        thirteenthLevelStage3Sunda.totalMedal = 0
        thirteenthLevelStage3Sunda.quizes = []
        
        let fourteenthLevelStage3Sunda = Level(context: PersistenceService.context)
        fourteenthLevelStage3Sunda.id = 14
        fourteenthLevelStage3Sunda.name = "Level 14"
        fourteenthLevelStage3Sunda.isLocked = true
        fourteenthLevelStage3Sunda.totalMedal = 0
        fourteenthLevelStage3Sunda.quizes = []
        
        let fifteenthLevelStage3Sunda = Level(context: PersistenceService.context)
        fifteenthLevelStage3Sunda.id = 15
        fifteenthLevelStage3Sunda.name = "Level 15"
        fifteenthLevelStage3Sunda.isLocked = true
        fifteenthLevelStage3Sunda.totalMedal = 0
        fifteenthLevelStage3Sunda.quizes = []
        
        // MARK: Stage Jawa
        let firstStageJawa = Stage(context: PersistenceService.context)
        firstStageJawa.id = 1
        firstStageJawa.name = "Stage 1"
        firstStageJawa.currentMedal = 0
        firstStageJawa.totalMedal = 45
        firstStageJawa.isLocked = false
        firstStageJawa.levels = [firstLevelStage1Jawa, secondLevelStage1Jawa, thirdLevelStage1Jawa, fourthLevelStage1Jawa, fifthLevelStage1Jawa, sixthLevelStage1Jawa, seventhLevelStage1Jawa, eightLevelStage1Jawa, ninthLevelStage1Jawa, tenthLevelStage1Jawa, eleventhLevelStage1Jawa, twelfthLevelStage1Jawa, thirteenthLevelStage1Jawa, fourteenthLevelStage1Jawa, fifteenthLevelStage1Jawa]
        
        let secondStageJawa = Stage(context: PersistenceService.context)
        secondStageJawa.id = 2
        secondStageJawa.name = "Stage 2"
        secondStageJawa.currentMedal = 0
        secondStageJawa.totalMedal = 45
        secondStageJawa.isLocked = false
        secondStageJawa.levels = [firstLevelStage2Jawa, secondLevelStage2Jawa, thirdLevelStage2Jawa, fourthLevelStage2Jawa, fifthLevelStage2Jawa, sixthLevelStage2Jawa, seventhLevelStage2Jawa, eightLevelStage2Jawa, ninthLevelStage2Jawa, tenthLevelStage2Jawa, eleventhLevelStage2Jawa, twelfthLevelStage2Jawa, thirteenthLevelStage2Jawa, fourteenthLevelStage2Jawa, fifteenthLevelStage2Jawa]
        
        let thirdStageJawa = Stage(context: PersistenceService.context)
        thirdStageJawa.id = 3
        thirdStageJawa.name = "Stage 3"
        thirdStageJawa.currentMedal = 0
        thirdStageJawa.totalMedal = 45
        thirdStageJawa.isLocked = false
        thirdStageJawa.levels = [firstLevelStage3Jawa, secondLevelStage3Jawa, thirdLevelStage3Jawa, fourthLevelStage3Jawa, fifthLevelStage3Jawa, sixthLevelStage3Jawa, seventhLevelStage3Jawa, eightLevelStage3Jawa, ninthLevelStage3Jawa, tenthLevelStage3Jawa, eleventhLevelStage3Jawa, twelfthLevelStage3Jawa, thirteenthLevelStage3Jawa, fourteenthLevelStage3Jawa, fifteenthLevelStage3Jawa]
        
        let fourthStageJawa = Stage(context: PersistenceService.context)
        fourthStageJawa.id = 4
        fourthStageJawa.name = "Stage 4"
        fourthStageJawa.currentMedal = 0
        fourthStageJawa.totalMedal = 45
        fourthStageJawa.isLocked = true
        fourthStageJawa.levels = []
        
        // MARK: Stage Sunda
        let firstStageSunda = Stage(context: PersistenceService.context)
        firstStageSunda.id = 5
        firstStageSunda.name = "Stage 1"
        firstStageSunda.currentMedal = 0
        firstStageSunda.totalMedal = 45
        firstStageSunda.isLocked = false
        firstStageSunda.levels = []
        
        let secondStageSunda = Stage(context: PersistenceService.context)
        secondStageSunda.id = 6
        secondStageSunda.name = "Stage 2"
        secondStageSunda.currentMedal = 0
        secondStageSunda.totalMedal = 45
        secondStageSunda.isLocked = false
        secondStageSunda.levels = []
        
        let thirdStageSunda = Stage(context: PersistenceService.context)
        thirdStageSunda.id = 7
        thirdStageSunda.name = "Stage 3"
        thirdStageSunda.currentMedal = 0
        thirdStageSunda.totalMedal = 45
        thirdStageSunda.isLocked = false
        thirdStageSunda.levels = []
        
        let fourthStageSunda = Stage(context: PersistenceService.context)
        fourthStageSunda.id = 8
        fourthStageSunda.name = "Stage 4"
        fourthStageSunda.currentMedal = 0
        fourthStageSunda.totalMedal = 45
        fourthStageSunda.isLocked = true
        fourthStageSunda.levels = []
        
        // MARK: Regions
        let firstRegion = Region(context: PersistenceService.context)
        firstRegion.id = 1
        firstRegion.name = "Jawa"
        firstRegion.isLocked = false
        firstRegion.stages = [firstStageJawa, secondStageJawa, thirdStageJawa, fourthStageJawa]
        firstRegion.dictionaries = []
        
        let secondRegion = Region(context: PersistenceService.context)
        secondRegion.id = 2
        secondRegion.name = "Sunda"
        secondRegion.isLocked = false
        secondRegion.stages = [firstStageSunda, secondStageSunda, thirdStageSunda, fourthStageSunda]
        secondRegion.dictionaries = []
        
        let thirdRegion = Region(context: PersistenceService.context)
        thirdRegion.id = 3
        thirdRegion.name = "Bali"
        thirdRegion.isLocked = true
        thirdRegion.stages = []
        thirdRegion.dictionaries = []
        
        let fourthRegion = Region(context: PersistenceService.context)
        fourthRegion.id = 4
        fourthRegion.name = "Bugis"
        fourthRegion.isLocked = true
        fourthRegion.stages = []
        fourthRegion.dictionaries = []
        
        let fifthRegion = Region(context: PersistenceService.context)
        fifthRegion.id = 5
        fifthRegion.name = "Lampung"
        fifthRegion.isLocked = true
        fifthRegion.stages = []
        fifthRegion.dictionaries = []
        
        let sixthRegion = Region(context: PersistenceService.context)
        sixthRegion.id = 6
        sixthRegion.name = "Batak"
        sixthRegion.isLocked = true
        sixthRegion.stages = []
        sixthRegion.dictionaries = []
        
        // MARK: User
        let user = User(context: PersistenceService.context)
        user.id = 1
        user.name = "Ganang Arief Pratama"
        user.regions = [firstRegion, secondRegion, thirdRegion, fourthRegion, fifthRegion, sixthRegion]
        
        PersistenceService.saveContext()
    }

}

extension MainViewController: MainViewProtocol {
    func updateData() {
        let stage1 = stages?[0]
        let levels = stage1?.levels?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Level]
        let quizes = levels?[0].quizes?.sortedArray(using: [.init(key: "id", ascending: true)]) as? [Quiz]
        
        for i in 0...quizes!.count - 1 {
            print("LEVEL", quizes?[i].choices?.count)
        }
    }
}

