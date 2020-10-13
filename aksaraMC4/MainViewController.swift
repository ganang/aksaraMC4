//
//  ViewController.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var stages: [Stage]?
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        
        return progressView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.setBackgroundColor()
        self.navigationController?.navigationBar.isHidden = true
        
//        deleteRecord()
//        setupRecord()
//        getRecord()
        
        let gradientImage = UIImage.gradientImage(with: progressView.frame, colors: [UIColor.blue.cgColor, UIColor.systemBlue.cgColor], locations: nil)
        progressView.progressImage = gradientImage!
        progressView.setProgress(0.75, animated: true)
        view.addSubview(progressView)
        progressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        progressView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
        choice1_Quiz2_Level1_Stage1_Jawa.name = "Ka"
        
        let choice2_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level1_Stage1_Jawa.id = 2
        choice2_Quiz2_Level1_Stage1_Jawa.name = "Ha"
        
        let choice3_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level1_Stage1_Jawa.id = 3
        choice3_Quiz2_Level1_Stage1_Jawa.name = "Da"
        
        let choice4_Quiz2_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level1_Stage1_Jawa.id = 4
        choice4_Quiz2_Level1_Stage1_Jawa.name = "Ba"
        
        //MARK: Image
        let image1_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level1_Stage1_Jawa.id = 1
        image1_Quiz2_Level1_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image2_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level1_Stage1_Jawa.id = 2
        image2_Quiz2_Level1_Stage1_Jawa.name = "Ha_Aksara_Jawa"
        
        let image3_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level1_Stage1_Jawa.id = 3
        image3_Quiz2_Level1_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image4_Quiz2_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level1_Stage1_Jawa.id = 4
        image4_Quiz2_Level1_Stage1_Jawa.name = "Ba_Aksara_Jawa"
    
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
        choice1_Quiz3_Level1_Stage1_Jawa.name = "Ta"
        
        let choice2_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level1_Stage1_Jawa.id = 2
        choice2_Quiz3_Level1_Stage1_Jawa.name = "La"
        
        let choice3_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level1_Stage1_Jawa.id = 3
        choice3_Quiz3_Level1_Stage1_Jawa.name = "Pa"
        
        let choice4_Quiz3_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level1_Stage1_Jawa.id = 4
        choice4_Quiz3_Level1_Stage1_Jawa.name = "Ha"
        
        //MARK: Image
        let image1_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level1_Stage1_Jawa.id = 1
        image1_Quiz3_Level1_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image2_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level1_Stage1_Jawa.id = 2
        image2_Quiz3_Level1_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image3_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level1_Stage1_Jawa.id = 3
        image3_Quiz3_Level1_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let image4_Quiz3_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level1_Stage1_Jawa.id = 4
        image4_Quiz3_Level1_Stage1_Jawa.name = "Ha_Aksara_Jawa"
        
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
        choice1_Quiz4_Level1_Stage1_Jawa.name = "La"
        
        let choice2_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level1_Stage1_Jawa.id = 2
        choice2_Quiz4_Level1_Stage1_Jawa.name = "Ha"
        
        let choice3_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level1_Stage1_Jawa.id = 3
        choice3_Quiz4_Level1_Stage1_Jawa.name = "Ta"
        
        let choice4_Quiz4_Level1_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level1_Stage1_Jawa.id = 4
        choice4_Quiz4_Level1_Stage1_Jawa.name = "Pa"
        
        //MARK: Image
        let image1_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level1_Stage1_Jawa.id = 1
        image1_Quiz4_Level1_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image2_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level1_Stage1_Jawa.id = 2
        image2_Quiz4_Level1_Stage1_Jawa.name = "Ha_Aksara_Jawa"
        
        let image3_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level1_Stage1_Jawa.id = 3
        image3_Quiz4_Level1_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image4_Quiz4_Level1_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level1_Stage1_Jawa.id = 4
        image4_Quiz4_Level1_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
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
        quiz1_level2_stage1_Jawa.question = "Ka"
        quiz1_level2_stage1_Jawa.choices = []
        quiz1_level2_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level2_Stage1_Jawa.id = 1
        choice1_Quiz2_Level2_Stage1_Jawa.name = "Ka"
        
        let choice2_Quiz2_Leve21_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Leve21_Stage1_Jawa.id = 2
        choice2_Quiz2_Leve21_Stage1_Jawa.name = "Sa"
        
        let choice3_Quiz2_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level2_Stage1_Jawa.id = 3
        choice3_Quiz2_Level2_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz2_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level2_Stage1_Jawa.id = 4
        choice4_Quiz2_Level2_Stage1_Jawa.name = "Ja"
        
        //MARK: Image
        let image1_Quiz2_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level2_Stage1_Jawa.id = 1
        image1_Quiz2_Level2_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image2_Quiz2_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level2_Stage1_Jawa.id = 2
        image2_Quiz2_Level2_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image3_Quiz2_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level2_Stage1_Jawa.id = 3
        image3_Quiz2_Level2_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz2_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level2_Stage1_Jawa.id = 4
        image4_Quiz2_Level2_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let quiz2_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level2_stage1_Jawa.id = 2
        quiz2_level2_stage1_Jawa.name = "Kuis 1"
        quiz2_level2_stage1_Jawa.type = "A"
        quiz2_level2_stage1_Jawa.isCorrect = false
        quiz2_level2_stage1_Jawa.question = "Ka"
        quiz2_level2_stage1_Jawa.choices = [choice1_Quiz2_Level2_Stage1_Jawa, choice2_Quiz2_Leve21_Stage1_Jawa, choice3_Quiz2_Level2_Stage1_Jawa, choice4_Quiz2_Level2_Stage1_Jawa]
        quiz2_level2_stage1_Jawa.images = [image1_Quiz2_Level2_Stage1_Jawa, image2_Quiz2_Level2_Stage1_Jawa, image3_Quiz2_Level2_Stage1_Jawa, image4_Quiz2_Level2_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level2_Stage1_Jawa.id = 1
        choice1_Quiz3_Level2_Stage1_Jawa.name = "Sa"
        
        let choice2_Quiz3_Leve21_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Leve21_Stage1_Jawa.id = 2
        choice2_Quiz3_Leve21_Stage1_Jawa.name = "Ja"
        
        let choice3_Quiz3_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level2_Stage1_Jawa.id = 3
        choice3_Quiz3_Level2_Stage1_Jawa.name = "Ka"
        
        let choice4_Quiz3_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level2_Stage1_Jawa.id = 4
        choice4_Quiz3_Level2_Stage1_Jawa.name = "Na"
        
        //MARK: Image
        let image1_Quiz3_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level2_Stage1_Jawa.id = 1
        image1_Quiz3_Level2_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image2_Quiz3_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level2_Stage1_Jawa.id = 2
        image2_Quiz3_Level2_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image3_Quiz3_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level2_Stage1_Jawa.id = 3
        image3_Quiz3_Level2_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image4_Quiz3_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level2_Stage1_Jawa.id = 4
        image4_Quiz3_Level2_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let quiz3_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level2_stage1_Jawa.id = 3
        quiz3_level2_stage1_Jawa.name = "Kuis 2"
        quiz3_level2_stage1_Jawa.type = "B"
        quiz3_level2_stage1_Jawa.isCorrect = false
        quiz3_level2_stage1_Jawa.question = "Ka"
        quiz3_level2_stage1_Jawa.choices = [choice1_Quiz3_Level2_Stage1_Jawa, choice2_Quiz3_Leve21_Stage1_Jawa, choice3_Quiz3_Level2_Stage1_Jawa, choice4_Quiz3_Level2_Stage1_Jawa]
        quiz3_level2_stage1_Jawa.images = [image1_Quiz3_Level2_Stage1_Jawa, image2_Quiz3_Level2_Stage1_Jawa, image3_Quiz3_Level2_Stage1_Jawa, image4_Quiz3_Level2_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level2_Stage1_Jawa.id = 1
        choice1_Quiz4_Level2_Stage1_Jawa.name = "Na"
        
        let choice2_Quiz4_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level2_Stage1_Jawa.id = 2
        choice2_Quiz4_Level2_Stage1_Jawa.name = "Ka"
        
        let choice3_Quiz4_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level2_Stage1_Jawa.id = 3
        choice3_Quiz4_Level2_Stage1_Jawa.name = "Da"
        
        let choice4_Quiz4_Level2_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level2_Stage1_Jawa.id = 4
        choice4_Quiz4_Level2_Stage1_Jawa.name = "Ja"
        
        //MARK: Image
        let image1_Quiz4_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level2_Stage1_Jawa.id = 1
        image1_Quiz4_Level2_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image2_Quiz4_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level2_Stage1_Jawa.id = 2
        image2_Quiz4_Level2_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image3_Quiz4_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level2_Stage1_Jawa.id = 3
        image3_Quiz4_Level2_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image4_Quiz4_Level2_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level2_Stage1_Jawa.id = 4
        image4_Quiz4_Level2_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let quiz4_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level2_stage1_Jawa.id = 4
        quiz4_level2_stage1_Jawa.name = "Kuis 3"
        quiz4_level2_stage1_Jawa.type = "C"
        quiz4_level2_stage1_Jawa.isCorrect = false
        quiz4_level2_stage1_Jawa.question = "Ka"
        quiz4_level2_stage1_Jawa.choices = [choice1_Quiz4_Level2_Stage1_Jawa, choice2_Quiz4_Level2_Stage1_Jawa, choice3_Quiz4_Level2_Stage1_Jawa, choice4_Quiz4_Level2_Stage1_Jawa]
        quiz4_level2_stage1_Jawa.images = [image1_Quiz4_Level2_Stage1_Jawa, image2_Quiz4_Level2_Stage1_Jawa, image3_Quiz4_Level2_Stage1_Jawa, image4_Quiz4_Level2_Stage1_Jawa]
        
        let quiz5_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level2_stage1_Jawa.id = 5
        quiz5_level2_stage1_Jawa.name = "Kuis 4"
        quiz5_level2_stage1_Jawa.type = "D"
        quiz5_level2_stage1_Jawa.isCorrect = false
        quiz5_level2_stage1_Jawa.question = "ka"
        quiz5_level2_stage1_Jawa.choices = []
        quiz5_level2_stage1_Jawa.images = []
        
        let quiz6_level2_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level2_stage1_Jawa.id = 6
        quiz6_level2_stage1_Jawa.name = "Kuis 5"
        quiz6_level2_stage1_Jawa.type = "E"
        quiz6_level2_stage1_Jawa.isCorrect = false
        quiz6_level2_stage1_Jawa.question = "Ka"
        quiz6_level2_stage1_Jawa.choices = []
        quiz6_level2_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 3 Stage 1 Jawa
        let quiz1_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level3_stage1_Jawa.id = 1
        quiz1_level3_stage1_Jawa.name = "Panduan"
        quiz1_level3_stage1_Jawa.type = "Panduan"
        quiz1_level3_stage1_Jawa.isCorrect = false
        quiz1_level3_stage1_Jawa.question = "Da"
        quiz1_level3_stage1_Jawa.choices = []
        quiz1_level3_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level3_Stage1_Jawa.id = 1
        choice1_Quiz2_Level3_Stage1_Jawa.name = "Na"
        
        let choice2_Quiz2_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level3_Stage1_Jawa.id = 2
        choice2_Quiz2_Level3_Stage1_Jawa.name = "Sa"
        
        let choice3_Quiz2_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level3_Stage1_Jawa.id = 3
        choice3_Quiz2_Level3_Stage1_Jawa.name = "Tha"
        
        let choice4_Quiz2_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level3_Stage1_Jawa.id = 4
        choice4_Quiz2_Level3_Stage1_Jawa.name = "Da"
        
        //MARK: Image
        let image1_Quiz2_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level3_Stage1_Jawa.id = 1
        image1_Quiz2_Level3_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image2_Quiz2_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level3_Stage1_Jawa.id = 2
        image2_Quiz2_Level3_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image3_Quiz2_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level3_Stage1_Jawa.id = 3
        image3_Quiz2_Level3_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image4_Quiz2_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level3_Stage1_Jawa.id = 4
        image4_Quiz2_Level3_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let quiz2_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level3_stage1_Jawa.id = 2
        quiz2_level3_stage1_Jawa.name = "Kuis 1"
        quiz2_level3_stage1_Jawa.type = "A"
        quiz2_level3_stage1_Jawa.isCorrect = false
        quiz2_level3_stage1_Jawa.question = "Da"
        quiz2_level3_stage1_Jawa.choices = [choice1_Quiz2_Level3_Stage1_Jawa, choice2_Quiz2_Level3_Stage1_Jawa, choice3_Quiz2_Level3_Stage1_Jawa, choice4_Quiz2_Level3_Stage1_Jawa]
        quiz2_level3_stage1_Jawa.images = [image1_Quiz2_Level3_Stage1_Jawa, image2_Quiz2_Level3_Stage1_Jawa, image3_Quiz2_Level3_Stage1_Jawa, image4_Quiz2_Level3_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level3_Stage1_Jawa.id = 1
        choice1_Quiz3_Level3_Stage1_Jawa.name = "Na"
        
        let choice2_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level3_Stage1_Jawa.id = 2
        choice2_Quiz3_Level3_Stage1_Jawa.name = "Sa"
        
        let choice3_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level3_Stage1_Jawa.id = 3
        choice3_Quiz3_Level3_Stage1_Jawa.name = "Ka"
        
        let choice4_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level3_Stage1_Jawa.id = 4
        choice4_Quiz3_Level3_Stage1_Jawa.name = "Da"
        
        //MARK: Image
        let image1_Quiz3_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level3_Stage1_Jawa.id = 1
        image1_Quiz3_Level3_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image2_Quiz3_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level3_Stage1_Jawa.id = 2
        image2_Quiz3_Level3_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image3_Quiz3_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level3_Stage1_Jawa.id = 3
        image3_Quiz3_Level3_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image4_Quiz3_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level3_Stage1_Jawa.id = 4
        image4_Quiz3_Level3_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let quiz3_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage1_Jawa.id = 3
        quiz3_level3_stage1_Jawa.name = "Kuis 2"
        quiz3_level3_stage1_Jawa.type = "B"
        quiz3_level3_stage1_Jawa.isCorrect = false
        quiz3_level3_stage1_Jawa.question = "Da"
        quiz3_level3_stage1_Jawa.choices = [choice1_Quiz3_Level3_Stage1_Jawa, choice2_Quiz3_Level3_Stage1_Jawa, choice3_Quiz3_Level3_Stage1_Jawa, choice4_Quiz3_Level3_Stage1_Jawa]
        quiz3_level3_stage1_Jawa.images = [image1_Quiz3_Level3_Stage1_Jawa, image2_Quiz3_Level3_Stage1_Jawa, image3_Quiz3_Level3_Stage1_Jawa, image4_Quiz3_Level3_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level3_Stage1_Jawa.id = 1
        choice1_Quiz4_Level3_Stage1_Jawa.name = "Da"
        
        let choice2_Quiz4_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level3_Stage1_Jawa.id = 2
        choice2_Quiz4_Level3_Stage1_Jawa.name = "Sa"
        
        let choice3_Quiz4_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level3_Stage1_Jawa.id = 3
        choice3_Quiz4_Level3_Stage1_Jawa.name = "Na"
        
        let choice4_Quiz4_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level3_Stage1_Jawa.id = 4
        choice4_Quiz4_Level3_Stage1_Jawa.name = "Ka"
        
        //MARK: Image
        let image1_Quiz4_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level3_Stage1_Jawa.id = 1
        image1_Quiz4_Level3_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image2_Quiz4_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level3_Stage1_Jawa.id = 2
        image2_Quiz4_Level3_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image3_Quiz4_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level3_Stage1_Jawa.id = 3
        image3_Quiz4_Level3_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image4_Quiz4_Level3_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level3_Stage1_Jawa.id = 4
        image4_Quiz4_Level3_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let quiz4_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level3_stage1_Jawa.id = 4
        quiz4_level3_stage1_Jawa.name = "Kuis 3"
        quiz4_level3_stage1_Jawa.type = "C"
        quiz4_level3_stage1_Jawa.isCorrect = false
        quiz4_level3_stage1_Jawa.question = "Da"
        quiz4_level3_stage1_Jawa.choices = [choice1_Quiz4_Level3_Stage1_Jawa, choice2_Quiz4_Level3_Stage1_Jawa, choice3_Quiz4_Level3_Stage1_Jawa, choice4_Quiz4_Level3_Stage1_Jawa]
        quiz4_level3_stage1_Jawa.images = [image1_Quiz4_Level3_Stage1_Jawa, image2_Quiz4_Level3_Stage1_Jawa, image3_Quiz4_Level3_Stage1_Jawa, image4_Quiz4_Level3_Stage1_Jawa]
        
        let quiz5_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level3_stage1_Jawa.id = 5
        quiz5_level3_stage1_Jawa.name = "Kuis 4"
        quiz5_level3_stage1_Jawa.type = "D"
        quiz5_level3_stage1_Jawa.isCorrect = false
        quiz5_level3_stage1_Jawa.question = "Da"
        quiz5_level3_stage1_Jawa.choices = []
        quiz5_level3_stage1_Jawa.images = []
        
        let quiz6_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level3_stage1_Jawa.id = 6
        quiz6_level3_stage1_Jawa.name = "Kuis 5"
        quiz6_level3_stage1_Jawa.type = "E"
        quiz6_level3_stage1_Jawa.isCorrect = false
        quiz6_level3_stage1_Jawa.question = "Da"
        quiz6_level3_stage1_Jawa.choices = []
        quiz6_level3_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 4 Stage 1 Jawa
        let quiz1_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level4_stage1_Jawa.id = 1
        quiz1_level4_stage1_Jawa.name = "Panduan"
        quiz1_level4_stage1_Jawa.type = "Panduan"
        quiz1_level4_stage1_Jawa.isCorrect = false
        quiz1_level4_stage1_Jawa.question = "Ta"
        quiz1_level4_stage1_Jawa.choices = []
        quiz1_level4_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level4_Stage1_Jawa.id = 1
        choice1_Quiz2_Level4_Stage1_Jawa.name = "La"
        
        let choice2_Quiz2_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level4_Stage1_Jawa.id = 2
        choice2_Quiz2_Level4_Stage1_Jawa.name = "Ma"
        
        let choice3_Quiz2_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level4_Stage1_Jawa.id = 3
        choice3_Quiz2_Level4_Stage1_Jawa.name = "Ta"
        
        let choice4_Quiz2_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level4_Stage1_Jawa.id = 4
        choice4_Quiz2_Level4_Stage1_Jawa.name = "Wa"
        
        //MARK: Image
        let image1_Quiz2_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level4_Stage1_Jawa.id = 1
        image1_Quiz2_Level4_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image2_Quiz2_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level4_Stage1_Jawa.id = 2
        image2_Quiz2_Level4_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image3_Quiz2_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level4_Stage1_Jawa.id = 3
        image3_Quiz2_Level4_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image4_Quiz2_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level4_Stage1_Jawa.id = 4
        image4_Quiz2_Level4_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let quiz2_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level4_stage1_Jawa.id = 2
        quiz2_level4_stage1_Jawa.name = "Kuis 1"
        quiz2_level4_stage1_Jawa.type = "A"
        quiz2_level4_stage1_Jawa.isCorrect = false
        quiz2_level4_stage1_Jawa.question = "Ta"
        quiz2_level4_stage1_Jawa.choices = [choice1_Quiz2_Level4_Stage1_Jawa, choice2_Quiz2_Level4_Stage1_Jawa, choice3_Quiz2_Level4_Stage1_Jawa, choice4_Quiz2_Level4_Stage1_Jawa]
        quiz2_level4_stage1_Jawa.images = [image1_Quiz2_Level4_Stage1_Jawa, image2_Quiz2_Level4_Stage1_Jawa, image3_Quiz2_Level4_Stage1_Jawa, image4_Quiz2_Level4_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level4_Stage1_Jawa.id = 1
        choice1_Quiz3_Level4_Stage1_Jawa.name = "Ta"
        
        let choice2_Quiz3_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level4_Stage1_Jawa.id = 2
        choice2_Quiz3_Level4_Stage1_Jawa.name = "Ma"
        
        let choice3_Quiz3_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level4_Stage1_Jawa.id = 3
        choice3_Quiz3_Level4_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz3_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level4_Stage1_Jawa.id = 4
        choice4_Quiz3_Level4_Stage1_Jawa.name = "La"
        
        //MARK: Image
        let image1_Quiz3_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level4_Stage1_Jawa.id = 1
        image1_Quiz3_Level4_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image2_Quiz3_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level4_Stage1_Jawa.id = 2
        image2_Quiz3_Level4_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image3_Quiz3_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level4_Stage1_Jawa.id = 3
        image3_Quiz3_Level4_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz3_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level4_Stage1_Jawa.id = 4
        image4_Quiz3_Level4_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let quiz3_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level4_stage1_Jawa.id = 3
        quiz3_level4_stage1_Jawa.name = "Kuis 2"
        quiz3_level4_stage1_Jawa.type = "B"
        quiz3_level4_stage1_Jawa.isCorrect = false
        quiz3_level4_stage1_Jawa.question = "Ta"
        quiz3_level4_stage1_Jawa.choices = [choice1_Quiz3_Level4_Stage1_Jawa, choice2_Quiz3_Level4_Stage1_Jawa, choice3_Quiz3_Level4_Stage1_Jawa, choice4_Quiz3_Level4_Stage1_Jawa]
        quiz3_level4_stage1_Jawa.images = [image1_Quiz3_Level4_Stage1_Jawa, image2_Quiz3_Level4_Stage1_Jawa, image3_Quiz3_Level4_Stage1_Jawa, image4_Quiz3_Level4_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level4_Stage1_Jawa.id = 1
        choice1_Quiz4_Level4_Stage1_Jawa.name = "Ma"
        
        let choice2_Quiz4_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level4_Stage1_Jawa.id = 2
        choice2_Quiz4_Level4_Stage1_Jawa.name = "La"
        
        let choice3_Quiz4_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level4_Stage1_Jawa.id = 3
        choice3_Quiz4_Level4_Stage1_Jawa.name = "Wa"
        
        let choice4_Quiz4_Level4_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level4_Stage1_Jawa.id = 4
        choice4_Quiz4_Level4_Stage1_Jawa.name = "Ta"
        
        //MARK: Image
        let image1_Quiz4_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level4_Stage1_Jawa.id = 1
        image1_Quiz4_Level4_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image2_Quiz4_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level4_Stage1_Jawa.id = 2
        image2_Quiz4_Level4_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image3_Quiz4_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level4_Stage1_Jawa.id = 3
        image3_Quiz4_Level4_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image4_Quiz4_Level4_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level4_Stage1_Jawa.id = 4
        image4_Quiz4_Level4_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let quiz4_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level4_stage1_Jawa.id = 4
        quiz4_level4_stage1_Jawa.name = "Kuis 3"
        quiz4_level4_stage1_Jawa.type = "C"
        quiz4_level4_stage1_Jawa.isCorrect = false
        quiz4_level4_stage1_Jawa.question = "Ta"
        quiz4_level4_stage1_Jawa.choices = [choice1_Quiz4_Level4_Stage1_Jawa, choice2_Quiz4_Level4_Stage1_Jawa, choice3_Quiz4_Level4_Stage1_Jawa, choice4_Quiz4_Level4_Stage1_Jawa]
        quiz4_level4_stage1_Jawa.images = [image1_Quiz4_Level4_Stage1_Jawa, image2_Quiz4_Level4_Stage1_Jawa, image3_Quiz4_Level4_Stage1_Jawa, image4_Quiz4_Level4_Stage1_Jawa]
        
        let quiz5_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level4_stage1_Jawa.id = 5
        quiz5_level4_stage1_Jawa.name = "Kuis 4"
        quiz5_level4_stage1_Jawa.type = "D"
        quiz5_level4_stage1_Jawa.isCorrect = false
        quiz5_level4_stage1_Jawa.question = "Ta"
        quiz5_level4_stage1_Jawa.choices = []
        quiz5_level4_stage1_Jawa.images = []
        
        let quiz6_level4_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level4_stage1_Jawa.id = 6
        quiz6_level4_stage1_Jawa.name = "Kuis 5"
        quiz6_level4_stage1_Jawa.type = "E"
        quiz6_level4_stage1_Jawa.isCorrect = false
        quiz6_level4_stage1_Jawa.question = "Ta"
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
        
        //MARK: Choice
        let choice1_Quiz2_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level5_Stage1_Jawa.id = 1
        choice1_Quiz2_Level5_Stage1_Jawa.name = "Ca"
        
        let choice2_Quiz2_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level5_Stage1_Jawa.id = 2
        choice2_Quiz2_Level5_Stage1_Jawa.name = "Pa"
        
        let choice3_Quiz2_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level5_Stage1_Jawa.id = 3
        choice3_Quiz2_Level5_Stage1_Jawa.name = "Ga"
        
        let choice4_Quiz2_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level5_Stage1_Jawa.id = 4
        choice4_Quiz2_Level5_Stage1_Jawa.name = "Ya"
        
        //MARK: Image
        let image1_Quiz2_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level5_Stage1_Jawa.id = 1
        image1_Quiz2_Level5_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image2_Quiz2_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level5_Stage1_Jawa.id = 2
        image2_Quiz2_Level5_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let image3_Quiz2_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level5_Stage1_Jawa.id = 3
        image3_Quiz2_Level5_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
        let image4_Quiz2_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level5_Stage1_Jawa.id = 4
        image4_Quiz2_Level5_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let quiz2_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage1_Jawa.id = 2
        quiz2_level5_stage1_Jawa.name = "Kuis 1"
        quiz2_level5_stage1_Jawa.type = "A"
        quiz2_level5_stage1_Jawa.isCorrect = false
        quiz2_level5_stage1_Jawa.question = "Ca"
        quiz2_level5_stage1_Jawa.choices = [choice1_Quiz2_Level5_Stage1_Jawa, choice2_Quiz2_Level5_Stage1_Jawa, choice3_Quiz2_Level5_Stage1_Jawa, choice4_Quiz2_Level5_Stage1_Jawa]
        quiz2_level5_stage1_Jawa.images = [image1_Quiz2_Level5_Stage1_Jawa, image2_Quiz2_Level5_Stage1_Jawa, image3_Quiz2_Level5_Stage1_Jawa, image4_Quiz2_Level5_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level5_Stage1_Jawa.id = 1
        choice1_Quiz3_Level5_Stage1_Jawa.name = "Ga"
        
        let choice2_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level5_Stage1_Jawa.id = 2
        choice2_Quiz3_Level5_Stage1_Jawa.name = "Ya"
        
        let choice3_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level5_Stage1_Jawa.id = 3
        choice3_Quiz3_Level5_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level5_Stage1_Jawa.id = 4
        choice4_Quiz3_Level5_Stage1_Jawa.name = "Wa"
        
        //MARK: Image
        let image1_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level5_Stage1_Jawa.id = 1
        image1_Quiz3_Level5_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
        let image2_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level5_Stage1_Jawa.id = 2
        image2_Quiz3_Level5_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let image3_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level5_Stage1_Jawa.id = 3
        image3_Quiz3_Level5_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level5_Stage1_Jawa.id = 4
        image4_Quiz3_Level5_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let quiz3_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level5_stage1_Jawa.id = 3
        quiz3_level5_stage1_Jawa.name = "Kuis 2"
        quiz3_level5_stage1_Jawa.type = "B"
        quiz3_level5_stage1_Jawa.isCorrect = false
        quiz3_level5_stage1_Jawa.question = "Ca"
        quiz3_level5_stage1_Jawa.choices = [choice1_Quiz3_Level5_Stage1_Jawa, choice2_Quiz3_Level5_Stage1_Jawa, choice3_Quiz3_Level5_Stage1_Jawa, choice4_Quiz3_Level5_Stage1_Jawa]
        quiz3_level5_stage1_Jawa.images = [image1_Quiz3_Level5_Stage1_Jawa, image2_Quiz3_Level5_Stage1_Jawa, image3_Quiz3_Level5_Stage1_Jawa, image4_Quiz3_Level5_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level5_Stage1_Jawa.id = 1
        choice1_Quiz4_Level5_Stage1_Jawa.name = "Wa"
        
        let choice2_Quiz4_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level5_Stage1_Jawa.id = 2
        choice2_Quiz4_Level5_Stage1_Jawa.name = "Ya"
        
        let choice3_Quiz4_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level5_Stage1_Jawa.id = 3
        choice3_Quiz4_Level5_Stage1_Jawa.name = "Ga"
        
        let choice4_Quiz4_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level5_Stage1_Jawa.id = 4
        choice4_Quiz4_Level5_Stage1_Jawa.name = "Ca"
        
        //MARK: Image
        let image1_Quiz4_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level5_Stage1_Jawa.id = 1
        image1_Quiz4_Level5_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image2_Quiz4_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level5_Stage1_Jawa.id = 2
        image2_Quiz4_Level5_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let image3_Quiz4_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level5_Stage1_Jawa.id = 3
        image3_Quiz4_Level5_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
        let image4_Quiz4_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level5_Stage1_Jawa.id = 4
        image4_Quiz4_Level5_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let quiz4_level5_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level5_stage1_Jawa.id = 4
        quiz4_level5_stage1_Jawa.name = "Kuis 3"
        quiz4_level5_stage1_Jawa.type = "C"
        quiz4_level5_stage1_Jawa.isCorrect = false
        quiz4_level5_stage1_Jawa.question = "Ca"
        quiz4_level5_stage1_Jawa.choices = [choice1_Quiz4_Level5_Stage1_Jawa, choice2_Quiz4_Level5_Stage1_Jawa, choice3_Quiz4_Level5_Stage1_Jawa, choice4_Quiz4_Level5_Stage1_Jawa]
        quiz4_level5_stage1_Jawa.images = [image1_Quiz4_Level5_Stage1_Jawa, image2_Quiz4_Level5_Stage1_Jawa, image3_Quiz4_Level5_Stage1_Jawa, image4_Quiz4_Level5_Stage1_Jawa]
        
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
        quiz1_level6_stage1_Jawa.question = "Wa"
        quiz1_level6_stage1_Jawa.choices = []
        quiz1_level6_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level6_Stage1_Jawa.id = 1
        choice1_Quiz2_Level6_Stage1_Jawa.name = "Dha"
        
        let choice2_Quiz2_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level6_Stage1_Jawa.id = 2
        choice2_Quiz2_Level6_Stage1_Jawa.name = "Wa"
        
        let choice3_Quiz2_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level6_Stage1_Jawa.id = 3
        choice3_Quiz2_Level6_Stage1_Jawa.name = "Da"
        
        let choice4_Quiz2_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level6_Stage1_Jawa.id = 4
        choice4_Quiz2_Level6_Stage1_Jawa.name = "Ca"
        
        //MARK: Image
        let image1_Quiz2_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level6_Stage1_Jawa.id = 1
        image1_Quiz2_Level6_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let image2_Quiz2_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level6_Stage1_Jawa.id = 2
        image2_Quiz2_Level6_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image3_Quiz2_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level6_Stage1_Jawa.id = 3
        image3_Quiz2_Level6_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image4_Quiz2_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level6_Stage1_Jawa.id = 4
        image4_Quiz2_Level6_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let quiz2_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level6_stage1_Jawa.id = 2
        quiz2_level6_stage1_Jawa.name = "Kuis 1"
        quiz2_level6_stage1_Jawa.type = "A"
        quiz2_level6_stage1_Jawa.isCorrect = false
        quiz2_level6_stage1_Jawa.question = "Wa"
        quiz2_level6_stage1_Jawa.choices = [choice1_Quiz2_Level6_Stage1_Jawa, choice2_Quiz2_Level6_Stage1_Jawa, choice3_Quiz2_Level6_Stage1_Jawa, choice4_Quiz2_Level6_Stage1_Jawa]
        quiz2_level6_stage1_Jawa.images = [image1_Quiz2_Level6_Stage1_Jawa, image2_Quiz2_Level6_Stage1_Jawa, image3_Quiz2_Level6_Stage1_Jawa, image4_Quiz2_Level6_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level6_Stage1_Jawa.id = 1
        choice1_Quiz3_Level6_Stage1_Jawa.name = "Pa"
        
        let choice2_Quiz3_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level6_Stage1_Jawa.id = 2
        choice2_Quiz3_Level6_Stage1_Jawa.name = "Wa"
        
        let choice3_Quiz3_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level6_Stage1_Jawa.id = 3
        choice3_Quiz3_Level6_Stage1_Jawa.name = "Dha"
        
        let choice4_Quiz3_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level6_Stage1_Jawa.id = 4
        choice4_Quiz3_Level6_Stage1_Jawa.name = "Ca"
        
        //MARK: Image
        let image1_Quiz3_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level6_Stage1_Jawa.id = 1
        image1_Quiz3_Level6_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let image2_Quiz3_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level6_Stage1_Jawa.id = 2
        image2_Quiz3_Level6_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image3_Quiz3_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level6_Stage1_Jawa.id = 3
        image3_Quiz3_Level6_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let image4_Quiz3_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level6_Stage1_Jawa.id = 4
        image4_Quiz3_Level6_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let quiz3_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level6_stage1_Jawa.id = 3
        quiz3_level6_stage1_Jawa.name = "Kuis 2"
        quiz3_level6_stage1_Jawa.type = "B"
        quiz3_level6_stage1_Jawa.isCorrect = false
        quiz3_level6_stage1_Jawa.question = "Wa"
        quiz3_level6_stage1_Jawa.choices = [choice1_Quiz3_Level6_Stage1_Jawa, choice2_Quiz3_Level6_Stage1_Jawa, choice3_Quiz3_Level6_Stage1_Jawa, choice4_Quiz3_Level6_Stage1_Jawa]
        quiz3_level6_stage1_Jawa.images = [image1_Quiz3_Level6_Stage1_Jawa, image2_Quiz3_Level6_Stage1_Jawa, image3_Quiz3_Level6_Stage1_Jawa, image4_Quiz3_Level6_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level6_Stage1_Jawa.id = 1
        choice1_Quiz4_Level6_Stage1_Jawa.name = "Wa"
        
        let choice2_Quiz4_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level6_Stage1_Jawa.id = 2
        choice2_Quiz4_Level6_Stage1_Jawa.name = "Da"
        
        let choice3_Quiz4_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level6_Stage1_Jawa.id = 3
        choice3_Quiz4_Level6_Stage1_Jawa.name = "Pa"
        
        let choice4_Quiz4_Level6_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level6_Stage1_Jawa.id = 4
        choice4_Quiz4_Level6_Stage1_Jawa.name = "Dha"
        
        //MARK: Image
        let image1_Quiz4_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level6_Stage1_Jawa.id = 1
        image1_Quiz4_Level6_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image2_Quiz4_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level6_Stage1_Jawa.id = 2
        image2_Quiz4_Level6_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image3_Quiz4_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level6_Stage1_Jawa.id = 3
        image3_Quiz4_Level6_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let image4_Quiz4_Level6_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level6_Stage1_Jawa.id = 4
        image4_Quiz4_Level6_Stage1_Jawa.name = "Dha_Aksara_Jawa"
               
        let quiz4_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level6_stage1_Jawa.id = 4
        quiz4_level6_stage1_Jawa.name = "Kuis 3"
        quiz4_level6_stage1_Jawa.type = "C"
        quiz4_level6_stage1_Jawa.isCorrect = false
        quiz4_level6_stage1_Jawa.question = "Wa"
        quiz4_level6_stage1_Jawa.choices = [choice1_Quiz4_Level6_Stage1_Jawa, choice2_Quiz4_Level6_Stage1_Jawa, choice3_Quiz4_Level6_Stage1_Jawa, choice4_Quiz4_Level6_Stage1_Jawa]
        quiz4_level6_stage1_Jawa.images = [image1_Quiz4_Level6_Stage1_Jawa, image2_Quiz4_Level6_Stage1_Jawa, image3_Quiz4_Level6_Stage1_Jawa, image4_Quiz4_Level6_Stage1_Jawa]
        
        let quiz5_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level6_stage1_Jawa.id = 5
        quiz5_level6_stage1_Jawa.name = "Kuis 4"
        quiz5_level6_stage1_Jawa.type = "D"
        quiz5_level6_stage1_Jawa.isCorrect = false
        quiz5_level6_stage1_Jawa.question = "Wa"
        quiz5_level6_stage1_Jawa.choices = []
        quiz5_level6_stage1_Jawa.images = []
        
        let quiz6_level6_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level6_stage1_Jawa.id = 6
        quiz6_level6_stage1_Jawa.name = "Kuis 5"
        quiz6_level6_stage1_Jawa.type = "E"
        quiz6_level6_stage1_Jawa.isCorrect = false
        quiz6_level6_stage1_Jawa.question = "Wa"
        quiz6_level6_stage1_Jawa.choices = []
        quiz6_level6_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 7 Stage 1 Jawa
        let quiz1_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level7_stage1_Jawa.id = 1
        quiz1_level7_stage1_Jawa.name = "Panduan"
        quiz1_level7_stage1_Jawa.type = "Panduan"
        quiz1_level7_stage1_Jawa.isCorrect = false
        quiz1_level7_stage1_Jawa.question = "Na"
        quiz1_level7_stage1_Jawa.choices = []
        quiz1_level7_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level7_Stage1_Jawa.id = 1
        choice1_Quiz2_Level7_Stage1_Jawa.name = "Da"
        
        let choice2_Quiz2_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level7_Stage1_Jawa.id = 2
        choice2_Quiz2_Level7_Stage1_Jawa.name = "Sa"
        
        let choice3_Quiz2_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level7_Stage1_Jawa.id = 3
        choice3_Quiz2_Level7_Stage1_Jawa.name = "Na"
        
        let choice4_Quiz2_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level7_Stage1_Jawa.id = 4
        choice4_Quiz2_Level7_Stage1_Jawa.name = "Ca"
        
        //MARK: Image
        let image1_Quiz2_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level7_Stage1_Jawa.id = 1
        image1_Quiz2_Level7_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image2_Quiz2_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level7_Stage1_Jawa.id = 2
        image2_Quiz2_Level7_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image3_Quiz2_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level7_Stage1_Jawa.id = 3
        image3_Quiz2_Level7_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image4_Quiz2_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level7_Stage1_Jawa.id = 4
        image4_Quiz2_Level7_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let quiz2_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level7_stage1_Jawa.id = 2
        quiz2_level7_stage1_Jawa.name = "Kuis 1"
        quiz2_level7_stage1_Jawa.type = "A"
        quiz2_level7_stage1_Jawa.isCorrect = false
        quiz2_level7_stage1_Jawa.question = "Na"
        quiz2_level7_stage1_Jawa.choices = [choice1_Quiz2_Level7_Stage1_Jawa, choice2_Quiz2_Level7_Stage1_Jawa, choice3_Quiz2_Level7_Stage1_Jawa, choice4_Quiz2_Level7_Stage1_Jawa]
        quiz2_level7_stage1_Jawa.images = [image1_Quiz2_Level7_Stage1_Jawa, image2_Quiz2_Level7_Stage1_Jawa, image3_Quiz2_Level7_Stage1_Jawa, image4_Quiz2_Level7_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level7_Stage1_Jawa.id = 1
        choice1_Quiz3_Level7_Stage1_Jawa.name = "Ca"
        
        let choice2_Quiz3_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level7_Stage1_Jawa.id = 2
        choice2_Quiz3_Level7_Stage1_Jawa.name = "Na"
        
        let choice3_Quiz3_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level7_Stage1_Jawa.id = 3
        choice3_Quiz3_Level7_Stage1_Jawa.name = "Sa"
        
        let choice4_Quiz3_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level7_Stage1_Jawa.id = 4
        choice4_Quiz3_Level7_Stage1_Jawa.name = "Da"
        
        //MARK: Image
        let image1_Quiz3_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level7_Stage1_Jawa.id = 1
        image1_Quiz3_Level7_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image2_Quiz3_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level7_Stage1_Jawa.id = 2
        image2_Quiz3_Level7_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image3_Quiz3_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level7_Stage1_Jawa.id = 3
        image3_Quiz3_Level7_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let image4_Quiz3_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level7_Stage1_Jawa.id = 4
        image4_Quiz3_Level7_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let quiz3_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level7_stage1_Jawa.id = 3
        quiz3_level7_stage1_Jawa.name = "Kuis 2"
        quiz3_level7_stage1_Jawa.type = "B"
        quiz3_level7_stage1_Jawa.isCorrect = false
        quiz3_level7_stage1_Jawa.question = "Na"
        quiz3_level7_stage1_Jawa.choices = [choice1_Quiz3_Level7_Stage1_Jawa, choice2_Quiz3_Level7_Stage1_Jawa, choice3_Quiz3_Level7_Stage1_Jawa, choice4_Quiz3_Level7_Stage1_Jawa]
        quiz3_level7_stage1_Jawa.images = [image1_Quiz3_Level7_Stage1_Jawa, image2_Quiz3_Level7_Stage1_Jawa, image3_Quiz3_Level7_Stage1_Jawa, image4_Quiz3_Level7_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level7_Stage1_Jawa.id = 1
        choice1_Quiz4_Level7_Stage1_Jawa.name = "Da"
        
        let choice2_Quiz4_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level7_Stage1_Jawa.id = 2
        choice2_Quiz4_Level7_Stage1_Jawa.name = "Ca"
        
        let choice3_Quiz4_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level7_Stage1_Jawa.id = 3
        choice3_Quiz4_Level7_Stage1_Jawa.name = "Na"
        
        let choice4_Quiz4_Level7_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level7_Stage1_Jawa.id = 4
        choice4_Quiz4_Level7_Stage1_Jawa.name = "Sa"
        
        //MARK: Image
        let image1_Quiz4_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level7_Stage1_Jawa.id = 1
        image1_Quiz4_Level7_Stage1_Jawa.name = "Da_Aksara_Jawa"
        
        let image2_Quiz4_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level7_Stage1_Jawa.id = 2
        image2_Quiz4_Level7_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image3_Quiz4_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level7_Stage1_Jawa.id = 3
        image3_Quiz4_Level7_Stage1_Jawa.name = "Na_Aksara_Jawa"
        
        let image4_Quiz4_Level7_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level7_Stage1_Jawa.id = 4
        image4_Quiz4_Level7_Stage1_Jawa.name = "Sa_Aksara_Jawa"
        
        let quiz4_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level7_stage1_Jawa.id = 4
        quiz4_level7_stage1_Jawa.name = "Kuis 3"
        quiz4_level7_stage1_Jawa.type = "C"
        quiz4_level7_stage1_Jawa.isCorrect = false
        quiz4_level7_stage1_Jawa.question = "Na"
        quiz4_level7_stage1_Jawa.choices = [choice1_Quiz4_Level7_Stage1_Jawa, choice2_Quiz4_Level7_Stage1_Jawa, choice3_Quiz4_Level7_Stage1_Jawa, choice4_Quiz4_Level7_Stage1_Jawa]
        quiz4_level7_stage1_Jawa.images = [image1_Quiz4_Level7_Stage1_Jawa, image2_Quiz4_Level7_Stage1_Jawa, image3_Quiz4_Level7_Stage1_Jawa, image4_Quiz4_Level7_Stage1_Jawa]
        
        let quiz5_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level7_stage1_Jawa.id = 5
        quiz5_level7_stage1_Jawa.name = "Kuis 4"
        quiz5_level7_stage1_Jawa.type = "D"
        quiz5_level7_stage1_Jawa.isCorrect = false
        quiz5_level7_stage1_Jawa.question = "Na"
        quiz5_level7_stage1_Jawa.choices = []
        quiz5_level7_stage1_Jawa.images = []
        
        let quiz6_level7_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level7_stage1_Jawa.id = 6
        quiz6_level7_stage1_Jawa.name = "Kuis 5"
        quiz6_level7_stage1_Jawa.type = "E"
        quiz6_level7_stage1_Jawa.isCorrect = false
        quiz6_level7_stage1_Jawa.question = "Na"
        quiz6_level7_stage1_Jawa.choices = []
        quiz6_level7_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 8 Stage 1 Jawa
        let quiz1_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level8_stage1_Jawa.id = 1
        quiz1_level8_stage1_Jawa.name = "Panduan"
        quiz1_level8_stage1_Jawa.type = "Panduan"
        quiz1_level8_stage1_Jawa.isCorrect = false
        quiz1_level8_stage1_Jawa.question = "Dha"
        quiz1_level8_stage1_Jawa.choices = []
        quiz1_level8_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level8_Stage1_Jawa.id = 1
        choice1_Quiz2_Level8_Stage1_Jawa.name = "Ja"
        
        let choice2_Quiz2_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level8_Stage1_Jawa.id = 2
        choice2_Quiz2_Level8_Stage1_Jawa.name = "Dha"
        
        let choice3_Quiz2_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level8_Stage1_Jawa.id = 3
        choice3_Quiz2_Level8_Stage1_Jawa.name = "Ma"
        
        let choice4_Quiz2_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level8_Stage1_Jawa.id = 4
        choice4_Quiz2_Level8_Stage1_Jawa.name = "Tha"
        
        //MARK: Image
        let image1_Quiz2_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level8_Stage1_Jawa.id = 1
        image1_Quiz2_Level8_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image2_Quiz2_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level8_Stage1_Jawa.id = 2
        image2_Quiz2_Level8_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let image3_Quiz2_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level8_Stage1_Jawa.id = 3
        image3_Quiz2_Level8_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image4_Quiz2_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level8_Stage1_Jawa.id = 4
        image4_Quiz2_Level8_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let quiz2_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level8_stage1_Jawa.id = 2
        quiz2_level8_stage1_Jawa.name = "Kuis 1"
        quiz2_level8_stage1_Jawa.type = "A"
        quiz2_level8_stage1_Jawa.isCorrect = false
        quiz2_level8_stage1_Jawa.question = "Dha"
        quiz2_level8_stage1_Jawa.choices = [choice1_Quiz2_Level8_Stage1_Jawa, choice2_Quiz2_Level8_Stage1_Jawa, choice3_Quiz2_Level8_Stage1_Jawa, choice4_Quiz2_Level8_Stage1_Jawa]
        quiz2_level8_stage1_Jawa.images = [image1_Quiz2_Level8_Stage1_Jawa, image2_Quiz2_Level8_Stage1_Jawa, image3_Quiz2_Level8_Stage1_Jawa, image4_Quiz2_Level8_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level8_Stage1_Jawa.id = 1
        choice1_Quiz3_Level8_Stage1_Jawa.name = "Ma"
        
        let choice2_Quiz3_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level8_Stage1_Jawa.id = 2
        choice2_Quiz3_Level8_Stage1_Jawa.name = "Tha"
        
        let choice3_Quiz3_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level8_Stage1_Jawa.id = 3
        choice3_Quiz3_Level8_Stage1_Jawa.name = "Ja"
        
        let choice4_Quiz3_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level8_Stage1_Jawa.id = 4
        choice4_Quiz3_Level8_Stage1_Jawa.name = "Dha"
        
        //MARK: Image
        let image1_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level8_Stage1_Jawa.id = 1
        image1_Quiz3_Level8_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image2_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level8_Stage1_Jawa.id = 2
        image2_Quiz3_Level8_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image3_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level8_Stage1_Jawa.id = 3
        image3_Quiz3_Level8_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image4_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level8_Stage1_Jawa.id = 4
        image4_Quiz3_Level8_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let quiz3_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level8_stage1_Jawa.id = 3
        quiz3_level8_stage1_Jawa.name = "Kuis 2"
        quiz3_level8_stage1_Jawa.type = "B"
        quiz3_level8_stage1_Jawa.isCorrect = false
        quiz3_level8_stage1_Jawa.question = "Dha"
        quiz3_level8_stage1_Jawa.choices = [choice1_Quiz3_Level8_Stage1_Jawa, choice2_Quiz3_Level8_Stage1_Jawa, choice3_Quiz3_Level8_Stage1_Jawa, choice4_Quiz3_Level8_Stage1_Jawa]
        quiz3_level8_stage1_Jawa.images = [image1_Quiz3_Level8_Stage1_Jawa, image2_Quiz3_Level8_Stage1_Jawa, image3_Quiz3_Level8_Stage1_Jawa, image4_Quiz3_Level8_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level8_Stage1_Jawa.id = 1
        choice1_Quiz4_Level8_Stage1_Jawa.name = "Tha"
        
        let choice2_Quiz4_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level8_Stage1_Jawa.id = 2
        choice2_Quiz4_Level8_Stage1_Jawa.name = "Dha"
        
        let choice3_Quiz4_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level8_Stage1_Jawa.id = 3
        choice3_Quiz4_Level8_Stage1_Jawa.name = "Ja"
        
        let choice4_Quiz4_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level8_Stage1_Jawa.id = 4
        choice4_Quiz4_Level8_Stage1_Jawa.name = "Ma"
        
        //MARK: Image
        let image1_Quiz4_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level8_Stage1_Jawa.id = 1
        image1_Quiz4_Level8_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image2_Quiz4_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level8_Stage1_Jawa.id = 2
        image2_Quiz4_Level8_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let image3_Quiz4_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level8_Stage1_Jawa.id = 3
        image3_Quiz4_Level8_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image4_Quiz4_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level8_Stage1_Jawa.id = 4
        image4_Quiz4_Level8_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let quiz4_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level8_stage1_Jawa.id = 4
        quiz4_level8_stage1_Jawa.name = "Kuis 3"
        quiz4_level8_stage1_Jawa.type = "C"
        quiz4_level8_stage1_Jawa.isCorrect = false
        quiz4_level8_stage1_Jawa.question = "Dha"
        quiz4_level8_stage1_Jawa.choices = [choice1_Quiz4_Level8_Stage1_Jawa, choice2_Quiz4_Level8_Stage1_Jawa, choice3_Quiz4_Level8_Stage1_Jawa, choice4_Quiz4_Level8_Stage1_Jawa]
        quiz4_level8_stage1_Jawa.images = [image1_Quiz4_Level8_Stage1_Jawa, image2_Quiz4_Level8_Stage1_Jawa, image3_Quiz4_Level8_Stage1_Jawa, image4_Quiz4_Level8_Stage1_Jawa]
        
        let quiz5_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level8_stage1_Jawa.id = 5
        quiz5_level8_stage1_Jawa.name = "Kuis 4"
        quiz5_level8_stage1_Jawa.type = "D"
        quiz5_level8_stage1_Jawa.isCorrect = false
        quiz5_level8_stage1_Jawa.question = "Dha"
        quiz5_level8_stage1_Jawa.choices = []
        quiz5_level8_stage1_Jawa.images = []
        
        let quiz6_level8_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level8_stage1_Jawa.id = 6
        quiz6_level8_stage1_Jawa.name = "Kuis 5"
        quiz6_level8_stage1_Jawa.type = "E"
        quiz6_level8_stage1_Jawa.isCorrect = false
        quiz6_level8_stage1_Jawa.question = "Dha"
        quiz6_level8_stage1_Jawa.choices = []
        quiz6_level8_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 9 Stage 1 Jawa
        let quiz1_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level9_stage1_Jawa.id = 1
        quiz1_level9_stage1_Jawa.name = "Panduan"
        quiz1_level9_stage1_Jawa.type = "Panduan"
        quiz1_level9_stage1_Jawa.isCorrect = false
        quiz1_level9_stage1_Jawa.question = "Ba"
        quiz1_level9_stage1_Jawa.choices = []
        quiz1_level9_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level9_Stage1_Jawa.id = 1
        choice1_Quiz2_Level9_Stage1_Jawa.name = "Nya"
        
        let choice2_Quiz2_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level9_Stage1_Jawa.id = 2
        choice2_Quiz2_Level9_Stage1_Jawa.name = "Ja"
        
        let choice3_Quiz2_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level9_Stage1_Jawa.id = 3
        choice3_Quiz2_Level9_Stage1_Jawa.name = "Nga"
        
        let choice4_Quiz2_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level9_Stage1_Jawa.id = 4
        choice4_Quiz2_Level9_Stage1_Jawa.name = "Ba"
        
        //MARK: Image
        let image1_Quiz2_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level9_Stage1_Jawa.id = 1
        image1_Quiz2_Level9_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image2_Quiz2_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level9_Stage1_Jawa.id = 2
        image2_Quiz2_Level9_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image3_Quiz2_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level9_Stage1_Jawa.id = 3
        image3_Quiz2_Level9_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image4_Quiz2_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level9_Stage1_Jawa.id = 4
        image4_Quiz2_Level9_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let quiz2_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level9_stage1_Jawa.id = 2
        quiz2_level9_stage1_Jawa.name = "Kuis 1"
        quiz2_level9_stage1_Jawa.type = "A"
        quiz2_level9_stage1_Jawa.isCorrect = false
        quiz2_level9_stage1_Jawa.question = "Ba"
        quiz2_level9_stage1_Jawa.choices = [choice1_Quiz2_Level9_Stage1_Jawa, choice2_Quiz2_Level9_Stage1_Jawa, choice3_Quiz2_Level9_Stage1_Jawa, choice4_Quiz2_Level9_Stage1_Jawa]
        quiz2_level9_stage1_Jawa.images = [image1_Quiz2_Level9_Stage1_Jawa, image2_Quiz2_Level9_Stage1_Jawa, image3_Quiz2_Level9_Stage1_Jawa, image4_Quiz2_Level9_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level9_Stage1_Jawa.id = 1
        choice1_Quiz3_Level9_Stage1_Jawa.name = "Nya"
        
        let choice2_Quiz3_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level9_Stage1_Jawa.id = 2
        choice2_Quiz3_Level9_Stage1_Jawa.name = "Ja"
        
        let choice3_Quiz3_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level9_Stage1_Jawa.id = 3
        choice3_Quiz3_Level9_Stage1_Jawa.name = "Ba"
        
        let choice4_Quiz3_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level9_Stage1_Jawa.id = 4
        choice4_Quiz3_Level9_Stage1_Jawa.name = "Ma"
        
        //MARK: Image
        let image1_Quiz3_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level9_Stage1_Jawa.id = 1
        image1_Quiz3_Level9_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image2_Quiz3_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level9_Stage1_Jawa.id = 2
        image2_Quiz3_Level9_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image3_Quiz3_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level9_Stage1_Jawa.id = 3
        image3_Quiz3_Level9_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image4_Quiz3_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level9_Stage1_Jawa.id = 4
        image4_Quiz3_Level9_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let quiz3_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level9_stage1_Jawa.id = 3
        quiz3_level9_stage1_Jawa.name = "Kuis 2"
        quiz3_level9_stage1_Jawa.type = "B"
        quiz3_level9_stage1_Jawa.isCorrect = false
        quiz3_level9_stage1_Jawa.question = "Ba"
        quiz3_level9_stage1_Jawa.choices = [choice1_Quiz3_Level9_Stage1_Jawa, choice2_Quiz3_Level9_Stage1_Jawa, choice3_Quiz3_Level9_Stage1_Jawa, choice4_Quiz3_Level9_Stage1_Jawa]
        quiz3_level9_stage1_Jawa.images = [image1_Quiz3_Level9_Stage1_Jawa, image2_Quiz3_Level9_Stage1_Jawa, image3_Quiz3_Level9_Stage1_Jawa, image4_Quiz3_Level9_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level9_Stage1_Jawa.id = 1
        choice1_Quiz4_Level9_Stage1_Jawa.name = "Ba"
        
        let choice2_Quiz4_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level9_Stage1_Jawa.id = 2
        choice2_Quiz4_Level9_Stage1_Jawa.name = "Ma"
        
        let choice3_Quiz4_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level9_Stage1_Jawa.id = 3
        choice3_Quiz4_Level9_Stage1_Jawa.name = "Nya"
        
        let choice4_Quiz4_Level9_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level9_Stage1_Jawa.id = 4
        choice4_Quiz4_Level9_Stage1_Jawa.name = "Ja"
        
        //MARK: Image
        let image1_Quiz4_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level9_Stage1_Jawa.id = 1
        image1_Quiz4_Level9_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image2_Quiz4_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level9_Stage1_Jawa.id = 2
        image2_Quiz4_Level9_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image3_Quiz4_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level9_Stage1_Jawa.id = 3
        image3_Quiz4_Level9_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image4_Quiz4_Level9_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level9_Stage1_Jawa.id = 4
        image4_Quiz4_Level9_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let quiz4_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level9_stage1_Jawa.id = 4
        quiz4_level9_stage1_Jawa.name = "Kuis 3"
        quiz4_level9_stage1_Jawa.type = "C"
        quiz4_level9_stage1_Jawa.isCorrect = false
        quiz4_level9_stage1_Jawa.question = "Ba"
        quiz4_level9_stage1_Jawa.choices = [choice1_Quiz4_Level9_Stage1_Jawa, choice2_Quiz4_Level9_Stage1_Jawa, choice3_Quiz4_Level9_Stage1_Jawa, choice4_Quiz4_Level9_Stage1_Jawa]
        quiz4_level9_stage1_Jawa.images = [image1_Quiz4_Level9_Stage1_Jawa, image2_Quiz4_Level9_Stage1_Jawa, image3_Quiz4_Level9_Stage1_Jawa, image4_Quiz4_Level9_Stage1_Jawa]
        
        let quiz5_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level9_stage1_Jawa.id = 5
        quiz5_level9_stage1_Jawa.name = "Kuis 4"
        quiz5_level9_stage1_Jawa.type = "D"
        quiz5_level9_stage1_Jawa.isCorrect = false
        quiz5_level9_stage1_Jawa.question = "Ba"
        quiz5_level9_stage1_Jawa.choices = []
        quiz5_level9_stage1_Jawa.images = []
        
        let quiz6_level9_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level9_stage1_Jawa.id = 6
        quiz6_level9_stage1_Jawa.name = "Kuis 5"
        quiz6_level9_stage1_Jawa.type = "E"
        quiz6_level9_stage1_Jawa.isCorrect = false
        quiz6_level9_stage1_Jawa.question = "Ba"
        quiz6_level9_stage1_Jawa.choices = []
        quiz6_level9_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 10 Stage 1 Jawa
        let quiz1_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level10_stage1_Jawa.id = 1
        quiz1_level10_stage1_Jawa.name = "Panduan"
        quiz1_level10_stage1_Jawa.type = "Panduan"
        quiz1_level10_stage1_Jawa.isCorrect = false
        quiz1_level10_stage1_Jawa.question = "Ya"
        quiz1_level10_stage1_Jawa.choices = []
        quiz1_level10_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level10_Stage1_Jawa.id = 1
        choice1_Quiz2_Level10_Stage1_Jawa.name = "Ya"
        
        let choice2_Quiz2_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level10_Stage1_Jawa.id = 2
        choice2_Quiz2_Level10_Stage1_Jawa.name = "Ga"
        
        let choice3_Quiz2_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level10_Stage1_Jawa.id = 3
        choice3_Quiz2_Level10_Stage1_Jawa.name = "La"
        
        let choice4_Quiz2_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level10_Stage1_Jawa.id = 4
        choice4_Quiz2_Level10_Stage1_Jawa.name = "Pa"
        
        //MARK: Image
        let image1_Quiz2_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level10_Stage1_Jawa.id = 1
        image1_Quiz2_Level10_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let image2_Quiz2_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level10_Stage1_Jawa.id = 2
        image2_Quiz2_Level10_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
        let image3_Quiz2_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level10_Stage1_Jawa.id = 3
        image3_Quiz2_Level10_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image4_Quiz2_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level10_Stage1_Jawa.id = 4
        image4_Quiz2_Level10_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let quiz2_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level10_stage1_Jawa.id = 2
        quiz2_level10_stage1_Jawa.name = "Kuis 1"
        quiz2_level10_stage1_Jawa.type = "A"
        quiz2_level10_stage1_Jawa.isCorrect = false
        quiz2_level10_stage1_Jawa.question = "Ya"
        quiz2_level10_stage1_Jawa.choices = [choice1_Quiz2_Level10_Stage1_Jawa, choice2_Quiz2_Level10_Stage1_Jawa, choice3_Quiz2_Level10_Stage1_Jawa, choice3_Quiz2_Level10_Stage1_Jawa]
        quiz2_level10_stage1_Jawa.images = [image1_Quiz2_Level10_Stage1_Jawa, image2_Quiz2_Level10_Stage1_Jawa, image3_Quiz2_Level10_Stage1_Jawa, image4_Quiz2_Level10_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level10_Stage1_Jawa.id = 1
        choice1_Quiz3_Level10_Stage1_Jawa.name = "Ya"
        
        let choice2_Quiz3_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level10_Stage1_Jawa.id = 2
        choice2_Quiz3_Level10_Stage1_Jawa.name = "Pa"
        
        let choice3_Quiz3_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level10_Stage1_Jawa.id = 3
        choice3_Quiz3_Level10_Stage1_Jawa.name = "La"
        
        let choice4_Quiz3_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level10_Stage1_Jawa.id = 4
        choice4_Quiz3_Level10_Stage1_Jawa.name = "Ga"
        
        //MARK: Image
        let image1_Quiz3_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level10_Stage1_Jawa.id = 1
        image1_Quiz3_Level10_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let image2_Quiz3_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level10_Stage1_Jawa.id = 2
        image2_Quiz3_Level10_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let image3_Quiz3_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level10_Stage1_Jawa.id = 3
        image3_Quiz3_Level10_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image4_Quiz3_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level10_Stage1_Jawa.id = 4
        image4_Quiz3_Level10_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
        let quiz3_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level10_stage1_Jawa.id = 3
        quiz3_level10_stage1_Jawa.name = "Kuis 2"
        quiz3_level10_stage1_Jawa.type = "B"
        quiz3_level10_stage1_Jawa.isCorrect = false
        quiz3_level10_stage1_Jawa.question = "Ya"
        quiz3_level10_stage1_Jawa.choices = [choice1_Quiz3_Level10_Stage1_Jawa, choice2_Quiz3_Level10_Stage1_Jawa, choice3_Quiz3_Level10_Stage1_Jawa, choice4_Quiz3_Level10_Stage1_Jawa]
        quiz3_level10_stage1_Jawa.images = [image1_Quiz3_Level10_Stage1_Jawa, image2_Quiz3_Level10_Stage1_Jawa, image3_Quiz3_Level10_Stage1_Jawa, image4_Quiz3_Level10_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level10_Stage1_Jawa.id = 1
        choice1_Quiz4_Level10_Stage1_Jawa.name = "La"
        
        let choice2_Quiz4_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level10_Stage1_Jawa.id = 2
        choice2_Quiz4_Level10_Stage1_Jawa.name = "Ga"
        
        let choice3_Quiz4_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level10_Stage1_Jawa.id = 3
        choice3_Quiz4_Level10_Stage1_Jawa.name = "Pa"
        
        let choice4_Quiz4_Level10_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level10_Stage1_Jawa.id = 4
        choice4_Quiz4_Level10_Stage1_Jawa.name = "Ya"
        
        //MARK: Image
        let image1_Quiz4_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level10_Stage1_Jawa.id = 1
        image1_Quiz4_Level10_Stage1_Jawa.name = "La_Aksara_Jawa"
        
        let image2_Quiz4_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level10_Stage1_Jawa.id = 2
        image2_Quiz4_Level10_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
        let image3_Quiz4_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level10_Stage1_Jawa.id = 3
        image3_Quiz4_Level10_Stage1_Jawa.name = "Pa_Aksara_Jawa"
        
        let image4_Quiz4_Level10_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level10_Stage1_Jawa.id = 4
        image4_Quiz4_Level10_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let quiz4_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level10_stage1_Jawa.id = 4
        quiz4_level10_stage1_Jawa.name = "Kuis 3"
        quiz4_level10_stage1_Jawa.type = "C"
        quiz4_level10_stage1_Jawa.isCorrect = false
        quiz4_level10_stage1_Jawa.question = "Ya"
        quiz4_level10_stage1_Jawa.choices = [choice1_Quiz4_Level10_Stage1_Jawa, choice2_Quiz4_Level10_Stage1_Jawa, choice3_Quiz4_Level10_Stage1_Jawa, choice4_Quiz4_Level10_Stage1_Jawa]
        quiz4_level10_stage1_Jawa.images = [image1_Quiz4_Level10_Stage1_Jawa, image2_Quiz4_Level10_Stage1_Jawa, image3_Quiz4_Level10_Stage1_Jawa, image4_Quiz4_Level10_Stage1_Jawa]
        
        let quiz5_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level10_stage1_Jawa.id = 5
        quiz5_level10_stage1_Jawa.name = "Kuis 4"
        quiz5_level10_stage1_Jawa.type = "D"
        quiz5_level10_stage1_Jawa.isCorrect = false
        quiz5_level10_stage1_Jawa.question = "Ya"
        quiz5_level10_stage1_Jawa.choices = []
        quiz5_level10_stage1_Jawa.images = []
        
        let quiz6_level10_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level10_stage1_Jawa.id = 6
        quiz6_level10_stage1_Jawa.name = "Kuis 5"
        quiz6_level10_stage1_Jawa.type = "E"
        quiz6_level10_stage1_Jawa.isCorrect = false
        quiz6_level10_stage1_Jawa.question = "Ya"
        quiz6_level10_stage1_Jawa.choices = []
        quiz6_level10_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 11 Stage 1 Jawa
        let quiz1_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level11_stage1_Jawa.id = 1
        quiz1_level11_stage1_Jawa.name = "Panduan"
        quiz1_level11_stage1_Jawa.type = "Panduan"
        quiz1_level11_stage1_Jawa.isCorrect = false
        quiz1_level11_stage1_Jawa.question = "Nga"
        quiz1_level11_stage1_Jawa.choices = []
        quiz1_level11_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level11_Stage1_Jawa.id = 1
        choice1_Quiz2_Level11_Stage1_Jawa.name = "Nya"
        
        let choice2_Quiz2_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level11_Stage1_Jawa.id = 2
        choice2_Quiz2_Level11_Stage1_Jawa.name = "Ba"
        
        let choice3_Quiz2_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level11_Stage1_Jawa.id = 3
        choice3_Quiz2_Level11_Stage1_Jawa.name = "Nga"
        
        let choice4_Quiz2_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level11_Stage1_Jawa.id = 4
        choice4_Quiz2_Level11_Stage1_Jawa.name = "Tha"
        
        //MARK: Image
        let image1_Quiz2_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level11_Stage1_Jawa.id = 1
        image1_Quiz2_Level11_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image2_Quiz2_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level11_Stage1_Jawa.id = 2
        image2_Quiz2_Level11_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image3_Quiz2_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level11_Stage1_Jawa.id = 3
        image3_Quiz2_Level11_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image4_Quiz2_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level11_Stage1_Jawa.id = 4
        image4_Quiz2_Level11_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let quiz2_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level11_stage1_Jawa.id = 2
        quiz2_level11_stage1_Jawa.name = "Kuis 1"
        quiz2_level11_stage1_Jawa.type = "A"
        quiz2_level11_stage1_Jawa.isCorrect = false
        quiz2_level11_stage1_Jawa.question = "Nga"
        quiz2_level11_stage1_Jawa.choices = [choice1_Quiz2_Level11_Stage1_Jawa, choice2_Quiz2_Level11_Stage1_Jawa, choice3_Quiz2_Level11_Stage1_Jawa, choice4_Quiz2_Level11_Stage1_Jawa]
        quiz2_level11_stage1_Jawa.images = [image1_Quiz2_Level11_Stage1_Jawa, image2_Quiz2_Level11_Stage1_Jawa, image3_Quiz2_Level11_Stage1_Jawa, image4_Quiz2_Level11_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level11_Stage1_Jawa.id = 1
        choice1_Quiz3_Level11_Stage1_Jawa.name = "Ba"
        
        let choice2_Quiz3_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level11_Stage1_Jawa.id = 2
        choice2_Quiz3_Level11_Stage1_Jawa.name = "Tha"
        
        let choice3_Quiz3_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level11_Stage1_Jawa.id = 3
        choice3_Quiz3_Level11_Stage1_Jawa.name = "Nya"
        
        let choice4_Quiz3_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level11_Stage1_Jawa.id = 4
        choice4_Quiz3_Level11_Stage1_Jawa.name = "Nga"
        
        //MARK: Image
        let image1_Quiz3_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level11_Stage1_Jawa.id = 1
        image1_Quiz3_Level11_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image2_Quiz3_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level11_Stage1_Jawa.id = 2
        image2_Quiz3_Level11_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image3_Quiz3_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level11_Stage1_Jawa.id = 3
        image3_Quiz3_Level11_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image4_Quiz3_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level11_Stage1_Jawa.id = 4
        image4_Quiz3_Level11_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let quiz3_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level11_stage1_Jawa.id = 3
        quiz3_level11_stage1_Jawa.name = "Kuis 2"
        quiz3_level11_stage1_Jawa.type = "B"
        quiz3_level11_stage1_Jawa.isCorrect = false
        quiz3_level11_stage1_Jawa.question = "Nga"
        quiz3_level11_stage1_Jawa.choices = [choice1_Quiz3_Level11_Stage1_Jawa, choice2_Quiz3_Level11_Stage1_Jawa, choice3_Quiz3_Level11_Stage1_Jawa, choice4_Quiz3_Level11_Stage1_Jawa]
        quiz3_level11_stage1_Jawa.images = [image1_Quiz3_Level11_Stage1_Jawa, image2_Quiz3_Level11_Stage1_Jawa, image3_Quiz3_Level11_Stage1_Jawa, image4_Quiz3_Level11_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level11_Stage1_Jawa.id = 1
        choice1_Quiz4_Level11_Stage1_Jawa.name = "Nga"
        
        let choice2_Quiz4_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level11_Stage1_Jawa.id = 2
        choice2_Quiz4_Level11_Stage1_Jawa.name = "Nya"
        
        let choice3_Quiz4_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level11_Stage1_Jawa.id = 3
        choice3_Quiz4_Level11_Stage1_Jawa.name = "Tha"
        
        let choice4_Quiz4_Level11_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level11_Stage1_Jawa.id = 4
        choice4_Quiz4_Level11_Stage1_Jawa.name = "Ba"
        
        //MARK: Image
        let image1_Quiz4_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level11_Stage1_Jawa.id = 1
        image1_Quiz4_Level11_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image2_Quiz4_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level11_Stage1_Jawa.id = 2
        image2_Quiz4_Level11_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image3_Quiz4_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level11_Stage1_Jawa.id = 3
        image3_Quiz4_Level11_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image4_Quiz4_Level11_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level11_Stage1_Jawa.id = 4
        image4_Quiz4_Level11_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let quiz4_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level11_stage1_Jawa.id = 4
        quiz4_level11_stage1_Jawa.name = "Kuis 3"
        quiz4_level11_stage1_Jawa.type = "C"
        quiz4_level11_stage1_Jawa.isCorrect = false
        quiz4_level11_stage1_Jawa.question = "Nga"
        quiz4_level11_stage1_Jawa.choices = [choice1_Quiz4_Level11_Stage1_Jawa, choice2_Quiz4_Level11_Stage1_Jawa, choice3_Quiz4_Level11_Stage1_Jawa, choice4_Quiz4_Level11_Stage1_Jawa]
        quiz4_level11_stage1_Jawa.images = [image1_Quiz4_Level11_Stage1_Jawa, image2_Quiz4_Level11_Stage1_Jawa, image3_Quiz4_Level11_Stage1_Jawa, image4_Quiz4_Level11_Stage1_Jawa]
        
        let quiz5_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level11_stage1_Jawa.id = 5
        quiz5_level11_stage1_Jawa.name = "Kuis 4"
        quiz5_level11_stage1_Jawa.type = "D"
        quiz5_level11_stage1_Jawa.isCorrect = false
        quiz5_level11_stage1_Jawa.question = "Nga"
        quiz5_level11_stage1_Jawa.choices = []
        quiz5_level11_stage1_Jawa.images = []
        
        let quiz6_level11_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level11_stage1_Jawa.id = 6
        quiz6_level11_stage1_Jawa.name = "Kuis 5"
        quiz6_level11_stage1_Jawa.type = "E"
        quiz6_level11_stage1_Jawa.isCorrect = false
        quiz6_level11_stage1_Jawa.question = "Nga"
        quiz6_level11_stage1_Jawa.choices = []
        quiz6_level11_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 12 Stage 1 Jawa
        let quiz1_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level12_stage1_Jawa.id = 1
        quiz1_level12_stage1_Jawa.name = "Panduan"
        quiz1_level12_stage1_Jawa.type = "Panduan"
        quiz1_level12_stage1_Jawa.isCorrect = false
        quiz1_level12_stage1_Jawa.question = "Ja"
        quiz1_level12_stage1_Jawa.choices = []
        quiz1_level12_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level12_Stage1_Jawa.id = 1
        choice1_Quiz2_Level12_Stage1_Jawa.name = "Ta"
        
        let choice2_Quiz2_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level12_Stage1_Jawa.id = 2
        choice2_Quiz2_Level12_Stage1_Jawa.name = "Ja"
        
        let choice3_Quiz2_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level12_Stage1_Jawa.id = 3
        choice3_Quiz2_Level12_Stage1_Jawa.name = "Ka"
        
        let choice4_Quiz2_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level12_Stage1_Jawa.id = 4
        choice4_Quiz2_Level12_Stage1_Jawa.name = "Ma"
        
        //MARK: Image
        let image1_Quiz2_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level12_Stage1_Jawa.id = 1
        image1_Quiz2_Level12_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image2_Quiz2_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level12_Stage1_Jawa.id = 2
        image2_Quiz2_Level12_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image3_Quiz2_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level12_Stage1_Jawa.id = 3
        image3_Quiz2_Level12_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image4_Quiz2_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level12_Stage1_Jawa.id = 4
        image4_Quiz2_Level12_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let quiz2_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level12_stage1_Jawa.id = 2
        quiz2_level12_stage1_Jawa.name = "Kuis 1"
        quiz2_level12_stage1_Jawa.type = "A"
        quiz2_level12_stage1_Jawa.isCorrect = false
        quiz2_level12_stage1_Jawa.question = "Ja"
        quiz2_level12_stage1_Jawa.choices = [choice1_Quiz2_Level12_Stage1_Jawa, choice2_Quiz2_Level12_Stage1_Jawa, choice3_Quiz2_Level12_Stage1_Jawa, choice4_Quiz2_Level12_Stage1_Jawa]
        quiz2_level12_stage1_Jawa.images = [image1_Quiz2_Level12_Stage1_Jawa, image2_Quiz2_Level12_Stage1_Jawa, image3_Quiz2_Level12_Stage1_Jawa, image4_Quiz2_Level12_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level12_Stage1_Jawa.id = 1
        choice1_Quiz3_Level12_Stage1_Jawa.name = "Ja"
        
        let choice2_Quiz3_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level12_Stage1_Jawa.id = 2
        choice2_Quiz3_Level12_Stage1_Jawa.name = "Ma"
        
        let choice3_Quiz3_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level12_Stage1_Jawa.id = 3
        choice3_Quiz3_Level12_Stage1_Jawa.name = "Ta"
        
        let choice4_Quiz3_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level12_Stage1_Jawa.id = 4
        choice4_Quiz3_Level12_Stage1_Jawa.name = "Ka"
        
        //MARK: Image
        let image1_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level12_Stage1_Jawa.id = 1
        image1_Quiz3_Level12_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image2_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level12_Stage1_Jawa.id = 2
        image2_Quiz3_Level12_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image3_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level12_Stage1_Jawa.id = 3
        image3_Quiz3_Level12_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image4_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level12_Stage1_Jawa.id = 4
        image4_Quiz3_Level12_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let quiz3_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level12_stage1_Jawa.id = 3
        quiz3_level12_stage1_Jawa.name = "Kuis 2"
        quiz3_level12_stage1_Jawa.type = "B"
        quiz3_level12_stage1_Jawa.isCorrect = false
        quiz3_level12_stage1_Jawa.question = "Ja"
        quiz3_level12_stage1_Jawa.choices = [choice1_Quiz3_Level12_Stage1_Jawa, choice2_Quiz3_Level12_Stage1_Jawa, choice3_Quiz3_Level12_Stage1_Jawa, choice4_Quiz3_Level12_Stage1_Jawa]
        quiz3_level12_stage1_Jawa.images = [image1_Quiz3_Level12_Stage1_Jawa, image2_Quiz3_Level12_Stage1_Jawa, image3_Quiz3_Level12_Stage1_Jawa, image4_Quiz3_Level12_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level12_Stage1_Jawa.id = 1
        choice1_Quiz4_Level12_Stage1_Jawa.name = "Ta"
        
        let choice2_Quiz4_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level12_Stage1_Jawa.id = 2
        choice2_Quiz4_Level12_Stage1_Jawa.name = "Ma"
        
        let choice3_Quiz4_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level12_Stage1_Jawa.id = 3
        choice3_Quiz4_Level12_Stage1_Jawa.name = "Ka"
        
        let choice4_Quiz4_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level12_Stage1_Jawa.id = 4
        choice4_Quiz4_Level12_Stage1_Jawa.name = "Ja"
        
        //MARK: Image
        let image1_Quiz4_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level12_Stage1_Jawa.id = 1
        image1_Quiz4_Level12_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image2_Quiz4_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level12_Stage1_Jawa.id = 2
        image2_Quiz4_Level12_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image3_Quiz4_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level12_Stage1_Jawa.id = 3
        image3_Quiz4_Level12_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image4_Quiz4_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level12_Stage1_Jawa.id = 4
        image4_Quiz4_Level12_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let quiz4_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level12_stage1_Jawa.id = 4
        quiz4_level12_stage1_Jawa.name = "Kuis 3"
        quiz4_level12_stage1_Jawa.type = "C"
        quiz4_level12_stage1_Jawa.isCorrect = false
        quiz4_level12_stage1_Jawa.question = "Ja"
        quiz4_level12_stage1_Jawa.choices = [choice1_Quiz4_Level12_Stage1_Jawa, choice2_Quiz4_Level12_Stage1_Jawa, choice3_Quiz4_Level12_Stage1_Jawa, choice4_Quiz4_Level12_Stage1_Jawa]
        quiz4_level12_stage1_Jawa.images = [image1_Quiz4_Level12_Stage1_Jawa, image2_Quiz4_Level12_Stage1_Jawa, image3_Quiz4_Level12_Stage1_Jawa, image4_Quiz4_Level12_Stage1_Jawa]
        
        let quiz5_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level12_stage1_Jawa.id = 5
        quiz5_level12_stage1_Jawa.name = "Kuis 4"
        quiz5_level12_stage1_Jawa.type = "D"
        quiz5_level12_stage1_Jawa.isCorrect = false
        quiz5_level12_stage1_Jawa.question = "Ja"
        quiz5_level12_stage1_Jawa.choices = []
        quiz5_level12_stage1_Jawa.images = []
        
        let quiz6_level12_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level12_stage1_Jawa.id = 6
        quiz6_level12_stage1_Jawa.name = "Kuis 5"
        quiz6_level12_stage1_Jawa.type = "E"
        quiz6_level12_stage1_Jawa.isCorrect = false
        quiz6_level12_stage1_Jawa.question = "Ja"
        quiz6_level12_stage1_Jawa.choices = []
        quiz6_level12_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 13 Stage 1 Jawa
        let quiz1_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level13_stage1_Jawa.id = 1
        quiz1_level13_stage1_Jawa.name = "Panduan"
        quiz1_level13_stage1_Jawa.type = "Panduan"
        quiz1_level13_stage1_Jawa.isCorrect = false
        quiz1_level13_stage1_Jawa.question = "Tha"
        quiz1_level13_stage1_Jawa.choices = []
        quiz1_level13_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level13_Stage1_Jawa.id = 1
        choice1_Quiz2_Level13_Stage1_Jawa.name = "Tha"
        
        let choice2_Quiz2_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level13_Stage1_Jawa.id = 2
        choice2_Quiz2_Level13_Stage1_Jawa.name = "Ba"
        
        let choice3_Quiz2_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level13_Stage1_Jawa.id = 3
        choice3_Quiz2_Level13_Stage1_Jawa.name = "Nga"
        
        let choice4_Quiz2_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level13_Stage1_Jawa.id = 4
        choice4_Quiz2_Level13_Stage1_Jawa.name = "Nya"
        
        //MARK: Image
        let image1_Quiz2_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level13_Stage1_Jawa.id = 1
        image1_Quiz2_Level13_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image2_Quiz2_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level13_Stage1_Jawa.id = 2
        image2_Quiz2_Level13_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image3_Quiz2_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level13_Stage1_Jawa.id = 3
        image3_Quiz2_Level13_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image4_Quiz2_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level13_Stage1_Jawa.id = 4
        image4_Quiz2_Level13_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let quiz2_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level13_stage1_Jawa.id = 2
        quiz2_level13_stage1_Jawa.name = "Kuis 1"
        quiz2_level13_stage1_Jawa.type = "A"
        quiz2_level13_stage1_Jawa.isCorrect = false
        quiz2_level13_stage1_Jawa.question = "Tha"
        quiz2_level13_stage1_Jawa.choices = [choice1_Quiz2_Level13_Stage1_Jawa, choice2_Quiz2_Level13_Stage1_Jawa, choice3_Quiz2_Level13_Stage1_Jawa, choice4_Quiz2_Level13_Stage1_Jawa]
        quiz2_level13_stage1_Jawa.images = [image1_Quiz2_Level13_Stage1_Jawa, image2_Quiz2_Level13_Stage1_Jawa, image3_Quiz2_Level13_Stage1_Jawa, image4_Quiz2_Level13_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level13_Stage1_Jawa.id = 1
        choice1_Quiz3_Level13_Stage1_Jawa.name = "Nga"
        
        let choice2_Quiz3_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level13_Stage1_Jawa.id = 2
        choice2_Quiz3_Level13_Stage1_Jawa.name = "Tha"
        
        let choice3_Quiz3_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level13_Stage1_Jawa.id = 3
        choice3_Quiz3_Level13_Stage1_Jawa.name = "Ba"
        
        let choice4_Quiz3_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level13_Stage1_Jawa.id = 4
        choice4_Quiz3_Level13_Stage1_Jawa.name = "Nya"
        
        //MARK: Image
        let image1_Quiz3_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level13_Stage1_Jawa.id = 1
        image1_Quiz3_Level13_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image2_Quiz3_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level13_Stage1_Jawa.id = 2
        image2_Quiz3_Level13_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image3_Quiz3_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level13_Stage1_Jawa.id = 3
        image3_Quiz3_Level13_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image4_Quiz3_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level13_Stage1_Jawa.id = 4
        image4_Quiz3_Level13_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let quiz3_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level13_stage1_Jawa.id = 3
        quiz3_level13_stage1_Jawa.name = "Kuis 2"
        quiz3_level13_stage1_Jawa.type = "B"
        quiz3_level13_stage1_Jawa.isCorrect = false
        quiz3_level13_stage1_Jawa.question = "Tha"
        quiz3_level13_stage1_Jawa.choices = [choice1_Quiz3_Level13_Stage1_Jawa, choice2_Quiz3_Level13_Stage1_Jawa, choice3_Quiz3_Level13_Stage1_Jawa, choice4_Quiz3_Level13_Stage1_Jawa]
        quiz3_level13_stage1_Jawa.images = [image1_Quiz3_Level13_Stage1_Jawa, image2_Quiz3_Level13_Stage1_Jawa, image3_Quiz3_Level13_Stage1_Jawa, image4_Quiz3_Level13_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level13_Stage1_Jawa.id = 1
        choice1_Quiz4_Level13_Stage1_Jawa.name = "Nya"
        
        let choice2_Quiz4_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level13_Stage1_Jawa.id = 2
        choice2_Quiz4_Level13_Stage1_Jawa.name = "Ba"
        
        let choice3_Quiz4_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level13_Stage1_Jawa.id = 3
        choice3_Quiz4_Level13_Stage1_Jawa.name = "Tha"
        
        let choice4_Quiz4_Level13_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level13_Stage1_Jawa.id = 4
        choice4_Quiz4_Level13_Stage1_Jawa.name = "Nga"
        
        //MARK: Image
        let image1_Quiz4_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level13_Stage1_Jawa.id = 1
        image1_Quiz4_Level13_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image2_Quiz4_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level13_Stage1_Jawa.id = 2
        image2_Quiz4_Level13_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image3_Quiz4_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level13_Stage1_Jawa.id = 3
        image3_Quiz4_Level13_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image4_Quiz4_Level13_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level13_Stage1_Jawa.id = 4
        image4_Quiz4_Level13_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let quiz4_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level13_stage1_Jawa.id = 4
        quiz4_level13_stage1_Jawa.name = "Kuis 3"
        quiz4_level13_stage1_Jawa.type = "C"
        quiz4_level13_stage1_Jawa.isCorrect = false
        quiz4_level13_stage1_Jawa.question = "Tha"
        quiz4_level13_stage1_Jawa.choices = [choice1_Quiz4_Level13_Stage1_Jawa, choice2_Quiz4_Level13_Stage1_Jawa, choice3_Quiz4_Level13_Stage1_Jawa, choice4_Quiz4_Level13_Stage1_Jawa]
        quiz4_level13_stage1_Jawa.images = [image1_Quiz4_Level13_Stage1_Jawa, image2_Quiz4_Level13_Stage1_Jawa, image3_Quiz4_Level13_Stage1_Jawa, image4_Quiz4_Level13_Stage1_Jawa]
        
        let quiz5_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level13_stage1_Jawa.id = 5
        quiz5_level13_stage1_Jawa.name = "Kuis 4"
        quiz5_level13_stage1_Jawa.type = "D"
        quiz5_level13_stage1_Jawa.isCorrect = false
        quiz5_level13_stage1_Jawa.question = "Tha"
        quiz5_level13_stage1_Jawa.choices = []
        quiz5_level13_stage1_Jawa.images = []
        
        let quiz6_level13_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level13_stage1_Jawa.id = 6
        quiz6_level13_stage1_Jawa.name = "Kuis 5"
        quiz6_level13_stage1_Jawa.type = "E"
        quiz6_level13_stage1_Jawa.isCorrect = false
        quiz6_level13_stage1_Jawa.question = "Tha"
        quiz6_level13_stage1_Jawa.choices = []
        quiz6_level13_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 14 Stage 1 Jawa
        let quiz1_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level14_stage1_Jawa.id = 1
        quiz1_level14_stage1_Jawa.name = "Panduan"
        quiz1_level14_stage1_Jawa.type = "Panduan"
        quiz1_level14_stage1_Jawa.isCorrect = false
        quiz1_level14_stage1_Jawa.question = "Ma"
        quiz1_level14_stage1_Jawa.choices = []
        quiz1_level14_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level14_Stage1_Jawa.id = 1
        choice1_Quiz2_Level14_Stage1_Jawa.name = "Ba"
        
        let choice2_Quiz2_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level14_Stage1_Jawa.id = 2
        choice2_Quiz2_Level14_Stage1_Jawa.name = "Ma"
        
        let choice3_Quiz2_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level14_Stage1_Jawa.id = 3
        choice3_Quiz2_Level14_Stage1_Jawa.name = "Ja"
        
        let choice4_Quiz2_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level14_Stage1_Jawa.id = 4
        choice4_Quiz2_Level14_Stage1_Jawa.name = "Ca"
        
        //MARK: Image
        let image1_Quiz2_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level14_Stage1_Jawa.id = 1
        image1_Quiz2_Level14_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image2_Quiz2_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level14_Stage1_Jawa.id = 2
        image2_Quiz2_Level14_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image3_Quiz2_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level14_Stage1_Jawa.id = 3
        image3_Quiz2_Level14_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image4_Quiz2_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level14_Stage1_Jawa.id = 4
        image4_Quiz2_Level14_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let quiz2_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level14_stage1_Jawa.id = 2
        quiz2_level14_stage1_Jawa.name = "Kuis 1"
        quiz2_level14_stage1_Jawa.type = "A"
        quiz2_level14_stage1_Jawa.isCorrect = false
        quiz2_level14_stage1_Jawa.question = "Ma"
        quiz2_level14_stage1_Jawa.choices = [choice1_Quiz2_Level14_Stage1_Jawa, choice2_Quiz2_Level14_Stage1_Jawa, choice3_Quiz2_Level14_Stage1_Jawa, choice4_Quiz2_Level14_Stage1_Jawa]
        quiz2_level14_stage1_Jawa.images = [image1_Quiz2_Level14_Stage1_Jawa, image2_Quiz2_Level14_Stage1_Jawa, image3_Quiz2_Level14_Stage1_Jawa, image4_Quiz2_Level14_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level14_Stage1_Jawa.id = 1
        choice1_Quiz3_Level14_Stage1_Jawa.name = "Ja"
        
        let choice2_Quiz3_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level14_Stage1_Jawa.id = 2
        choice2_Quiz3_Level14_Stage1_Jawa.name = "Wa"
        
        let choice3_Quiz3_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level14_Stage1_Jawa.id = 3
        choice3_Quiz3_Level14_Stage1_Jawa.name = "Ma"
        
        let choice4_Quiz3_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level14_Stage1_Jawa.id = 4
        choice4_Quiz3_Level14_Stage1_Jawa.name = "Dha"
        
        //MARK: Image
        let image1_Quiz3_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level14_Stage1_Jawa.id = 1
        image1_Quiz3_Level14_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image2_Quiz3_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level14_Stage1_Jawa.id = 2
        image2_Quiz3_Level14_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image3_Quiz3_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level14_Stage1_Jawa.id = 3
        image3_Quiz3_Level14_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image4_Quiz3_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level14_Stage1_Jawa.id = 4
        image4_Quiz3_Level14_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let quiz3_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage1_Jawa.id = 3
        quiz3_level14_stage1_Jawa.name = "Kuis 2"
        quiz3_level14_stage1_Jawa.type = "B"
        quiz3_level14_stage1_Jawa.isCorrect = false
        quiz3_level14_stage1_Jawa.question = "Ma"
        quiz3_level14_stage1_Jawa.choices = [choice1_Quiz3_Level14_Stage1_Jawa, choice2_Quiz3_Level14_Stage1_Jawa, choice3_Quiz3_Level14_Stage1_Jawa, choice4_Quiz3_Level14_Stage1_Jawa]
        quiz3_level14_stage1_Jawa.images = [image1_Quiz3_Level14_Stage1_Jawa, image2_Quiz3_Level14_Stage1_Jawa, image3_Quiz3_Level14_Stage1_Jawa, image4_Quiz3_Level14_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level14_Stage1_Jawa.id = 1
        choice1_Quiz4_Level14_Stage1_Jawa.name = "Wa"
        
        let choice2_Quiz4_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level14_Stage1_Jawa.id = 2
        choice2_Quiz4_Level14_Stage1_Jawa.name = "Dha"
        
        let choice3_Quiz4_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level14_Stage1_Jawa.id = 3
        choice3_Quiz4_Level14_Stage1_Jawa.name = "Ja"
        
        let choice4_Quiz4_Level14_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level14_Stage1_Jawa.id = 4
        choice4_Quiz4_Level14_Stage1_Jawa.name = "Ma"
        
        //MARK: Image
        let image1_Quiz4_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level14_Stage1_Jawa.id = 1
        image1_Quiz4_Level14_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image2_Quiz4_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level14_Stage1_Jawa.id = 2
        image2_Quiz4_Level14_Stage1_Jawa.name = "Dha_Aksara_Jawa"
        
        let image3_Quiz4_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level14_Stage1_Jawa.id = 3
        image3_Quiz4_Level14_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image4_Quiz4_Level14_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level14_Stage1_Jawa.id = 4
        image4_Quiz4_Level14_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let quiz4_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level14_stage1_Jawa.id = 4
        quiz4_level14_stage1_Jawa.name = "Kuis 3"
        quiz4_level14_stage1_Jawa.type = "C"
        quiz4_level14_stage1_Jawa.isCorrect = false
        quiz4_level14_stage1_Jawa.question = "Ma"
        quiz4_level14_stage1_Jawa.choices = [choice1_Quiz4_Level14_Stage1_Jawa, choice2_Quiz4_Level14_Stage1_Jawa, choice3_Quiz4_Level14_Stage1_Jawa, choice4_Quiz4_Level14_Stage1_Jawa]
        quiz4_level14_stage1_Jawa.images = [image1_Quiz4_Level14_Stage1_Jawa, image2_Quiz4_Level14_Stage1_Jawa, image3_Quiz4_Level14_Stage1_Jawa, image4_Quiz4_Level14_Stage1_Jawa]
        
        let quiz5_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage1_Jawa.id = 5
        quiz5_level14_stage1_Jawa.name = "Kuis 4"
        quiz5_level14_stage1_Jawa.type = "D"
        quiz5_level14_stage1_Jawa.isCorrect = false
        quiz5_level14_stage1_Jawa.question = "Ma"
        quiz5_level14_stage1_Jawa.choices = []
        quiz5_level14_stage1_Jawa.images = []
        
        let quiz6_level14_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage1_Jawa.id = 6
        quiz6_level14_stage1_Jawa.name = "Kuis 5"
        quiz6_level14_stage1_Jawa.type = "E"
        quiz6_level14_stage1_Jawa.isCorrect = false
        quiz6_level14_stage1_Jawa.question = "Ma"
        quiz6_level14_stage1_Jawa.choices = []
        quiz6_level14_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 15 Stage 1 Jawa
        let quiz1_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level15_stage1_Jawa.id = 1
        quiz1_level15_stage1_Jawa.name = "Panduan"
        quiz1_level15_stage1_Jawa.type = "Panduan"
        quiz1_level15_stage1_Jawa.isCorrect = false
        quiz1_level15_stage1_Jawa.question = "Nya"
        quiz1_level15_stage1_Jawa.choices = []
        quiz1_level15_stage1_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level15_Stage1_Jawa.id = 1
        choice1_Quiz2_Level15_Stage1_Jawa.name = "Nga"
        
        let choice2_Quiz2_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level15_Stage1_Jawa.id = 2
        choice2_Quiz2_Level15_Stage1_Jawa.name = "Tha"
        
        let choice3_Quiz2_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level15_Stage1_Jawa.id = 3
        choice3_Quiz2_Level15_Stage1_Jawa.name = "Ba"
        
        let choice4_Quiz2_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level15_Stage1_Jawa.id = 4
        choice4_Quiz2_Level15_Stage1_Jawa.name = "Nya"
        
        //MARK: Image
        let image1_Quiz2_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level15_Stage1_Jawa.id = 1
        image1_Quiz2_Level15_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image2_Quiz2_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level15_Stage1_Jawa.id = 2
        image2_Quiz2_Level15_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image3_Quiz2_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level15_Stage1_Jawa.id = 3
        image3_Quiz2_Level15_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image4_Quiz2_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level15_Stage1_Jawa.id = 4
        image4_Quiz2_Level15_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let quiz2_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level15_stage1_Jawa.id = 2
        quiz2_level15_stage1_Jawa.name = "Kuis 1"
        quiz2_level15_stage1_Jawa.type = "A"
        quiz2_level15_stage1_Jawa.isCorrect = false
        quiz2_level15_stage1_Jawa.question = "Nya"
        quiz2_level15_stage1_Jawa.choices = [choice1_Quiz2_Level15_Stage1_Jawa, choice2_Quiz2_Level15_Stage1_Jawa, choice3_Quiz2_Level15_Stage1_Jawa, choice4_Quiz2_Level15_Stage1_Jawa]
        quiz2_level15_stage1_Jawa.images = [image1_Quiz2_Level15_Stage1_Jawa, image2_Quiz2_Level15_Stage1_Jawa, image3_Quiz2_Level15_Stage1_Jawa, image4_Quiz2_Level15_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level15_Stage1_Jawa.id = 1
        choice1_Quiz3_Level15_Stage1_Jawa.name = "Tha"
        
        let choice2_Quiz3_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level15_Stage1_Jawa.id = 2
        choice2_Quiz3_Level15_Stage1_Jawa.name = "Nya"
        
        let choice3_Quiz3_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level15_Stage1_Jawa.id = 3
        choice3_Quiz3_Level15_Stage1_Jawa.name = "Nga"
        
        let choice4_Quiz3_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level15_Stage1_Jawa.id = 4
        choice4_Quiz3_Level15_Stage1_Jawa.name = "Ba"
        
        //MARK: Image
        let image1_Quiz3_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level15_Stage1_Jawa.id = 1
        image1_Quiz3_Level15_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
        let image2_Quiz3_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level15_Stage1_Jawa.id = 2
        image2_Quiz3_Level15_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image3_Quiz3_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level15_Stage1_Jawa.id = 3
        image3_Quiz3_Level15_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image4_Quiz3_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level15_Stage1_Jawa.id = 4
        image4_Quiz3_Level15_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let quiz3_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level15_stage1_Jawa.id = 3
        quiz3_level15_stage1_Jawa.name = "Kuis 2"
        quiz3_level15_stage1_Jawa.type = "B"
        quiz3_level15_stage1_Jawa.isCorrect = false
        quiz3_level15_stage1_Jawa.question = "Nya"
        quiz3_level15_stage1_Jawa.choices = [choice1_Quiz3_Level15_Stage1_Jawa, choice2_Quiz3_Level15_Stage1_Jawa, choice3_Quiz3_Level15_Stage1_Jawa, choice4_Quiz3_Level15_Stage1_Jawa]
        quiz3_level15_stage1_Jawa.images = [image1_Quiz3_Level15_Stage1_Jawa, image2_Quiz3_Level15_Stage1_Jawa, image3_Quiz3_Level15_Stage1_Jawa, image4_Quiz3_Level15_Stage1_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level15_Stage1_Jawa.id = 1
        choice1_Quiz4_Level15_Stage1_Jawa.name = "Ba"
        
        let choice2_Quiz4_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level15_Stage1_Jawa.id = 2
        choice2_Quiz4_Level15_Stage1_Jawa.name = "Nga"
        
        let choice3_Quiz4_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level15_Stage1_Jawa.id = 3
        choice3_Quiz4_Level15_Stage1_Jawa.name = "Nya"
        
        let choice4_Quiz4_Level15_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level15_Stage1_Jawa.id = 4
        choice4_Quiz4_Level15_Stage1_Jawa.name = "Ta"
        
        //MARK: Image
        let image1_Quiz4_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level15_Stage1_Jawa.id = 1
        image1_Quiz4_Level15_Stage1_Jawa.name = "Ba_Aksara_Jawa"
        
        let image2_Quiz4_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level15_Stage1_Jawa.id = 2
        image2_Quiz4_Level15_Stage1_Jawa.name = "Nga_Aksara_Jawa"
        
        let image3_Quiz4_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level15_Stage1_Jawa.id = 3
        image3_Quiz4_Level15_Stage1_Jawa.name = "Nya_Aksara_Jawa"
        
        let image4_Quiz4_Level15_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level15_Stage1_Jawa.id = 4
        image4_Quiz4_Level15_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let quiz4_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level15_stage1_Jawa.id = 4
        quiz4_level15_stage1_Jawa.name = "Kuis 3"
        quiz4_level15_stage1_Jawa.type = "C"
        quiz4_level15_stage1_Jawa.isCorrect = false
        quiz4_level15_stage1_Jawa.question = "Nya"
        quiz4_level15_stage1_Jawa.choices = [choice1_Quiz4_Level15_Stage1_Jawa, choice2_Quiz4_Level15_Stage1_Jawa, choice3_Quiz4_Level15_Stage1_Jawa, choice4_Quiz4_Level15_Stage1_Jawa]
        quiz4_level15_stage1_Jawa.images = [image1_Quiz4_Level15_Stage1_Jawa, image2_Quiz4_Level15_Stage1_Jawa, image3_Quiz4_Level15_Stage1_Jawa, image4_Quiz4_Level15_Stage1_Jawa]
        
        let quiz5_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level15_stage1_Jawa.id = 5
        quiz5_level15_stage1_Jawa.name = "Kuis 4"
        quiz5_level15_stage1_Jawa.type = "D"
        quiz5_level15_stage1_Jawa.isCorrect = false
        quiz5_level15_stage1_Jawa.question = "Nya"
        quiz5_level15_stage1_Jawa.choices = []
        quiz5_level15_stage1_Jawa.images = []
        
        let quiz6_level15_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level15_stage1_Jawa.id = 6
        quiz6_level15_stage1_Jawa.name = "Kuis 5"
        quiz6_level15_stage1_Jawa.type = "E"
        quiz6_level15_stage1_Jawa.isCorrect = false
        quiz6_level15_stage1_Jawa.question = "Nya"
        quiz6_level15_stage1_Jawa.choices = []
        quiz6_level15_stage1_Jawa.images = []
        
        // MARK: Quiz for Level 1 Stage 2 Jawa
        let quiz1_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level1_stage2_Jawa.id = 1
        quiz1_level1_stage2_Jawa.name = "Panduan"
        quiz1_level1_stage2_Jawa.type = "Panduan"
        quiz1_level1_stage2_Jawa.isCorrect = false
        quiz1_level1_stage2_Jawa.question = "Ki"
        quiz1_level1_stage2_Jawa.choices = []
        quiz1_level1_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level1_Stage2_Jawa.id = 1
        choice1_Quiz2_Level1_Stage2_Jawa.name = "Kang"
        
        let choice2_Quiz2_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level1_Stage2_Jawa.id = 2
        choice2_Quiz2_Level1_Stage2_Jawa.name = "Si"
        
        let choice3_Quiz2_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level1_Stage2_Jawa.id = 3
        choice3_Quiz2_Level1_Stage2_Jawa.name = "Sang"
        
        let choice4_Quiz2_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level1_Stage2_Jawa.id = 4
        choice4_Quiz2_Level1_Stage2_Jawa.name = "Ki"
        
        //MARK: Image
        let image1_Quiz2_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level1_Stage2_Jawa.id = 1
        image1_Quiz2_Level1_Stage2_Jawa.name = "Kang_Aksara_Jawa"
        
        let image2_Quiz2_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level1_Stage2_Jawa.id = 2
        image2_Quiz2_Level1_Stage2_Jawa.name = "Si_Aksara_Jawa"
        
        let image3_Quiz2_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level1_Stage2_Jawa.id = 3
        image3_Quiz2_Level1_Stage2_Jawa.name = "Sang_Aksara_Jawa"
        
        let image4_Quiz2_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level1_Stage2_Jawa.id = 4
        image4_Quiz2_Level1_Stage2_Jawa.name = "Ki_Aksara_Jawa"
        
        let quiz2_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level1_stage2_Jawa.id = 2
        quiz2_level1_stage2_Jawa.name = "Kuis 1"
        quiz2_level1_stage2_Jawa.type = "A"
        quiz2_level1_stage2_Jawa.isCorrect = false
        quiz2_level1_stage2_Jawa.question = "Ki"
        quiz2_level1_stage2_Jawa.choices = [choice1_Quiz2_Level1_Stage2_Jawa, choice2_Quiz2_Level1_Stage2_Jawa, choice3_Quiz2_Level1_Stage2_Jawa, choice4_Quiz2_Level1_Stage2_Jawa]
        quiz2_level1_stage2_Jawa.images = [image1_Quiz2_Level1_Stage2_Jawa, image2_Quiz2_Level1_Stage2_Jawa, image3_Quiz2_Level1_Stage2_Jawa, image4_Quiz2_Level1_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level1_Stage2_Jawa.id = 1
        choice1_Quiz3_Level1_Stage2_Jawa.name = "Sang"
        
        let choice2_Quiz3_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level1_Stage2_Jawa.id = 2
        choice2_Quiz3_Level1_Stage2_Jawa.name = "Kang"
        
        let choice3_Quiz3_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level1_Stage2_Jawa.id = 3
        choice3_Quiz3_Level1_Stage2_Jawa.name = "Ki"
        
        let choice4_Quiz3_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level1_Stage2_Jawa.id = 4
        choice4_Quiz3_Level1_Stage2_Jawa.name = "Si"
        
        //MARK: Image
        let image1_Quiz3_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level1_Stage2_Jawa.id = 1
        image1_Quiz3_Level1_Stage2_Jawa.name = "Sang_Aksara_Jawa"
        
        let image2_Quiz3_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level1_Stage2_Jawa.id = 2
        image2_Quiz3_Level1_Stage2_Jawa.name = "Kang_Aksara_Jawa"
        
        let image3_Quiz3_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level1_Stage2_Jawa.id = 3
        image3_Quiz3_Level1_Stage2_Jawa.name = "Ki_Aksara_Jawa"
        
        let image4_Quiz3_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level1_Stage2_Jawa.id = 4
        image4_Quiz3_Level1_Stage2_Jawa.name = "Si_Aksara_Jawa"
        
        let quiz3_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level1_stage2_Jawa.id = 3
        quiz3_level1_stage2_Jawa.name = "Kuis 2"
        quiz3_level1_stage2_Jawa.type = "B"
        quiz3_level1_stage2_Jawa.isCorrect = false
        quiz3_level1_stage2_Jawa.question = "Ki"
        quiz3_level1_stage2_Jawa.choices = [choice1_Quiz3_Level1_Stage2_Jawa, choice2_Quiz3_Level1_Stage2_Jawa, choice3_Quiz3_Level1_Stage2_Jawa, choice4_Quiz3_Level1_Stage2_Jawa]
        quiz3_level1_stage2_Jawa.images = [image1_Quiz3_Level1_Stage2_Jawa, image2_Quiz3_Level1_Stage2_Jawa, image3_Quiz3_Level1_Stage2_Jawa, image4_Quiz3_Level1_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level1_Stage2_Jawa.id = 1
        choice1_Quiz4_Level1_Stage2_Jawa.name = "Ki"
        
        let choice2_Quiz4_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level1_Stage2_Jawa.id = 2
        choice2_Quiz4_Level1_Stage2_Jawa.name = "Si"
        
        let choice3_Quiz4_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level1_Stage2_Jawa.id = 3
        choice3_Quiz4_Level1_Stage2_Jawa.name = "Kang"
        
        let choice4_Quiz4_Level1_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level1_Stage2_Jawa.id = 4
        choice4_Quiz4_Level1_Stage2_Jawa.name = "Sang"
        
        //MARK: Image
        let image1_Quiz4_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level1_Stage2_Jawa.id = 1
        image1_Quiz4_Level1_Stage2_Jawa.name = "Ki_Aksara_Jawa"
        
        let image2_Quiz4_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level1_Stage2_Jawa.id = 2
        image2_Quiz4_Level1_Stage2_Jawa.name = "Si_Aksara_Jawa"
        
        let image3_Quiz4_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level1_Stage2_Jawa.id = 3
        image3_Quiz4_Level1_Stage2_Jawa.name = "Kang_Aksara_Jawa"
        
        let image4_Quiz4_Level1_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level1_Stage2_Jawa.id = 4
        image4_Quiz4_Level1_Stage2_Jawa.name = "Sang_Aksara_Jawa"
        
        let quiz4_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level1_stage2_Jawa.id = 4
        quiz4_level1_stage2_Jawa.name = "Kuis 3"
        quiz4_level1_stage2_Jawa.type = "C"
        quiz4_level1_stage2_Jawa.isCorrect = false
        quiz4_level1_stage2_Jawa.question = "Ki"
        quiz4_level1_stage2_Jawa.choices = [choice1_Quiz4_Level1_Stage2_Jawa, choice2_Quiz4_Level1_Stage2_Jawa, choice3_Quiz4_Level1_Stage2_Jawa, choice4_Quiz4_Level1_Stage2_Jawa]
        quiz4_level1_stage2_Jawa.images = [image1_Quiz4_Level1_Stage2_Jawa, image2_Quiz4_Level1_Stage2_Jawa, image3_Quiz4_Level1_Stage2_Jawa, image4_Quiz4_Level1_Stage2_Jawa]
        
        let quiz5_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level1_stage2_Jawa.id = 5
        quiz5_level1_stage2_Jawa.name = "Kuis 4"
        quiz5_level1_stage2_Jawa.type = "D"
        quiz5_level1_stage2_Jawa.isCorrect = false
        quiz5_level1_stage2_Jawa.question = "Ki"
        quiz5_level1_stage2_Jawa.choices = []
        quiz5_level1_stage2_Jawa.images = []
        
        let quiz6_level1_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level1_stage2_Jawa.id = 6
        quiz6_level1_stage2_Jawa.name = "Kuis 5"
        quiz6_level1_stage2_Jawa.type = "E"
        quiz6_level1_stage2_Jawa.isCorrect = false
        quiz6_level1_stage2_Jawa.question = "Ki"
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
        
        //MARK: Choice
        let choice1_Quiz2_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level2_Stage2_Jawa.id = 1
        choice1_Quiz2_Level2_Stage2_Jawa.name = "Se"
        
        let choice2_Quiz2_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level2_Stage2_Jawa.id = 2
        choice2_Quiz2_Level2_Stage2_Jawa.name = "Du"
        
        let choice3_Quiz2_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level2_Stage2_Jawa.id = 3
        choice3_Quiz2_Level2_Stage2_Jawa.name = "Dar"
        
        let choice4_Quiz2_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level2_Stage2_Jawa.id = 4
        choice4_Quiz2_Level2_Stage2_Jawa.name = "Nu"
        
        //MARK: Image
        let image1_Quiz2_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level2_Stage2_Jawa.id = 1
        image1_Quiz2_Level2_Stage2_Jawa.name = "Se_Aksara_Jawa"
        
        let image2_Quiz2_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level2_Stage2_Jawa.id = 2
        image2_Quiz2_Level2_Stage2_Jawa.name = "Du_Aksara_Jawa"
        
        let image3_Quiz2_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level2_Stage2_Jawa.id = 3
        image3_Quiz2_Level2_Stage2_Jawa.name = "Dar_Aksara_Jawa"
        
        let image4_Quiz2_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level2_Stage2_Jawa.id = 4
        image4_Quiz2_Level2_Stage2_Jawa.name = "Nu_Aksara_Jawa"
        
        let quiz2_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level2_stage2_Jawa.id = 2
        quiz2_level2_stage2_Jawa.name = "Kuis 1"
        quiz2_level2_stage2_Jawa.type = "A"
        quiz2_level2_stage2_Jawa.isCorrect = false
        quiz2_level2_stage2_Jawa.question = "Du"
        quiz2_level2_stage2_Jawa.choices = [choice1_Quiz2_Level2_Stage2_Jawa, choice2_Quiz2_Level2_Stage2_Jawa, choice3_Quiz2_Level2_Stage2_Jawa, choice4_Quiz2_Level2_Stage2_Jawa]
        quiz2_level2_stage2_Jawa.images = [image1_Quiz2_Level2_Stage2_Jawa, image2_Quiz2_Level2_Stage2_Jawa, image3_Quiz2_Level2_Stage2_Jawa, image4_Quiz2_Level2_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level2_Stage2_Jawa.id = 1
        choice1_Quiz3_Level2_Stage2_Jawa.name = "Du"
        
        let choice2_Quiz3_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level2_Stage2_Jawa.id = 2
        choice2_Quiz3_Level2_Stage2_Jawa.name = "Dar"
        
        let choice3_Quiz3_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level2_Stage2_Jawa.id = 3
        choice3_Quiz3_Level2_Stage2_Jawa.name = "Nu"
        
        let choice4_Quiz3_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level2_Stage2_Jawa.id = 4
        choice4_Quiz3_Level2_Stage2_Jawa.name = "Se"
        
        //MARK: Image
        let image1_Quiz3_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level2_Stage2_Jawa.id = 1
        image1_Quiz3_Level2_Stage2_Jawa.name = "Du_Aksara_Jawa"
        
        let image2_Quiz3_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level2_Stage2_Jawa.id = 2
        image2_Quiz3_Level2_Stage2_Jawa.name = "Dar_Aksara_Jawa"
        
        let image3_Quiz3_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level2_Stage2_Jawa.id = 3
        image3_Quiz3_Level2_Stage2_Jawa.name = "Nu_Aksara_Jawa"
        
        let image4_Quiz3_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level2_Stage2_Jawa.id = 4
        image4_Quiz3_Level2_Stage2_Jawa.name = "Se_Aksara_Jawa"
        
        let quiz3_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level2_stage2_Jawa.id = 3
        quiz3_level2_stage2_Jawa.name = "Kuis 2"
        quiz3_level2_stage2_Jawa.type = "B"
        quiz3_level2_stage2_Jawa.isCorrect = false
        quiz3_level2_stage2_Jawa.question = "Du"
        quiz3_level2_stage2_Jawa.choices = [choice1_Quiz3_Level2_Stage2_Jawa, choice2_Quiz3_Level2_Stage2_Jawa, choice2_Quiz3_Level2_Stage2_Jawa, choice2_Quiz3_Level2_Stage2_Jawa]
        quiz3_level2_stage2_Jawa.images = [image1_Quiz3_Level2_Stage2_Jawa, image2_Quiz3_Level2_Stage2_Jawa, image3_Quiz3_Level2_Stage2_Jawa, image4_Quiz3_Level2_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level2_Stage2_Jawa.id = 1
        choice1_Quiz4_Level2_Stage2_Jawa.name = "Nu"
        
        let choice2_Quiz4_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level2_Stage2_Jawa.id = 2
        choice2_Quiz4_Level2_Stage2_Jawa.name = "Dar"
        
        let choice3_Quiz4_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level2_Stage2_Jawa.id = 3
        choice3_Quiz4_Level2_Stage2_Jawa.name = "Se"
        
        let choice4_Quiz4_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level2_Stage2_Jawa.id = 4
        choice4_Quiz4_Level2_Stage2_Jawa.name = "Du"
        
        //MARK: Image
        let image1_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level2_Stage2_Jawa.id = 1
        image1_Quiz4_Level2_Stage2_Jawa.name = "Nu_Aksara_Jawa"
        
        let image2_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level2_Stage2_Jawa.id = 2
        image2_Quiz4_Level2_Stage2_Jawa.name = "Dar_Aksara_Jawa"
        
        let image3_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level2_Stage2_Jawa.id = 3
        image3_Quiz4_Level2_Stage2_Jawa.name = "Se_Aksara_Jawa"
        
        let image4_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level2_Stage2_Jawa.id = 4
        image4_Quiz4_Level2_Stage2_Jawa.name = "Du_Aksara_Jawa"
        
        let quiz4_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level2_stage2_Jawa.id = 4
        quiz4_level2_stage2_Jawa.name = "Kuis 3"
        quiz4_level2_stage2_Jawa.type = "C"
        quiz4_level2_stage2_Jawa.isCorrect = false
        quiz4_level2_stage2_Jawa.question = "Du"
        quiz4_level2_stage2_Jawa.choices = [choice1_Quiz4_Level2_Stage2_Jawa, choice2_Quiz4_Level2_Stage2_Jawa, choice3_Quiz4_Level2_Stage2_Jawa, choice4_Quiz4_Level2_Stage2_Jawa]
        quiz4_level2_stage2_Jawa.images = [image1_Quiz4_Level2_Stage2_Jawa, image2_Quiz4_Level2_Stage2_Jawa, image3_Quiz4_Level2_Stage2_Jawa, image4_Quiz4_Level2_Stage2_Jawa]
        
        let quiz5_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level2_stage2_Jawa.id = 5
        quiz5_level2_stage2_Jawa.name = "Kuis 4"
        quiz5_level2_stage2_Jawa.type = "D"
        quiz5_level2_stage2_Jawa.isCorrect = false
        quiz5_level2_stage2_Jawa.question = "Du"
        quiz5_level2_stage2_Jawa.choices = []
        quiz5_level2_stage2_Jawa.images = []
        
        let quiz6_level2_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level2_stage2_Jawa.id = 6
        quiz6_level2_stage2_Jawa.name = "Kuis 5"
        quiz6_level2_stage2_Jawa.type = "E"
        quiz6_level2_stage2_Jawa.isCorrect = false
        quiz6_level2_stage2_Jawa.question = "Du"
        quiz6_level2_stage2_Jawa.choices = []
        quiz6_level2_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 3 Stage 2 Jawa
        let quiz1_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level3_stage2_Jawa.id = 1
        quiz1_level3_stage2_Jawa.name = "Panduan"
        quiz1_level3_stage2_Jawa.type = "Panduan"
        quiz1_level3_stage2_Jawa.isCorrect = false
        quiz1_level3_stage2_Jawa.question = "Le"
        quiz1_level3_stage2_Jawa.choices = []
        quiz1_level3_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level3_Stage2_Jawa.id = 1
        choice1_Quiz2_Level3_Stage2_Jawa.name = "Le"
        
        let choice2_Quiz2_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level3_Stage2_Jawa.id = 2
        choice2_Quiz2_Level3_Stage2_Jawa.name = "He"
        
        let choice3_Quiz2_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level3_Stage2_Jawa.id = 3
        choice3_Quiz2_Level3_Stage2_Jawa.name = "Lé"
        
        let choice4_Quiz2_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level3_Stage2_Jawa.id = 4
        choice4_Quiz2_Level3_Stage2_Jawa.name = "Yé"
        
        //MARK: Image
        let image1_Quiz2_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level3_Stage2_Jawa.id = 1
        image1_Quiz2_Level3_Stage2_Jawa.name = "Le_Aksara_Jawa"
        
        let image2_Quiz2_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level3_Stage2_Jawa.id = 2
        image2_Quiz2_Level3_Stage2_Jawa.name = "He_Aksara_Jawa"
        
        let image3_Quiz2_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level3_Stage2_Jawa.id = 3
        image3_Quiz2_Level3_Stage2_Jawa.name = "Lé_Aksara_Jawa"
        
        let image4_Quiz2_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level3_Stage2_Jawa.id = 4
        image4_Quiz2_Level3_Stage2_Jawa.name = "Yé_Aksara_Jawa"
        
        let quiz2_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level3_stage2_Jawa.id = 2
        quiz2_level3_stage2_Jawa.name = "Kuis 1"
        quiz2_level3_stage2_Jawa.type = "A"
        quiz2_level3_stage2_Jawa.isCorrect = false
        quiz2_level3_stage2_Jawa.question = "Le"
        quiz2_level3_stage2_Jawa.choices = [choice1_Quiz2_Level3_Stage2_Jawa, choice1_Quiz2_Level3_Stage2_Jawa, choice1_Quiz2_Level3_Stage2_Jawa, choice1_Quiz2_Level3_Stage2_Jawa]
        quiz2_level3_stage2_Jawa.images = [image1_Quiz2_Level3_Stage2_Jawa, image1_Quiz2_Level3_Stage2_Jawa, image1_Quiz2_Level3_Stage2_Jawa, image1_Quiz2_Level3_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level3_Stage2_Jawa.id = 1
        choice1_Quiz3_Level3_Stage2_Jawa.name = "Yé"
        
        let choice2_Quiz3_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level3_Stage2_Jawa.id = 2
        choice2_Quiz3_Level3_Stage2_Jawa.name = "Le"
        
        let choice3_Quiz3_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level3_Stage2_Jawa.id = 3
        choice3_Quiz3_Level3_Stage2_Jawa.name = "He"
        
        let choice4_Quiz3_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level3_Stage2_Jawa.id = 4
        choice4_Quiz3_Level3_Stage2_Jawa.name = "Lé"
        
        //MARK: Image
        let image1_Quiz3_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level3_Stage2_Jawa.id = 1
        image1_Quiz3_Level3_Stage2_Jawa.name = "Yé_Aksara_Jawa"
        
        let image2_Quiz3_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level3_Stage2_Jawa.id = 2
        image2_Quiz3_Level3_Stage2_Jawa.name = "Le_Aksara_Jawa"
        
        let image3_Quiz3_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level3_Stage2_Jawa.id = 3
        image3_Quiz3_Level3_Stage2_Jawa.name = "He_Aksara_Jawa"
        
        let image4_Quiz3_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level3_Stage2_Jawa.id = 4
        image4_Quiz3_Level3_Stage2_Jawa.name = "Lé_Aksara_Jawa"
        
        let quiz3_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage2_Jawa.id = 3
        quiz3_level3_stage2_Jawa.name = "Kuis 2"
        quiz3_level3_stage2_Jawa.type = "B"
        quiz3_level3_stage2_Jawa.isCorrect = false
        quiz3_level3_stage2_Jawa.question = "Le"
        quiz3_level3_stage2_Jawa.choices = [choice1_Quiz3_Level3_Stage2_Jawa, choice2_Quiz3_Level3_Stage2_Jawa, choice3_Quiz3_Level3_Stage2_Jawa, choice4_Quiz3_Level3_Stage2_Jawa]
        quiz3_level3_stage2_Jawa.images = [image1_Quiz3_Level3_Stage2_Jawa, image2_Quiz3_Level3_Stage2_Jawa, image3_Quiz3_Level3_Stage2_Jawa, image4_Quiz3_Level3_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level3_Stage2_Jawa.id = 1
        choice1_Quiz4_Level3_Stage2_Jawa.name = "Lé"
        
        let choice2_Quiz4_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level3_Stage2_Jawa.id = 2
        choice2_Quiz4_Level3_Stage2_Jawa.name = "He"
        
        let choice3_Quiz4_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level3_Stage2_Jawa.id = 3
        choice3_Quiz4_Level3_Stage2_Jawa.name = "Le"
        
        let choice4_Quiz4_Level3_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level3_Stage2_Jawa.id = 4
        choice4_Quiz4_Level3_Stage2_Jawa.name = "Yé"
        
        //MARK: Image
        let image1_Quiz4_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level3_Stage2_Jawa.id = 1
        image1_Quiz4_Level3_Stage2_Jawa.name = "Lé_Aksara_Jawa"
        
        let image2_Quiz4_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level3_Stage2_Jawa.id = 2
        image2_Quiz4_Level3_Stage2_Jawa.name = "He_Aksara_Jawa"
        
        let image3_Quiz4_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level3_Stage2_Jawa.id = 3
        image3_Quiz4_Level3_Stage2_Jawa.name = "Le_Aksara_Jawa"
        
        let image4_Quiz4_Level3_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level3_Stage2_Jawa.id = 4
        image4_Quiz4_Level3_Stage2_Jawa.name = "Yé_Aksara_Jawa"
        
        let quiz4_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level3_stage2_Jawa.id = 4
        quiz4_level3_stage2_Jawa.name = "Kuis 3"
        quiz4_level3_stage2_Jawa.type = "C"
        quiz4_level3_stage2_Jawa.isCorrect = false
        quiz4_level3_stage2_Jawa.question = "Le"
        quiz4_level3_stage2_Jawa.choices = [choice1_Quiz4_Level3_Stage2_Jawa, choice2_Quiz4_Level3_Stage2_Jawa, choice3_Quiz4_Level3_Stage2_Jawa, choice4_Quiz4_Level3_Stage2_Jawa]
        quiz4_level3_stage2_Jawa.images = [image1_Quiz4_Level3_Stage2_Jawa, image2_Quiz4_Level3_Stage2_Jawa, image3_Quiz4_Level3_Stage2_Jawa, image4_Quiz4_Level3_Stage2_Jawa]
        
        let quiz5_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level3_stage2_Jawa.id = 5
        quiz5_level3_stage2_Jawa.name = "Kuis 4"
        quiz5_level3_stage2_Jawa.type = "D"
        quiz5_level3_stage2_Jawa.isCorrect = false
        quiz5_level3_stage2_Jawa.question = "Le"
        quiz5_level3_stage2_Jawa.choices = []
        quiz5_level3_stage2_Jawa.images = []
        
        let quiz6_level3_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level3_stage2_Jawa.id = 6
        quiz6_level3_stage2_Jawa.name = "Kuis 5"
        quiz6_level3_stage2_Jawa.type = "E"
        quiz6_level3_stage2_Jawa.isCorrect = false
        quiz6_level3_stage2_Jawa.question = "Le"
        quiz6_level3_stage2_Jawa.choices = []
        quiz6_level3_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 4 Stage 2 Jawa
        let quiz1_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level4_stage2_Jawa.id = 1
        quiz1_level4_stage2_Jawa.name = "Panduan"
        quiz1_level4_stage2_Jawa.type = "Panduan"
        quiz1_level4_stage2_Jawa.isCorrect = false
        quiz1_level4_stage2_Jawa.question = "Tre"
        quiz1_level4_stage2_Jawa.choices = []
        quiz1_level4_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level4_Stage2_Jawa.id = 1
        choice1_Quiz2_Level4_Stage2_Jawa.name = "Tra"
        
        let choice2_Quiz2_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level4_Stage2_Jawa.id = 2
        choice2_Quiz2_Level4_Stage2_Jawa.name = "Har"
        
        let choice3_Quiz2_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level4_Stage2_Jawa.id = 3
        choice3_Quiz2_Level4_Stage2_Jawa.name = "Tre"
        
        let choice4_Quiz2_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level4_Stage2_Jawa.id = 4
        choice4_Quiz2_Level4_Stage2_Jawa.name = "Kra"
        
        //MARK: Image
        let image1_Quiz2_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level4_Stage2_Jawa.id = 1
        image1_Quiz2_Level4_Stage2_Jawa.name = "Tra_Aksara_Jawa"
        
        let image2_Quiz2_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level4_Stage2_Jawa.id = 2
        image2_Quiz2_Level4_Stage2_Jawa.name = "Har_Aksara_Jawa"
        
        let image3_Quiz2_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level4_Stage2_Jawa.id = 3
        image3_Quiz2_Level4_Stage2_Jawa.name = "Tre_Aksara_Jawa"
        
        let image4_Quiz2_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level4_Stage2_Jawa.id = 4
        image4_Quiz2_Level4_Stage2_Jawa.name = "Kra_Aksara_Jawa"
        
        let quiz2_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level4_stage2_Jawa.id = 2
        quiz2_level4_stage2_Jawa.name = "Kuis 1"
        quiz2_level4_stage2_Jawa.type = "A"
        quiz2_level4_stage2_Jawa.isCorrect = false
        quiz2_level4_stage2_Jawa.question = "Tre"
        quiz2_level4_stage2_Jawa.choices = [choice1_Quiz2_Level4_Stage2_Jawa, choice2_Quiz2_Level4_Stage2_Jawa, choice3_Quiz2_Level4_Stage2_Jawa, choice4_Quiz2_Level4_Stage2_Jawa]
        quiz2_level4_stage2_Jawa.images = [image1_Quiz2_Level4_Stage2_Jawa, image2_Quiz2_Level4_Stage2_Jawa, image3_Quiz2_Level4_Stage2_Jawa, image4_Quiz2_Level4_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level4_Stage2_Jawa.id = 1
        choice1_Quiz3_Level4_Stage2_Jawa.name = "Kra"
        
        let choice2_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level4_Stage2_Jawa.id = 2
        choice2_Quiz3_Level4_Stage2_Jawa.name = "Har"
        
        let choice3_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level4_Stage2_Jawa.id = 3
        choice3_Quiz3_Level4_Stage2_Jawa.name = "Tre"
        
        let choice4_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level4_Stage2_Jawa.id = 4
        choice4_Quiz3_Level4_Stage2_Jawa.name = "Tra"
        
        //MARK: Image
        let image1_Quiz3_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level4_Stage2_Jawa.id = 1
        image1_Quiz3_Level4_Stage2_Jawa.name = "Kra_Aksara_Jawa"
        
        let image2_Quiz3_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level4_Stage2_Jawa.id = 2
        image2_Quiz3_Level4_Stage2_Jawa.name = "Har_Aksara_Jawa"
        
        let image3_Quiz3_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level4_Stage2_Jawa.id = 3
        image3_Quiz3_Level4_Stage2_Jawa.name = "Tre_Aksara_Jawa"
        
        let image4_Quiz3_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level4_Stage2_Jawa.id = 4
        image4_Quiz3_Level4_Stage2_Jawa.name = "Tra_Aksara_Jawa"
        
        let quiz3_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level4_stage2_Jawa.id = 3
        quiz3_level4_stage2_Jawa.name = "Kuis 2"
        quiz3_level4_stage2_Jawa.type = "B"
        quiz3_level4_stage2_Jawa.isCorrect = false
        quiz3_level4_stage2_Jawa.question = "Tre"
        quiz3_level4_stage2_Jawa.choices = [choice1_Quiz3_Level4_Stage2_Jawa, choice2_Quiz3_Level4_Stage2_Jawa, choice3_Quiz3_Level4_Stage2_Jawa, choice4_Quiz3_Level4_Stage2_Jawa]
        quiz3_level4_stage2_Jawa.images = [image1_Quiz3_Level4_Stage2_Jawa, image2_Quiz3_Level4_Stage2_Jawa, image3_Quiz3_Level4_Stage2_Jawa, image4_Quiz3_Level4_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level4_Stage2_Jawa.id = 1
        choice1_Quiz4_Level4_Stage2_Jawa.name = "Tra"
        
        let choice2_Quiz4_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level4_Stage2_Jawa.id = 2
        choice2_Quiz4_Level4_Stage2_Jawa.name = "Tre"
        
        let choice3_Quiz4_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level4_Stage2_Jawa.id = 3
        choice3_Quiz4_Level4_Stage2_Jawa.name = "Kra"
        
        let choice4_Quiz4_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level4_Stage2_Jawa.id = 4
        choice4_Quiz4_Level4_Stage2_Jawa.name = "Har"
        
        //MARK: Image
        let image1_Quiz4_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level4_Stage2_Jawa.id = 1
        image1_Quiz4_Level4_Stage2_Jawa.name = "Tra_Aksara_Jawa"
        
        let image2_Quiz4_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level4_Stage2_Jawa.id = 2
        image2_Quiz4_Level4_Stage2_Jawa.name = "Tre_Aksara_Jawa"
        
        let image3_Quiz4_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level4_Stage2_Jawa.id = 3
        image3_Quiz4_Level4_Stage2_Jawa.name = "Kra_Aksara_Jawa"
        
        let image4_Quiz4_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level4_Stage2_Jawa.id = 4
        image4_Quiz4_Level4_Stage2_Jawa.name = "Har_Aksara_Jawa"
        
        let quiz4_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level4_stage2_Jawa.id = 4
        quiz4_level4_stage2_Jawa.name = "Kuis 3"
        quiz4_level4_stage2_Jawa.type = "C"
        quiz4_level4_stage2_Jawa.isCorrect = false
        quiz4_level4_stage2_Jawa.question = "Tre"
        quiz4_level4_stage2_Jawa.choices = [choice1_Quiz4_Level4_Stage2_Jawa, choice2_Quiz4_Level4_Stage2_Jawa, choice3_Quiz4_Level4_Stage2_Jawa, choice4_Quiz4_Level4_Stage2_Jawa]
        quiz4_level4_stage2_Jawa.images = [image1_Quiz4_Level4_Stage2_Jawa, image2_Quiz4_Level4_Stage2_Jawa, image3_Quiz4_Level4_Stage2_Jawa, image4_Quiz4_Level4_Stage2_Jawa]
        
        let quiz5_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level4_stage2_Jawa.id = 5
        quiz5_level4_stage2_Jawa.name = "Kuis 4"
        quiz5_level4_stage2_Jawa.type = "D"
        quiz5_level4_stage2_Jawa.isCorrect = false
        quiz5_level4_stage2_Jawa.question = "Tre"
        quiz5_level4_stage2_Jawa.choices = []
        quiz5_level4_stage2_Jawa.images = []
        
        let quiz6_level4_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level4_stage2_Jawa.id = 6
        quiz6_level4_stage2_Jawa.name = "Kuis 5"
        quiz6_level4_stage2_Jawa.type = "E"
        quiz6_level4_stage2_Jawa.isCorrect = false
        quiz6_level4_stage2_Jawa.question = "Tre"
        quiz6_level4_stage2_Jawa.choices = []
        quiz6_level4_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 5 Stage 2 Jawa
        let quiz1_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level5_stage2_Jawa.id = 1
        quiz1_level5_stage2_Jawa.name = "Panduan"
        quiz1_level5_stage2_Jawa.type = "Panduan"
        quiz1_level5_stage2_Jawa.isCorrect = false
        quiz1_level5_stage2_Jawa.question = "Wang"
        quiz1_level5_stage2_Jawa.choices = []
        quiz1_level5_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level5_Stage2_Jawa.id = 1
        choice1_Quiz2_Level5_Stage2_Jawa.name = "Cang"
        
        let choice2_Quiz2_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level5_Stage2_Jawa.id = 2
        choice2_Quiz2_Level5_Stage2_Jawa.name = "Wang"
        
        let choice3_Quiz2_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level5_Stage2_Jawa.id = 3
        choice3_Quiz2_Level5_Stage2_Jawa.name = "Dhang"
        
        let choice4_Quiz2_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level5_Stage2_Jawa.id = 4
        choice4_Quiz2_Level5_Stage2_Jawa.name = "Wi"
        
        //MARK: Image
        let image1_Quiz2_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level5_Stage2_Jawa.id = 1
        image1_Quiz2_Level5_Stage2_Jawa.name = "Cang_Aksara_Jawa"
        
        let image2_Quiz2_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level5_Stage2_Jawa.id = 2
        image2_Quiz2_Level5_Stage2_Jawa.name = "Wang_Aksara_Jawa"
        
        let image3_Quiz2_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level5_Stage2_Jawa.id = 3
        image3_Quiz2_Level5_Stage2_Jawa.name = "Dhang_Aksara_Jawa"
        
        let image4_Quiz2_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level5_Stage2_Jawa.id = 4
        image4_Quiz2_Level5_Stage2_Jawa.name = "Wi_Aksara_Jawa"
        
        let quiz2_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage2_Jawa.id = 2
        quiz2_level5_stage1_Jawa.name = "Kuis 1"
        quiz2_level5_stage1_Jawa.type = "A"
        quiz2_level5_stage1_Jawa.isCorrect = false
        quiz2_level5_stage1_Jawa.question = "Wang"
        quiz2_level5_stage1_Jawa.choices = [choice1_Quiz2_Level5_Stage2_Jawa, choice2_Quiz2_Level5_Stage2_Jawa, choice3_Quiz2_Level5_Stage2_Jawa, choice4_Quiz2_Level5_Stage2_Jawa]
        quiz2_level5_stage1_Jawa.images = [image1_Quiz2_Level5_Stage2_Jawa, image2_Quiz2_Level5_Stage2_Jawa, image3_Quiz2_Level5_Stage2_Jawa, image4_Quiz2_Level5_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level5_Stage2_Jawa.id = 1
        choice1_Quiz3_Level5_Stage2_Jawa.name = "Wi"
        
        let choice2_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level5_Stage2_Jawa.id = 2
        choice2_Quiz3_Level5_Stage2_Jawa.name = "Ya"
        
        let choice3_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level5_Stage2_Jawa.id = 3
        choice3_Quiz3_Level5_Stage2_Jawa.name = "Dhang"
        
        let choice4_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level5_Stage2_Jawa.id = 4
        choice4_Quiz3_Level5_Stage2_Jawa.name = "Wang"
        
        //MARK: Image
        let image1_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level5_Stage2_Jawa.id = 1
        image1_Quiz3_Level5_Stage2_Jawa.name = "Wi_Aksara_Jawa"
        
        let image2_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level5_Stage2_Jawa.id = 2
        image2_Quiz3_Level5_Stage2_Jawa.name = "Ya_Aksara_Jawa"
        
        let image3_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level5_Stage2_Jawa.id = 3
        image3_Quiz3_Level5_Stage2_Jawa.name = "Dhang_Aksara_Jawa"
        
        let image4_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level5_Stage2_Jawa.id = 4
        image4_Quiz3_Level5_Stage2_Jawa.name = "Wang_Aksara_Jawa"
        
        let quiz3_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level5_stage2_Jawa.id = 3
        quiz3_level5_stage2_Jawa.name = "Kuis 2"
        quiz3_level5_stage2_Jawa.type = "B"
        quiz3_level5_stage2_Jawa.isCorrect = false
        quiz3_level5_stage2_Jawa.question = "Wang"
        quiz3_level5_stage2_Jawa.choices = [choice1_Quiz3_Level5_Stage2_Jawa, choice2_Quiz3_Level5_Stage2_Jawa, choice3_Quiz3_Level5_Stage2_Jawa, choice4_Quiz3_Level5_Stage2_Jawa]
        quiz3_level5_stage2_Jawa.images = [image1_Quiz3_Level5_Stage2_Jawa, image2_Quiz3_Level5_Stage2_Jawa, image3_Quiz3_Level5_Stage2_Jawa, image4_Quiz3_Level5_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level5_Stage2_Jawa.id = 1
        choice1_Quiz4_Level5_Stage2_Jawa.name = "Cang"
        
        let choice2_Quiz4_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level5_Stage2_Jawa.id = 2
        choice2_Quiz4_Level5_Stage2_Jawa.name = "Dhang"
        
        let choice3_Quiz4_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level5_Stage2_Jawa.id = 3
        choice3_Quiz4_Level5_Stage2_Jawa.name = "Wang"
        
        let choice4_Quiz4_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level5_Stage2_Jawa.id = 4
        choice4_Quiz4_Level5_Stage2_Jawa.name = "Wi"
        
        //MARK: Image
        let image1_Quiz4_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level5_Stage2_Jawa.id = 1
        image1_Quiz4_Level5_Stage2_Jawa.name = "Cang_Aksara_Jawa"
        
        let image2_Quiz4_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level5_Stage2_Jawa.id = 2
        image2_Quiz4_Level5_Stage2_Jawa.name = "Dhang_Aksara_Jawa"
        
        let image3_Quiz4_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level5_Stage2_Jawa.id = 3
        image3_Quiz4_Level5_Stage2_Jawa.name = "Wang_Aksara_Jawa"
        
        let image4_Quiz4_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level5_Stage2_Jawa.id = 4
        image4_Quiz4_Level5_Stage2_Jawa.name = "Wi_Aksara_Jawa"
        
        let quiz4_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level5_stage2_Jawa.id = 4
        quiz4_level5_stage2_Jawa.name = "Kuis 3"
        quiz4_level5_stage2_Jawa.type = "C"
        quiz4_level5_stage2_Jawa.isCorrect = false
        quiz4_level5_stage2_Jawa.question = "Wang"
        quiz4_level5_stage2_Jawa.choices = [choice1_Quiz4_Level5_Stage2_Jawa, choice2_Quiz4_Level5_Stage2_Jawa, choice3_Quiz4_Level5_Stage2_Jawa, choice4_Quiz4_Level5_Stage2_Jawa]
        quiz4_level5_stage2_Jawa.images = [image1_Quiz4_Level5_Stage2_Jawa, image2_Quiz4_Level5_Stage2_Jawa, image3_Quiz4_Level5_Stage2_Jawa, image4_Quiz4_Level5_Stage2_Jawa]
        
        let quiz5_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level5_stage2_Jawa.id = 5
        quiz5_level5_stage2_Jawa.name = "Kuis 4"
        quiz5_level5_stage2_Jawa.type = "D"
        quiz5_level5_stage2_Jawa.isCorrect = false
        quiz5_level5_stage2_Jawa.question = "Wang"
        quiz5_level5_stage2_Jawa.choices = []
        quiz5_level5_stage2_Jawa.images = []
        
        let quiz6_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level5_stage2_Jawa.id = 6
        quiz6_level5_stage2_Jawa.name = "Kuis 5"
        quiz6_level5_stage2_Jawa.type = "E"
        quiz6_level5_stage2_Jawa.isCorrect = false
        quiz6_level5_stage2_Jawa.question = "Wang"
        quiz6_level5_stage2_Jawa.choices = []
        quiz6_level5_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 6 Stage 2 Jawa
        let quiz1_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level6_stage2_Jawa.id = 1
        quiz1_level6_stage2_Jawa.name = "Panduan"
        quiz1_level6_stage2_Jawa.type = "Panduan"
        quiz1_level6_stage2_Jawa.isCorrect = false
        quiz1_level6_stage2_Jawa.question = "Cra"
        quiz1_level6_stage2_Jawa.choices = []
        quiz1_level6_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level6_Stage2_Jawa.id = 1
        choice1_Quiz2_Level6_Stage2_Jawa.name = "Tra"
        
        let choice2_Quiz2_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level6_Stage2_Jawa.id = 2
        choice2_Quiz2_Level6_Stage2_Jawa.name = "Cre"
        
        let choice3_Quiz2_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level6_Stage2_Jawa.id = 3
        choice3_Quiz2_Level6_Stage2_Jawa.name = "Wra"
        
        let choice4_Quiz2_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level6_Stage2_Jawa.id = 4
        choice4_Quiz2_Level6_Stage2_Jawa.name = "Cra"
        
        //MARK: Image
        let image1_Quiz2_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level6_Stage2_Jawa.id = 1
        image1_Quiz2_Level6_Stage2_Jawa.name = "Tra_Aksara_Jawa"
        
        let image2_Quiz2_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level6_Stage2_Jawa.id = 2
        image2_Quiz2_Level6_Stage2_Jawa.name = "Cre_Aksara_Jawa"
        
        let image3_Quiz2_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level6_Stage2_Jawa.id = 3
        image3_Quiz2_Level6_Stage2_Jawa.name = "Wra_Aksara_Jawa"
        
        let image4_Quiz2_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level6_Stage2_Jawa.id = 4
        image4_Quiz2_Level6_Stage2_Jawa.name = "Cra_Aksara_Jawa"
        
        let quiz2_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level6_stage2_Jawa.id = 2
        quiz2_level6_stage2_Jawa.name = "Kuis 1"
        quiz2_level6_stage2_Jawa.type = "A"
        quiz2_level6_stage2_Jawa.isCorrect = false
        quiz2_level6_stage2_Jawa.question = "Cra"
        quiz2_level6_stage2_Jawa.choices = [choice1_Quiz2_Level6_Stage2_Jawa, choice2_Quiz2_Level6_Stage2_Jawa, choice3_Quiz2_Level6_Stage2_Jawa, choice4_Quiz2_Level6_Stage2_Jawa]
        quiz2_level6_stage2_Jawa.images = [image1_Quiz2_Level6_Stage2_Jawa, image2_Quiz2_Level6_Stage2_Jawa, image3_Quiz2_Level6_Stage2_Jawa, image4_Quiz2_Level6_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level6_Stage2_Jawa.id = 1
        choice1_Quiz3_Level6_Stage2_Jawa.name = "Cra"
        
        let choice2_Quiz3_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level6_Stage2_Jawa.id = 2
        choice2_Quiz3_Level6_Stage2_Jawa.name = "Tra"
        
        let choice3_Quiz3_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level6_Stage2_Jawa.id = 3
        choice3_Quiz3_Level6_Stage2_Jawa.name = "Cre"
        
        let choice4_Quiz3_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level6_Stage2_Jawa.id = 4
        choice4_Quiz3_Level6_Stage2_Jawa.name = "Wra"
        
        //MARK: Image
        let image1_Quiz3_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level6_Stage2_Jawa.id = 1
        image1_Quiz3_Level6_Stage2_Jawa.name = "Cra_Aksara_Jawa"
        
        let image2_Quiz3_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level6_Stage2_Jawa.id = 2
        image2_Quiz3_Level6_Stage2_Jawa.name = "Tra_Aksara_Jawa"
        
        let image3_Quiz3_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level6_Stage2_Jawa.id = 3
        image3_Quiz3_Level6_Stage2_Jawa.name = "Cre_Aksara_Jawa"
        
        let image4_Quiz3_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level6_Stage2_Jawa.id = 4
        image4_Quiz3_Level6_Stage2_Jawa.name = "Wra_Aksara_Jawa"
        
        let quiz3_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level6_stage2_Jawa.id = 3
        quiz3_level6_stage2_Jawa.name = "Kuis 2"
        quiz3_level6_stage2_Jawa.type = "B"
        quiz3_level6_stage2_Jawa.isCorrect = false
        quiz3_level6_stage2_Jawa.question = "Cra"
        quiz3_level6_stage2_Jawa.choices = [choice1_Quiz3_Level6_Stage2_Jawa, choice2_Quiz3_Level6_Stage2_Jawa, choice3_Quiz3_Level6_Stage2_Jawa, choice4_Quiz3_Level6_Stage2_Jawa]
        quiz3_level6_stage2_Jawa.images = [image1_Quiz3_Level6_Stage2_Jawa, image2_Quiz3_Level6_Stage2_Jawa, image3_Quiz3_Level6_Stage2_Jawa, image4_Quiz3_Level6_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level6_Stage2_Jawa.id = 1
        choice1_Quiz4_Level6_Stage2_Jawa.name = "Tra"
        
        let choice2_Quiz4_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level6_Stage2_Jawa.id = 2
        choice2_Quiz4_Level6_Stage2_Jawa.name = "Cre"
        
        let choice3_Quiz4_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level6_Stage2_Jawa.id = 3
        choice3_Quiz4_Level6_Stage2_Jawa.name = "Wra"
        
        let choice4_Quiz4_Level6_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level6_Stage2_Jawa.id = 4
        choice4_Quiz4_Level6_Stage2_Jawa.name = "Cra"
        
        //MARK: Image
        let image1_Quiz4_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level6_Stage2_Jawa.id = 1
        image1_Quiz4_Level6_Stage2_Jawa.name = "Tra_Aksara_Jawa"
        
        let image2_Quiz4_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level6_Stage2_Jawa.id = 2
        image2_Quiz4_Level6_Stage2_Jawa.name = "Cre_Aksara_Jawa"
        
        let image3_Quiz4_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level6_Stage2_Jawa.id = 3
        image3_Quiz4_Level6_Stage2_Jawa.name = "Wra_Aksara_Jawa"
        
        let image4_Quiz4_Level6_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level6_Stage2_Jawa.id = 4
        image4_Quiz4_Level6_Stage2_Jawa.name = "Cra_Aksara_Jawa"
        
        let quiz4_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level6_stage2_Jawa.id = 4
        quiz4_level6_stage2_Jawa.name = "Kuis 3"
        quiz4_level6_stage2_Jawa.type = "C"
        quiz4_level6_stage2_Jawa.isCorrect = false
        quiz4_level6_stage2_Jawa.question = "Cra"
        quiz4_level6_stage2_Jawa.choices = [choice1_Quiz4_Level6_Stage2_Jawa, choice2_Quiz4_Level6_Stage2_Jawa, choice3_Quiz4_Level6_Stage2_Jawa, choice4_Quiz4_Level6_Stage2_Jawa]
        quiz4_level6_stage2_Jawa.images = [image1_Quiz4_Level6_Stage2_Jawa, image2_Quiz4_Level6_Stage2_Jawa, image3_Quiz4_Level6_Stage2_Jawa, image4_Quiz4_Level6_Stage2_Jawa]
        
        let quiz5_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level6_stage2_Jawa.id = 5
        quiz5_level6_stage2_Jawa.name = "Kuis 4"
        quiz5_level6_stage2_Jawa.type = "D"
        quiz5_level6_stage2_Jawa.isCorrect = false
        quiz5_level6_stage2_Jawa.question = "Cra"
        quiz5_level6_stage2_Jawa.choices = []
        quiz5_level6_stage2_Jawa.images = []
        
        let quiz6_level6_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level6_stage2_Jawa.id = 6
        quiz6_level6_stage2_Jawa.name = "Kuis 5"
        quiz6_level6_stage2_Jawa.type = "E"
        quiz6_level6_stage2_Jawa.isCorrect = false
        quiz6_level6_stage2_Jawa.question = "Cra"
        quiz6_level6_stage2_Jawa.choices = []
        quiz6_level6_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 7 Stage 2 Jawa
        let quiz1_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level7_stage2_Jawa.id = 1
        quiz1_level7_stage2_Jawa.name = "Panduan"
        quiz1_level7_stage2_Jawa.type = "Panduan"
        quiz1_level7_stage2_Jawa.isCorrect = false
        quiz1_level7_stage2_Jawa.question = "Ran"
        quiz1_level7_stage2_Jawa.choices = []
        quiz1_level7_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level7_Stage2_Jawa.id = 1
        choice1_Quiz2_Level7_Stage2_Jawa.name = "Ran"
        
        let choice2_Quiz2_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level7_Stage2_Jawa.id = 2
        choice2_Quiz2_Level7_Stage2_Jawa.name = "Wan"
        
        let choice3_Quiz2_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level7_Stage2_Jawa.id = 3
        choice3_Quiz2_Level7_Stage2_Jawa.name = "Rad"
        
        let choice4_Quiz2_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level7_Stage2_Jawa.id = 4
        choice4_Quiz2_Level7_Stage2_Jawa.name = "Gas"
        
        //MARK: Image
        let image1_Quiz2_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level7_Stage2_Jawa.id = 1
        image1_Quiz2_Level7_Stage2_Jawa.name = "Ran_Aksara_Jawa"
        
        let image2_Quiz2_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level7_Stage2_Jawa.id = 2
        image2_Quiz2_Level7_Stage2_Jawa.name = "Wan_Aksara_Jawa"
        
        let image3_Quiz2_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level7_Stage2_Jawa.id = 3
        image3_Quiz2_Level7_Stage2_Jawa.name = "Rad_Aksara_Jawa"
        
        let image4_Quiz2_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level7_Stage2_Jawa.id = 4
        image4_Quiz2_Level7_Stage2_Jawa.name = "Gas_Aksara_Jawa"
        
        let quiz2_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level7_stage2_Jawa.id = 2
        quiz2_level7_stage2_Jawa.name = "Kuis 1"
        quiz2_level7_stage2_Jawa.type = "A"
        quiz2_level7_stage2_Jawa.isCorrect = false
        quiz2_level7_stage2_Jawa.question = "Ran"
        quiz2_level7_stage2_Jawa.choices = [choice1_Quiz2_Level7_Stage2_Jawa, choice2_Quiz2_Level7_Stage2_Jawa, choice3_Quiz2_Level7_Stage2_Jawa, choice4_Quiz2_Level7_Stage2_Jawa]
        quiz2_level7_stage2_Jawa.images = [image1_Quiz2_Level7_Stage2_Jawa, image2_Quiz2_Level7_Stage2_Jawa, image3_Quiz2_Level7_Stage2_Jawa, image4_Quiz2_Level7_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level7_Stage2_Jawa.id = 1
        choice1_Quiz3_Level7_Stage2_Jawa.name = "Wan"
        
        let choice2_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level7_Stage2_Jawa.id = 2
        choice2_Quiz3_Level7_Stage2_Jawa.name = "Ran"
        
        let choice3_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level7_Stage2_Jawa.id = 3
        choice3_Quiz3_Level7_Stage2_Jawa.name = "Rad"
        
        let choice4_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level7_Stage2_Jawa.id = 4
        choice4_Quiz3_Level7_Stage2_Jawa.name = "Gas"
        
        //MARK: Image
        let image1_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level7_Stage2_Jawa.id = 1
        image1_Quiz3_Level7_Stage2_Jawa.name = "Wan_Aksara_Jawa"
        
        let image2_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level7_Stage2_Jawa.id = 2
        image2_Quiz3_Level7_Stage2_Jawa.name = "Ran_Aksara_Jawa"
        
        let image3_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level7_Stage2_Jawa.id = 3
        image3_Quiz3_Level7_Stage2_Jawa.name = "Rad_Aksara_Jawa"
        
        let image4_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level7_Stage2_Jawa.id = 4
        image4_Quiz3_Level7_Stage2_Jawa.name = "Gas_Aksara_Jawa"
        
        let quiz3_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level7_stage2_Jawa.id = 3
        quiz3_level7_stage2_Jawa.name = "Kuis 2"
        quiz3_level7_stage2_Jawa.type = "B"
        quiz3_level7_stage2_Jawa.isCorrect = false
        quiz3_level7_stage2_Jawa.question = "Ran"
        quiz3_level7_stage2_Jawa.choices = [choice1_Quiz3_Level7_Stage2_Jawa, choice2_Quiz3_Level7_Stage2_Jawa, choice3_Quiz3_Level7_Stage2_Jawa, choice4_Quiz3_Level7_Stage2_Jawa]
        quiz3_level7_stage2_Jawa.images = [image1_Quiz3_Level7_Stage2_Jawa, image2_Quiz3_Level7_Stage2_Jawa, image3_Quiz3_Level7_Stage2_Jawa, image4_Quiz3_Level7_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level7_Stage2_Jawa.id = 1
        choice1_Quiz4_Level7_Stage2_Jawa.name = "Ran"
        
        let choice2_Quiz4_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level7_Stage2_Jawa.id = 2
        choice2_Quiz4_Level7_Stage2_Jawa.name = "Gas"
        
        let choice3_Quiz4_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level7_Stage2_Jawa.id = 3
        choice3_Quiz4_Level7_Stage2_Jawa.name = "Rad"
        
        let choice4_Quiz4_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level7_Stage2_Jawa.id = 4
        choice4_Quiz4_Level7_Stage2_Jawa.name = "Wan"
        
        //MARK: Image
        let image1_Quiz4_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level7_Stage2_Jawa.id = 1
        image1_Quiz4_Level7_Stage2_Jawa.name = "Ran_Aksara_Jawa"
        
        let image2_Quiz4_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level7_Stage2_Jawa.id = 2
        image2_Quiz4_Level7_Stage2_Jawa.name = "Gas_Aksara_Jawa"
        
        let image3_Quiz4_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level7_Stage2_Jawa.id = 3
        image3_Quiz4_Level7_Stage2_Jawa.name = "Rad_Aksara_Jawa"
        
        let image4_Quiz4_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level7_Stage2_Jawa.id = 4
        image4_Quiz4_Level7_Stage2_Jawa.name = "Wan_Aksara_Jawa"
        
        let quiz4_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level7_stage2_Jawa.id = 4
        quiz4_level7_stage2_Jawa.name = "Kuis 3"
        quiz4_level7_stage2_Jawa.type = "C"
        quiz4_level7_stage2_Jawa.isCorrect = false
        quiz4_level7_stage2_Jawa.question = "Ran"
        quiz4_level7_stage2_Jawa.choices = [choice1_Quiz4_Level7_Stage2_Jawa, choice2_Quiz4_Level7_Stage2_Jawa, choice3_Quiz4_Level7_Stage2_Jawa, choice4_Quiz4_Level7_Stage2_Jawa]
        quiz4_level7_stage2_Jawa.images = [image1_Quiz4_Level7_Stage2_Jawa, image2_Quiz4_Level7_Stage2_Jawa, image3_Quiz4_Level7_Stage2_Jawa, image4_Quiz4_Level7_Stage2_Jawa]
        
        let quiz5_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level7_stage2_Jawa.id = 5
        quiz5_level7_stage2_Jawa.name = "Kuis 4"
        quiz5_level7_stage2_Jawa.type = "D"
        quiz5_level7_stage2_Jawa.isCorrect = false
        quiz5_level7_stage2_Jawa.question = "Ran"
        quiz5_level7_stage2_Jawa.choices = []
        quiz5_level7_stage2_Jawa.images = []
        
        let quiz6_level7_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level7_stage2_Jawa.id = 6
        quiz6_level7_stage2_Jawa.name = "Kuis 5"
        quiz6_level7_stage2_Jawa.type = "E"
        quiz6_level7_stage2_Jawa.isCorrect = false
        quiz6_level7_stage2_Jawa.question = "Ran"
        quiz6_level7_stage2_Jawa.choices = []
        quiz6_level7_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 8 Stage 2 Jawa
        let quiz1_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level8_stage2_Jawa.id = 1
        quiz1_level8_stage2_Jawa.name = "Panduan"
        quiz1_level8_stage2_Jawa.type = "Panduan"
        quiz1_level8_stage2_Jawa.isCorrect = false
        quiz1_level8_stage2_Jawa.question = "Bé"
        quiz1_level8_stage2_Jawa.choices = []
        quiz1_level8_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level8_Stage2_Jawa.id = 1
        choice1_Quiz2_Level8_Stage2_Jawa.name = "Ngo"
        
        let choice2_Quiz2_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level8_Stage2_Jawa.id = 2
        choice2_Quiz2_Level8_Stage2_Jawa.name = "Bé"
        
        let choice3_Quiz2_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level8_Stage2_Jawa.id = 3
        choice3_Quiz2_Level8_Stage2_Jawa.name = "Nye"
        
        let choice4_Quiz2_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level8_Stage2_Jawa.id = 4
        choice4_Quiz2_Level8_Stage2_Jawa.name = "Be"
        
        //MARK: Image
        let image1_Quiz2_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level8_Stage2_Jawa.id = 1
        image1_Quiz2_Level8_Stage2_Jawa.name = "Ngo_Aksara_Jawa"
        
        let image2_Quiz2_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level8_Stage2_Jawa.id = 2
        image2_Quiz2_Level8_Stage2_Jawa.name = "Bé_Aksara_Jawa"
        
        let image3_Quiz2_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level8_Stage2_Jawa.id = 3
        image3_Quiz2_Level8_Stage2_Jawa.name = "Nye_Aksara_Jawa"
        
        let image4_Quiz2_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level8_Stage2_Jawa.id = 4
        image4_Quiz2_Level8_Stage2_Jawa.name = "Be_Aksara_Jawa"
        
        let quiz2_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level8_stage2_Jawa.id = 2
        quiz2_level8_stage2_Jawa.name = "Kuis 1"
        quiz2_level8_stage2_Jawa.type = "A"
        quiz2_level8_stage2_Jawa.isCorrect = false
        quiz2_level8_stage2_Jawa.question = "Bé"
        quiz2_level8_stage2_Jawa.choices = [choice1_Quiz2_Level8_Stage2_Jawa, choice2_Quiz2_Level8_Stage2_Jawa, choice3_Quiz2_Level8_Stage2_Jawa, choice4_Quiz2_Level8_Stage2_Jawa]
        quiz2_level8_stage2_Jawa.images = [image1_Quiz2_Level8_Stage2_Jawa, image2_Quiz2_Level8_Stage2_Jawa, image3_Quiz2_Level8_Stage2_Jawa, image4_Quiz2_Level8_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level8_Stage2_Jawa.id = 1
        choice1_Quiz3_Level8_Stage2_Jawa.name = "Be"
        
        let choice2_Quiz3_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level8_Stage2_Jawa.id = 2
        choice2_Quiz3_Level8_Stage2_Jawa.name = "Ngo"
        
        let choice3_Quiz3_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level8_Stage2_Jawa.id = 3
        choice3_Quiz3_Level8_Stage2_Jawa.name = "Bé"
        
        let choice4_Quiz3_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level8_Stage2_Jawa.id = 4
        choice4_Quiz3_Level8_Stage2_Jawa.name = "Nye"
        
        //MARK: Image
        let image1_Quiz3_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level8_Stage2_Jawa.id = 1
        image1_Quiz3_Level8_Stage2_Jawa.name = "Be_Aksara_Jawa"
        
        let image2_Quiz3_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level8_Stage2_Jawa.id = 2
        image2_Quiz3_Level8_Stage2_Jawa.name = "Ngo_Aksara_Jawa"
        
        let image3_Quiz3_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level8_Stage2_Jawa.id = 3
        image3_Quiz3_Level8_Stage2_Jawa.name = "Bé_Aksara_Jawa"
        
        let image4_Quiz3_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level8_Stage2_Jawa.id = 4
        image4_Quiz3_Level8_Stage2_Jawa.name = "Nye_Aksara_Jawa"
        
        let quiz3_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level8_stage2_Jawa.id = 3
        quiz3_level8_stage2_Jawa.name = "Kuis 2"
        quiz3_level8_stage2_Jawa.type = "B"
        quiz3_level8_stage2_Jawa.isCorrect = false
        quiz3_level8_stage2_Jawa.question = "Bé"
        quiz3_level8_stage2_Jawa.choices = [choice1_Quiz3_Level8_Stage2_Jawa, choice2_Quiz3_Level8_Stage2_Jawa, choice3_Quiz3_Level8_Stage2_Jawa, choice4_Quiz3_Level8_Stage2_Jawa]
        quiz3_level8_stage2_Jawa.images = [image1_Quiz3_Level8_Stage2_Jawa, image2_Quiz3_Level8_Stage2_Jawa, image3_Quiz3_Level8_Stage2_Jawa, image4_Quiz3_Level8_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level8_Stage2_Jawa.id = 1
        choice1_Quiz4_Level8_Stage2_Jawa.name = "Bé"
        
        let choice2_Quiz4_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level8_Stage2_Jawa.id = 2
        choice2_Quiz4_Level8_Stage2_Jawa.name = "Nye"
        
        let choice3_Quiz4_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level8_Stage2_Jawa.id = 3
        choice3_Quiz4_Level8_Stage2_Jawa.name = "Be"
        
        let choice4_Quiz4_Level8_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level8_Stage2_Jawa.id = 4
        choice4_Quiz4_Level8_Stage2_Jawa.name = "Ngo"
        
        //MARK: Image
        let image1_Quiz4_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level8_Stage2_Jawa.id = 1
        image1_Quiz4_Level8_Stage2_Jawa.name = "Bé_Aksara_Jawa"
        
        let image2_Quiz4_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level8_Stage2_Jawa.id = 2
        image2_Quiz4_Level8_Stage2_Jawa.name = "Nye_Aksara_Jawa"
        
        let image3_Quiz4_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level8_Stage2_Jawa.id = 3
        image3_Quiz4_Level8_Stage2_Jawa.name = "Be_Aksara_Jawa"
        
        let image4_Quiz4_Level8_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level8_Stage2_Jawa.id = 4
        image4_Quiz4_Level8_Stage2_Jawa.name = "Ngo_Aksara_Jawa"
        
        let quiz4_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level8_stage2_Jawa.id = 4
        quiz4_level8_stage2_Jawa.name = "Kuis 3"
        quiz4_level8_stage2_Jawa.type = "C"
        quiz4_level8_stage2_Jawa.isCorrect = false
        quiz4_level8_stage2_Jawa.question = "Bé"
        quiz4_level8_stage2_Jawa.choices = [choice1_Quiz4_Level8_Stage2_Jawa, choice2_Quiz4_Level8_Stage2_Jawa, choice3_Quiz4_Level8_Stage2_Jawa, choice4_Quiz4_Level8_Stage2_Jawa]
        quiz4_level8_stage2_Jawa.images = [image1_Quiz4_Level8_Stage2_Jawa, image2_Quiz4_Level8_Stage2_Jawa, image3_Quiz4_Level8_Stage2_Jawa, image4_Quiz4_Level8_Stage2_Jawa]
        
        let quiz5_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level8_stage2_Jawa.id = 5
        quiz5_level8_stage2_Jawa.name = "Kuis 4"
        quiz5_level8_stage2_Jawa.type = "D"
        quiz5_level8_stage2_Jawa.isCorrect = false
        quiz5_level8_stage2_Jawa.question = "Bé"
        quiz5_level8_stage2_Jawa.choices = []
        quiz5_level8_stage2_Jawa.images = []
        
        let quiz6_level8_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level8_stage2_Jawa.id = 6
        quiz6_level8_stage2_Jawa.name = "Kuis 5"
        quiz6_level8_stage2_Jawa.type = "E"
        quiz6_level8_stage2_Jawa.isCorrect = false
        quiz6_level8_stage2_Jawa.question = "Bé"
        quiz6_level8_stage2_Jawa.choices = []
        quiz6_level8_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 9 Stage 2 Jawa
        let quiz1_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level9_stage2_Jawa.id = 1
        quiz1_level9_stage2_Jawa.name = "Panduan"
        quiz1_level9_stage2_Jawa.type = "Panduan"
        quiz1_level9_stage2_Jawa.isCorrect = false
        quiz1_level9_stage2_Jawa.question = "Dhya"
        quiz1_level9_stage2_Jawa.choices = []
        quiz1_level9_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level9_Stage2_Jawa.id = 1
        choice1_Quiz2_Level9_Stage2_Jawa.name = "Wya"
        
        let choice2_Quiz2_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level9_Stage2_Jawa.id = 2
        choice2_Quiz2_Level9_Stage2_Jawa.name = "Dhah"
        
        let choice3_Quiz2_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level9_Stage2_Jawa.id = 3
        choice3_Quiz2_Level9_Stage2_Jawa.name = "Dhya"
        
        let choice4_Quiz2_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level9_Stage2_Jawa.id = 4
        choice4_Quiz2_Level9_Stage2_Jawa.name = "Wah"
        
        //MARK: Image
        let image1_Quiz2_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level9_Stage2_Jawa.id = 1
        image1_Quiz2_Level9_Stage2_Jawa.name = "Wya_Aksara_Jawa"
        
        let image2_Quiz2_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level9_Stage2_Jawa.id = 2
        image2_Quiz2_Level9_Stage2_Jawa.name = "Dhah_Aksara_Jawa"
        
        let image3_Quiz2_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level9_Stage2_Jawa.id = 3
        image3_Quiz2_Level9_Stage2_Jawa.name = "Dhya_Aksara_Jawa"
        
        let image4_Quiz2_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level9_Stage2_Jawa.id = 4
        image4_Quiz2_Level9_Stage2_Jawa.name = "Wah_Aksara_Jawa"
        
        let quiz2_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level9_stage2_Jawa.id = 2
        quiz2_level9_stage2_Jawa.name = "Kuis 1"
        quiz2_level9_stage2_Jawa.type = "A"
        quiz2_level9_stage2_Jawa.isCorrect = false
        quiz2_level9_stage2_Jawa.question = "Dhya"
        quiz2_level9_stage2_Jawa.choices = [choice1_Quiz2_Level9_Stage2_Jawa, choice2_Quiz2_Level9_Stage2_Jawa, choice3_Quiz2_Level9_Stage2_Jawa, choice4_Quiz2_Level9_Stage2_Jawa]
        quiz2_level9_stage2_Jawa.images = [image1_Quiz2_Level9_Stage2_Jawa, image2_Quiz2_Level9_Stage2_Jawa, image3_Quiz2_Level9_Stage2_Jawa, image4_Quiz2_Level9_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level9_Stage2_Jawa.id = 1
        choice1_Quiz3_Level9_Stage2_Jawa.name = "Dhya"
        
        let choice2_Quiz3_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level9_Stage2_Jawa.id = 2
        choice2_Quiz3_Level9_Stage2_Jawa.name = "_Dh"
        
        let choice3_Quiz3_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level9_Stage2_Jawa.id = 3
        choice3_Quiz3_Level9_Stage2_Jawa.name = "Wya"
        
        let choice4_Quiz3_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level9_Stage2_Jawa.id = 4
        choice4_Quiz3_Level9_Stage2_Jawa.name = "Dhah"
        
        //MARK: Image
        let image1_Quiz3_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level9_Stage2_Jawa.id = 1
        image1_Quiz3_Level9_Stage2_Jawa.name = "Dhya_Aksara_Jawa"
        
        let image2_Quiz3_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level9_Stage2_Jawa.id = 2
        image2_Quiz3_Level9_Stage2_Jawa.name = "_Dh_Aksara_Jawa"
        
        let image3_Quiz3_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level9_Stage2_Jawa.id = 3
        image3_Quiz3_Level9_Stage2_Jawa.name = "Wya_Aksara_Jawa"
        
        let image4_Quiz3_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level9_Stage2_Jawa.id = 4
        image4_Quiz3_Level9_Stage2_Jawa.name = "Dhah_Aksara_Jawa"
        
        let quiz3_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level9_stage2_Jawa.id = 3
        quiz3_level9_stage2_Jawa.name = "Kuis 2"
        quiz3_level9_stage2_Jawa.type = "B"
        quiz3_level9_stage2_Jawa.isCorrect = false
        quiz3_level9_stage2_Jawa.question = "Dhya"
        quiz3_level9_stage2_Jawa.choices = [choice1_Quiz3_Level9_Stage2_Jawa, choice2_Quiz3_Level9_Stage2_Jawa, choice3_Quiz3_Level9_Stage2_Jawa, choice4_Quiz3_Level9_Stage2_Jawa]
        quiz3_level9_stage2_Jawa.images = [image1_Quiz3_Level9_Stage2_Jawa, image2_Quiz3_Level9_Stage2_Jawa, image3_Quiz3_Level9_Stage2_Jawa, image4_Quiz3_Level9_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level9_Stage2_Jawa.id = 1
        choice1_Quiz4_Level9_Stage2_Jawa.name = "Dhah"
        
        let choice2_Quiz4_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level9_Stage2_Jawa.id = 2
        choice2_Quiz4_Level9_Stage2_Jawa.name = "Dhya"
        
        let choice3_Quiz4_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level9_Stage2_Jawa.id = 3
        choice3_Quiz4_Level9_Stage2_Jawa.name = "Wya"
        
        let choice4_Quiz4_Level9_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level9_Stage2_Jawa.id = 4
        choice4_Quiz4_Level9_Stage2_Jawa.name = "_Dh"
        
        //MARK: Image
        let image1_Quiz4_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level9_Stage2_Jawa.id = 1
        image1_Quiz4_Level9_Stage2_Jawa.name = "Dhah_Aksara_Jawa"
        
        let image2_Quiz4_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level9_Stage2_Jawa.id = 2
        image2_Quiz4_Level9_Stage2_Jawa.name = "Dhya_Aksara_Jawa"
        
        let image3_Quiz4_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level9_Stage2_Jawa.id = 3
        image3_Quiz4_Level9_Stage2_Jawa.name = "Wya_Aksara_Jawa"
        
        let image4_Quiz4_Level9_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level9_Stage2_Jawa.id = 4
        image4_Quiz4_Level9_Stage2_Jawa.name = "_Dh_Aksara_Jawa"
        
        let quiz4_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level9_stage2_Jawa.id = 4
        quiz4_level9_stage2_Jawa.name = "Kuis 3"
        quiz4_level9_stage2_Jawa.type = "C"
        quiz4_level9_stage2_Jawa.isCorrect = false
        quiz4_level9_stage2_Jawa.question = "Dhya"
        quiz4_level9_stage2_Jawa.choices = [choice1_Quiz4_Level9_Stage2_Jawa, choice2_Quiz4_Level9_Stage2_Jawa, choice3_Quiz4_Level9_Stage2_Jawa, choice4_Quiz4_Level9_Stage2_Jawa]
        quiz4_level9_stage2_Jawa.images = [image1_Quiz4_Level9_Stage2_Jawa, image2_Quiz4_Level9_Stage2_Jawa, image3_Quiz4_Level9_Stage2_Jawa, image4_Quiz4_Level9_Stage2_Jawa]
        
        let quiz5_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level9_stage2_Jawa.id = 5
        quiz5_level9_stage2_Jawa.name = "Kuis 4"
        quiz5_level9_stage2_Jawa.type = "D"
        quiz5_level9_stage2_Jawa.isCorrect = false
        quiz5_level9_stage2_Jawa.question = "Dhya"
        quiz5_level9_stage2_Jawa.choices = []
        quiz5_level9_stage2_Jawa.images = []
        
        let quiz6_level9_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level9_stage2_Jawa.id = 6
        quiz6_level9_stage2_Jawa.name = "Kuis 5"
        quiz6_level9_stage2_Jawa.type = "E"
        quiz6_level9_stage2_Jawa.isCorrect = false
        quiz6_level9_stage2_Jawa.question = "Dhya"
        quiz6_level9_stage2_Jawa.choices = []
        quiz6_level9_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 10 Stage 2 Jawa
        let quiz1_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level10_stage2_Jawa.id = 1
        quiz1_level10_stage2_Jawa.name = "Panduan"
        quiz1_level10_stage2_Jawa.type = "Panduan"
        quiz1_level10_stage2_Jawa.isCorrect = false
        quiz1_level10_stage2_Jawa.question = "Po"
        quiz1_level10_stage2_Jawa.choices = []
        quiz1_level10_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level10_Stage2_Jawa.id = 1
        choice1_Quiz2_Level10_Stage2_Jawa.name = "Yo"
        
        let choice2_Quiz2_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level10_Stage2_Jawa.id = 2
        choice2_Quiz2_Level10_Stage2_Jawa.name = "Gah"
        
        let choice3_Quiz2_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level10_Stage2_Jawa.id = 3
        choice3_Quiz2_Level10_Stage2_Jawa.name = "Pah"
        
        let choice4_Quiz2_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level10_Stage2_Jawa.id = 4
        choice4_Quiz2_Level10_Stage2_Jawa.name = "Po"
        
        //MARK: Image
        let image1_Quiz2_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level10_Stage2_Jawa.id = 1
        image1_Quiz2_Level10_Stage2_Jawa.name = "Yo_Aksara_Jawa"
        
        let image2_Quiz2_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level10_Stage2_Jawa.id = 2
        image2_Quiz2_Level10_Stage2_Jawa.name = "Gah_Aksara_Jawa"
        
        let image3_Quiz2_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level10_Stage2_Jawa.id = 3
        image3_Quiz2_Level10_Stage2_Jawa.name = "Pah_Aksara_Jawa"
        
        let image4_Quiz2_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level10_Stage2_Jawa.id = 4
        image4_Quiz2_Level10_Stage2_Jawa.name = "Po_Aksara_Jawa"
        
        let quiz2_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level10_stage2_Jawa.id = 2
        quiz2_level10_stage2_Jawa.name = "Kuis 1"
        quiz2_level10_stage2_Jawa.type = "A"
        quiz2_level10_stage2_Jawa.isCorrect = false
        quiz2_level10_stage2_Jawa.question = "Po"
        quiz2_level10_stage2_Jawa.choices = [choice1_Quiz2_Level10_Stage2_Jawa, choice2_Quiz2_Level10_Stage2_Jawa, choice3_Quiz2_Level10_Stage2_Jawa, choice4_Quiz2_Level10_Stage2_Jawa]
        quiz2_level10_stage2_Jawa.images = [image1_Quiz2_Level10_Stage2_Jawa, image2_Quiz2_Level10_Stage2_Jawa, image3_Quiz2_Level10_Stage2_Jawa, image4_Quiz2_Level10_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level10_Stage2_Jawa.id = 1
        choice1_Quiz3_Level10_Stage2_Jawa.name = "Pah"
        
        let choice2_Quiz3_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level10_Stage2_Jawa.id = 2
        choice2_Quiz3_Level10_Stage2_Jawa.name = "Yo"
        
        let choice3_Quiz3_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level10_Stage2_Jawa.id = 3
        choice3_Quiz3_Level10_Stage2_Jawa.name = "Gah"
        
        let choice4_Quiz3_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level10_Stage2_Jawa.id = 4
        choice4_Quiz3_Level10_Stage2_Jawa.name = "Po"
        
        //MARK: Image
        let image1_Quiz3_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level10_Stage2_Jawa.id = 1
        image1_Quiz3_Level10_Stage2_Jawa.name = "Pah_Aksara_Jawa"
        
        let image2_Quiz3_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level10_Stage2_Jawa.id = 2
        image2_Quiz3_Level10_Stage2_Jawa.name = "Yo_Aksara_Jawa"
        
        let image3_Quiz3_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level10_Stage2_Jawa.id = 3
        image3_Quiz3_Level10_Stage2_Jawa.name = "Gah_Aksara_Jawa"
        
        let image4_Quiz3_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level10_Stage2_Jawa.id = 4
        image4_Quiz3_Level10_Stage2_Jawa.name = "Po_Aksara_Jawa"
        
        let quiz3_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level10_stage2_Jawa.id = 3
        quiz3_level10_stage2_Jawa.name = "Kuis 2"
        quiz3_level10_stage2_Jawa.type = "B"
        quiz3_level10_stage2_Jawa.isCorrect = false
        quiz3_level10_stage2_Jawa.question = "Po"
        quiz3_level10_stage2_Jawa.choices = [choice1_Quiz3_Level10_Stage2_Jawa, choice2_Quiz3_Level10_Stage2_Jawa, choice3_Quiz3_Level10_Stage2_Jawa, choice4_Quiz3_Level10_Stage2_Jawa]
        quiz3_level10_stage2_Jawa.images = [image1_Quiz3_Level10_Stage2_Jawa, image2_Quiz3_Level10_Stage2_Jawa, image3_Quiz3_Level10_Stage2_Jawa, image4_Quiz3_Level10_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level10_Stage2_Jawa.id = 1
        choice1_Quiz4_Level10_Stage2_Jawa.name = "Pah"
        
        let choice2_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level10_Stage2_Jawa.id = 2
        choice2_Quiz4_Level10_Stage2_Jawa.name = "Gah"
        
        let choice3_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level10_Stage2_Jawa.id = 3
        choice3_Quiz4_Level10_Stage2_Jawa.name = "Po"
        
        let choice4_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level10_Stage2_Jawa.id = 4
        choice4_Quiz4_Level10_Stage2_Jawa.name = "Yo"
        
        //MARK: Image
        let image1_Quiz4_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level10_Stage2_Jawa.id = 1
        image1_Quiz4_Level10_Stage2_Jawa.name = "Pah_Aksara_Jawa"
        
        let image2_Quiz4_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level10_Stage2_Jawa.id = 2
        image2_Quiz4_Level10_Stage2_Jawa.name = "Gah_Aksara_Jawa"
        
        let image3_Quiz4_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level10_Stage2_Jawa.id = 3
        image3_Quiz4_Level10_Stage2_Jawa.name = "Po_Aksara_Jawa"
        
        let image4_Quiz4_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level10_Stage2_Jawa.id = 4
        image4_Quiz4_Level10_Stage2_Jawa.name = "Yo_Aksara_Jawa"
        
        let quiz4_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level10_stage2_Jawa.id = 4
        quiz4_level10_stage2_Jawa.name = "Kuis 3"
        quiz4_level10_stage2_Jawa.type = "C"
        quiz4_level10_stage2_Jawa.isCorrect = false
        quiz4_level10_stage2_Jawa.question = "Po"
        quiz4_level10_stage2_Jawa.choices = [choice1_Quiz4_Level10_Stage2_Jawa, choice2_Quiz4_Level10_Stage2_Jawa, choice3_Quiz4_Level10_Stage2_Jawa, choice4_Quiz4_Level10_Stage2_Jawa]
        quiz4_level10_stage2_Jawa.images = []
        
        let quiz5_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level10_stage2_Jawa.id = 5
        quiz5_level10_stage2_Jawa.name = "Kuis 4"
        quiz5_level10_stage2_Jawa.type = "D"
        quiz5_level10_stage2_Jawa.isCorrect = false
        quiz5_level10_stage2_Jawa.question = "Po"
        quiz5_level10_stage2_Jawa.choices = []
        quiz5_level10_stage2_Jawa.images = []
        
        let quiz6_level10_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level10_stage2_Jawa.id = 6
        quiz6_level10_stage2_Jawa.name = "Kuis 5"
        quiz6_level10_stage2_Jawa.type = "E"
        quiz6_level10_stage2_Jawa.isCorrect = false
        quiz6_level10_stage2_Jawa.question = "Po"
        quiz6_level10_stage2_Jawa.choices = []
        quiz6_level10_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 11 Stage 2 Jawa
        let quiz1_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level11_stage2_Jawa.id = 1
        quiz1_level11_stage2_Jawa.name = "Panduan"
        quiz1_level11_stage2_Jawa.type = "Panduan"
        quiz1_level11_stage2_Jawa.isCorrect = false
        quiz1_level11_stage2_Jawa.question = "Mar"
        quiz1_level11_stage2_Jawa.choices = []
        quiz1_level11_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level11_Stage2_Jawa.id = 1
        choice1_Quiz2_Level11_Stage2_Jawa.name = "Mar"
        
        let choice2_Quiz2_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level11_Stage2_Jawa.id = 2
        choice2_Quiz2_Level11_Stage2_Jawa.name = "Jah"
        
        let choice3_Quiz2_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level11_Stage2_Jawa.id = 3
        choice3_Quiz2_Level11_Stage2_Jawa.name = "Mah"
        
        let choice4_Quiz2_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level11_Stage2_Jawa.id = 4
        choice4_Quiz2_Level11_Stage2_Jawa.name = "Gar"
        
        //MARK: Image
        let image1_Quiz2_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level11_Stage2_Jawa.id = 1
        image1_Quiz2_Level11_Stage2_Jawa.name = "Mar_Aksara_Jawa"
        
        let image2_Quiz2_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level11_Stage2_Jawa.id = 2
        image2_Quiz2_Level11_Stage2_Jawa.name = "Jah_Aksara_Jawa"
        
        let image3_Quiz2_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level11_Stage2_Jawa.id = 3
        image3_Quiz2_Level11_Stage2_Jawa.name = "Mah_Aksara_Jawa"
        
        let image4_Quiz2_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level11_Stage2_Jawa.id = 4
        image4_Quiz2_Level11_Stage2_Jawa.name = "Gar_Aksara_Jawa"
        
        let quiz2_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level11_stage2_Jawa.id = 2
        quiz2_level11_stage2_Jawa.name = "Kuis 1"
        quiz2_level11_stage2_Jawa.type = "A"
        quiz2_level11_stage2_Jawa.isCorrect = false
        quiz2_level11_stage2_Jawa.question = "Mar"
        quiz2_level11_stage2_Jawa.choices = [choice1_Quiz2_Level11_Stage2_Jawa, choice2_Quiz2_Level11_Stage2_Jawa, choice3_Quiz2_Level11_Stage2_Jawa, choice4_Quiz2_Level11_Stage2_Jawa]
        quiz2_level11_stage2_Jawa.images = [image1_Quiz2_Level11_Stage2_Jawa, image2_Quiz2_Level11_Stage2_Jawa, image3_Quiz2_Level11_Stage2_Jawa, image4_Quiz2_Level11_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level11_Stage2_Jawa.id = 1
        choice1_Quiz3_Level11_Stage2_Jawa.name = "Gar"
        
        let choice2_Quiz3_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level11_Stage2_Jawa.id = 2
        choice2_Quiz3_Level11_Stage2_Jawa.name = "Mah"
        
        let choice3_Quiz3_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level11_Stage2_Jawa.id = 3
        choice3_Quiz3_Level11_Stage2_Jawa.name = "Jah"
        
        let choice4_Quiz3_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level11_Stage2_Jawa.id = 4
        choice4_Quiz3_Level11_Stage2_Jawa.name = "Mar"
        
        //MARK: Image
        let image1_Quiz3_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level11_Stage2_Jawa.id = 1
        image1_Quiz3_Level11_Stage2_Jawa.name = "Gar_Aksara_Jawa"
        
        let image2_Quiz3_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level11_Stage2_Jawa.id = 2
        image2_Quiz3_Level11_Stage2_Jawa.name = "Mah_Aksara_Jawa"
        
        let image3_Quiz3_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level11_Stage2_Jawa.id = 3
        image3_Quiz3_Level11_Stage2_Jawa.name = "Jah_Aksara_Jawa"
        
        let image4_Quiz3_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level11_Stage2_Jawa.id = 4
        image4_Quiz3_Level11_Stage2_Jawa.name = "Mar_Aksara_Jawa"
        
        let quiz3_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level11_stage2_Jawa.id = 3
        quiz3_level11_stage2_Jawa.name = "Kuis 2"
        quiz3_level11_stage2_Jawa.type = "B"
        quiz3_level11_stage2_Jawa.isCorrect = false
        quiz3_level11_stage2_Jawa.question = "Mar"
        quiz3_level11_stage2_Jawa.choices = [choice1_Quiz3_Level11_Stage2_Jawa, choice2_Quiz3_Level11_Stage2_Jawa, choice3_Quiz3_Level11_Stage2_Jawa, choice4_Quiz3_Level11_Stage2_Jawa]
        quiz3_level11_stage2_Jawa.images = [image1_Quiz3_Level11_Stage2_Jawa, image2_Quiz3_Level11_Stage2_Jawa, image3_Quiz3_Level11_Stage2_Jawa, image4_Quiz3_Level11_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level11_Stage2_Jawa.id = 1
        choice1_Quiz4_Level11_Stage2_Jawa.name = "Gar"
        
        let choice2_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level11_Stage2_Jawa.id = 2
        choice2_Quiz4_Level11_Stage2_Jawa.name = "Mar"
        
        let choice3_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level11_Stage2_Jawa.id = 3
        choice3_Quiz4_Level11_Stage2_Jawa.name = "Jah"
        
        let choice4_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level11_Stage2_Jawa.id = 4
        choice4_Quiz4_Level11_Stage2_Jawa.name = "Mah"
        
        //MARK: Image
        let image1_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level11_Stage2_Jawa.id = 1
        image1_Quiz4_Level11_Stage2_Jawa.name = "Gar_Aksara_Jawa"
        
        let image2_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level11_Stage2_Jawa.id = 2
        image2_Quiz4_Level11_Stage2_Jawa.name = "Mar_Aksara_Jawa"
        
        let image3_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level11_Stage2_Jawa.id = 3
        image3_Quiz4_Level11_Stage2_Jawa.name = "Jah_Aksara_Jawa"
        
        let image4_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level11_Stage2_Jawa.id = 4
        image4_Quiz4_Level11_Stage2_Jawa.name = "Mah"
        
        let quiz4_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level11_stage2_Jawa.id = 4
        quiz4_level11_stage2_Jawa.name = "Kuis 3"
        quiz4_level11_stage2_Jawa.type = "C"
        quiz4_level11_stage2_Jawa.isCorrect = false
        quiz4_level11_stage2_Jawa.question = "Mar"
        quiz4_level11_stage2_Jawa.choices = [choice1_Quiz4_Level11_Stage2_Jawa, choice2_Quiz4_Level11_Stage2_Jawa, choice3_Quiz4_Level11_Stage2_Jawa, choice4_Quiz4_Level11_Stage2_Jawa]
        quiz4_level11_stage2_Jawa.images = [image1_Quiz4_Level11_Stage2_Jawa, image2_Quiz4_Level11_Stage2_Jawa, image3_Quiz4_Level11_Stage2_Jawa, image4_Quiz4_Level11_Stage2_Jawa]
        
        let quiz5_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level11_stage2_Jawa.id = 5
        quiz5_level11_stage2_Jawa.name = "Kuis 4"
        quiz5_level11_stage2_Jawa.type = "D"
        quiz5_level11_stage2_Jawa.isCorrect = false
        quiz5_level11_stage2_Jawa.question = "Mar"
        quiz5_level11_stage2_Jawa.choices = []
        quiz5_level11_stage2_Jawa.images = []
        
        let quiz6_level11_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level11_stage2_Jawa.id = 6
        quiz6_level11_stage2_Jawa.name = "Kuis 5"
        quiz6_level11_stage2_Jawa.type = "E"
        quiz6_level11_stage2_Jawa.isCorrect = false
        quiz6_level11_stage2_Jawa.question = "Mar"
        quiz6_level11_stage2_Jawa.choices = []
        quiz6_level11_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 12 Stage 2 Jawa
        let quiz1_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level12_stage2_Jawa.id = 1
        quiz1_level12_stage2_Jawa.name = "Panduan"
        quiz1_level12_stage2_Jawa.type = "Panduan"
        quiz1_level12_stage2_Jawa.isCorrect = false
        quiz1_level12_stage2_Jawa.question = "Nyah"
        quiz1_level12_stage2_Jawa.choices = []
        quiz1_level12_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level12_Stage2_Jawa.id = 1
        choice1_Quiz2_Level12_Stage2_Jawa.name = "Bo"
        
        let choice2_Quiz2_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level12_Stage2_Jawa.id = 2
        choice2_Quiz2_Level12_Stage2_Jawa.name = "Nyah"
        
        let choice3_Quiz2_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level12_Stage2_Jawa.id = 3
        choice3_Quiz2_Level12_Stage2_Jawa.name = "Ngah"
        
        let choice4_Quiz2_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level12_Stage2_Jawa.id = 4
        choice4_Quiz2_Level12_Stage2_Jawa.name = "Nyo"
        
        //MARK: Image
        let image1_Quiz2_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level12_Stage2_Jawa.id = 1
        image1_Quiz2_Level12_Stage2_Jawa.name = "Bo_Aksara_Jawa"
        
        let image2_Quiz2_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level12_Stage2_Jawa.id = 2
        image2_Quiz2_Level12_Stage2_Jawa.name = "Nyah_Aksara_Jawa"
        
        let image3_Quiz2_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level12_Stage2_Jawa.id = 3
        image3_Quiz2_Level12_Stage2_Jawa.name = "Ngah_Aksara_Jawa"
        
        let image4_Quiz2_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level12_Stage2_Jawa.id = 4
        image4_Quiz2_Level12_Stage2_Jawa.name = "Nyo_Aksara_Jawa"
        
        let quiz2_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level12_stage2_Jawa.id = 2
        quiz2_level12_stage2_Jawa.name = "Kuis 1"
        quiz2_level12_stage2_Jawa.type = "A"
        quiz2_level12_stage2_Jawa.isCorrect = false
        quiz2_level12_stage2_Jawa.question = "Nyah"
        quiz2_level12_stage2_Jawa.choices = [choice1_Quiz2_Level12_Stage2_Jawa, choice2_Quiz2_Level12_Stage2_Jawa, choice3_Quiz2_Level12_Stage2_Jawa, choice4_Quiz2_Level12_Stage2_Jawa]
        quiz2_level12_stage2_Jawa.images = [image1_Quiz2_Level12_Stage2_Jawa, image2_Quiz2_Level12_Stage2_Jawa, image3_Quiz2_Level12_Stage2_Jawa, image4_Quiz2_Level12_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level12_Stage2_Jawa.id = 1
        choice1_Quiz3_Level12_Stage2_Jawa.name = "Nyo"
        
        let choice2_Quiz3_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level12_Stage2_Jawa.id = 2
        choice2_Quiz3_Level12_Stage2_Jawa.name = "Nyah"
        
        let choice3_Quiz3_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level12_Stage2_Jawa.id = 3
        choice3_Quiz3_Level12_Stage2_Jawa.name = "Bo"
        
        let choice4_Quiz3_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level12_Stage2_Jawa.id = 4
        choice4_Quiz3_Level12_Stage2_Jawa.name = "Ngah"
        
        //MARK: Image
        let image1_Quiz3_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level12_Stage2_Jawa.id = 1
        image1_Quiz3_Level12_Stage2_Jawa.name = "Nyo_Aksara_Jawa"
        
        let image2_Quiz3_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level12_Stage2_Jawa.id = 2
        image2_Quiz3_Level12_Stage2_Jawa.name = "Nyah_Aksara_Jawa"
        
        let image3_Quiz3_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level12_Stage2_Jawa.id = 3
        image3_Quiz3_Level12_Stage2_Jawa.name = "Bo_Aksara_Jawa"
        
        let image4_Quiz3_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level12_Stage2_Jawa.id = 4
        image4_Quiz3_Level12_Stage2_Jawa.name = "Ngah_Aksara_Jawa"
        
        let quiz3_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level12_stage2_Jawa.id = 3
        quiz3_level12_stage2_Jawa.name = "Kuis 2"
        quiz3_level12_stage2_Jawa.type = "B"
        quiz3_level12_stage2_Jawa.isCorrect = false
        quiz3_level12_stage2_Jawa.question = "Nyah"
        quiz3_level12_stage2_Jawa.choices = [choice1_Quiz3_Level12_Stage2_Jawa, choice2_Quiz3_Level12_Stage2_Jawa, choice3_Quiz3_Level12_Stage2_Jawa, choice4_Quiz3_Level12_Stage2_Jawa]
        quiz3_level12_stage2_Jawa.images = [image1_Quiz3_Level12_Stage2_Jawa, image2_Quiz3_Level12_Stage2_Jawa, image3_Quiz3_Level12_Stage2_Jawa, image4_Quiz3_Level12_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level12_Stage2_Jawa.id = 1
        choice1_Quiz4_Level12_Stage2_Jawa.name = "Bo"
        
        let choice2_Quiz4_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level12_Stage2_Jawa.id = 2
        choice2_Quiz4_Level12_Stage2_Jawa.name = "Ngah"
        
        let choice3_Quiz4_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level12_Stage2_Jawa.id = 3
        choice3_Quiz4_Level12_Stage2_Jawa.name = "Nyo"
        
        let choice4_Quiz4_Level12_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level12_Stage2_Jawa.id = 4
        choice4_Quiz4_Level12_Stage2_Jawa.name = "Nyah"
        
        //MARK: Image
        let image1_Quiz4_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level12_Stage2_Jawa.id = 1
        image1_Quiz4_Level12_Stage2_Jawa.name = "Bo_Aksara_Jawa"
        
        let image2_Quiz4_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level12_Stage2_Jawa.id = 2
        image2_Quiz4_Level12_Stage2_Jawa.name = "Ngah_Aksara_Jawa"
        
        let image3_Quiz4_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level12_Stage2_Jawa.id = 3
        image3_Quiz4_Level12_Stage2_Jawa.name = "Nyo_Aksara_Jawa"
        
        let image4_Quiz4_Level12_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level12_Stage2_Jawa.id = 4
        image4_Quiz4_Level12_Stage2_Jawa.name = "Nyah_Aksara_Jawa"
        
        let quiz4_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level12_stage2_Jawa.id = 4
        quiz4_level12_stage2_Jawa.name = "Kuis 3"
        quiz4_level12_stage2_Jawa.type = "C"
        quiz4_level12_stage2_Jawa.isCorrect = false
        quiz4_level12_stage2_Jawa.question = "Nyah"
        quiz4_level12_stage2_Jawa.choices = [choice1_Quiz4_Level12_Stage2_Jawa, choice2_Quiz4_Level12_Stage2_Jawa, choice3_Quiz4_Level12_Stage2_Jawa, choice4_Quiz4_Level12_Stage2_Jawa]
        quiz4_level12_stage2_Jawa.images = [image1_Quiz4_Level12_Stage2_Jawa, image2_Quiz4_Level12_Stage2_Jawa, image3_Quiz4_Level12_Stage2_Jawa, image4_Quiz4_Level12_Stage2_Jawa]
        
        let quiz5_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level12_stage2_Jawa.id = 5
        quiz5_level12_stage2_Jawa.name = "Kuis 4"
        quiz5_level12_stage2_Jawa.type = "D"
        quiz5_level12_stage2_Jawa.isCorrect = false
        quiz5_level12_stage2_Jawa.question = "Nyah"
        quiz5_level12_stage2_Jawa.choices = []
        quiz5_level12_stage2_Jawa.images = []
        
        let quiz6_level12_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level12_stage2_Jawa.id = 6
        quiz6_level12_stage2_Jawa.name = "Kuis 5"
        quiz6_level12_stage2_Jawa.type = "E"
        quiz6_level12_stage2_Jawa.isCorrect = false
        quiz6_level12_stage2_Jawa.question = "Nyah"
        quiz6_level12_stage2_Jawa.choices = []
        quiz6_level12_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 13 Stage 1 Jawa
        let quiz1_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level13_stage2_Jawa.id = 1
        quiz1_level13_stage2_Jawa.name = "Panduan"
        quiz1_level13_stage2_Jawa.type = "Panduan"
        quiz1_level13_stage2_Jawa.isCorrect = false
        quiz1_level13_stage2_Jawa.question = "Je"
        quiz1_level13_stage2_Jawa.choices = []
        quiz1_level13_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level13_Stage2_Jawa.id = 1
        choice1_Quiz2_Level13_Stage2_Jawa.name = "Me"
        
        let choice2_Quiz2_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level13_Stage2_Jawa.id = 2
        choice2_Quiz2_Level13_Stage2_Jawa.name = "Jé"
        
        let choice3_Quiz2_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level13_Stage2_Jawa.id = 3
        choice3_Quiz2_Level13_Stage2_Jawa.name = "Je"
        
        let choice4_Quiz2_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level13_Stage2_Jawa.id = 4
        choice4_Quiz2_Level13_Stage2_Jawa.name = "Dhé"
        
        //MARK: Image
        let image1_Quiz2_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level13_Stage2_Jawa.id = 1
        image1_Quiz2_Level13_Stage2_Jawa.name = "Me_Aksara_Jawa"
        
        let image2_Quiz2_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level13_Stage2_Jawa.id = 2
        image2_Quiz2_Level13_Stage2_Jawa.name = "Jé_Aksara_Jawa"
        
        let image3_Quiz2_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level13_Stage2_Jawa.id = 3
        image3_Quiz2_Level13_Stage2_Jawa.name = "Je_Aksara_Jawa"
        
        let image4_Quiz2_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level13_Stage2_Jawa.id = 4
        image4_Quiz2_Level13_Stage2_Jawa.name = "Dhé_Aksara_Jawa"
        
        let quiz2_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level13_stage2_Jawa.id = 2
        quiz2_level13_stage2_Jawa.name = "Kuis 1"
        quiz2_level13_stage2_Jawa.type = "A"
        quiz2_level13_stage2_Jawa.isCorrect = false
        quiz2_level13_stage2_Jawa.question = "Je"
        quiz2_level13_stage2_Jawa.choices = [choice1_Quiz2_Level13_Stage2_Jawa, choice2_Quiz2_Level13_Stage2_Jawa, choice3_Quiz2_Level13_Stage2_Jawa, choice4_Quiz2_Level13_Stage2_Jawa]
        quiz2_level13_stage2_Jawa.images = [image1_Quiz2_Level13_Stage2_Jawa, image2_Quiz2_Level13_Stage2_Jawa, image3_Quiz2_Level13_Stage2_Jawa, image4_Quiz2_Level13_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level13_Stage2_Jawa.id = 1
        choice1_Quiz3_Level13_Stage2_Jawa.name = "Je"
        
        let choice2_Quiz3_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level13_Stage2_Jawa.id = 2
        choice2_Quiz3_Level13_Stage2_Jawa.name = "Dhé"
        
        let choice3_Quiz3_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level13_Stage2_Jawa.id = 3
        choice3_Quiz3_Level13_Stage2_Jawa.name = "Jé"
        
        let choice4_Quiz3_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level13_Stage2_Jawa.id = 4
        choice4_Quiz3_Level13_Stage2_Jawa.name = "Me"
        
        //MARK: Image
        let image1_Quiz3_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level13_Stage2_Jawa.id = 1
        image1_Quiz3_Level13_Stage2_Jawa.name = "Je_Aksara_Jawa"
        
        let image2_Quiz3_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level13_Stage2_Jawa.id = 2
        image2_Quiz3_Level13_Stage2_Jawa.name = "Dhé_Aksara_Jawa"
        
        let image3_Quiz3_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level13_Stage2_Jawa.id = 3
        image3_Quiz3_Level13_Stage2_Jawa.name = "Jé_Aksara_Jawa"
        
        let image4_Quiz3_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level13_Stage2_Jawa.id = 4
        image4_Quiz3_Level13_Stage2_Jawa.name = "Me_Aksara_Jawa"
        
        let quiz3_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level13_stage2_Jawa.id = 3
        quiz3_level13_stage2_Jawa.name = "Kuis 2"
        quiz3_level13_stage2_Jawa.type = "B"
        quiz3_level13_stage2_Jawa.isCorrect = false
        quiz3_level13_stage2_Jawa.question = "Je"
        quiz3_level13_stage2_Jawa.choices = [choice1_Quiz3_Level13_Stage2_Jawa, choice2_Quiz3_Level13_Stage2_Jawa, choice3_Quiz3_Level13_Stage2_Jawa, choice4_Quiz3_Level13_Stage2_Jawa]
        quiz3_level13_stage2_Jawa.images = [image1_Quiz3_Level13_Stage2_Jawa, image2_Quiz3_Level13_Stage2_Jawa, image3_Quiz3_Level13_Stage2_Jawa, image4_Quiz3_Level13_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level13_Stage2_Jawa.id = 1
        choice1_Quiz4_Level13_Stage2_Jawa.name = "Jé"
        
        let choice2_Quiz4_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level13_Stage2_Jawa.id = 2
        choice2_Quiz4_Level13_Stage2_Jawa.name = "Me"
        
        let choice3_Quiz4_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level13_Stage2_Jawa.id = 3
        choice3_Quiz4_Level13_Stage2_Jawa.name = "Je"
        
        let choice4_Quiz4_Level13_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level13_Stage2_Jawa.id = 4
        choice4_Quiz4_Level13_Stage2_Jawa.name = "Dhé"
        
        //MARK: Image
        let image1_Quiz4_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level13_Stage2_Jawa.id = 1
        image1_Quiz4_Level13_Stage2_Jawa.name = "Jé_Aksara_Jawa"
        
        let image2_Quiz4_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level13_Stage2_Jawa.id = 2
        image2_Quiz4_Level13_Stage2_Jawa.name = "Me_Aksara_Jawa"
        
        let image3_Quiz4_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level13_Stage2_Jawa.id = 3
        image3_Quiz4_Level13_Stage2_Jawa.name = "Je_Aksara_Jawa"
        
        let image4_Quiz4_Level13_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level13_Stage2_Jawa.id = 4
        image4_Quiz4_Level13_Stage2_Jawa.name = "Dhé_Aksara_Jawa"
        
        let quiz4_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level13_stage2_Jawa.id = 4
        quiz4_level13_stage2_Jawa.name = "Kuis 3"
        quiz4_level13_stage2_Jawa.type = "C"
        quiz4_level13_stage2_Jawa.isCorrect = false
        quiz4_level13_stage2_Jawa.question = "Je"
        quiz4_level13_stage2_Jawa.choices = [choice1_Quiz4_Level13_Stage2_Jawa, choice2_Quiz4_Level13_Stage2_Jawa, choice3_Quiz4_Level13_Stage2_Jawa, choice4_Quiz4_Level13_Stage2_Jawa]
        quiz4_level13_stage2_Jawa.images = [image1_Quiz4_Level13_Stage2_Jawa , image2_Quiz4_Level13_Stage2_Jawa, image3_Quiz4_Level13_Stage2_Jawa, image4_Quiz4_Level13_Stage2_Jawa]
        
        let quiz5_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level13_stage2_Jawa.id = 5
        quiz5_level13_stage2_Jawa.name = "Kuis 4"
        quiz5_level13_stage2_Jawa.type = "D"
        quiz5_level13_stage2_Jawa.isCorrect = false
        quiz5_level13_stage2_Jawa.question = "Je"
        quiz5_level13_stage2_Jawa.choices = []
        quiz5_level13_stage2_Jawa.images = []
        
        let quiz6_level13_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level13_stage2_Jawa.id = 6
        quiz6_level13_stage2_Jawa.name = "Kuis 5"
        quiz6_level13_stage2_Jawa.type = "E"
        quiz6_level13_stage2_Jawa.isCorrect = false
        quiz6_level13_stage2_Jawa.question = "Je"
        quiz6_level13_stage2_Jawa.choices = []
        quiz6_level13_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 14 Stage 2 Jawa
        let quiz1_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level14_stage2_Jawa.id = 1
        quiz1_level14_stage2_Jawa.name = "Panduan"
        quiz1_level14_stage2_Jawa.type = "Panduan"
        quiz1_level14_stage2_Jawa.isCorrect = false
        quiz1_level14_stage2_Jawa.question = "Ngan"
        quiz1_level14_stage2_Jawa.choices = []
        quiz1_level14_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level14_Stage2_Jawa.id = 1
        choice1_Quiz2_Level14_Stage2_Jawa.name = "Thad"
        
        let choice2_Quiz2_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level14_Stage2_Jawa.id = 2
        choice2_Quiz2_Level14_Stage2_Jawa.name = "Nyan"
        
        let choice3_Quiz2_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level14_Stage2_Jawa.id = 3
        choice3_Quiz2_Level14_Stage2_Jawa.name = "Ngan"
        
        let choice4_Quiz2_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level14_Stage2_Jawa.id = 4
        choice4_Quiz2_Level14_Stage2_Jawa.name = "Ngad"
        
        //MARK: Image
        let image1_Quiz2_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level14_Stage2_Jawa.id = 1
        image1_Quiz2_Level14_Stage2_Jawa.name = "Thad_Aksara_Jawa"
        
        let image2_Quiz2_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level14_Stage2_Jawa.id = 2
        image2_Quiz2_Level14_Stage2_Jawa.name = "Nyan_Aksara_Jawa"
        
        let image3_Quiz2_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level14_Stage2_Jawa.id = 3
        image3_Quiz2_Level14_Stage2_Jawa.name = "Ngan_Aksara_Jawa"
        
        let image4_Quiz2_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level14_Stage2_Jawa.id = 4
        image4_Quiz2_Level14_Stage2_Jawa.name = "Ngad_Aksara_Jawa"
        
        let quiz2_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level14_stage2_Jawa.id = 2
        quiz2_level14_stage2_Jawa.name = "Kuis 1"
        quiz2_level14_stage2_Jawa.type = "A"
        quiz2_level14_stage2_Jawa.isCorrect = false
        quiz2_level14_stage2_Jawa.question = "Ngan"
        quiz2_level14_stage2_Jawa.choices = [choice1_Quiz2_Level14_Stage2_Jawa, choice2_Quiz2_Level14_Stage2_Jawa, choice3_Quiz2_Level14_Stage2_Jawa, choice4_Quiz2_Level14_Stage2_Jawa]
        quiz2_level14_stage2_Jawa.images = [image1_Quiz2_Level14_Stage2_Jawa, image2_Quiz2_Level14_Stage2_Jawa, image3_Quiz2_Level14_Stage2_Jawa, image4_Quiz2_Level14_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level14_Stage2_Jawa.id = 1
        choice1_Quiz3_Level14_Stage2_Jawa.name = "Ngad"
        
        let choice2_Quiz3_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level14_Stage2_Jawa.id = 2
        choice2_Quiz3_Level14_Stage2_Jawa.name = "Ngan"
        
        let choice3_Quiz3_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level14_Stage2_Jawa.id = 3
        choice3_Quiz3_Level14_Stage2_Jawa.name = "Thad"
        
        let choice4_Quiz3_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level14_Stage2_Jawa.id = 4
        choice4_Quiz3_Level14_Stage2_Jawa.name = "Nyan"
        
        //MARK: Image
        let image1_Quiz3_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level14_Stage2_Jawa.id = 1
        image1_Quiz3_Level14_Stage2_Jawa.name = "Ngad_Aksara_Jawa"
        
        let image2_Quiz3_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level14_Stage2_Jawa.id = 2
        image2_Quiz3_Level14_Stage2_Jawa.name = "Ngan_Aksara_Jawa"
        
        let image3_Quiz3_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level14_Stage2_Jawa.id = 3
        image3_Quiz3_Level14_Stage2_Jawa.name = "Thad_Aksara_Jawa"
        
        let image4_Quiz3_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level14_Stage2_Jawa.id = 4
        image4_Quiz3_Level14_Stage2_Jawa.name = "Nyan_Aksara_Jawa"
        
        let quiz3_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage2_Jawa.id = 3
        quiz3_level14_stage2_Jawa.name = "Kuis 2"
        quiz3_level14_stage2_Jawa.type = "B"
        quiz3_level14_stage2_Jawa.isCorrect = false
        quiz3_level14_stage2_Jawa.question = "Ngan"
        quiz3_level14_stage2_Jawa.choices = [choice1_Quiz3_Level14_Stage2_Jawa, choice2_Quiz3_Level14_Stage2_Jawa, choice3_Quiz3_Level14_Stage2_Jawa, choice4_Quiz3_Level14_Stage2_Jawa]
        quiz3_level14_stage2_Jawa.images = [image1_Quiz3_Level14_Stage2_Jawa, image2_Quiz3_Level14_Stage2_Jawa, image3_Quiz3_Level14_Stage2_Jawa, image4_Quiz3_Level14_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level14_Stage2_Jawa.id = 1
        choice1_Quiz4_Level14_Stage2_Jawa.name = "Ngan"
        
        let choice2_Quiz4_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level14_Stage2_Jawa.id = 2
        choice2_Quiz4_Level14_Stage2_Jawa.name = "Thad"
        
        let choice3_Quiz4_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level14_Stage2_Jawa.id = 3
        choice3_Quiz4_Level14_Stage2_Jawa.name = "Nyan"
        
        let choice4_Quiz4_Level14_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level14_Stage2_Jawa.id = 4
        choice4_Quiz4_Level14_Stage2_Jawa.name = "Ngad"
        
        //MARK: Image
        let image1_Quiz4_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level14_Stage2_Jawa.id = 1
        image1_Quiz4_Level14_Stage2_Jawa.name = "Ngan_Aksara_Jawa"
        
        let image2_Quiz4_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level14_Stage2_Jawa.id = 2
        image2_Quiz4_Level14_Stage2_Jawa.name = "Thad_Aksara_Jawa"
        
        let image3_Quiz4_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level14_Stage2_Jawa.id = 3
        image3_Quiz4_Level14_Stage2_Jawa.name = "Nyan_Aksara_Jawa"
        
        let image4_Quiz4_Level14_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level14_Stage2_Jawa.id = 4
        image4_Quiz4_Level14_Stage2_Jawa.name = "Ngad_Aksara_Jawa"
        
        let quiz4_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level14_stage2_Jawa.id = 4
        quiz4_level14_stage2_Jawa.name = "Kuis 3"
        quiz4_level14_stage2_Jawa.type = "C"
        quiz4_level14_stage2_Jawa.isCorrect = false
        quiz4_level14_stage2_Jawa.question = "Ngan"
        quiz4_level14_stage2_Jawa.choices = [choice1_Quiz4_Level14_Stage2_Jawa, choice2_Quiz4_Level14_Stage2_Jawa, choice3_Quiz4_Level14_Stage2_Jawa, choice4_Quiz4_Level14_Stage2_Jawa]
        quiz4_level14_stage2_Jawa.images = [image1_Quiz4_Level14_Stage2_Jawa, image2_Quiz4_Level14_Stage2_Jawa, image3_Quiz4_Level14_Stage2_Jawa, image4_Quiz4_Level14_Stage2_Jawa]
        
        let quiz5_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage2_Jawa.id = 5
        quiz5_level14_stage2_Jawa.name = "Kuis 4"
        quiz5_level14_stage2_Jawa.type = "D"
        quiz5_level14_stage2_Jawa.isCorrect = false
        quiz5_level14_stage2_Jawa.question = "Ngan"
        quiz5_level14_stage2_Jawa.choices = []
        quiz5_level14_stage2_Jawa.images = []
        
        let quiz6_level14_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage2_Jawa.id = 6
        quiz6_level14_stage2_Jawa.name = "Kuis 5"
        quiz6_level14_stage2_Jawa.type = "E"
        quiz6_level14_stage2_Jawa.isCorrect = false
        quiz6_level14_stage2_Jawa.question = "Ngan"
        quiz6_level14_stage2_Jawa.choices = []
        quiz6_level14_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 15 Stage 2 Jawa
        let quiz1_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level15_stage2_Jawa.id = 1
        quiz1_level15_stage2_Jawa.name = "Panduan"
        quiz1_level15_stage2_Jawa.type = "Panduan"
        quiz1_level15_stage2_Jawa.isCorrect = false
        quiz1_level15_stage2_Jawa.question = "Thre"
        quiz1_level15_stage2_Jawa.choices = []
        quiz1_level15_stage2_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level15_Stage2_Jawa.id = 1
        choice1_Quiz2_Level15_Stage2_Jawa.name = "Thre"
        
        let choice2_Quiz2_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level15_Stage2_Jawa.id = 2
        choice2_Quiz2_Level15_Stage2_Jawa.name = "Nyra"
        
        let choice3_Quiz2_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level15_Stage2_Jawa.id = 3
        choice3_Quiz2_Level15_Stage2_Jawa.name = "Thra"
        
        let choice4_Quiz2_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level15_Stage2_Jawa.id = 4
        choice4_Quiz2_Level15_Stage2_Jawa.name = "Ngre"
        
        //MARK: Image
        let image1_Quiz2_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level15_Stage2_Jawa.id = 1
        image1_Quiz2_Level15_Stage2_Jawa.name = "Thre_Aksara_Jawa"
        
        let image2_Quiz2_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level15_Stage2_Jawa.id = 2
        image2_Quiz2_Level15_Stage2_Jawa.name = "Nyra_Aksara_Jawa"
        
        let image3_Quiz2_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level15_Stage2_Jawa.id = 3
        image3_Quiz2_Level15_Stage2_Jawa.name = "Thra_Aksara_Jawa"
        
        let image4_Quiz2_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level15_Stage2_Jawa.id = 4
        image4_Quiz2_Level15_Stage2_Jawa.name = "Ngre_Aksara_Jawa"
        
        let quiz2_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level15_stage2_Jawa.id = 2
        quiz2_level15_stage2_Jawa.name = "Kuis 1"
        quiz2_level15_stage2_Jawa.type = "A"
        quiz2_level15_stage2_Jawa.isCorrect = false
        quiz2_level15_stage2_Jawa.question = "Thre"
        quiz2_level15_stage2_Jawa.choices = [choice1_Quiz2_Level15_Stage2_Jawa, choice2_Quiz2_Level15_Stage2_Jawa, choice3_Quiz2_Level15_Stage2_Jawa, choice4_Quiz2_Level15_Stage2_Jawa]
        quiz2_level15_stage2_Jawa.images = [image1_Quiz2_Level15_Stage2_Jawa, image2_Quiz2_Level15_Stage2_Jawa, image3_Quiz2_Level15_Stage2_Jawa, image4_Quiz2_Level15_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level15_Stage2_Jawa.id = 1
        choice1_Quiz3_Level15_Stage2_Jawa.name = "Thra"
        
        let choice2_Quiz3_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level15_Stage2_Jawa.id = 2
        choice2_Quiz3_Level15_Stage2_Jawa.name = "Ngre"
        
        let choice3_Quiz3_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level15_Stage2_Jawa.id = 3
        choice3_Quiz3_Level15_Stage2_Jawa.name = "Thre"
        
        let choice4_Quiz3_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level15_Stage2_Jawa.id = 4
        choice4_Quiz3_Level15_Stage2_Jawa.name = "Nyra"
        
        //MARK: Image
        let image1_Quiz3_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level15_Stage2_Jawa.id = 1
        image1_Quiz3_Level15_Stage2_Jawa.name = "Thra_Aksara_Jawa"
        
        let image2_Quiz3_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level15_Stage2_Jawa.id = 2
        image2_Quiz3_Level15_Stage2_Jawa.name = "Ngre_Aksara_Jawa"
        
        let image3_Quiz3_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level15_Stage2_Jawa.id = 3
        image3_Quiz3_Level15_Stage2_Jawa.name = "Thre_Aksara_Jawa"
        
        let image4_Quiz3_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level15_Stage2_Jawa.id = 4
        image4_Quiz3_Level15_Stage2_Jawa.name = "Nyra_Aksara_Jawa"
        
        let quiz3_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level15_stage2_Jawa.id = 3
        quiz3_level15_stage2_Jawa.name = "Kuis 2"
        quiz3_level15_stage2_Jawa.type = "B"
        quiz3_level15_stage2_Jawa.isCorrect = false
        quiz3_level15_stage2_Jawa.question = "Thre"
        quiz3_level15_stage2_Jawa.choices = [choice1_Quiz3_Level15_Stage2_Jawa, choice2_Quiz3_Level15_Stage2_Jawa, choice3_Quiz3_Level15_Stage2_Jawa, choice4_Quiz3_Level15_Stage2_Jawa]
        quiz3_level15_stage2_Jawa.images = [image1_Quiz3_Level15_Stage2_Jawa, image2_Quiz3_Level15_Stage2_Jawa, image3_Quiz3_Level15_Stage2_Jawa, image4_Quiz3_Level15_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level15_Stage2_Jawa.id = 1
        choice1_Quiz4_Level15_Stage2_Jawa.name = "Nyra"
        
        let choice2_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level15_Stage2_Jawa.id = 2
        choice2_Quiz4_Level15_Stage2_Jawa.name = "Ngre"
        
        let choice3_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level15_Stage2_Jawa.id = 3
        choice3_Quiz4_Level15_Stage2_Jawa.name = "Thra"
        
        let choice4_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level15_Stage2_Jawa.id = 4
        choice4_Quiz4_Level15_Stage2_Jawa.name = "Thre"
        
        //MARK: Image
        let image1_Quiz4_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level15_Stage2_Jawa.id = 1
        image1_Quiz4_Level15_Stage2_Jawa.name = "Nyra_Aksara_Jawa"
        
        let image2_Quiz4_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level15_Stage2_Jawa.id = 2
        image2_Quiz4_Level15_Stage2_Jawa.name = "Ngre_Aksara_Jawa"
        
        let image3_Quiz4_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level15_Stage2_Jawa.id = 3
        image3_Quiz4_Level15_Stage2_Jawa.name = "Thra_Aksara_Jawa"
        
        let image4_Quiz4_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level15_Stage2_Jawa.id = 4
        image4_Quiz4_Level15_Stage2_Jawa.name = "Thre_Aksara_Jawa"
        
        let quiz4_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level15_stage2_Jawa.id = 4
        quiz4_level15_stage2_Jawa.name = "Kuis 3"
        quiz4_level15_stage2_Jawa.type = "C"
        quiz4_level15_stage2_Jawa.isCorrect = false
        quiz4_level15_stage2_Jawa.question = "Thre"
        quiz4_level15_stage2_Jawa.choices = [choice1_Quiz4_Level15_Stage2_Jawa, choice2_Quiz4_Level15_Stage2_Jawa, choice3_Quiz4_Level15_Stage2_Jawa, choice4_Quiz4_Level15_Stage2_Jawa]
        quiz4_level15_stage2_Jawa.images = [image1_Quiz4_Level15_Stage2_Jawa, image2_Quiz4_Level15_Stage2_Jawa, image3_Quiz4_Level15_Stage2_Jawa, image4_Quiz4_Level15_Stage2_Jawa]
        
        let quiz5_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level15_stage2_Jawa.id = 5
        quiz5_level15_stage2_Jawa.name = "Kuis 4"
        quiz5_level15_stage2_Jawa.type = "D"
        quiz5_level15_stage2_Jawa.isCorrect = false
        quiz5_level15_stage2_Jawa.question = "Thre"
        quiz5_level15_stage2_Jawa.choices = []
        quiz5_level15_stage2_Jawa.images = []
        
        let quiz6_level15_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level15_stage2_Jawa.id = 6
        quiz6_level15_stage2_Jawa.name = "Kuis 5"
        quiz6_level15_stage2_Jawa.type = "E"
        quiz6_level15_stage2_Jawa.isCorrect = false
        quiz6_level15_stage2_Jawa.question = "Thre"
        quiz6_level15_stage2_Jawa.choices = []
        quiz6_level15_stage2_Jawa.images = []
        
        // MARK: Quiz for Level 1 Stage 3 Jawa
        let quiz1_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level1_stage3_Jawa.id = 1
        quiz1_level1_stage3_Jawa.name = "Panduan"
        quiz1_level1_stage3_Jawa.type = "Panduan"
        quiz1_level1_stage3_Jawa.isCorrect = false
        quiz1_level1_stage3_Jawa.question = "Lir"
        quiz1_level1_stage3_Jawa.choices = []
        quiz1_level1_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level1_Stage3_Jawa.id = 1
        choice1_Quiz2_Level1_Stage3_Jawa.name = "Hir"
        
        let choice2_Quiz2_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level1_Stage3_Jawa.id = 2
        choice2_Quiz2_Level1_Stage3_Jawa.name = "Yir"
        
        let choice3_Quiz2_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level1_Stage3_Jawa.id = 3
        choice3_Quiz2_Level1_Stage3_Jawa.name = "Lir"
        
        let choice4_Quiz2_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level1_Stage3_Jawa.id = 4
        choice4_Quiz2_Level1_Stage3_Jawa.name = "Lri"
        
        //MARK: Image
        let image1_Quiz2_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level1_Stage3_Jawa.id = 1
        image1_Quiz2_Level1_Stage3_Jawa.name = "Hir_Aksara_Jawa"
        
        let image2_Quiz2_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level1_Stage3_Jawa.id = 2
        image2_Quiz2_Level1_Stage3_Jawa.name = "Yir_Aksara_Jawa"
        
        let image3_Quiz2_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level1_Stage3_Jawa.id = 3
        image3_Quiz2_Level1_Stage3_Jawa.name = "Lir_Aksara_Jawa"
        
        let image4_Quiz2_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level1_Stage3_Jawa.id = 4
        image4_Quiz2_Level1_Stage3_Jawa.name = "Lri_Aksara_Jawa"
        
        let quiz2_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level1_stage3_Jawa.id = 2
        quiz2_level1_stage3_Jawa.name = "Kuis 1"
        quiz2_level1_stage3_Jawa.type = "A"
        quiz2_level1_stage3_Jawa.isCorrect = false
        quiz2_level1_stage3_Jawa.question = "Lir"
        quiz2_level1_stage3_Jawa.choices = [choice1_Quiz2_Level1_Stage3_Jawa, choice2_Quiz2_Level1_Stage3_Jawa, choice3_Quiz2_Level1_Stage3_Jawa, choice4_Quiz2_Level1_Stage3_Jawa]
        quiz2_level1_stage3_Jawa.images = [image1_Quiz2_Level1_Stage3_Jawa, image2_Quiz2_Level1_Stage3_Jawa, image3_Quiz2_Level1_Stage3_Jawa, image4_Quiz2_Level1_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level1_Stage3_Jawa.id = 1
        choice1_Quiz3_Level1_Stage3_Jawa.name = "Lir"
        
        let choice2_Quiz3_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level1_Stage3_Jawa.id = 2
        choice2_Quiz3_Level1_Stage3_Jawa.name = "Lri"
        
        let choice3_Quiz3_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level1_Stage3_Jawa.id = 3
        choice3_Quiz3_Level1_Stage3_Jawa.name = "Hir"
        
        let choice4_Quiz3_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level1_Stage3_Jawa.id = 4
        choice4_Quiz3_Level1_Stage3_Jawa.name = "Yir"
        
        //MARK: Image
        let image1_Quiz3_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level1_Stage3_Jawa.id = 1
        image1_Quiz3_Level1_Stage3_Jawa.name = "Lir_Aksara_Jawa"
        
        let image2_Quiz3_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level1_Stage3_Jawa.id = 2
        image2_Quiz3_Level1_Stage3_Jawa.name = "Lri_Aksara_Jawa"
        
        let image3_Quiz3_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level1_Stage3_Jawa.id = 3
        image3_Quiz3_Level1_Stage3_Jawa.name = "Hir_Aksara_Jawa"
        
        let image4_Quiz3_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level1_Stage3_Jawa.id = 4
        image4_Quiz3_Level1_Stage3_Jawa.name = "Yir_Aksara_Jawa"
        
        let quiz3_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level1_stage3_Jawa.id = 3
        quiz3_level1_stage3_Jawa.name = "Kuis 2"
        quiz3_level1_stage3_Jawa.type = "B"
        quiz3_level1_stage3_Jawa.isCorrect = false
        quiz3_level1_stage3_Jawa.question = "Lir"
        quiz3_level1_stage3_Jawa.choices = [choice1_Quiz3_Level1_Stage3_Jawa, choice2_Quiz3_Level1_Stage3_Jawa, choice3_Quiz3_Level1_Stage3_Jawa, choice4_Quiz3_Level1_Stage3_Jawa]
        quiz3_level1_stage3_Jawa.images = [image1_Quiz3_Level1_Stage3_Jawa, image2_Quiz3_Level1_Stage3_Jawa, image3_Quiz3_Level1_Stage3_Jawa, image4_Quiz3_Level1_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level1_Stage3_Jawa.id = 1
        choice1_Quiz4_Level1_Stage3_Jawa.name = "Lri"
        
        let choice2_Quiz4_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level1_Stage3_Jawa.id = 2
        choice2_Quiz4_Level1_Stage3_Jawa.name = "Yir"
        
        let choice3_Quiz4_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level1_Stage3_Jawa.id = 3
        choice3_Quiz4_Level1_Stage3_Jawa.name = "Lir"
        
        let choice4_Quiz4_Level1_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level1_Stage3_Jawa.id = 4
        choice4_Quiz4_Level1_Stage3_Jawa.name = "Hir"
        
        //MARK: Image
        let image1_Quiz4_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level1_Stage3_Jawa.id = 1
        image1_Quiz4_Level1_Stage3_Jawa.name = "Lri_Aksara_Jawa"
        
        let image2_Quiz4_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level1_Stage3_Jawa.id = 2
        image2_Quiz4_Level1_Stage3_Jawa.name = "Yir_Aksara_Jawa"
        
        let image3_Quiz4_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level1_Stage3_Jawa.id = 3
        image3_Quiz4_Level1_Stage3_Jawa.name = "Lir_Aksara_Jawa"
        
        let image4_Quiz4_Level1_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level1_Stage3_Jawa.id = 4
        image4_Quiz4_Level1_Stage3_Jawa.name = "Hir_Aksara_Jawa"
        
        let quiz4_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level1_stage3_Jawa.id = 4
        quiz4_level1_stage3_Jawa.name = "Kuis 3"
        quiz4_level1_stage3_Jawa.type = "C"
        quiz4_level1_stage3_Jawa.isCorrect = false
        quiz4_level1_stage3_Jawa.question = "Lir"
        quiz4_level1_stage3_Jawa.choices = [choice1_Quiz4_Level1_Stage3_Jawa, choice2_Quiz4_Level1_Stage3_Jawa, choice3_Quiz4_Level1_Stage3_Jawa, choice4_Quiz4_Level1_Stage3_Jawa]
        quiz4_level1_stage3_Jawa.images = [image1_Quiz4_Level1_Stage3_Jawa, image2_Quiz4_Level1_Stage3_Jawa, image3_Quiz4_Level1_Stage3_Jawa, image4_Quiz4_Level1_Stage3_Jawa]
        
        let quiz5_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level1_stage3_Jawa.id = 5
        quiz5_level1_stage3_Jawa.name = "Kuis 4"
        quiz5_level1_stage3_Jawa.type = "D"
        quiz5_level1_stage3_Jawa.isCorrect = false
        quiz5_level1_stage3_Jawa.question = "Lir"
        quiz5_level1_stage3_Jawa.choices = []
        quiz5_level1_stage3_Jawa.images = []
        
        let quiz6_level1_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level1_stage3_Jawa.id = 6
        quiz6_level1_stage3_Jawa.name = "Kuis 5"
        quiz6_level1_stage3_Jawa.type = "E"
        quiz6_level1_stage3_Jawa.isCorrect = false
        quiz6_level1_stage3_Jawa.question = "Lir"
        quiz6_level1_stage3_Jawa.choices = []
        quiz6_level1_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 2 Stage 3 Jawa
        let quiz1_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level2_stage3_Jawa.id = 1
        quiz1_level2_stage3_Jawa.name = "Panduan"
        quiz1_level2_stage3_Jawa.type = "Panduan"
        quiz1_level2_stage3_Jawa.isCorrect = false
        quiz1_level2_stage3_Jawa.question = "Kro"
        quiz1_level2_stage3_Jawa.choices = []
        quiz1_level2_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level2_Stage3_Jawa.id = 1
        choice1_Quiz2_Level2_Stage3_Jawa.name = "Srah"
        
        let choice2_Quiz2_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level2_Stage3_Jawa.id = 2
        choice2_Quiz2_Level2_Stage3_Jawa.name = "Kré"
        
        let choice3_Quiz2_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level2_Stage3_Jawa.id = 3
        choice3_Quiz2_Level2_Stage3_Jawa.name = "Tro"
        
        let choice4_Quiz2_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level2_Stage3_Jawa.id = 4
        choice4_Quiz2_Level2_Stage3_Jawa.name = "Kro"
        
        //MARK: Image
        let image1_Quiz2_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level2_Stage3_Jawa.id = 1
        image1_Quiz2_Level2_Stage3_Jawa.name = "Srah_Aksara_Jawa"
        
        let image2_Quiz2_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level2_Stage3_Jawa.id = 2
        image2_Quiz2_Level2_Stage3_Jawa.name = "Kré_Aksara_Jawa"
        
        let image3_Quiz2_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level2_Stage3_Jawa.id = 3
        image3_Quiz2_Level2_Stage3_Jawa.name = "Tro_Aksara_Jawa"
        
        let image4_Quiz2_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level2_Stage3_Jawa.id = 4
        image4_Quiz2_Level2_Stage3_Jawa.name = "Kro_Aksara_Jawa"
        
        let quiz2_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level2_stage3_Jawa.id = 2
        quiz2_level2_stage3_Jawa.name = "Kuis 1"
        quiz2_level2_stage3_Jawa.type = "A"
        quiz2_level2_stage3_Jawa.isCorrect = false
        quiz2_level2_stage3_Jawa.question = "Kro"
        quiz2_level2_stage3_Jawa.choices = [choice1_Quiz2_Level2_Stage3_Jawa, choice2_Quiz2_Level2_Stage3_Jawa, choice3_Quiz2_Level2_Stage3_Jawa, choice4_Quiz2_Level2_Stage3_Jawa]
        quiz2_level2_stage3_Jawa.images = [image1_Quiz2_Level2_Stage3_Jawa, image2_Quiz2_Level2_Stage3_Jawa, image3_Quiz2_Level2_Stage3_Jawa, image4_Quiz2_Level2_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level2_Stage3_Jawa.id = 1
        choice1_Quiz3_Level2_Stage3_Jawa.name = "Kré"
        
        let choice2_Quiz3_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level2_Stage3_Jawa.id = 2
        choice2_Quiz3_Level2_Stage3_Jawa.name = "Kro"
        
        let choice3_Quiz3_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level2_Stage3_Jawa.id = 3
        choice3_Quiz3_Level2_Stage3_Jawa.name = "Tro"
        
        let choice4_Quiz3_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level2_Stage3_Jawa.id = 4
        choice4_Quiz3_Level2_Stage3_Jawa.name = "Srah"
        
        //MARK: Image
        let image1_Quiz3_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level2_Stage3_Jawa.id = 1
        image1_Quiz3_Level2_Stage3_Jawa.name = "Kré_Aksara_Jawa"
        
        let image2_Quiz3_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level2_Stage3_Jawa.id = 2
        image2_Quiz3_Level2_Stage3_Jawa.name = "Kro_Aksara_Jawa"
        
        let image3_Quiz3_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level2_Stage3_Jawa.id = 3
        image3_Quiz3_Level2_Stage3_Jawa.name = "Tro_Aksara_Jawa"
        
        let image4_Quiz3_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level2_Stage3_Jawa.id = 4
        image4_Quiz3_Level2_Stage3_Jawa.name = "Srah_Aksara_Jawa"
        
        let quiz3_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level2_stage3_Jawa.id = 3
        quiz3_level2_stage3_Jawa.name = "Kuis 2"
        quiz3_level2_stage3_Jawa.type = "B"
        quiz3_level2_stage3_Jawa.isCorrect = false
        quiz3_level2_stage3_Jawa.question = "Kro"
        quiz3_level2_stage3_Jawa.choices = [choice1_Quiz3_Level2_Stage3_Jawa, choice2_Quiz3_Level2_Stage3_Jawa, choice3_Quiz3_Level2_Stage3_Jawa, choice4_Quiz3_Level2_Stage3_Jawa]
        quiz3_level2_stage3_Jawa.images = [image1_Quiz3_Level2_Stage3_Jawa, image2_Quiz3_Level2_Stage3_Jawa, image3_Quiz3_Level2_Stage3_Jawa, image4_Quiz3_Level2_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level2_Stage3_Jawa.id = 1
        choice1_Quiz4_Level2_Stage3_Jawa.name = "Kro"
        
        let choice2_Quiz4_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level2_Stage3_Jawa.id = 2
        choice2_Quiz4_Level2_Stage3_Jawa.name = "Srah"
        
        let choice3_Quiz4_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level2_Stage3_Jawa.id = 3
        choice3_Quiz4_Level2_Stage3_Jawa.name = "Tro"
        
        let choice4_Quiz4_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level2_Stage3_Jawa.id = 4
        choice4_Quiz4_Level2_Stage3_Jawa.name = "Kré"
        
        //MARK: Image
        let image1_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level2_Stage3_Jawa.id = 1
        image1_Quiz4_Level2_Stage3_Jawa.name = "Kro_Aksara_Jawa"
        
        let image2_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level2_Stage3_Jawa.id = 2
        image2_Quiz4_Level2_Stage3_Jawa.name = "Srah_Aksara_Jawa"
        
        let image3_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level2_Stage3_Jawa.id = 3
        image3_Quiz4_Level2_Stage3_Jawa.name = "Tro_Aksara_Jawa"
        
        let image4_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level2_Stage3_Jawa.id = 4
        image4_Quiz4_Level2_Stage3_Jawa.name = "Kré_Aksara_Jawa"
        
        let quiz4_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level2_stage3_Jawa.id = 4
        quiz4_level2_stage3_Jawa.name = "Kuis 3"
        quiz4_level2_stage3_Jawa.type = "C"
        quiz4_level2_stage3_Jawa.isCorrect = false
        quiz4_level2_stage3_Jawa.question = "Kro"
        quiz4_level2_stage3_Jawa.choices = [choice1_Quiz4_Level2_Stage3_Jawa, choice2_Quiz4_Level2_Stage3_Jawa, choice3_Quiz4_Level2_Stage3_Jawa, choice4_Quiz4_Level2_Stage3_Jawa]
        quiz4_level2_stage3_Jawa.images = [image1_Quiz4_Level2_Stage3_Jawa, image2_Quiz4_Level2_Stage3_Jawa, image3_Quiz4_Level2_Stage3_Jawa, image4_Quiz4_Level2_Stage3_Jawa]
        
        let quiz5_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level2_stage3_Jawa.id = 5
        quiz5_level2_stage3_Jawa.name = "Kuis 4"
        quiz5_level2_stage3_Jawa.type = "D"
        quiz5_level2_stage3_Jawa.isCorrect = false
        quiz5_level2_stage3_Jawa.question = "Kro"
        quiz5_level2_stage3_Jawa.choices = []
        quiz5_level2_stage3_Jawa.images = []
        
        let quiz6_level2_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level2_stage3_Jawa.id = 6
        quiz6_level2_stage3_Jawa.name = "Kuis 5"
        quiz6_level2_stage3_Jawa.type = "E"
        quiz6_level2_stage3_Jawa.isCorrect = false
        quiz6_level2_stage3_Jawa.question = "Kro"
        quiz6_level2_stage3_Jawa.choices = []
        quiz6_level2_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 3 Stage 2 Jawa
        let quiz1_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level3_stage3_Jawa.id = 1
        quiz1_level3_stage3_Jawa.name = "Panduan"
        quiz1_level3_stage3_Jawa.type = "Panduan"
        quiz1_level3_stage3_Jawa.isCorrect = false
        quiz1_level3_stage3_Jawa.question = "Hyang"
        quiz1_level3_stage3_Jawa.choices = []
        quiz1_level3_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level3_Stage3_Jawa.id = 1
        choice1_Quiz2_Level3_Stage3_Jawa.name = "Lyi"
        
        let choice2_Quiz2_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level3_Stage3_Jawa.id = 2
        choice2_Quiz2_Level3_Stage3_Jawa.name = "Hyang"
        
        let choice3_Quiz2_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level3_Stage3_Jawa.id = 3
        choice3_Quiz2_Level3_Stage3_Jawa.name = "Lyang"
        
        let choice4_Quiz2_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level3_Stage3_Jawa.id = 4
        choice4_Quiz2_Level3_Stage3_Jawa.name = "Hyi"
        
        //MARK: Image
        let image1_Quiz2_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level3_Stage3_Jawa.id = 1
        image1_Quiz2_Level3_Stage3_Jawa.name = "Lyi_Aksara_Jawa"
        
        let image2_Quiz2_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level3_Stage3_Jawa.id = 2
        image2_Quiz2_Level3_Stage3_Jawa.name = "Hyang_Aksara_Jawa"
        
        let image3_Quiz2_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level3_Stage3_Jawa.id = 3
        image3_Quiz2_Level3_Stage3_Jawa.name = "Lyang_Aksara_Jawa"
        
        let image4_Quiz2_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level3_Stage3_Jawa.id = 4
        image4_Quiz2_Level3_Stage3_Jawa.name = "Hyi_Aksara_Jawa"
        
        let quiz2_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level3_stage3_Jawa.id = 2
        quiz2_level3_stage3_Jawa.name = "Kuis 1"
        quiz2_level3_stage3_Jawa.type = "A"
        quiz2_level3_stage3_Jawa.isCorrect = false
        quiz2_level3_stage3_Jawa.question = "Hyang"
        quiz2_level3_stage3_Jawa.choices = [choice1_Quiz2_Level3_Stage3_Jawa, choice2_Quiz2_Level3_Stage3_Jawa, choice3_Quiz2_Level3_Stage3_Jawa, choice4_Quiz2_Level3_Stage3_Jawa]
        quiz2_level3_stage3_Jawa.images = [image1_Quiz2_Level3_Stage3_Jawa, image2_Quiz2_Level3_Stage3_Jawa, image3_Quiz2_Level3_Stage3_Jawa, image4_Quiz2_Level3_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level3_Stage3_Jawa.id = 1
        choice1_Quiz3_Level3_Stage3_Jawa.name = "Lyang"
        
        let choice2_Quiz3_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level3_Stage3_Jawa.id = 2
        choice2_Quiz3_Level3_Stage3_Jawa.name = "Hyang"
        
        let choice3_Quiz3_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level3_Stage3_Jawa.id = 3
        choice3_Quiz3_Level3_Stage3_Jawa.name = "Hyi"
        
        let choice4_Quiz3_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level3_Stage3_Jawa.id = 4
        choice4_Quiz3_Level3_Stage3_Jawa.name = "Lyi"
        
        //MARK: Image
        let image1_Quiz3_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level3_Stage3_Jawa.id = 1
        image1_Quiz3_Level3_Stage3_Jawa.name = "Lyang_Aksara_Jawa"
        
        let image2_Quiz3_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level3_Stage3_Jawa.id = 2
        image2_Quiz3_Level3_Stage3_Jawa.name = "Hyang_Aksara_Jawa"
        
        let image3_Quiz3_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level3_Stage3_Jawa.id = 3
        image3_Quiz3_Level3_Stage3_Jawa.name = "Hyi_Aksara_Jawa"
        
        let image4_Quiz3_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level3_Stage3_Jawa.id = 4
        image4_Quiz3_Level3_Stage3_Jawa.name = "Lyi_Aksara_Jawa"
        
        let quiz3_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage3_Jawa.id = 3
        quiz3_level3_stage3_Jawa.name = "Kuis 2"
        quiz3_level3_stage3_Jawa.type = "B"
        quiz3_level3_stage3_Jawa.isCorrect = false
        quiz3_level3_stage3_Jawa.question = "Hyang"
        quiz3_level3_stage3_Jawa.choices = [choice1_Quiz3_Level3_Stage3_Jawa, choice2_Quiz3_Level3_Stage3_Jawa, choice3_Quiz3_Level3_Stage3_Jawa, choice4_Quiz3_Level3_Stage3_Jawa]
        quiz3_level3_stage3_Jawa.images = [image1_Quiz3_Level3_Stage3_Jawa, image2_Quiz3_Level3_Stage3_Jawa, image3_Quiz3_Level3_Stage3_Jawa, image4_Quiz3_Level3_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level3_Stage3_Jawa.id = 1
        choice1_Quiz4_Level3_Stage3_Jawa.name = "Hyi"
        
        let choice2_Quiz4_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level3_Stage3_Jawa.id = 2
        choice2_Quiz4_Level3_Stage3_Jawa.name = "Lyi"
        
        let choice3_Quiz4_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level3_Stage3_Jawa.id = 3
        choice3_Quiz4_Level3_Stage3_Jawa.name = "Lyang"
        
        let choice4_Quiz4_Level3_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level3_Stage3_Jawa.id = 4
        choice4_Quiz4_Level3_Stage3_Jawa.name = "Hyang"
        
        //MARK: Image
        let image1_Quiz4_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level3_Stage3_Jawa.id = 1
        image1_Quiz4_Level3_Stage3_Jawa.name = "Hyi_Aksara_Jawa"
        
        let image2_Quiz4_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level3_Stage3_Jawa.id = 2
        image2_Quiz4_Level3_Stage3_Jawa.name = "Lyi_Aksara_Jawa"
        
        let image3_Quiz4_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level3_Stage3_Jawa.id = 3
        image3_Quiz4_Level3_Stage3_Jawa.name = "Lyang_Aksara_Jawa"
        
        let image4_Quiz4_Level3_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level3_Stage3_Jawa.id = 4
        image4_Quiz4_Level3_Stage3_Jawa.name = "Hyang_Aksara_Jawa"
        
        let quiz4_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level3_stage3_Jawa.id = 4
        quiz4_level3_stage3_Jawa.name = "Kuis 3"
        quiz4_level3_stage3_Jawa.type = "C"
        quiz4_level3_stage3_Jawa.isCorrect = false
        quiz4_level3_stage3_Jawa.question = "Hyang"
        quiz4_level3_stage3_Jawa.choices = [choice1_Quiz4_Level3_Stage3_Jawa, choice2_Quiz4_Level3_Stage3_Jawa, choice3_Quiz4_Level3_Stage3_Jawa, choice4_Quiz4_Level3_Stage3_Jawa]
        quiz4_level3_stage3_Jawa.images = [image1_Quiz4_Level3_Stage3_Jawa, image2_Quiz4_Level3_Stage3_Jawa, image3_Quiz4_Level3_Stage3_Jawa, image4_Quiz4_Level3_Stage3_Jawa]
        
        let quiz5_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level3_stage3_Jawa.id = 5
        quiz5_level3_stage3_Jawa.name = "Kuis 4"
        quiz5_level3_stage3_Jawa.type = "D"
        quiz5_level3_stage3_Jawa.isCorrect = false
        quiz5_level3_stage3_Jawa.question = "Hyang"
        quiz5_level3_stage3_Jawa.choices = []
        quiz5_level3_stage3_Jawa.images = []
        
        let quiz6_level3_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level3_stage3_Jawa.id = 6
        quiz6_level3_stage3_Jawa.name = "Kuis 5"
        quiz6_level3_stage3_Jawa.type = "E"
        quiz6_level3_stage3_Jawa.isCorrect = false
        quiz6_level3_stage3_Jawa.question = "Hyang"
        quiz6_level3_stage3_Jawa.choices = []
        quiz6_level3_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 4 Stage 2 Jawa
        let quiz1_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level4_stage3_Jawa.id = 1
        quiz1_level4_stage3_Jawa.name = "Panduan"
        quiz1_level4_stage3_Jawa.type = "Panduan"
        quiz1_level4_stage3_Jawa.isCorrect = false
        quiz1_level4_stage3_Jawa.question = "Téh"
        quiz1_level4_stage3_Jawa.choices = []
        quiz1_level4_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level4_Stage3_Jawa.id = 1
        choice1_Quiz2_Level4_Stage3_Jawa.name = "Téh"
        
        let choice2_Quiz2_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level4_Stage3_Jawa.id = 2
        choice2_Quiz2_Level4_Stage3_Jawa.name = "Sre"
        
        let choice3_Quiz2_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level4_Stage3_Jawa.id = 3
        choice3_Quiz2_Level4_Stage3_Jawa.name = "To"
        
        let choice4_Quiz2_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level4_Stage3_Jawa.id = 4
        choice4_Quiz2_Level4_Stage3_Jawa.name = "Kré"
        
        //MARK: Image
        let image1_Quiz2_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level4_Stage3_Jawa.id = 1
        image1_Quiz2_Level4_Stage3_Jawa.name = "Téh_Aksara_Jawa"
        
        let image2_Quiz2_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level4_Stage3_Jawa.id = 2
        image2_Quiz2_Level4_Stage3_Jawa.name = "Sre_Aksara_Jawa"
        
        let image3_Quiz2_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level4_Stage3_Jawa.id = 3
        image3_Quiz2_Level4_Stage3_Jawa.name = "To_Aksara_Jawa"
        
        let image4_Quiz2_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level4_Stage3_Jawa.id = 4
        image4_Quiz2_Level4_Stage3_Jawa.name = "Kré_Aksara_Jawa"
        
        let quiz2_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level4_stage3_Jawa.id = 2
        quiz2_level4_stage3_Jawa.name = "Kuis 1"
        quiz2_level4_stage3_Jawa.type = "A"
        quiz2_level4_stage3_Jawa.isCorrect = false
        quiz2_level4_stage3_Jawa.question = "Téh"
        quiz2_level4_stage3_Jawa.choices = [choice1_Quiz2_Level4_Stage3_Jawa, choice2_Quiz2_Level4_Stage3_Jawa, choice3_Quiz2_Level4_Stage3_Jawa, choice4_Quiz2_Level4_Stage3_Jawa]
        quiz2_level4_stage3_Jawa.images = [image1_Quiz2_Level4_Stage3_Jawa, image2_Quiz2_Level4_Stage3_Jawa, image3_Quiz2_Level4_Stage3_Jawa, image4_Quiz2_Level4_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level4_Stage3_Jawa.id = 1
        choice1_Quiz3_Level4_Stage3_Jawa.name = "Sre"
        
        let choice2_Quiz3_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level4_Stage3_Jawa.id = 2
        choice2_Quiz3_Level4_Stage3_Jawa.name = "Kré"
        
        let choice3_Quiz3_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level4_Stage3_Jawa.id = 3
        choice3_Quiz3_Level4_Stage3_Jawa.name = "Téh"
        
        let choice4_Quiz3_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level4_Stage3_Jawa.id = 4
        choice4_Quiz3_Level4_Stage3_Jawa.name = "To"
        
        //MARK: Image
        let image1_Quiz3_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level4_Stage3_Jawa.id = 1
        image1_Quiz3_Level4_Stage3_Jawa.name = "Sre_Aksara_Jawa"
        
        let image2_Quiz3_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level4_Stage3_Jawa.id = 2
        image2_Quiz3_Level4_Stage3_Jawa.name = "Kré_Aksara_Jawa"
        
        let image3_Quiz3_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level4_Stage3_Jawa.id = 3
        image3_Quiz3_Level4_Stage3_Jawa.name = "Téh_Aksara_Jawa"
        
        let image4_Quiz3_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level4_Stage3_Jawa.id = 4
        image4_Quiz3_Level4_Stage3_Jawa.name = "To_Aksara_Jawa"
        
        let quiz3_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level4_stage3_Jawa.id = 3
        quiz3_level4_stage3_Jawa.name = "Kuis 2"
        quiz3_level4_stage3_Jawa.type = "B"
        quiz3_level4_stage3_Jawa.isCorrect = false
        quiz3_level4_stage3_Jawa.question = "Téh"
        quiz3_level4_stage3_Jawa.choices = [choice1_Quiz3_Level4_Stage3_Jawa, choice2_Quiz3_Level4_Stage3_Jawa, choice3_Quiz3_Level4_Stage3_Jawa, choice4_Quiz3_Level4_Stage3_Jawa]
        quiz3_level4_stage3_Jawa.images = [image1_Quiz3_Level4_Stage3_Jawa, image2_Quiz3_Level4_Stage3_Jawa, image3_Quiz3_Level4_Stage3_Jawa, image4_Quiz3_Level4_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level4_Stage3_Jawa.id = 1
        choice1_Quiz4_Level4_Stage3_Jawa.name = "To"
        
        let choice2_Quiz4_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level4_Stage3_Jawa.id = 2
        choice2_Quiz4_Level4_Stage3_Jawa.name = "Téh"
        
        let choice3_Quiz4_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level4_Stage3_Jawa.id = 3
        choice3_Quiz4_Level4_Stage3_Jawa.name = "Kré"
        
        let choice4_Quiz4_Level4_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level4_Stage3_Jawa.id = 4
        choice4_Quiz4_Level4_Stage3_Jawa.name = "Sre"
        
        //MARK: Image
        let image1_Quiz4_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level4_Stage3_Jawa.id = 1
        image1_Quiz4_Level4_Stage3_Jawa.name = "To_Aksara_Jawa"
        
        let image2_Quiz4_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level4_Stage3_Jawa.id = 2
        image2_Quiz4_Level4_Stage3_Jawa.name = "Téh_Aksara_Jawa"
        
        let image3_Quiz4_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level4_Stage3_Jawa.id = 3
        image3_Quiz4_Level4_Stage3_Jawa.name = "Kré_Aksara_Jawa"
        
        let image4_Quiz4_Level4_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level4_Stage3_Jawa.id = 4
        image4_Quiz4_Level4_Stage3_Jawa.name = "Sre_Aksara_Jawa"
        
        let quiz4_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level4_stage3_Jawa.id = 4
        quiz4_level4_stage3_Jawa.name = "Kuis 3"
        quiz4_level4_stage3_Jawa.type = "C"
        quiz4_level4_stage3_Jawa.isCorrect = false
        quiz4_level4_stage3_Jawa.question = "Téh"
        quiz4_level4_stage3_Jawa.choices = [choice1_Quiz4_Level4_Stage3_Jawa, choice2_Quiz4_Level4_Stage3_Jawa, choice3_Quiz4_Level4_Stage3_Jawa, choice4_Quiz4_Level4_Stage3_Jawa]
        quiz4_level4_stage3_Jawa.images = [image1_Quiz4_Level4_Stage3_Jawa, image2_Quiz4_Level4_Stage3_Jawa, image3_Quiz4_Level4_Stage3_Jawa, image4_Quiz4_Level4_Stage3_Jawa]
        
        let quiz5_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level4_stage3_Jawa.id = 5
        quiz5_level4_stage3_Jawa.name = "Kuis 4"
        quiz5_level4_stage3_Jawa.type = "D"
        quiz5_level4_stage3_Jawa.isCorrect = false
        quiz5_level4_stage3_Jawa.question = "Téh"
        quiz5_level4_stage3_Jawa.choices = []
        quiz5_level4_stage3_Jawa.images = []
        
        let quiz6_level4_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level4_stage3_Jawa.id = 6
        quiz6_level4_stage3_Jawa.name = "Kuis 5"
        quiz6_level4_stage3_Jawa.type = "E"
        quiz6_level4_stage3_Jawa.isCorrect = false
        quiz6_level4_stage3_Jawa.question = "Téh"
        quiz6_level4_stage3_Jawa.choices = []
        quiz6_level4_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 5 Stage 3 Jawa
        let quiz1_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level5_stage3_Jawa.id = 1
        quiz1_level5_stage3_Jawa.name = "Panduan"
        quiz1_level5_stage3_Jawa.type = "Panduan"
        quiz1_level5_stage3_Jawa.isCorrect = false
        quiz1_level5_stage3_Jawa.question = "Wer"
        quiz1_level5_stage3_Jawa.choices = []
        quiz1_level5_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level5_Stage3_Jawa.id = 1
        choice1_Quiz2_Level5_Stage3_Jawa.name = "Weng"
        
        let choice2_Quiz2_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level5_Stage3_Jawa.id = 2
        choice2_Quiz2_Level5_Stage3_Jawa.name = "Cer"
        
        let choice3_Quiz2_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level5_Stage3_Jawa.id = 3
        choice3_Quiz2_Level5_Stage3_Jawa.name = "Cing"
        
        let choice4_Quiz2_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level5_Stage3_Jawa.id = 4
        choice4_Quiz2_Level5_Stage3_Jawa.name = "Wer"
        
        //MARK: Image
        let image1_Quiz2_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level5_Stage3_Jawa.id = 1
        image1_Quiz2_Level5_Stage3_Jawa.name = "Weng_Aksara_Jawa"
        
        let image2_Quiz2_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level5_Stage3_Jawa.id = 2
        image2_Quiz2_Level5_Stage3_Jawa.name = "Cer_Aksara_Jawa"
        
        let image3_Quiz2_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level5_Stage3_Jawa.id = 3
        image3_Quiz2_Level5_Stage3_Jawa.name = "Cing_Aksara_Jawa"
        
        let image4_Quiz2_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level5_Stage3_Jawa.id = 4
        image4_Quiz2_Level5_Stage3_Jawa.name = "Wer_Aksara_Jawa"
        
        let quiz2_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage3_Jawa.id = 2
        quiz2_level5_stage3_Jawa.name = "Kuis 1"
        quiz2_level5_stage3_Jawa.type = "A"
        quiz2_level5_stage3_Jawa.isCorrect = false
        quiz2_level5_stage3_Jawa.question = "Wer"
        quiz2_level5_stage3_Jawa.choices = [choice1_Quiz2_Level5_Stage3_Jawa, choice2_Quiz2_Level5_Stage3_Jawa, choice3_Quiz2_Level5_Stage3_Jawa, choice4_Quiz2_Level5_Stage3_Jawa]
        quiz2_level5_stage3_Jawa.images = [image1_Quiz2_Level5_Stage3_Jawa, image2_Quiz2_Level5_Stage3_Jawa, image3_Quiz2_Level5_Stage3_Jawa, image4_Quiz2_Level5_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level5_Stage3_Jawa.id = 1
        choice1_Quiz3_Level5_Stage3_Jawa.name = "Wi"
        
        let choice2_Quiz3_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level5_Stage3_Jawa.id = 2
        choice2_Quiz3_Level5_Stage3_Jawa.name = "Cer"
        
        let choice3_Quiz3_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level5_Stage3_Jawa.id = 3
        choice3_Quiz3_Level5_Stage3_Jawa.name = "Cing"
        
        let choice4_Quiz3_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level5_Stage3_Jawa.id = 4
        choice4_Quiz3_Level5_Stage3_Jawa.name = "Wer"
        
        //MARK: Image
        let image1_Quiz3_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level5_Stage3_Jawa.id = 1
        image1_Quiz3_Level5_Stage3_Jawa.name = "Wi_Aksara_Jawa"
        
        let image2_Quiz3_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level5_Stage3_Jawa.id = 2
        image2_Quiz3_Level5_Stage3_Jawa.name = "Cer_Aksara_Jawa"
        
        let image3_Quiz3_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level5_Stage3_Jawa.id = 3
        image3_Quiz3_Level5_Stage3_Jawa.name = "Cing_Aksara_Jawa"
        
        let image4_Quiz3_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level5_Stage3_Jawa.id = 4
        image4_Quiz3_Level5_Stage3_Jawa.name = "Wer_Aksara_Jawa"
        
        let quiz3_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level5_stage3_Jawa.id = 3
        quiz3_level5_stage3_Jawa.name = "Kuis 2"
        quiz3_level5_stage3_Jawa.type = "B"
        quiz3_level5_stage3_Jawa.isCorrect = false
        quiz3_level5_stage3_Jawa.question = "Wer"
        quiz3_level5_stage3_Jawa.choices = [choice1_Quiz3_Level5_Stage3_Jawa, choice2_Quiz3_Level5_Stage3_Jawa, choice3_Quiz3_Level5_Stage3_Jawa, choice4_Quiz3_Level5_Stage3_Jawa]
        quiz3_level5_stage3_Jawa.images = [image1_Quiz3_Level5_Stage3_Jawa, image2_Quiz3_Level5_Stage3_Jawa, image3_Quiz3_Level5_Stage3_Jawa, image4_Quiz3_Level5_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level5_Stage3_Jawa.id = 1
        choice1_Quiz4_Level5_Stage3_Jawa.name = "Weng"
        
        let choice2_Quiz4_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level5_Stage3_Jawa.id = 2
        choice2_Quiz4_Level5_Stage3_Jawa.name = "Cing"
        
        let choice3_Quiz4_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level5_Stage3_Jawa.id = 3
        choice3_Quiz4_Level5_Stage3_Jawa.name = "Wer"
        
        let choice4_Quiz4_Level5_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level5_Stage3_Jawa.id = 4
        choice4_Quiz4_Level5_Stage3_Jawa.name = "Cer"
        
        //MARK: Image
        let image1_Quiz4_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level5_Stage3_Jawa.id = 1
        image1_Quiz4_Level5_Stage3_Jawa.name = "Weng_Aksara_Jawa"
        
        let image2_Quiz4_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level5_Stage3_Jawa.id = 2
        image2_Quiz4_Level5_Stage3_Jawa.name = "Cing_Aksara_Jawa"
        
        let image3_Quiz4_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level5_Stage3_Jawa.id = 3
        image3_Quiz4_Level5_Stage3_Jawa.name = "Wer_Aksara_Jawa"
        
        let image4_Quiz4_Level5_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level5_Stage3_Jawa.id = 4
        image4_Quiz4_Level5_Stage3_Jawa.name = "Cer_Aksara_Jawa"
        
        let quiz4_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level5_stage3_Jawa.id = 4
        quiz4_level5_stage3_Jawa.name = "Kuis 3"
        quiz4_level5_stage3_Jawa.type = "C"
        quiz4_level5_stage3_Jawa.isCorrect = false
        quiz4_level5_stage3_Jawa.question = "Wer"
        quiz4_level5_stage3_Jawa.choices = [choice1_Quiz4_Level5_Stage3_Jawa, choice2_Quiz4_Level5_Stage3_Jawa, choice3_Quiz4_Level5_Stage3_Jawa, choice4_Quiz4_Level5_Stage3_Jawa]
        quiz4_level5_stage3_Jawa.images = [image1_Quiz4_Level5_Stage3_Jawa, image2_Quiz4_Level5_Stage3_Jawa, image3_Quiz4_Level5_Stage3_Jawa, image4_Quiz4_Level5_Stage3_Jawa]
        
        let quiz5_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level5_stage3_Jawa.id = 5
        quiz5_level5_stage3_Jawa.name = "Kuis 4"
        quiz5_level5_stage3_Jawa.type = "D"
        quiz5_level5_stage3_Jawa.isCorrect = false
        quiz5_level5_stage3_Jawa.question = "Wer"
        quiz5_level5_stage3_Jawa.choices = []
        quiz5_level5_stage3_Jawa.images = []
        
        let quiz6_level5_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level5_stage3_Jawa.id = 6
        quiz6_level5_stage3_Jawa.name = "Kuis 5"
        quiz6_level5_stage3_Jawa.type = "E"
        quiz6_level5_stage3_Jawa.isCorrect = false
        quiz6_level5_stage3_Jawa.question = "Wer"
        quiz6_level5_stage3_Jawa.choices = []
        quiz6_level5_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 6 Stage 3 Jawa
        let quiz1_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level6_stage3_Jawa.id = 1
        quiz1_level6_stage3_Jawa.name = "Panduan"
        quiz1_level6_stage3_Jawa.type = "Panduan"
        quiz1_level6_stage3_Jawa.isCorrect = false
        quiz1_level6_stage3_Jawa.question = "Nuh"
        quiz1_level6_stage3_Jawa.choices = []
        quiz1_level6_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level6_Stage3_Jawa.id = 1
        choice1_Quiz2_Level6_Stage3_Jawa.name = "Néh"
        
        let choice2_Quiz2_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level6_Stage3_Jawa.id = 2
        choice2_Quiz2_Level6_Stage3_Jawa.name = "Duh"
        
        let choice3_Quiz2_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level6_Stage3_Jawa.id = 3
        choice3_Quiz2_Level6_Stage3_Jawa.name = "Nuh"
        
        let choice4_Quiz2_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level6_Stage3_Jawa.id = 4
        choice4_Quiz2_Level6_Stage3_Jawa.name = "Dih"
        
        //MARK: Image
        let image1_Quiz2_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level6_Stage3_Jawa.id = 1
        image1_Quiz2_Level6_Stage3_Jawa.name = "Néh_Aksara_Jawa"
        
        let image2_Quiz2_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level6_Stage3_Jawa.id = 2
        image2_Quiz2_Level6_Stage3_Jawa.name = "Duh_Aksara_Jawa"
        
        let image3_Quiz2_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level6_Stage3_Jawa.id = 3
        image3_Quiz2_Level6_Stage3_Jawa.name = "Nuh_Aksara_Jawa"
        
        let image4_Quiz2_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level6_Stage3_Jawa.id = 4
        image4_Quiz2_Level6_Stage3_Jawa.name = "Dih_Aksara_Jawa"
        
        let quiz2_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level6_stage3_Jawa.id = 2
        quiz2_level6_stage3_Jawa.name = "Kuis 1"
        quiz2_level6_stage3_Jawa.type = "A"
        quiz2_level6_stage3_Jawa.isCorrect = false
        quiz2_level6_stage3_Jawa.question = "Nuh"
        quiz2_level6_stage3_Jawa.choices = [choice1_Quiz2_Level6_Stage3_Jawa, choice2_Quiz2_Level6_Stage3_Jawa, choice3_Quiz2_Level6_Stage3_Jawa, choice4_Quiz2_Level6_Stage3_Jawa]
        quiz2_level6_stage3_Jawa.images = [image1_Quiz2_Level6_Stage3_Jawa, image2_Quiz2_Level6_Stage3_Jawa, image3_Quiz2_Level6_Stage3_Jawa, image4_Quiz2_Level6_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level6_Stage3_Jawa.id = 1
        choice1_Quiz3_Level6_Stage3_Jawa.name = "Dih"
        
        let choice2_Quiz3_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level6_Stage3_Jawa.id = 2
        choice2_Quiz3_Level6_Stage3_Jawa.name = "Nuh"
        
        let choice3_Quiz3_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level6_Stage3_Jawa.id = 3
        choice3_Quiz3_Level6_Stage3_Jawa.name = "Néh"
        
        let choice4_Quiz3_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level6_Stage3_Jawa.id = 4
        choice4_Quiz3_Level6_Stage3_Jawa.name = "Duh"
        
        //MARK: Image
        let image1_Quiz3_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level6_Stage3_Jawa.id = 1
        image1_Quiz3_Level6_Stage3_Jawa.name = "Dih_Aksara_Jawa"
        
        let image2_Quiz3_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level6_Stage3_Jawa.id = 2
        image2_Quiz3_Level6_Stage3_Jawa.name = "Nuh_Aksara_Jawa"
        
        let image3_Quiz3_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level6_Stage3_Jawa.id = 3
        image3_Quiz3_Level6_Stage3_Jawa.name = "Néh_Aksara_Jawa"
        
        let image4_Quiz3_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level6_Stage3_Jawa.id = 4
        image4_Quiz3_Level6_Stage3_Jawa.name = "Duh_Aksara_Jawa"
        
        let quiz3_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level6_stage3_Jawa.id = 3
        quiz3_level6_stage3_Jawa.name = "Kuis 2"
        quiz3_level6_stage3_Jawa.type = "B"
        quiz3_level6_stage3_Jawa.isCorrect = false
        quiz3_level6_stage3_Jawa.question = "Nuh"
        quiz3_level6_stage3_Jawa.choices = [choice1_Quiz3_Level6_Stage3_Jawa, choice2_Quiz3_Level6_Stage3_Jawa, choice3_Quiz3_Level6_Stage3_Jawa, choice4_Quiz3_Level6_Stage3_Jawa]
        quiz3_level6_stage3_Jawa.images = [image1_Quiz3_Level6_Stage3_Jawa, image2_Quiz3_Level6_Stage3_Jawa, image3_Quiz3_Level6_Stage3_Jawa, image4_Quiz3_Level6_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level6_Stage3_Jawa.id = 1
        choice1_Quiz4_Level6_Stage3_Jawa.name = "Nuh"
        
        let choice2_Quiz4_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level6_Stage3_Jawa.id = 2
        choice2_Quiz4_Level6_Stage3_Jawa.name = "Dih"
        
        let choice3_Quiz4_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level6_Stage3_Jawa.id = 3
        choice3_Quiz4_Level6_Stage3_Jawa.name = "Duh"
        
        let choice4_Quiz4_Level6_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level6_Stage3_Jawa.id = 4
        choice4_Quiz4_Level6_Stage3_Jawa.name = "Néh"
        
        //MARK: Image
        let image1_Quiz4_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level6_Stage3_Jawa.id = 1
        image1_Quiz4_Level6_Stage3_Jawa.name = "Nuh_Aksara_Jawa"
        
        let image2_Quiz4_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level6_Stage3_Jawa.id = 2
        image2_Quiz4_Level6_Stage3_Jawa.name = "Dih_Aksara_Jawa"
        
        let image3_Quiz4_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level6_Stage3_Jawa.id = 3
        image3_Quiz4_Level6_Stage3_Jawa.name = "Duh_Aksara_Jawa"
        
        let image4_Quiz4_Level6_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level6_Stage3_Jawa.id = 4
        image4_Quiz4_Level6_Stage3_Jawa.name = "Néh_Aksara_Jawa"
        
        let quiz4_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level6_stage3_Jawa.id = 4
        quiz4_level6_stage3_Jawa.name = "Kuis 3"
        quiz4_level6_stage3_Jawa.type = "C"
        quiz4_level6_stage3_Jawa.isCorrect = false
        quiz4_level6_stage3_Jawa.question = "Nuh"
        quiz4_level6_stage3_Jawa.choices = [choice1_Quiz4_Level6_Stage3_Jawa, choice2_Quiz4_Level6_Stage3_Jawa, choice3_Quiz4_Level6_Stage3_Jawa, choice4_Quiz4_Level6_Stage3_Jawa]
        quiz4_level6_stage3_Jawa.images = [image1_Quiz4_Level6_Stage3_Jawa, image2_Quiz4_Level6_Stage3_Jawa, image3_Quiz4_Level6_Stage3_Jawa, image4_Quiz4_Level6_Stage3_Jawa]
        
        let quiz5_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level6_stage3_Jawa.id = 5
        quiz5_level6_stage3_Jawa.name = "Kuis 4"
        quiz5_level6_stage3_Jawa.type = "D"
        quiz5_level6_stage3_Jawa.isCorrect = false
        quiz5_level6_stage3_Jawa.question = "Nuh"
        quiz5_level6_stage3_Jawa.choices = []
        quiz5_level6_stage3_Jawa.images = []
        
        let quiz6_level6_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level6_stage3_Jawa.id = 6
        quiz6_level6_stage3_Jawa.name = "Kuis 5"
        quiz6_level6_stage3_Jawa.type = "E"
        quiz6_level6_stage3_Jawa.isCorrect = false
        quiz6_level6_stage3_Jawa.question = "Nuh"
        quiz6_level6_stage3_Jawa.choices = []
        quiz6_level6_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 7 Stage 3 Jawa
        let quiz1_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level7_stage3_Jawa.id = 1
        quiz1_level7_stage3_Jawa.name = "Panduan"
        quiz1_level7_stage3_Jawa.type = "Panduan"
        quiz1_level7_stage3_Jawa.isCorrect = false
        quiz1_level7_stage3_Jawa.question = "Creng"
        quiz1_level7_stage3_Jawa.choices = []
        quiz1_level7_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level7_Stage3_Jawa.id = 1
        choice1_Quiz2_Level7_Stage3_Jawa.name = "Wrang"
        
        let choice2_Quiz2_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level7_Stage3_Jawa.id = 2
        choice2_Quiz2_Level7_Stage3_Jawa.name = "Creng"
        
        let choice3_Quiz2_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level7_Stage3_Jawa.id = 3
        choice3_Quiz2_Level7_Stage3_Jawa.name = "Wreng"
        
        let choice4_Quiz2_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level7_Stage3_Jawa.id = 4
        choice4_Quiz2_Level7_Stage3_Jawa.name = "Cri"
        
        //MARK: Image
        let image1_Quiz2_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level7_Stage3_Jawa.id = 1
        image1_Quiz2_Level7_Stage3_Jawa.name = "Wrang_Aksara_Jawa"
        
        let image2_Quiz2_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level7_Stage3_Jawa.id = 2
        image2_Quiz2_Level7_Stage3_Jawa.name = "Creng_Aksara_Jawa"
        
        let image3_Quiz2_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level7_Stage3_Jawa.id = 3
        image3_Quiz2_Level7_Stage3_Jawa.name = "Wreng_Aksara_Jawa"
        
        let image4_Quiz2_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level7_Stage3_Jawa.id = 4
        image4_Quiz2_Level7_Stage3_Jawa.name = "Cri_Aksara_Jawa"
        
        let quiz2_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level7_stage3_Jawa.id = 2
        quiz2_level7_stage3_Jawa.name = "Kuis 1"
        quiz2_level7_stage3_Jawa.type = "A"
        quiz2_level7_stage3_Jawa.isCorrect = false
        quiz2_level7_stage3_Jawa.question = "Creng"
        quiz2_level7_stage3_Jawa.choices = [choice1_Quiz2_Level7_Stage3_Jawa, choice2_Quiz2_Level7_Stage3_Jawa, choice3_Quiz2_Level7_Stage3_Jawa, choice4_Quiz2_Level7_Stage3_Jawa]
        quiz2_level7_stage3_Jawa.images = [image1_Quiz2_Level7_Stage3_Jawa, image2_Quiz2_Level7_Stage3_Jawa, image3_Quiz2_Level7_Stage3_Jawa, image4_Quiz2_Level7_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level7_Stage3_Jawa.id = 1
        choice1_Quiz3_Level7_Stage3_Jawa.name = "Creng"
        
        let choice2_Quiz3_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level7_Stage3_Jawa.id = 2
        choice2_Quiz3_Level7_Stage3_Jawa.name = "Wrang"
        
        let choice3_Quiz3_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level7_Stage3_Jawa.id = 3
        choice3_Quiz3_Level7_Stage3_Jawa.name = "Cri"
        
        let choice4_Quiz3_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level7_Stage3_Jawa.id = 4
        choice4_Quiz3_Level7_Stage3_Jawa.name = "Wreng"
        
        //MARK: Image
        let image1_Quiz3_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level7_Stage3_Jawa.id = 1
        image1_Quiz3_Level7_Stage3_Jawa.name = "Creng_Aksara_Jawa"
        
        let image2_Quiz3_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level7_Stage3_Jawa.id = 2
        image2_Quiz3_Level7_Stage3_Jawa.name = "Wrang_Aksara_Jawa"
        
        let image3_Quiz3_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level7_Stage3_Jawa.id = 3
        image3_Quiz3_Level7_Stage3_Jawa.name = "Cri_Aksara_Jawa"
        
        let image4_Quiz3_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level7_Stage3_Jawa.id = 4
        image4_Quiz3_Level7_Stage3_Jawa.name = "Wreng_Aksara_Jawa"
        
        let quiz3_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level7_stage3_Jawa.id = 3
        quiz3_level7_stage3_Jawa.name = "Kuis 2"
        quiz3_level7_stage3_Jawa.type = "B"
        quiz3_level7_stage3_Jawa.isCorrect = false
        quiz3_level7_stage3_Jawa.question = "Creng"
        quiz3_level7_stage3_Jawa.choices = [choice1_Quiz3_Level7_Stage3_Jawa, choice2_Quiz3_Level7_Stage3_Jawa, choice3_Quiz3_Level7_Stage3_Jawa, choice4_Quiz3_Level7_Stage3_Jawa]
        quiz3_level7_stage3_Jawa.images = [image1_Quiz3_Level7_Stage3_Jawa, image2_Quiz3_Level7_Stage3_Jawa, image3_Quiz3_Level7_Stage3_Jawa, image4_Quiz3_Level7_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level7_Stage3_Jawa.id = 1
        choice1_Quiz4_Level7_Stage3_Jawa.name = "Wreng"
        
        let choice2_Quiz4_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level7_Stage3_Jawa.id = 2
        choice2_Quiz4_Level7_Stage3_Jawa.name = "Cri"
        
        let choice3_Quiz4_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level7_Stage3_Jawa.id = 3
        choice3_Quiz4_Level7_Stage3_Jawa.name = "Wrang"
        
        let choice4_Quiz4_Level7_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level7_Stage3_Jawa.id = 4
        choice4_Quiz4_Level7_Stage3_Jawa.name = "Creng"
        
        //MARK: Image
        let image1_Quiz4_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level7_Stage3_Jawa.id = 1
        image1_Quiz4_Level7_Stage3_Jawa.name = "Wreng_Aksara_Jawa"
        
        let image2_Quiz4_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level7_Stage3_Jawa.id = 2
        image2_Quiz4_Level7_Stage3_Jawa.name = "Cri_Aksara_Jawa"
        
        let image3_Quiz4_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level7_Stage3_Jawa.id = 3
        image3_Quiz4_Level7_Stage3_Jawa.name = "Wrang_Aksara_Jawa"
        
        let image4_Quiz4_Level7_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level7_Stage3_Jawa.id = 4
        image4_Quiz4_Level7_Stage3_Jawa.name = "Creng_Aksara_Jawa"
        
        let quiz4_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level7_stage3_Jawa.id = 4
        quiz4_level7_stage3_Jawa.name = "Kuis 3"
        quiz4_level7_stage3_Jawa.type = "C"
        quiz4_level7_stage3_Jawa.isCorrect = false
        quiz4_level7_stage3_Jawa.question = "Creng"
        quiz4_level7_stage3_Jawa.choices = [choice1_Quiz4_Level7_Stage3_Jawa, choice2_Quiz4_Level7_Stage3_Jawa, choice3_Quiz4_Level7_Stage3_Jawa, choice4_Quiz4_Level7_Stage3_Jawa]
        quiz4_level7_stage3_Jawa.images = [image1_Quiz4_Level7_Stage3_Jawa, image2_Quiz4_Level7_Stage3_Jawa, image3_Quiz4_Level7_Stage3_Jawa, image4_Quiz4_Level7_Stage3_Jawa]
        
        let quiz5_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level7_stage3_Jawa.id = 5
        quiz5_level7_stage3_Jawa.name = "Kuis 4"
        quiz5_level7_stage3_Jawa.type = "D"
        quiz5_level7_stage3_Jawa.isCorrect = false
        quiz5_level7_stage3_Jawa.question = "Creng"
        quiz5_level7_stage3_Jawa.choices = []
        quiz5_level7_stage3_Jawa.images = []
        
        let quiz6_level7_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level7_stage3_Jawa.id = 6
        quiz6_level7_stage3_Jawa.name = "Kuis 5"
        quiz6_level7_stage3_Jawa.type = "E"
        quiz6_level7_stage3_Jawa.isCorrect = false
        quiz6_level7_stage3_Jawa.question = "Creng"
        quiz6_level7_stage3_Jawa.choices = []
        quiz6_level7_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 8 Stage 3 Jawa
        let quiz1_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level8_stage3_Jawa.id = 1
        quiz1_level8_stage3_Jawa.name = "Panduan"
        quiz1_level8_stage3_Jawa.type = "Panduan"
        quiz1_level8_stage3_Jawa.isCorrect = false
        quiz1_level8_stage3_Jawa.question = "Dhip"
        quiz1_level8_stage3_Jawa.choices = []
        quiz1_level8_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level8_Stage3_Jawa.id = 1
        choice1_Quiz2_Level8_Stage3_Jawa.name = "Dhip"
        
        let choice2_Quiz2_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level8_Stage3_Jawa.id = 2
        choice2_Quiz2_Level8_Stage3_Jawa.name = "Bé"
        
        let choice3_Quiz2_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level8_Stage3_Jawa.id = 3
        choice3_Quiz2_Level8_Stage3_Jawa.name = "Nye"
        
        let choice4_Quiz2_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level8_Stage3_Jawa.id = 4
        choice4_Quiz2_Level8_Stage3_Jawa.name = "Be"
        
        //MARK: Image
        let image1_Quiz2_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level8_Stage3_Jawa.id = 1
        image1_Quiz2_Level8_Stage3_Jawa.name = "Dhip_Aksara_Jawa"
        
        let image2_Quiz2_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level8_Stage3_Jawa.id = 2
        image2_Quiz2_Level8_Stage3_Jawa.name = "Bé_Aksara_Jawa"
        
        let image3_Quiz2_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level8_Stage3_Jawa.id = 3
        image3_Quiz2_Level8_Stage3_Jawa.name = "Nye_Aksara_Jawa"
        
        let image4_Quiz2_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level8_Stage3_Jawa.id = 4
        image4_Quiz2_Level8_Stage3_Jawa.name = "Be_Aksara_Jawa"
        
        let quiz2_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level8_stage3_Jawa.id = 2
        quiz2_level8_stage3_Jawa.name = "Kuis 1"
        quiz2_level8_stage3_Jawa.type = "A"
        quiz2_level8_stage3_Jawa.isCorrect = false
        quiz2_level8_stage3_Jawa.question = "Dhip"
        quiz2_level8_stage3_Jawa.choices = [choice1_Quiz2_Level8_Stage3_Jawa, choice2_Quiz2_Level8_Stage3_Jawa, choice3_Quiz2_Level8_Stage3_Jawa, choice4_Quiz2_Level8_Stage3_Jawa]
        quiz2_level8_stage3_Jawa.images = [image1_Quiz2_Level8_Stage3_Jawa, image2_Quiz2_Level8_Stage3_Jawa, image3_Quiz2_Level8_Stage3_Jawa, image4_Quiz2_Level8_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level8_Stage3_Jawa.id = 1
        choice1_Quiz3_Level8_Stage3_Jawa.name = "Be"
        
        let choice2_Quiz3_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level8_Stage3_Jawa.id = 2
        choice2_Quiz3_Level8_Stage3_Jawa.name = "Ngo"
        
        let choice3_Quiz3_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level8_Stage3_Jawa.id = 3
        choice3_Quiz3_Level8_Stage3_Jawa.name = "Bé"
        
        let choice4_Quiz3_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level8_Stage3_Jawa.id = 4
        choice4_Quiz3_Level8_Stage3_Jawa.name = "Dhip"
        
        //MARK: Image
        let image1_Quiz3_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level8_Stage3_Jawa.id = 1
        image1_Quiz3_Level8_Stage3_Jawa.name = "Be_Aksara_Jawa"
        
        let image2_Quiz3_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level8_Stage3_Jawa.id = 2
        image2_Quiz3_Level8_Stage3_Jawa.name = "Ngo_Aksara_Jawa"
        
        let image3_Quiz3_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level8_Stage3_Jawa.id = 3
        image3_Quiz3_Level8_Stage3_Jawa.name = "Bé_Aksara_Jawa"
        
        let image4_Quiz3_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level8_Stage3_Jawa.id = 4
        image4_Quiz3_Level8_Stage3_Jawa.name = "Dhip_Aksara_Jawa"
        
        let quiz3_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level8_stage3_Jawa.id = 3
        quiz3_level8_stage3_Jawa.name = "Kuis 2"
        quiz3_level8_stage3_Jawa.type = "B"
        quiz3_level8_stage3_Jawa.isCorrect = false
        quiz3_level8_stage3_Jawa.question = "Dhip"
        quiz3_level8_stage3_Jawa.choices = [choice1_Quiz3_Level8_Stage3_Jawa, choice2_Quiz3_Level8_Stage3_Jawa, choice3_Quiz3_Level8_Stage3_Jawa, choice4_Quiz3_Level8_Stage3_Jawa]
        quiz3_level8_stage3_Jawa.images = [image1_Quiz3_Level8_Stage3_Jawa, image2_Quiz3_Level8_Stage3_Jawa, image3_Quiz3_Level8_Stage3_Jawa, image4_Quiz3_Level8_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level8_Stage3_Jawa.id = 1
        choice1_Quiz4_Level8_Stage3_Jawa.name = "Bé"
        
        let choice2_Quiz4_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level8_Stage3_Jawa.id = 2
        choice2_Quiz4_Level8_Stage3_Jawa.name = "Nye"
        
        let choice3_Quiz4_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level8_Stage3_Jawa.id = 3
        choice3_Quiz4_Level8_Stage3_Jawa.name = "Dhip"
        
        let choice4_Quiz4_Level8_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level8_Stage3_Jawa.id = 4
        choice4_Quiz4_Level8_Stage3_Jawa.name = "Ngo"
        
        //MARK: Image
        let image1_Quiz4_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level8_Stage3_Jawa.id = 1
        image1_Quiz4_Level8_Stage3_Jawa.name = "Bé_Aksara_Jawa"
        
        let image2_Quiz4_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level8_Stage3_Jawa.id = 2
        image2_Quiz4_Level8_Stage3_Jawa.name = "Nye_Aksara_Jawa"
        
        let image3_Quiz4_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level8_Stage3_Jawa.id = 3
        image3_Quiz4_Level8_Stage3_Jawa.name = "Dhip_Aksara_Jawa"
        
        let image4_Quiz4_Level8_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level8_Stage3_Jawa.id = 4
        image4_Quiz4_Level8_Stage3_Jawa.name = "Ngo_Aksara_Jawa"
        
        let quiz4_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level8_stage3_Jawa.id = 4
        quiz4_level8_stage3_Jawa.name = "Kuis 3"
        quiz4_level8_stage3_Jawa.type = "C"
        quiz4_level8_stage3_Jawa.isCorrect = false
        quiz4_level8_stage3_Jawa.question = "Dhip"
        quiz4_level8_stage3_Jawa.choices = [choice1_Quiz4_Level8_Stage3_Jawa, choice2_Quiz4_Level8_Stage3_Jawa, choice3_Quiz4_Level8_Stage3_Jawa, choice4_Quiz4_Level8_Stage3_Jawa]
        quiz4_level8_stage3_Jawa.images = [image1_Quiz4_Level8_Stage3_Jawa, image2_Quiz4_Level8_Stage3_Jawa, image3_Quiz4_Level8_Stage3_Jawa, image4_Quiz4_Level8_Stage3_Jawa]
        
        let quiz5_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level8_stage3_Jawa.id = 5
        quiz5_level8_stage3_Jawa.name = "Kuis 4"
        quiz5_level8_stage3_Jawa.type = "D"
        quiz5_level8_stage3_Jawa.isCorrect = false
        quiz5_level8_stage3_Jawa.question = "Dhip"
        quiz5_level8_stage3_Jawa.choices = []
        quiz5_level8_stage3_Jawa.images = []
        
        let quiz6_level8_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level8_stage3_Jawa.id = 6
        quiz6_level8_stage3_Jawa.name = "Kuis 5"
        quiz6_level8_stage3_Jawa.type = "E"
        quiz6_level8_stage3_Jawa.isCorrect = false
        quiz6_level8_stage3_Jawa.question = "Dhip"
        quiz6_level8_stage3_Jawa.choices = []
        quiz6_level8_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 9 Stage 2 Jawa
        let quiz1_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level9_stage3_Jawa.id = 1
        quiz1_level9_stage3_Jawa.name = "Panduan"
        quiz1_level9_stage3_Jawa.type = "Panduan"
        quiz1_level9_stage3_Jawa.isCorrect = false
        quiz1_level9_stage3_Jawa.question = "Bro"
        quiz1_level9_stage3_Jawa.choices = []
        quiz1_level9_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level9_Stage3_Jawa.id = 1
        choice1_Quiz2_Level9_Stage3_Jawa.name = "Bré"
        
        let choice2_Quiz2_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level9_Stage3_Jawa.id = 2
        choice2_Quiz2_Level9_Stage3_Jawa.name = "Ngro"
        
        let choice3_Quiz2_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level9_Stage3_Jawa.id = 3
        choice3_Quiz2_Level9_Stage3_Jawa.name = "Ngrah"
        
        let choice4_Quiz2_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level9_Stage3_Jawa.id = 4
        choice4_Quiz2_Level9_Stage3_Jawa.name = "Bro"
        
        //MARK: Image
        let image1_Quiz2_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level9_Stage3_Jawa.id = 1
        image1_Quiz2_Level9_Stage3_Jawa.name = "Bré_Aksara_Jawa"
        
        let image2_Quiz2_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level9_Stage3_Jawa.id = 2
        image2_Quiz2_Level9_Stage3_Jawa.name = "Ngro_Aksara_Jawa"
        
        let image3_Quiz2_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level9_Stage3_Jawa.id = 3
        image3_Quiz2_Level9_Stage3_Jawa.name = "Ngrah_Aksara_Jawa"
        
        let image4_Quiz2_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level9_Stage3_Jawa.id = 4
        image4_Quiz2_Level9_Stage3_Jawa.name = "Bro_Aksara_Jawa"
        
        let quiz2_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level9_stage3_Jawa.id = 2
        quiz2_level9_stage3_Jawa.name = "Kuis 1"
        quiz2_level9_stage3_Jawa.type = "A"
        quiz2_level9_stage3_Jawa.isCorrect = false
        quiz2_level9_stage3_Jawa.question = "Bro"
        quiz2_level9_stage3_Jawa.choices = [choice1_Quiz2_Level9_Stage3_Jawa, choice2_Quiz2_Level9_Stage3_Jawa, choice3_Quiz2_Level9_Stage3_Jawa, choice4_Quiz2_Level9_Stage3_Jawa]
        quiz2_level9_stage3_Jawa.images = [image1_Quiz2_Level9_Stage3_Jawa, image2_Quiz2_Level9_Stage3_Jawa, image3_Quiz2_Level9_Stage3_Jawa, image4_Quiz2_Level9_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level9_Stage3_Jawa.id = 1
        choice1_Quiz3_Level9_Stage3_Jawa.name = "Ngrah"
        
        let choice2_Quiz3_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level9_Stage3_Jawa.id = 2
        choice2_Quiz3_Level9_Stage3_Jawa.name = "Bré"
        
        let choice3_Quiz3_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level9_Stage3_Jawa.id = 3
        choice3_Quiz3_Level9_Stage3_Jawa.name = "Bro"
        
        let choice4_Quiz3_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level9_Stage3_Jawa.id = 4
        choice4_Quiz3_Level9_Stage3_Jawa.name = "Ngro"
        
        //MARK: Image
        let image1_Quiz3_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level9_Stage3_Jawa.id = 1
        image1_Quiz3_Level9_Stage3_Jawa.name = "Ngrah_Aksara_Jawa"
        
        let image2_Quiz3_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level9_Stage3_Jawa.id = 2
        image2_Quiz3_Level9_Stage3_Jawa.name = "Bré_Aksara_Jawa"
        
        let image3_Quiz3_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level9_Stage3_Jawa.id = 3
        image3_Quiz3_Level9_Stage3_Jawa.name = "Bro_Aksara_Jawa"
        
        let image4_Quiz3_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level9_Stage3_Jawa.id = 4
        image4_Quiz3_Level9_Stage3_Jawa.name = "Ngro_Aksara_Jawa"
        
        let quiz3_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level9_stage3_Jawa.id = 3
        quiz3_level9_stage3_Jawa.name = "Kuis 2"
        quiz3_level9_stage3_Jawa.type = "B"
        quiz3_level9_stage3_Jawa.isCorrect = false
        quiz3_level9_stage3_Jawa.question = "Bro"
        quiz3_level9_stage3_Jawa.choices = [choice1_Quiz3_Level9_Stage3_Jawa, choice2_Quiz3_Level9_Stage3_Jawa, choice3_Quiz3_Level9_Stage3_Jawa, choice4_Quiz3_Level9_Stage3_Jawa]
        quiz3_level9_stage3_Jawa.images = [image1_Quiz3_Level9_Stage3_Jawa, image2_Quiz3_Level9_Stage3_Jawa, image3_Quiz3_Level9_Stage3_Jawa, image4_Quiz3_Level9_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level9_Stage3_Jawa.id = 1
        choice1_Quiz4_Level9_Stage3_Jawa.name = "Bro"
        
        let choice2_Quiz4_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level9_Stage3_Jawa.id = 2
        choice2_Quiz4_Level9_Stage3_Jawa.name = "Ngrah"
        
        let choice3_Quiz4_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level9_Stage3_Jawa.id = 3
        choice3_Quiz4_Level9_Stage3_Jawa.name = "Ngro"
        
        let choice4_Quiz4_Level9_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level9_Stage3_Jawa.id = 4
        choice4_Quiz4_Level9_Stage3_Jawa.name = "Bré"
        
        //MARK: Image
        let image1_Quiz4_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level9_Stage3_Jawa.id = 1
        image1_Quiz4_Level9_Stage3_Jawa.name = "Bro_Aksara_Jawa"
        
        let image2_Quiz4_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level9_Stage3_Jawa.id = 2
        image2_Quiz4_Level9_Stage3_Jawa.name = "Ngrah_Aksara_Jawa"
        
        let image3_Quiz4_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level9_Stage3_Jawa.id = 3
        image3_Quiz4_Level9_Stage3_Jawa.name = "Ngro_Aksara_Jawa"
        
        let image4_Quiz4_Level9_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level9_Stage3_Jawa.id = 4
        image4_Quiz4_Level9_Stage3_Jawa.name = "Bré_Aksara_Jawa"
        
        let quiz4_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level9_stage3_Jawa.id = 4
        quiz4_level9_stage3_Jawa.name = "Kuis 3"
        quiz4_level9_stage3_Jawa.type = "C"
        quiz4_level9_stage3_Jawa.isCorrect = false
        quiz4_level9_stage3_Jawa.question = "Bro"
        quiz4_level9_stage3_Jawa.choices = [choice1_Quiz4_Level9_Stage3_Jawa, choice2_Quiz4_Level9_Stage3_Jawa, choice3_Quiz4_Level9_Stage3_Jawa, choice4_Quiz4_Level9_Stage3_Jawa]
        quiz4_level9_stage3_Jawa.images = [image1_Quiz4_Level9_Stage3_Jawa, image2_Quiz4_Level9_Stage3_Jawa, image3_Quiz4_Level9_Stage3_Jawa, image4_Quiz4_Level9_Stage3_Jawa]
        
        let quiz5_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level9_stage3_Jawa.id = 5
        quiz5_level9_stage3_Jawa.name = "Kuis 4"
        quiz5_level9_stage3_Jawa.type = "D"
        quiz5_level9_stage3_Jawa.isCorrect = false
        quiz5_level9_stage3_Jawa.question = "Bro"
        quiz5_level9_stage3_Jawa.choices = []
        quiz5_level9_stage3_Jawa.images = []
        
        let quiz6_level9_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level9_stage3_Jawa.id = 6
        quiz6_level9_stage3_Jawa.name = "Kuis 5"
        quiz6_level9_stage3_Jawa.type = "E"
        quiz6_level9_stage3_Jawa.isCorrect = false
        quiz6_level9_stage3_Jawa.question = "Bro"
        quiz6_level9_stage3_Jawa.choices = []
        quiz6_level9_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 10 Stage 3 Jawa
        let quiz1_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level10_stage3_Jawa.id = 1
        quiz1_level10_stage3_Jawa.name = "Panduan"
        quiz1_level10_stage3_Jawa.type = "Panduan"
        quiz1_level10_stage3_Jawa.isCorrect = false
        quiz1_level10_stage3_Jawa.question = "Pyu"
        quiz1_level10_stage3_Jawa.choices = []
        quiz1_level10_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level10_Stage3_Jawa.id = 1
        choice1_Quiz2_Level10_Stage3_Jawa.name = "Yo"
        
        let choice2_Quiz2_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level10_Stage3_Jawa.id = 2
        choice2_Quiz2_Level10_Stage3_Jawa.name = "Pyu"
        
        let choice3_Quiz2_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level10_Stage3_Jawa.id = 3
        choice3_Quiz2_Level10_Stage3_Jawa.name = "Pah"
        
        let choice4_Quiz2_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level10_Stage3_Jawa.id = 4
        choice4_Quiz2_Level10_Stage3_Jawa.name = "Po"
        
        //MARK: Image
        let image1_Quiz2_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level10_Stage3_Jawa.id = 1
        image1_Quiz2_Level10_Stage3_Jawa.name = "Yo_Aksara_Jawa"
        
        let image2_Quiz2_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level10_Stage3_Jawa.id = 2
        image2_Quiz2_Level10_Stage3_Jawa.name = "Pyu_Aksara_Jawa"
        
        let image3_Quiz2_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level10_Stage3_Jawa.id = 3
        image3_Quiz2_Level10_Stage3_Jawa.name = "Pah_Aksara_Jawa"
        
        let image4_Quiz2_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level10_Stage3_Jawa.id = 4
        image4_Quiz2_Level10_Stage3_Jawa.name = "Po_Aksara_Jawa"
        
        let quiz2_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level10_stage3_Jawa.id = 2
        quiz2_level10_stage3_Jawa.name = "Kuis 1"
        quiz2_level10_stage3_Jawa.type = "A"
        quiz2_level10_stage3_Jawa.isCorrect = false
        quiz2_level10_stage3_Jawa.question = "Pyu"
        quiz2_level10_stage3_Jawa.choices = [choice1_Quiz2_Level10_Stage3_Jawa, choice2_Quiz2_Level10_Stage3_Jawa, choice3_Quiz2_Level10_Stage3_Jawa, choice4_Quiz2_Level10_Stage3_Jawa]
        quiz2_level10_stage3_Jawa.images = [image1_Quiz2_Level10_Stage3_Jawa, image2_Quiz2_Level10_Stage3_Jawa, image3_Quiz2_Level10_Stage3_Jawa, image4_Quiz2_Level10_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level10_Stage3_Jawa.id = 1
        choice1_Quiz3_Level10_Stage3_Jawa.name = "Pah"
        
        let choice2_Quiz3_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level10_Stage3_Jawa.id = 2
        choice2_Quiz3_Level10_Stage3_Jawa.name = "Pyu"
        
        let choice3_Quiz3_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level10_Stage3_Jawa.id = 3
        choice3_Quiz3_Level10_Stage3_Jawa.name = "Gah"
        
        let choice4_Quiz3_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level10_Stage3_Jawa.id = 4
        choice4_Quiz3_Level10_Stage3_Jawa.name = "Po"
        
        //MARK: Image
        let image1_Quiz3_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level10_Stage3_Jawa.id = 1
        image1_Quiz3_Level10_Stage3_Jawa.name = "Pah_Aksara_Jawa"
        
        let image2_Quiz3_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level10_Stage3_Jawa.id = 2
        image2_Quiz3_Level10_Stage3_Jawa.name = "Pyu_Aksara_Jawa"
        
        let image3_Quiz3_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level10_Stage3_Jawa.id = 3
        image3_Quiz3_Level10_Stage3_Jawa.name = "Gah_Aksara_Jawa"
        
        let image4_Quiz3_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level10_Stage3_Jawa.id = 4
        image4_Quiz3_Level10_Stage3_Jawa.name = "Po_Aksara_Jawa"
        
        let quiz3_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level10_stage3_Jawa.id = 3
        quiz3_level10_stage3_Jawa.name = "Kuis 2"
        quiz3_level10_stage3_Jawa.type = "B"
        quiz3_level10_stage3_Jawa.isCorrect = false
        quiz3_level10_stage3_Jawa.question = "Pyu"
        quiz3_level10_stage3_Jawa.choices = [choice1_Quiz3_Level10_Stage3_Jawa, choice2_Quiz3_Level10_Stage3_Jawa, choice3_Quiz3_Level10_Stage3_Jawa, choice4_Quiz3_Level10_Stage3_Jawa]
        quiz3_level10_stage3_Jawa.images = [image1_Quiz3_Level10_Stage3_Jawa, image2_Quiz3_Level10_Stage3_Jawa, image3_Quiz3_Level10_Stage3_Jawa, image4_Quiz3_Level10_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level10_Stage3_Jawa.id = 1
        choice1_Quiz4_Level10_Stage3_Jawa.name = "Pah"
        
        let choice2_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level10_Stage3_Jawa.id = 2
        choice2_Quiz4_Level10_Stage3_Jawa.name = "Gah"
        
        let choice3_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level10_Stage3_Jawa.id = 3
        choice3_Quiz4_Level10_Stage3_Jawa.name = "Pyu"
        
        let choice4_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level10_Stage3_Jawa.id = 4
        choice4_Quiz4_Level10_Stage3_Jawa.name = "Yo"
        
        //MARK: Image
        let image1_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level10_Stage3_Jawa.id = 1
        image1_Quiz4_Level10_Stage3_Jawa.name = "Pah_Aksara_Jawa"
        
        let image2_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level10_Stage3_Jawa.id = 2
        image2_Quiz4_Level10_Stage3_Jawa.name = "Gah_Aksara_Jawa"
        
        let image3_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level10_Stage3_Jawa.id = 3
        image3_Quiz4_Level10_Stage3_Jawa.name = "Pyu_Aksara_Jawa"
        
        let image4_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level10_Stage3_Jawa.id = 4
        image4_Quiz4_Level10_Stage3_Jawa.name = "Yo_Aksara_Jawa"
        
        let quiz4_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level10_stage3_Jawa.id = 4
        quiz4_level10_stage3_Jawa.name = "Kuis 3"
        quiz4_level10_stage3_Jawa.type = "C"
        quiz4_level10_stage3_Jawa.isCorrect = false
        quiz4_level10_stage3_Jawa.question = "Pyu"
        quiz4_level10_stage3_Jawa.choices = [choice1_Quiz4_Level10_Stage3_Jawa, choice2_Quiz4_Level10_Stage3_Jawa, choice3_Quiz4_Level10_Stage3_Jawa, choice4_Quiz4_Level10_Stage3_Jawa]
        quiz4_level10_stage3_Jawa.images = [image1_Quiz4_Level10_Stage3_Jawa, image2_Quiz4_Level10_Stage3_Jawa, image3_Quiz4_Level10_Stage3_Jawa, image4_Quiz4_Level10_Stage3_Jawa]
        
        let quiz5_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level10_stage3_Jawa.id = 5
        quiz5_level10_stage3_Jawa.name = "Kuis 4"
        quiz5_level10_stage3_Jawa.type = "D"
        quiz5_level10_stage3_Jawa.isCorrect = false
        quiz5_level10_stage3_Jawa.question = "Pyu"
        quiz5_level10_stage3_Jawa.choices = []
        quiz5_level10_stage3_Jawa.images = []
        
        let quiz6_level10_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level10_stage3_Jawa.id = 6
        quiz6_level10_stage3_Jawa.name = "Kuis 5"
        quiz6_level10_stage3_Jawa.type = "E"
        quiz6_level10_stage3_Jawa.isCorrect = false
        quiz6_level10_stage3_Jawa.question = "Pyu"
        quiz6_level10_stage3_Jawa.choices = []
        quiz6_level10_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 11 Stage 3 Jawa
        let quiz1_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level11_stage3_Jawa.id = 1
        quiz1_level11_stage3_Jawa.name = "Panduan"
        quiz1_level11_stage3_Jawa.type = "Panduan"
        quiz1_level11_stage3_Jawa.isCorrect = false
        quiz1_level11_stage3_Jawa.question = "Ngeh"
        quiz1_level11_stage3_Jawa.choices = []
        quiz1_level11_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level11_Stage3_Jawa.id = 1
        choice1_Quiz2_Level11_Stage3_Jawa.name = "Ngih"
        
        let choice2_Quiz2_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level11_Stage3_Jawa.id = 2
        choice2_Quiz2_Level11_Stage3_Jawa.name = "Beh"
        
        let choice3_Quiz2_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level11_Stage3_Jawa.id = 3
        choice3_Quiz2_Level11_Stage3_Jawa.name = "Ngeh"
        
        let choice4_Quiz2_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level11_Stage3_Jawa.id = 4
        choice4_Quiz2_Level11_Stage3_Jawa.name = "Bih"
        
        //MARK: Image
        let image1_Quiz2_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level11_Stage3_Jawa.id = 1
        image1_Quiz2_Level11_Stage3_Jawa.name = "Ngih_Aksara_Jawa"
        
        let image2_Quiz2_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level11_Stage3_Jawa.id = 2
        image2_Quiz2_Level11_Stage3_Jawa.name = "Beh_Aksara_Jawa"
        
        let image3_Quiz2_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level11_Stage3_Jawa.id = 3
        image3_Quiz2_Level11_Stage3_Jawa.name = "Ngeh_Aksara_Jawa"
        
        let image4_Quiz2_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level11_Stage3_Jawa.id = 4
        image4_Quiz2_Level11_Stage3_Jawa.name = "Bih_Aksara_Jawa"
        
        let quiz2_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level11_stage3_Jawa.id = 2
        quiz2_level11_stage3_Jawa.name = "Kuis 1"
        quiz2_level11_stage3_Jawa.type = "A"
        quiz2_level11_stage3_Jawa.isCorrect = false
        quiz2_level11_stage3_Jawa.question = "Ngeh"
        quiz2_level11_stage3_Jawa.choices = [choice1_Quiz2_Level11_Stage3_Jawa, choice2_Quiz2_Level11_Stage3_Jawa, choice3_Quiz2_Level11_Stage3_Jawa, choice4_Quiz2_Level11_Stage3_Jawa]
        quiz2_level11_stage3_Jawa.images = [image1_Quiz2_Level11_Stage3_Jawa, image2_Quiz2_Level11_Stage3_Jawa, image3_Quiz2_Level11_Stage3_Jawa, image4_Quiz2_Level11_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level11_Stage3_Jawa.id = 1
        choice1_Quiz3_Level11_Stage3_Jawa.name = "Bih"
        
        let choice2_Quiz3_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level11_Stage3_Jawa.id = 2
        choice2_Quiz3_Level11_Stage3_Jawa.name = "Ngih"
        
        let choice3_Quiz3_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level11_Stage3_Jawa.id = 3
        choice3_Quiz3_Level11_Stage3_Jawa.name = "Beh"
        
        let choice4_Quiz3_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level11_Stage3_Jawa.id = 4
        choice4_Quiz3_Level11_Stage3_Jawa.name = "Ngeh"
        
        //MARK: Image
        let image1_Quiz3_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level11_Stage3_Jawa.id = 1
        image1_Quiz3_Level11_Stage3_Jawa.name = "Bih_Aksara_Jawa"
        
        let image2_Quiz3_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level11_Stage3_Jawa.id = 2
        image2_Quiz3_Level11_Stage3_Jawa.name = "Ngih_Aksara_Jawa"
        
        let image3_Quiz3_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level11_Stage3_Jawa.id = 3
        image3_Quiz3_Level11_Stage3_Jawa.name = "Beh_Aksara_Jawa"
        
        let image4_Quiz3_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level11_Stage3_Jawa.id = 4
        image4_Quiz3_Level11_Stage3_Jawa.name = "Ngeh_Aksara_Jawa"
        
        let quiz3_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level11_stage3_Jawa.id = 3
        quiz3_level11_stage3_Jawa.name = "Kuis 2"
        quiz3_level11_stage3_Jawa.type = "B"
        quiz3_level11_stage3_Jawa.isCorrect = false
        quiz3_level11_stage3_Jawa.question = "Ngeh"
        quiz3_level11_stage3_Jawa.choices = [choice1_Quiz3_Level11_Stage3_Jawa, choice2_Quiz3_Level11_Stage3_Jawa, choice3_Quiz3_Level11_Stage3_Jawa, choice4_Quiz3_Level11_Stage3_Jawa]
        quiz3_level11_stage3_Jawa.images = [image1_Quiz3_Level11_Stage3_Jawa, image2_Quiz3_Level11_Stage3_Jawa, image3_Quiz3_Level11_Stage3_Jawa, image4_Quiz3_Level11_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level11_Stage3_Jawa.id = 1
        choice1_Quiz4_Level11_Stage3_Jawa.name = "Beh"
        
        let choice2_Quiz4_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level11_Stage3_Jawa.id = 2
        choice2_Quiz4_Level11_Stage3_Jawa.name = "Ngeh"
        
        let choice3_Quiz4_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level11_Stage3_Jawa.id = 3
        choice3_Quiz4_Level11_Stage3_Jawa.name = "Bih"
        
        let choice4_Quiz4_Level11_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level11_Stage3_Jawa.id = 4
        choice4_Quiz4_Level11_Stage3_Jawa.name = "Ngih"
        
        //MARK: Image
        let image1_Quiz4_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level11_Stage3_Jawa.id = 1
        image1_Quiz4_Level11_Stage3_Jawa.name = "Beh_Aksara_Jawa"
        
        let image2_Quiz4_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level11_Stage3_Jawa.id = 2
        image2_Quiz4_Level11_Stage3_Jawa.name = "Ngeh_Aksara_Jawa"
        
        let image3_Quiz4_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level11_Stage3_Jawa.id = 3
        image3_Quiz4_Level11_Stage3_Jawa.name = "Bih_Aksara_Jawa"
        
        let image4_Quiz4_Level11_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level11_Stage3_Jawa.id = 4
        image4_Quiz4_Level11_Stage3_Jawa.name = "Ngih_Aksara_Jawa"
        
        let quiz4_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level11_stage3_Jawa.id = 4
        quiz4_level11_stage3_Jawa.name = "Kuis 3"
        quiz4_level11_stage3_Jawa.type = "C"
        quiz4_level11_stage3_Jawa.isCorrect = false
        quiz4_level11_stage3_Jawa.question = "Ngeh"
        quiz4_level11_stage3_Jawa.choices = [choice1_Quiz4_Level11_Stage3_Jawa, choice2_Quiz4_Level11_Stage3_Jawa, choice3_Quiz4_Level11_Stage3_Jawa, choice4_Quiz4_Level11_Stage3_Jawa]
        quiz4_level11_stage3_Jawa.images = [image1_Quiz4_Level11_Stage3_Jawa, image2_Quiz4_Level11_Stage3_Jawa, image3_Quiz4_Level11_Stage3_Jawa, image4_Quiz4_Level11_Stage3_Jawa]
        
        let quiz5_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level11_stage3_Jawa.id = 5
        quiz5_level11_stage3_Jawa.name = "Kuis 4"
        quiz5_level11_stage3_Jawa.type = "D"
        quiz5_level11_stage3_Jawa.isCorrect = false
        quiz5_level11_stage3_Jawa.question = "Ngeh"
        quiz5_level11_stage3_Jawa.choices = []
        quiz5_level11_stage3_Jawa.images = []
        
        let quiz6_level11_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level11_stage3_Jawa.id = 6
        quiz6_level11_stage3_Jawa.name = "Kuis 5"
        quiz6_level11_stage3_Jawa.type = "E"
        quiz6_level11_stage3_Jawa.isCorrect = false
        quiz6_level11_stage3_Jawa.question = "Ngeh"
        quiz6_level11_stage3_Jawa.choices = []
        quiz6_level11_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 12 Stage 3 Jawa
        let quiz1_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level12_stage3_Jawa.id = 1
        quiz1_level12_stage3_Jawa.name = "Panduan"
        quiz1_level12_stage3_Jawa.type = "Panduan"
        quiz1_level12_stage3_Jawa.isCorrect = false
        quiz1_level12_stage3_Jawa.question = "Rém"
        quiz1_level12_stage3_Jawa.choices = []
        quiz1_level12_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level12_Stage3_Jawa.id = 1
        choice1_Quiz2_Level12_Stage3_Jawa.name = "Gém"
        
        let choice2_Quiz2_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level12_Stage3_Jawa.id = 2
        choice2_Quiz2_Level12_Stage3_Jawa.name = "Red"
        
        let choice3_Quiz2_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level12_Stage3_Jawa.id = 3
        choice3_Quiz2_Level12_Stage3_Jawa.name = "Ted"
        
        let choice4_Quiz2_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level12_Stage3_Jawa.id = 4
        choice4_Quiz2_Level12_Stage3_Jawa.name = "Rém"
        
        //MARK: Image
        let image1_Quiz2_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level12_Stage3_Jawa.id = 1
        image1_Quiz2_Level12_Stage3_Jawa.name = "Gém_Aksara_Jawa"
        
        let image2_Quiz2_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level12_Stage3_Jawa.id = 2
        image2_Quiz2_Level12_Stage3_Jawa.name = "Red_Aksara_Jawa"
        
        let image3_Quiz2_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level12_Stage3_Jawa.id = 3
        image3_Quiz2_Level12_Stage3_Jawa.name = "Ted_Aksara_Jawa"
        
        let image4_Quiz2_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level12_Stage3_Jawa.id = 4
        image4_Quiz2_Level12_Stage3_Jawa.name = "Rém_Aksara_Jawa"
        
        let quiz2_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level12_stage3_Jawa.id = 2
        quiz2_level12_stage3_Jawa.name = "Kuis 1"
        quiz2_level12_stage3_Jawa.type = "A"
        quiz2_level12_stage3_Jawa.isCorrect = false
        quiz2_level12_stage3_Jawa.question = "Rém"
        quiz2_level12_stage3_Jawa.choices = [choice1_Quiz2_Level12_Stage3_Jawa, choice2_Quiz2_Level12_Stage3_Jawa, choice3_Quiz2_Level12_Stage3_Jawa, choice4_Quiz2_Level12_Stage3_Jawa]
        quiz2_level12_stage3_Jawa.images = [image1_Quiz2_Level12_Stage3_Jawa, image2_Quiz2_Level12_Stage3_Jawa, image3_Quiz2_Level12_Stage3_Jawa, image4_Quiz2_Level12_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level12_Stage3_Jawa.id = 1
        choice1_Quiz3_Level12_Stage3_Jawa.name = "Rém"
        
        let choice2_Quiz3_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level12_Stage3_Jawa.id = 2
        choice2_Quiz3_Level12_Stage3_Jawa.name = "Ted"
        
        let choice3_Quiz3_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level12_Stage3_Jawa.id = 3
        choice3_Quiz3_Level12_Stage3_Jawa.name = "Gém"
        
        let choice4_Quiz3_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level12_Stage3_Jawa.id = 4
        choice4_Quiz3_Level12_Stage3_Jawa.name = "Red"
        
        //MARK: Image
        let image1_Quiz3_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level12_Stage3_Jawa.id = 1
        image1_Quiz3_Level12_Stage3_Jawa.name = "Rém_Aksara_Jawa"
        
        let image2_Quiz3_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level12_Stage3_Jawa.id = 2
        image2_Quiz3_Level12_Stage3_Jawa.name = "Ted_Aksara_Jawa"
        
        let image3_Quiz3_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level12_Stage3_Jawa.id = 3
        image3_Quiz3_Level12_Stage3_Jawa.name = "Gém_Aksara_Jawa"
        
        let image4_Quiz3_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level12_Stage3_Jawa.id = 4
        image4_Quiz3_Level12_Stage3_Jawa.name = "Red_Aksara_Jawa"
        
        let quiz3_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level12_stage3_Jawa.id = 3
        quiz3_level12_stage3_Jawa.name = "Kuis 2"
        quiz3_level12_stage3_Jawa.type = "B"
        quiz3_level12_stage3_Jawa.isCorrect = false
        quiz3_level12_stage3_Jawa.question = "Rém"
        quiz3_level12_stage3_Jawa.choices = [choice1_Quiz3_Level12_Stage3_Jawa, choice2_Quiz3_Level12_Stage3_Jawa, choice3_Quiz3_Level12_Stage3_Jawa, choice4_Quiz3_Level12_Stage3_Jawa]
        quiz3_level12_stage3_Jawa.images = [image1_Quiz3_Level12_Stage3_Jawa, image2_Quiz3_Level12_Stage3_Jawa, image3_Quiz3_Level12_Stage3_Jawa, image4_Quiz3_Level12_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level12_Stage3_Jawa.id = 1
        choice1_Quiz4_Level12_Stage3_Jawa.name = "Red"
        
        let choice2_Quiz4_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level12_Stage3_Jawa.id = 2
        choice2_Quiz4_Level12_Stage3_Jawa.name = "Gém"
        
        let choice3_Quiz4_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level12_Stage3_Jawa.id = 3
        choice3_Quiz4_Level12_Stage3_Jawa.name = "Ted"
        
        let choice4_Quiz4_Level12_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level12_Stage3_Jawa.id = 4
        choice4_Quiz4_Level12_Stage3_Jawa.name = "Rém"
        
        //MARK: Image
        let image1_Quiz4_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level12_Stage3_Jawa.id = 1
        image1_Quiz4_Level12_Stage3_Jawa.name = "Red_Aksara_Jawa"
        
        let image2_Quiz4_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level12_Stage3_Jawa.id = 2
        image2_Quiz4_Level12_Stage3_Jawa.name = "Gém_Aksara_Jawa"
        
        let image3_Quiz4_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level12_Stage3_Jawa.id = 3
        image3_Quiz4_Level12_Stage3_Jawa.name = "Ted_Aksara_Jawa"
        
        let image4_Quiz4_Level12_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level12_Stage3_Jawa.id = 4
        image4_Quiz4_Level12_Stage3_Jawa.name = "Rém_Aksara_Jawa"
        
        let quiz4_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level12_stage3_Jawa.id = 4
        quiz4_level12_stage3_Jawa.name = "Kuis 3"
        quiz4_level12_stage3_Jawa.type = "C"
        quiz4_level12_stage3_Jawa.isCorrect = false
        quiz4_level12_stage3_Jawa.question = "Rém"
        quiz4_level12_stage3_Jawa.choices = [choice1_Quiz4_Level12_Stage3_Jawa, choice2_Quiz4_Level12_Stage3_Jawa, choice3_Quiz4_Level12_Stage3_Jawa, choice4_Quiz4_Level12_Stage3_Jawa]
        quiz4_level12_stage3_Jawa.images = [image1_Quiz4_Level12_Stage3_Jawa, image2_Quiz4_Level12_Stage3_Jawa, image3_Quiz4_Level12_Stage3_Jawa, image4_Quiz4_Level12_Stage3_Jawa]
        
        let quiz5_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level12_stage3_Jawa.id = 5
        quiz5_level12_stage3_Jawa.name = "Kuis 4"
        quiz5_level12_stage3_Jawa.type = "D"
        quiz5_level12_stage3_Jawa.isCorrect = false
        quiz5_level12_stage3_Jawa.question = "Rém"
        quiz5_level12_stage3_Jawa.choices = []
        quiz5_level12_stage3_Jawa.images = []
        
        let quiz6_level12_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level12_stage3_Jawa.id = 6
        quiz6_level12_stage3_Jawa.name = "Kuis 5"
        quiz6_level12_stage3_Jawa.type = "E"
        quiz6_level12_stage3_Jawa.isCorrect = false
        quiz6_level12_stage3_Jawa.question = "Rém"
        quiz6_level12_stage3_Jawa.choices = []
        quiz6_level12_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 13 Stage 3 Jawa
        let quiz1_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level13_stage3_Jawa.id = 1
        quiz1_level13_stage3_Jawa.name = "Panduan"
        quiz1_level13_stage3_Jawa.type = "Panduan"
        quiz1_level13_stage3_Jawa.isCorrect = false
        quiz1_level13_stage3_Jawa.question = "Thing"
        quiz1_level13_stage3_Jawa.choices = []
        quiz1_level13_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level13_Stage3_Jawa.id = 1
        choice1_Quiz2_Level13_Stage3_Jawa.name = "Thing"
        
        let choice2_Quiz2_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level13_Stage3_Jawa.id = 2
        choice2_Quiz2_Level13_Stage3_Jawa.name = "Thir"
        
        let choice3_Quiz2_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level13_Stage3_Jawa.id = 3
        choice3_Quiz2_Level13_Stage3_Jawa.name = "Nging"
        
        let choice4_Quiz2_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level13_Stage3_Jawa.id = 4
        choice4_Quiz2_Level13_Stage3_Jawa.name = "Ngir"
        
        //MARK: Image
        let image1_Quiz2_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level13_Stage3_Jawa.id = 1
        image1_Quiz2_Level13_Stage3_Jawa.name = "Thing_Aksara_Jawa"
        
        let image2_Quiz2_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level13_Stage3_Jawa.id = 2
        image2_Quiz2_Level13_Stage3_Jawa.name = "Thir_Aksara_Jawa"
        
        let image3_Quiz2_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level13_Stage3_Jawa.id = 3
        image3_Quiz2_Level13_Stage3_Jawa.name = "Nging_Aksara_Jawa"
        
        let image4_Quiz2_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level13_Stage3_Jawa.id = 4
        image4_Quiz2_Level13_Stage3_Jawa.name = "Ngir_Aksara_Jawa"
        
        let quiz2_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level13_stage3_Jawa.id = 2
        quiz2_level13_stage3_Jawa.name = "Kuis 1"
        quiz2_level13_stage3_Jawa.type = "A"
        quiz2_level13_stage3_Jawa.isCorrect = false
        quiz2_level13_stage3_Jawa.question = "Thing"
        quiz2_level13_stage3_Jawa.choices = [choice1_Quiz2_Level13_Stage3_Jawa, choice2_Quiz2_Level13_Stage3_Jawa, choice3_Quiz2_Level13_Stage3_Jawa, choice4_Quiz2_Level13_Stage3_Jawa]
        quiz2_level13_stage3_Jawa.images = [image1_Quiz2_Level13_Stage3_Jawa, image2_Quiz2_Level13_Stage3_Jawa, image3_Quiz2_Level13_Stage3_Jawa, image4_Quiz2_Level13_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level13_Stage3_Jawa.id = 1
        choice1_Quiz3_Level13_Stage3_Jawa.name = "Thir"
        
        let choice2_Quiz3_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level13_Stage3_Jawa.id = 2
        choice2_Quiz3_Level13_Stage3_Jawa.name = "Ngir"
        
        let choice3_Quiz3_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level13_Stage3_Jawa.id = 3
        choice3_Quiz3_Level13_Stage3_Jawa.name = "Thing"
        
        let choice4_Quiz3_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level13_Stage3_Jawa.id = 4
        choice4_Quiz3_Level13_Stage3_Jawa.name = "Nging"
        
        //MARK: Image
        let image1_Quiz3_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level13_Stage3_Jawa.id = 1
        image1_Quiz3_Level13_Stage3_Jawa.name = "Thir_Aksara_Jawa"
        
        let image2_Quiz3_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level13_Stage3_Jawa.id = 2
        image2_Quiz3_Level13_Stage3_Jawa.name = "Ngir_Aksara_Jawa"
        
        let image3_Quiz3_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level13_Stage3_Jawa.id = 3
        image3_Quiz3_Level13_Stage3_Jawa.name = "Thing_Aksara_Jawa"
        
        let image4_Quiz3_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level13_Stage3_Jawa.id = 4
        image4_Quiz3_Level13_Stage3_Jawa.name = "Nging_Aksara_Jawa"
        
        let quiz3_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level13_stage3_Jawa.id = 3
        quiz3_level13_stage3_Jawa.name = "Kuis 2"
        quiz3_level13_stage3_Jawa.type = "B"
        quiz3_level13_stage3_Jawa.isCorrect = false
        quiz3_level13_stage3_Jawa.question = "Thing"
        quiz3_level13_stage3_Jawa.choices = [choice1_Quiz3_Level13_Stage3_Jawa, choice2_Quiz3_Level13_Stage3_Jawa, choice3_Quiz3_Level13_Stage3_Jawa, choice4_Quiz3_Level13_Stage3_Jawa]
        quiz3_level13_stage3_Jawa.images = [image1_Quiz3_Level13_Stage3_Jawa, image2_Quiz3_Level13_Stage3_Jawa, image3_Quiz3_Level13_Stage3_Jawa, image4_Quiz3_Level13_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level13_Stage3_Jawa.id = 1
        choice1_Quiz4_Level13_Stage3_Jawa.name = "Thing"
        
        let choice2_Quiz4_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level13_Stage3_Jawa.id = 2
        choice2_Quiz4_Level13_Stage3_Jawa.name = "Nging"
        
        let choice3_Quiz4_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level13_Stage3_Jawa.id = 3
        choice3_Quiz4_Level13_Stage3_Jawa.name = "Ngir"
        
        let choice4_Quiz4_Level13_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level13_Stage3_Jawa.id = 4
        choice4_Quiz4_Level13_Stage3_Jawa.name = "Thir"
        
        //MARK: Image
        let image1_Quiz4_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level13_Stage3_Jawa.id = 1
        image1_Quiz4_Level13_Stage3_Jawa.name = "Thing_Aksara_Jawa"
        
        let image2_Quiz4_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level13_Stage3_Jawa.id = 2
        image2_Quiz4_Level13_Stage3_Jawa.name = "Nging_Aksara_Jawa"
        
        let image3_Quiz4_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level13_Stage3_Jawa.id = 3
        image3_Quiz4_Level13_Stage3_Jawa.name = "Ngir_Aksara_Jawa"
        
        let image4_Quiz4_Level13_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level13_Stage3_Jawa.id = 4
        image4_Quiz4_Level13_Stage3_Jawa.name = "Thir_Aksara_Jawa"
        
        let quiz4_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level13_stage3_Jawa.id = 4
        quiz4_level13_stage3_Jawa.name = "Kuis 3"
        quiz4_level13_stage3_Jawa.type = "C"
        quiz4_level13_stage3_Jawa.isCorrect = false
        quiz4_level13_stage3_Jawa.question = "Thing"
        quiz4_level13_stage3_Jawa.choices = [choice1_Quiz4_Level13_Stage3_Jawa, choice2_Quiz4_Level13_Stage3_Jawa, choice3_Quiz4_Level13_Stage3_Jawa, choice4_Quiz4_Level13_Stage3_Jawa]
        quiz4_level13_stage3_Jawa.images = [image1_Quiz4_Level13_Stage3_Jawa, image2_Quiz4_Level13_Stage3_Jawa, image3_Quiz4_Level13_Stage3_Jawa, image4_Quiz4_Level13_Stage3_Jawa]
        
        let quiz5_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level13_stage3_Jawa.id = 5
        quiz5_level13_stage3_Jawa.name = "Kuis 4"
        quiz5_level13_stage3_Jawa.type = "D"
        quiz5_level13_stage3_Jawa.isCorrect = false
        quiz5_level13_stage3_Jawa.question = "Thing"
        quiz5_level13_stage3_Jawa.choices = []
        quiz5_level13_stage3_Jawa.images = []
        
        let quiz6_level13_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level13_stage3_Jawa.id = 6
        quiz6_level13_stage3_Jawa.name = "Kuis 5"
        quiz6_level13_stage3_Jawa.type = "E"
        quiz6_level13_stage3_Jawa.isCorrect = false
        quiz6_level13_stage3_Jawa.question = "Thing"
        quiz6_level13_stage3_Jawa.choices = []
        quiz6_level13_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 14 Stage 3 Jawa
        let quiz1_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level14_stage3_Jawa.id = 1
        quiz1_level14_stage3_Jawa.name = "Panduan"
        quiz1_level14_stage3_Jawa.type = "Panduan"
        quiz1_level14_stage3_Jawa.isCorrect = false
        quiz1_level14_stage3_Jawa.question = "Nyer"
        quiz1_level14_stage3_Jawa.choices = []
        quiz1_level14_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level14_Stage3_Jawa.id = 1
        choice1_Quiz2_Level14_Stage3_Jawa.name = "Thad"
        
        let choice2_Quiz2_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level14_Stage3_Jawa.id = 2
        choice2_Quiz2_Level14_Stage3_Jawa.name = "Nyer"
        
        let choice3_Quiz2_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level14_Stage3_Jawa.id = 3
        choice3_Quiz2_Level14_Stage3_Jawa.name = "Ngan"
        
        let choice4_Quiz2_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level14_Stage3_Jawa.id = 4
        choice4_Quiz2_Level14_Stage3_Jawa.name = "Ngad"
        
        //MARK: Image
        let image1_Quiz2_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level14_Stage3_Jawa.id = 1
        image1_Quiz2_Level14_Stage3_Jawa.name = "Thad_Aksara_Jawa"
        
        let image2_Quiz2_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level14_Stage3_Jawa.id = 2
        image2_Quiz2_Level14_Stage3_Jawa.name = "Nyer_Aksara_Jawa"
        
        let image3_Quiz2_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level14_Stage3_Jawa.id = 3
        image3_Quiz2_Level14_Stage3_Jawa.name = "Ngan_Aksara_Jawa"
        
        let image4_Quiz2_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level14_Stage3_Jawa.id = 4
        image4_Quiz2_Level14_Stage3_Jawa.name = "Ngad_Aksara_Jawa"
        
        let quiz2_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level14_stage3_Jawa.id = 2
        quiz2_level14_stage3_Jawa.name = "Kuis 1"
        quiz2_level14_stage3_Jawa.type = "A"
        quiz2_level14_stage3_Jawa.isCorrect = false
        quiz2_level14_stage3_Jawa.question = "Nyer"
        quiz2_level14_stage3_Jawa.choices = [choice1_Quiz2_Level14_Stage3_Jawa, choice2_Quiz2_Level14_Stage3_Jawa, choice3_Quiz2_Level14_Stage3_Jawa, choice4_Quiz2_Level14_Stage3_Jawa]
        quiz2_level14_stage3_Jawa.images = [image1_Quiz2_Level14_Stage3_Jawa, image2_Quiz2_Level14_Stage3_Jawa, image3_Quiz2_Level14_Stage3_Jawa, image4_Quiz2_Level14_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level14_Stage3_Jawa.id = 1
        choice1_Quiz3_Level14_Stage3_Jawa.name = "Ngad"
        
        let choice2_Quiz3_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level14_Stage3_Jawa.id = 2
        choice2_Quiz3_Level14_Stage3_Jawa.name = "Ngan"
        
        let choice3_Quiz3_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level14_Stage3_Jawa.id = 3
        choice3_Quiz3_Level14_Stage3_Jawa.name = "Thad"
        
        let choice4_Quiz3_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level14_Stage3_Jawa.id = 4
        choice4_Quiz3_Level14_Stage3_Jawa.name = "Nyer"
        
        //MARK: Image
        let image1_Quiz3_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level14_Stage3_Jawa.id = 1
        image1_Quiz3_Level14_Stage3_Jawa.name = "Ngad_Aksara_Jawa"
        
        let image2_Quiz3_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level14_Stage3_Jawa.id = 2
        image2_Quiz3_Level14_Stage3_Jawa.name = "Ngan_Aksara_Jawa"
        
        let image3_Quiz3_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level14_Stage3_Jawa.id = 3
        image3_Quiz3_Level14_Stage3_Jawa.name = "Thad_Aksara_Jawa"
        
        let image4_Quiz3_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level14_Stage3_Jawa.id = 4
        image4_Quiz3_Level14_Stage3_Jawa.name = "Nyer_Aksara_Jawa"
        
        let quiz3_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage3_Jawa.id = 3
        quiz3_level14_stage3_Jawa.name = "Kuis 2"
        quiz3_level14_stage3_Jawa.type = "B"
        quiz3_level14_stage3_Jawa.isCorrect = false
        quiz3_level14_stage3_Jawa.question = "Nyer"
        quiz3_level14_stage3_Jawa.choices = [choice1_Quiz3_Level14_Stage3_Jawa, choice2_Quiz3_Level14_Stage3_Jawa, choice3_Quiz3_Level14_Stage3_Jawa, choice4_Quiz3_Level14_Stage3_Jawa]
        quiz3_level14_stage3_Jawa.images = [image1_Quiz3_Level14_Stage3_Jawa, image2_Quiz3_Level14_Stage3_Jawa, image3_Quiz3_Level14_Stage3_Jawa, image4_Quiz3_Level14_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level14_Stage3_Jawa.id = 1
        choice1_Quiz4_Level14_Stage3_Jawa.name = "Nyer"
        
        let choice2_Quiz4_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level14_Stage3_Jawa.id = 2
        choice2_Quiz4_Level14_Stage3_Jawa.name = "Thad"
        
        let choice3_Quiz4_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level14_Stage3_Jawa.id = 3
        choice3_Quiz4_Level14_Stage3_Jawa.name = "Nyan"
        
        let choice4_Quiz4_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level14_Stage3_Jawa.id = 4
        choice4_Quiz4_Level14_Stage3_Jawa.name = "Ngad"
        
        //MARK: Image
        let image1_Quiz4_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level14_Stage3_Jawa.id = 1
        image1_Quiz4_Level14_Stage3_Jawa.name = "Nyer_Aksara_Jawa"
        
        let image2_Quiz4_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level14_Stage3_Jawa.id = 2
        image2_Quiz4_Level14_Stage3_Jawa.name = "Thad_Aksara_Jawa"
        
        let image3_Quiz4_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level14_Stage3_Jawa.id = 3
        image3_Quiz4_Level14_Stage3_Jawa.name = "Nyan_Aksara_Jawa"
        
        let image4_Quiz4_Level14_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level14_Stage3_Jawa.id = 4
        image4_Quiz4_Level14_Stage3_Jawa.name = "Ngad_Aksara_Jawa"
        
        let quiz4_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level14_stage3_Jawa.id = 4
        quiz4_level14_stage3_Jawa.name = "Kuis 3"
        quiz4_level14_stage3_Jawa.type = "C"
        quiz4_level14_stage3_Jawa.isCorrect = false
        quiz4_level14_stage3_Jawa.question = "Nyer"
        quiz4_level14_stage3_Jawa.choices = [choice1_Quiz4_Level14_Stage3_Jawa, choice2_Quiz4_Level14_Stage3_Jawa, choice3_Quiz4_Level14_Stage3_Jawa, choice4_Quiz4_Level14_Stage3_Jawa]
        quiz4_level14_stage3_Jawa.images = [image1_Quiz4_Level14_Stage3_Jawa, image2_Quiz4_Level14_Stage3_Jawa, image3_Quiz4_Level14_Stage3_Jawa, image4_Quiz4_Level14_Stage3_Jawa]
        
        let quiz5_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage3_Jawa.id = 5
        quiz5_level14_stage3_Jawa.name = "Kuis 4"
        quiz5_level14_stage3_Jawa.type = "D"
        quiz5_level14_stage3_Jawa.isCorrect = false
        quiz5_level14_stage3_Jawa.question = "Nyer"
        quiz5_level14_stage3_Jawa.choices = []
        quiz5_level14_stage3_Jawa.images = []
        
        let quiz6_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage3_Jawa.id = 6
        quiz6_level14_stage3_Jawa.name = "Kuis 5"
        quiz6_level14_stage3_Jawa.type = "E"
        quiz6_level14_stage3_Jawa.isCorrect = false
        quiz6_level14_stage3_Jawa.question = "Nyer"
        quiz6_level14_stage3_Jawa.choices = []
        quiz6_level14_stage3_Jawa.images = []
        
        // MARK: Quiz for Level 15 Stage 3 Jawa
        let quiz1_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level15_stage3_Jawa.id = 1
        quiz1_level15_stage3_Jawa.name = "Panduan"
        quiz1_level15_stage3_Jawa.type = "Panduan"
        quiz1_level15_stage3_Jawa.isCorrect = false
        quiz1_level15_stage3_Jawa.question = "Jog"
        quiz1_level15_stage3_Jawa.choices = []
        quiz1_level15_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level15_Stage3_Jawa.id = 1
        choice1_Quiz2_Level15_Stage3_Jawa.name = "Mog"
        
        let choice2_Quiz2_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level15_Stage3_Jawa.id = 2
        choice2_Quiz2_Level15_Stage3_Jawa.name = "Jor"
        
        let choice3_Quiz2_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level15_Stage3_Jawa.id = 3
        choice3_Quiz2_Level15_Stage3_Jawa.name = "Jog"
        
        let choice4_Quiz2_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level15_Stage3_Jawa.id = 4
        choice4_Quiz2_Level15_Stage3_Jawa.name = "Dhor"
        
        //MARK: Image
        let image1_Quiz2_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz2_Level15_Stage3_Jawa.id = 1
        image1_Quiz2_Level15_Stage3_Jawa.name = "Mog_Aksara_Jawa"
        
        let image2_Quiz2_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz2_Level15_Stage3_Jawa.id = 2
        image2_Quiz2_Level15_Stage3_Jawa.name = "Jor_Aksara_Jawa"
        
        let image3_Quiz2_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz2_Level15_Stage3_Jawa.id = 3
        image3_Quiz2_Level15_Stage3_Jawa.name = "Jog_Aksara_Jawa"
        
        let image4_Quiz2_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level15_Stage3_Jawa.id = 4
        image4_Quiz2_Level15_Stage3_Jawa.name = "Dhor_Aksara_Jawa"
        
        let quiz2_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level15_stage3_Jawa.id = 2
        quiz2_level15_stage3_Jawa.name = "Kuis 1"
        quiz2_level15_stage3_Jawa.type = "A"
        quiz2_level15_stage3_Jawa.isCorrect = false
        quiz2_level15_stage3_Jawa.question = "Jog"
        quiz2_level15_stage3_Jawa.choices = [choice1_Quiz2_Level15_Stage3_Jawa, choice2_Quiz2_Level15_Stage3_Jawa, choice3_Quiz2_Level15_Stage3_Jawa, choice4_Quiz2_Level15_Stage3_Jawa]
        quiz2_level15_stage3_Jawa.images = [image1_Quiz2_Level15_Stage3_Jawa, image2_Quiz2_Level15_Stage3_Jawa, image3_Quiz2_Level15_Stage3_Jawa, image4_Quiz2_Level15_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level15_Stage3_Jawa.id = 1
        choice1_Quiz3_Level15_Stage3_Jawa.name = "Dhor"
        
        let choice2_Quiz3_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level15_Stage3_Jawa.id = 2
        choice2_Quiz3_Level15_Stage3_Jawa.name = "Jog"
        
        let choice3_Quiz3_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level15_Stage3_Jawa.id = 3
        choice3_Quiz3_Level15_Stage3_Jawa.name = "Mog"
        
        let choice4_Quiz3_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level15_Stage3_Jawa.id = 4
        choice4_Quiz3_Level15_Stage3_Jawa.name = "Jor"
        
        //MARK: Image
        let image1_Quiz3_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level15_Stage3_Jawa.id = 1
        image1_Quiz3_Level15_Stage3_Jawa.name = "Dhor_Aksara_Jawa"
        
        let image2_Quiz3_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level15_Stage3_Jawa.id = 2
        image2_Quiz3_Level15_Stage3_Jawa.name = "Jog_Aksara_Jawa"
        
        let image3_Quiz3_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level15_Stage3_Jawa.id = 3
        image3_Quiz3_Level15_Stage3_Jawa.name = "Mog_Aksara_Jawa"
        
        let image4_Quiz3_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level15_Stage3_Jawa.id = 4
        image4_Quiz3_Level15_Stage3_Jawa.name = "Jor_Aksara_Jawa"
        
        let quiz3_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level15_stage3_Jawa.id = 3
        quiz3_level15_stage3_Jawa.name = "Kuis 2"
        quiz3_level15_stage3_Jawa.type = "B"
        quiz3_level15_stage3_Jawa.isCorrect = false
        quiz3_level15_stage3_Jawa.question = "Jog"
        quiz3_level15_stage3_Jawa.choices = [choice1_Quiz3_Level15_Stage3_Jawa, choice2_Quiz3_Level15_Stage3_Jawa, choice3_Quiz3_Level15_Stage3_Jawa, choice4_Quiz3_Level15_Stage3_Jawa]
        quiz3_level15_stage3_Jawa.images = [image1_Quiz3_Level15_Stage3_Jawa, image2_Quiz3_Level15_Stage3_Jawa, image3_Quiz3_Level15_Stage3_Jawa, image4_Quiz3_Level15_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level15_Stage3_Jawa.id = 1
        choice1_Quiz4_Level15_Stage3_Jawa.name = "Jor"
        
        let choice2_Quiz4_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level15_Stage3_Jawa.id = 2
        choice2_Quiz4_Level15_Stage3_Jawa.name = "Mog"
        
        let choice3_Quiz4_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level15_Stage3_Jawa.id = 3
        choice3_Quiz4_Level15_Stage3_Jawa.name = "Jog"
        
        let choice4_Quiz4_Level15_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level15_Stage3_Jawa.id = 4
        choice4_Quiz4_Level15_Stage3_Jawa.name = "Dhor"
        
        //MARK: Image
        let image1_Quiz4_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level15_Stage3_Jawa.id = 1
        image1_Quiz4_Level15_Stage3_Jawa.name = "Jor_Aksara_Jawa"
        
        let image2_Quiz4_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level15_Stage3_Jawa.id = 2
        image2_Quiz4_Level15_Stage3_Jawa.name = "Mog_Aksara_Jawa"
        
        let image3_Quiz4_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level15_Stage3_Jawa.id = 3
        image3_Quiz4_Level15_Stage3_Jawa.name = "Jog_Aksara_Jawa"
        
        let image4_Quiz4_Level15_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level15_Stage3_Jawa.id = 4
        image4_Quiz4_Level15_Stage3_Jawa.name = "Dhor_Aksara_Jawa"
        
        let quiz4_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level15_stage3_Jawa.id = 4
        quiz4_level15_stage3_Jawa.name = "Kuis 3"
        quiz4_level15_stage3_Jawa.type = "C"
        quiz4_level15_stage3_Jawa.isCorrect = false
        quiz4_level15_stage3_Jawa.question = "Jog"
        quiz4_level15_stage3_Jawa.choices = [choice1_Quiz4_Level15_Stage3_Jawa, choice2_Quiz4_Level15_Stage3_Jawa, choice3_Quiz4_Level15_Stage3_Jawa, choice4_Quiz4_Level15_Stage3_Jawa]
        quiz4_level15_stage3_Jawa.images = [image1_Quiz4_Level15_Stage3_Jawa, image2_Quiz4_Level15_Stage3_Jawa, image3_Quiz4_Level15_Stage3_Jawa, image4_Quiz4_Level15_Stage3_Jawa]
        
        let quiz5_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level15_stage3_Jawa.id = 5
        quiz5_level15_stage3_Jawa.name = "Kuis 4"
        quiz5_level15_stage3_Jawa.type = "D"
        quiz5_level15_stage3_Jawa.isCorrect = false
        quiz5_level15_stage3_Jawa.question = "Jog"
        quiz5_level15_stage3_Jawa.choices = []
        quiz5_level15_stage3_Jawa.images = []
        
        let quiz6_level15_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level15_stage3_Jawa.id = 6
        quiz6_level15_stage3_Jawa.name = "Kuis 5"
        quiz6_level15_stage3_Jawa.type = "E"
        quiz6_level15_stage3_Jawa.isCorrect = false
        quiz6_level15_stage3_Jawa.question = "Jog"
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

extension UIImage {
    static func gradientImage(with bounds: CGRect, colors: [CGColor], locations: [NSNumber]?) -> UIImage? {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 400, height: 50)
        gradientLayer.colors = colors
        // This makes it horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
