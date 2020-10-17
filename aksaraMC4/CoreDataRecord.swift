//
//  CoreDataRecord.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 16/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class CoreDataRecord {
    static let shared = CoreDataRecord()
    
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
    
//    func getRecord() {
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
//        let idSort = NSSortDescriptor(key:"id", ascending:true)
//        fetchRequest.sortDescriptors = [idSort]
//
//        do {
//            let users = try PersistenceService.context.fetch(fetchRequest)
//
//            let user: User = users[0]
//            let regions: [Region] = user.regions?.sortedArray(using: [.init(key: "id", ascending: true)]) as! [Region]
//
//
//        } catch {
//            print("ERROR")
//        }
//    }
    
    func saveRecord() {
        
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
        quiz5_level2_stage1_Jawa.question = "Ka"
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
        choice1_Quiz3_Level3_Stage1_Jawa.name = "Sa"
        
        let choice2_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level3_Stage1_Jawa.id = 2
        choice2_Quiz3_Level3_Stage1_Jawa.name = "Ka"
        
        let choice3_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level3_Stage1_Jawa.id = 3
        choice3_Quiz3_Level3_Stage1_Jawa.name = "Na"
        
        let choice4_Quiz3_Level3_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level3_Stage1_Jawa.id = 4
        choice4_Quiz3_Level3_Stage1_Jawa.name = "Da"

        
        let quiz3_level3_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level3_stage1_Jawa.id = 3
        quiz3_level3_stage1_Jawa.name = "Kuis 2"
        quiz3_level3_stage1_Jawa.type = "B"
        quiz3_level3_stage1_Jawa.isCorrect = false
        quiz3_level3_stage1_Jawa.question = "Da"
        quiz3_level3_stage1_Jawa.choices = [choice1_Quiz3_Level3_Stage1_Jawa, choice2_Quiz3_Level3_Stage1_Jawa, choice3_Quiz3_Level3_Stage1_Jawa, choice4_Quiz3_Level3_Stage1_Jawa]
        quiz3_level3_stage1_Jawa.images = []
        
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
        choice1_Quiz3_Level5_Stage1_Jawa.name = "Ya"
        
        let choice2_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level5_Stage1_Jawa.id = 2
        choice2_Quiz3_Level5_Stage1_Jawa.name = "Wa"
        
        let choice3_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level5_Stage1_Jawa.id = 3
        choice3_Quiz3_Level5_Stage1_Jawa.name = "Ca"
        
        let choice4_Quiz3_Level5_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level5_Stage1_Jawa.id = 4
        choice4_Quiz3_Level5_Stage1_Jawa.name = "Ga"
        
        //MARK: Image
        let image1_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level5_Stage1_Jawa.id = 1
        image1_Quiz3_Level5_Stage1_Jawa.name = "Ya_Aksara_Jawa"
        
        let image2_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level5_Stage1_Jawa.id = 2
        image2_Quiz3_Level5_Stage1_Jawa.name = "Wa_Aksara_Jawa"
        
        let image3_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level5_Stage1_Jawa.id = 3
        image3_Quiz3_Level5_Stage1_Jawa.name = "Ca_Aksara_Jawa"
        
        let image4_Quiz3_Level5_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level5_Stage1_Jawa.id = 4
        image4_Quiz3_Level5_Stage1_Jawa.name = "Ga_Aksara_Jawa"
        
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
        choice2_Quiz3_Level8_Stage1_Jawa.name = "Ja"
        
        let choice3_Quiz3_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level8_Stage1_Jawa.id = 3
        choice3_Quiz3_Level8_Stage1_Jawa.name = "Tha"
        
        let choice4_Quiz3_Level8_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level8_Stage1_Jawa.id = 4
        choice4_Quiz3_Level8_Stage1_Jawa.name = "Dha"
        
        //MARK: Image
        let image1_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level8_Stage1_Jawa.id = 1
        image1_Quiz3_Level8_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
        let image2_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level8_Stage1_Jawa.id = 2
        image2_Quiz3_Level8_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image3_Quiz3_Level8_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level8_Stage1_Jawa.id = 3
        image3_Quiz3_Level8_Stage1_Jawa.name = "Tha_Aksara_Jawa"
        
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
        quiz2_level10_stage1_Jawa.choices = [choice1_Quiz2_Level10_Stage1_Jawa, choice2_Quiz2_Level10_Stage1_Jawa, choice3_Quiz2_Level10_Stage1_Jawa, choice4_Quiz2_Level10_Stage1_Jawa]
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
        choice2_Quiz3_Level12_Stage1_Jawa.name = "Ka"
        
        let choice3_Quiz3_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level12_Stage1_Jawa.id = 3
        choice3_Quiz3_Level12_Stage1_Jawa.name = "Ta"
        
        let choice4_Quiz3_Level12_Stage1_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level12_Stage1_Jawa.id = 4
        choice4_Quiz3_Level12_Stage1_Jawa.name = "Ma"
        
        //MARK: Image
        let image1_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level12_Stage1_Jawa.id = 1
        image1_Quiz3_Level12_Stage1_Jawa.name = "Ja_Aksara_Jawa"
        
        let image2_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level12_Stage1_Jawa.id = 2
        image2_Quiz3_Level12_Stage1_Jawa.name = "Ka_Aksara_Jawa"
        
        let image3_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level12_Stage1_Jawa.id = 3
        image3_Quiz3_Level12_Stage1_Jawa.name = "Ta_Aksara_Jawa"
        
        let image4_Quiz3_Level12_Stage1_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level12_Stage1_Jawa.id = 4
        image4_Quiz3_Level12_Stage1_Jawa.name = "Ma_Aksara_Jawa"
        
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
        choice3_Quiz2_Level1_Stage2_Jawa.name = "Dang"
        
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
        image3_Quiz2_Level1_Stage2_Jawa.name = "Dang_Aksara_Jawa"
        
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
        choice1_Quiz3_Level1_Stage2_Jawa.name = "Dang"
        
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
        image1_Quiz3_Level1_Stage2_Jawa.name = "Dang_Aksara_Jawa"
        
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
        choice4_Quiz4_Level1_Stage2_Jawa.name = "Dang"
        
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
        image4_Quiz4_Level1_Stage2_Jawa.name = "Dang_Aksara_Jawa"
        
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
        choice2_Quiz4_Level2_Stage2_Jawa.name = "Se"
        
        let choice3_Quiz4_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level2_Stage2_Jawa.id = 3
        choice3_Quiz4_Level2_Stage2_Jawa.name = "Dar"
        
        let choice4_Quiz4_Level2_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level2_Stage2_Jawa.id = 4
        choice4_Quiz4_Level2_Stage2_Jawa.name = "Du"
        
        //MARK: Image
        let image1_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level2_Stage2_Jawa.id = 1
        image1_Quiz4_Level2_Stage2_Jawa.name = "Nu_Aksara_Jawa"
        
        let image2_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level2_Stage2_Jawa.id = 2
        image2_Quiz4_Level2_Stage2_Jawa.name = "Se_Aksara_Jawa"
        
        let image3_Quiz4_Level2_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level2_Stage2_Jawa.id = 3
        image3_Quiz4_Level2_Stage2_Jawa.name = "Dar_Aksara_Jawa"
        
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
        choice2_Quiz2_Level4_Stage2_Jawa.name = "Hre"
        
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
        image2_Quiz2_Level4_Stage2_Jawa.name = "Hre_Aksara_Jawa"
        
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
        choice1_Quiz3_Level4_Stage2_Jawa.name = "Hre"
        
        let choice2_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level4_Stage2_Jawa.id = 2
        choice2_Quiz3_Level4_Stage2_Jawa.name = "Kra"
        
        let choice3_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level4_Stage2_Jawa.id = 3
        choice3_Quiz3_Level4_Stage2_Jawa.name = "Tre"
        
        let choice4_Quiz3_Level4_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level4_Stage2_Jawa.id = 4
        choice4_Quiz3_Level4_Stage2_Jawa.name = "Tra"
        
        //MARK: Image
        let image1_Quiz3_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level4_Stage2_Jawa.id = 1
        image1_Quiz3_Level4_Stage2_Jawa.name = "Hre_Aksara_Jawa"
        
        let image2_Quiz3_Level4_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level4_Stage2_Jawa.id = 2
        image2_Quiz3_Level4_Stage2_Jawa.name = "Kra_Aksara_Jawa"
        
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
        choice4_Quiz4_Level4_Stage2_Jawa.name = "Hre"
        
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
        image4_Quiz4_Level4_Stage2_Jawa.name = "Hre_Aksara_Jawa"
        
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
        choice3_Quiz2_Level5_Stage2_Jawa.name = "Dhi"
        
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
        image3_Quiz2_Level5_Stage2_Jawa.name = "Dhi_Aksara_Jawa"
        
        let image4_Quiz2_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz2_Level5_Stage2_Jawa.id = 4
        image4_Quiz2_Level5_Stage2_Jawa.name = "Wi_Aksara_Jawa"
        
        let quiz2_level5_stage2_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level5_stage2_Jawa.id = 2
        quiz2_level5_stage2_Jawa.name = "Kuis 1"
        quiz2_level5_stage2_Jawa.type = "A"
        quiz2_level5_stage2_Jawa.isCorrect = false
        quiz2_level5_stage2_Jawa.question = "Wang"
        quiz2_level5_stage2_Jawa.choices = [choice1_Quiz2_Level5_Stage2_Jawa, choice2_Quiz2_Level5_Stage2_Jawa, choice3_Quiz2_Level5_Stage2_Jawa, choice4_Quiz2_Level5_Stage2_Jawa]
        quiz2_level5_stage2_Jawa.images = [image1_Quiz2_Level5_Stage2_Jawa, image2_Quiz2_Level5_Stage2_Jawa, image3_Quiz2_Level5_Stage2_Jawa, image4_Quiz2_Level5_Stage2_Jawa]
        
        //MARK: Choice
        let choice1_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level5_Stage2_Jawa.id = 1
        choice1_Quiz3_Level5_Stage2_Jawa.name = "Dhi"
        
        let choice2_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level5_Stage2_Jawa.id = 2
        choice2_Quiz3_Level5_Stage2_Jawa.name = "Chang"
        
        let choice3_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level5_Stage2_Jawa.id = 3
        choice3_Quiz3_Level5_Stage2_Jawa.name = "Wi"
        
        let choice4_Quiz3_Level5_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level5_Stage2_Jawa.id = 4
        choice4_Quiz3_Level5_Stage2_Jawa.name = "Wang"
        
        //MARK: Image
        let image1_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level5_Stage2_Jawa.id = 1
        image1_Quiz3_Level5_Stage2_Jawa.name = "Dhi_Aksara_Jawa"
        
        let image2_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level5_Stage2_Jawa.id = 2
        image2_Quiz3_Level5_Stage2_Jawa.name = "Cang_Aksara_Jawa"
        
        let image3_Quiz3_Level5_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level5_Stage2_Jawa.id = 3
        image3_Quiz3_Level5_Stage2_Jawa.name = "Wi_Aksara_Jawa"
        
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
        choice2_Quiz4_Level5_Stage2_Jawa.name = "Dhi"
        
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
        image2_Quiz4_Level5_Stage2_Jawa.name = "Dhi_Aksara_Jawa"
        
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
        choice3_Quiz2_Level6_Stage2_Jawa.name = "Wre"
        
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
        image3_Quiz2_Level6_Stage2_Jawa.name = "Wre_Aksara_Jawa"
        
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
        choice4_Quiz3_Level6_Stage2_Jawa.name = "Wre"
        
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
        image4_Quiz3_Level6_Stage2_Jawa.name = "Wre_Aksara_Jawa"
        
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
        choice3_Quiz4_Level6_Stage2_Jawa.name = "Wre"
        
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
        image3_Quiz4_Level6_Stage2_Jawa.name = "Wre_Aksara_Jawa"
        
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
        choice1_Quiz3_Level7_Stage2_Jawa.name = "Gas"
        
        let choice2_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level7_Stage2_Jawa.id = 2
        choice2_Quiz3_Level7_Stage2_Jawa.name = "Ran"
        
        let choice3_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level7_Stage2_Jawa.id = 3
        choice3_Quiz3_Level7_Stage2_Jawa.name = "Wan"
        
        let choice4_Quiz3_Level7_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level7_Stage2_Jawa.id = 4
        choice4_Quiz3_Level7_Stage2_Jawa.name = "Rad"
        
        //MARK: Image
        let image1_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz3_Level7_Stage2_Jawa.id = 1
        image1_Quiz3_Level7_Stage2_Jawa.name = "Gas_Aksara_Jawa"
        
        let image2_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz3_Level7_Stage2_Jawa.id = 2
        image2_Quiz3_Level7_Stage2_Jawa.name = "Ran_Aksara_Jawa"
        
        let image3_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz3_Level7_Stage2_Jawa.id = 3
        image3_Quiz3_Level7_Stage2_Jawa.name = "Wan_Aksara_Jawa"
        
        let image4_Quiz3_Level7_Stage2_Jawa = Image(context: PersistenceService.context)
        image4_Quiz3_Level7_Stage2_Jawa.id = 4
        image4_Quiz3_Level7_Stage2_Jawa.name = "Rad_Aksara_Jawa"
        
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
        choice2_Quiz3_Level9_Stage2_Jawa.name = "Wah"
        
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
        image2_Quiz3_Level9_Stage2_Jawa.name = "Wah_Aksara_Jawa"
        
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
        choice4_Quiz4_Level9_Stage2_Jawa.name = "Wah"
        
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
        image4_Quiz4_Level9_Stage2_Jawa.name = "Wah_Aksara_Jawa"
        
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
        choice1_Quiz4_Level10_Stage2_Jawa.name = "Gah"
        
        let choice2_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level10_Stage2_Jawa.id = 2
        choice2_Quiz4_Level10_Stage2_Jawa.name = "Pah"
        
        let choice3_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level10_Stage2_Jawa.id = 3
        choice3_Quiz4_Level10_Stage2_Jawa.name = "Po"
        
        let choice4_Quiz4_Level10_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level10_Stage2_Jawa.id = 4
        choice4_Quiz4_Level10_Stage2_Jawa.name = "Yo"
        
        //MARK: Image
        let image1_Quiz4_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level10_Stage2_Jawa.id = 1
        image1_Quiz4_Level10_Stage2_Jawa.name = "Gah_Aksara_Jawa"
        
        let image2_Quiz4_Level10_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level10_Stage2_Jawa.id = 2
        image2_Quiz4_Level10_Stage2_Jawa.name = "Pah_Aksara_Jawa"
        
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
        choice1_Quiz4_Level11_Stage2_Jawa.name = "Jah"
        
        let choice2_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level11_Stage2_Jawa.id = 2
        choice2_Quiz4_Level11_Stage2_Jawa.name = "Mar"
        
        let choice3_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level11_Stage2_Jawa.id = 3
        choice3_Quiz4_Level11_Stage2_Jawa.name = "Gar"
        
        let choice4_Quiz4_Level11_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level11_Stage2_Jawa.id = 4
        choice4_Quiz4_Level11_Stage2_Jawa.name = "Mah"
        
        //MARK: Image
        let image1_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level11_Stage2_Jawa.id = 1
        image1_Quiz4_Level11_Stage2_Jawa.name = "Jah_Aksara_Jawa"
        
        let image2_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level11_Stage2_Jawa.id = 2
        image2_Quiz4_Level11_Stage2_Jawa.name = "Mar_Aksara_Jawa"
        
        let image3_Quiz4_Level11_Stage2_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level11_Stage2_Jawa.id = 3
        image3_Quiz4_Level11_Stage2_Jawa.name = "Gar_Aksara_Jawa"
        
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
        choice1_Quiz4_Level15_Stage2_Jawa.name = "Ngre"
        
        let choice2_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level15_Stage2_Jawa.id = 2
        choice2_Quiz4_Level15_Stage2_Jawa.name = "Nyra"
        
        let choice3_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level15_Stage2_Jawa.id = 3
        choice3_Quiz4_Level15_Stage2_Jawa.name = "Thra"
        
        let choice4_Quiz4_Level15_Stage2_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level15_Stage2_Jawa.id = 4
        choice4_Quiz4_Level15_Stage2_Jawa.name = "Thre"
        
        //MARK: Image
        let image1_Quiz4_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level15_Stage2_Jawa.id = 1
        image1_Quiz4_Level15_Stage2_Jawa.name = "Ngre_Aksara_Jawa"
        
        let image2_Quiz4_Level15_Stage2_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level15_Stage2_Jawa.id = 2
        image2_Quiz4_Level15_Stage2_Jawa.name = "Nyra_Aksara_Jawa"
        
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
        choice2_Quiz4_Level2_Stage3_Jawa.name = "Tro"
        
        let choice3_Quiz4_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level2_Stage3_Jawa.id = 3
        choice3_Quiz4_Level2_Stage3_Jawa.name = "Srah"
        
        let choice4_Quiz4_Level2_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level2_Stage3_Jawa.id = 4
        choice4_Quiz4_Level2_Stage3_Jawa.name = "Kré"
        
        //MARK: Image
        let image1_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level2_Stage3_Jawa.id = 1
        image1_Quiz4_Level2_Stage3_Jawa.name = "Kro_Aksara_Jawa"
        
        let image2_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level2_Stage3_Jawa.id = 2
        image2_Quiz4_Level2_Stage3_Jawa.name = "Tro_Aksara_Jawa"
        
        let image3_Quiz4_Level2_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level2_Stage3_Jawa.id = 3
        image3_Quiz4_Level2_Stage3_Jawa.name = "Srah_Aksara_Jawa"
        
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
        choice1_Quiz4_Level10_Stage3_Jawa.name = "Po"
        
        let choice2_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level10_Stage3_Jawa.id = 2
        choice2_Quiz4_Level10_Stage3_Jawa.name = "Pah"
        
        let choice3_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level10_Stage3_Jawa.id = 3
        choice3_Quiz4_Level10_Stage3_Jawa.name = "Pyu"
        
        let choice4_Quiz4_Level10_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level10_Stage3_Jawa.id = 4
        choice4_Quiz4_Level10_Stage3_Jawa.name = "Gah"
        
        //MARK: Image
        let image1_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image1_Quiz4_Level10_Stage3_Jawa.id = 1
        image1_Quiz4_Level10_Stage3_Jawa.name = "Po_Aksara_Jawa"
        
        let image2_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image2_Quiz4_Level10_Stage3_Jawa.id = 2
        image2_Quiz4_Level10_Stage3_Jawa.name = "Pah_Aksara_Jawa"
        
        let image3_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image3_Quiz4_Level10_Stage3_Jawa.id = 3
        image3_Quiz4_Level10_Stage3_Jawa.name = "Pyu_Aksara_Jawa"
        
        let image4_Quiz4_Level10_Stage3_Jawa = Image(context: PersistenceService.context)
        image4_Quiz4_Level10_Stage3_Jawa.id = 4
        image4_Quiz4_Level10_Stage3_Jawa.name = "Gah_Aksara_Jawa"
        
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
        quiz1_level14_stage3_Jawa.question = "Nyér"
        quiz1_level14_stage3_Jawa.choices = []
        quiz1_level14_stage3_Jawa.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level14_Stage3_Jawa.id = 1
        choice1_Quiz2_Level14_Stage3_Jawa.name = "Thad"
        
        let choice2_Quiz2_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level14_Stage3_Jawa.id = 2
        choice2_Quiz2_Level14_Stage3_Jawa.name = "Nyér"
        
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
        image2_Quiz2_Level14_Stage3_Jawa.name = "Nyér_Aksara_Jawa"
        
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
        quiz2_level14_stage3_Jawa.question = "Nyér"
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
        choice4_Quiz3_Level14_Stage3_Jawa.name = "Nyér"
        
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
        image4_Quiz3_Level14_Stage3_Jawa.name = "Nyér_Aksara_Jawa"
        
        let quiz3_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level14_stage3_Jawa.id = 3
        quiz3_level14_stage3_Jawa.name = "Kuis 2"
        quiz3_level14_stage3_Jawa.type = "B"
        quiz3_level14_stage3_Jawa.isCorrect = false
        quiz3_level14_stage3_Jawa.question = "Nyér"
        quiz3_level14_stage3_Jawa.choices = [choice1_Quiz3_Level14_Stage3_Jawa, choice2_Quiz3_Level14_Stage3_Jawa, choice3_Quiz3_Level14_Stage3_Jawa, choice4_Quiz3_Level14_Stage3_Jawa]
        quiz3_level14_stage3_Jawa.images = [image1_Quiz3_Level14_Stage3_Jawa, image2_Quiz3_Level14_Stage3_Jawa, image3_Quiz3_Level14_Stage3_Jawa, image4_Quiz3_Level14_Stage3_Jawa]
        
        //MARK: Choice
        let choice1_Quiz4_Level14_Stage3_Jawa = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level14_Stage3_Jawa.id = 1
        choice1_Quiz4_Level14_Stage3_Jawa.name = "Nyér"
        
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
        image1_Quiz4_Level14_Stage3_Jawa.name = "Nyér_Aksara_Jawa"
        
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
        quiz4_level14_stage3_Jawa.question = "Nyér"
        quiz4_level14_stage3_Jawa.choices = [choice1_Quiz4_Level14_Stage3_Jawa, choice2_Quiz4_Level14_Stage3_Jawa, choice3_Quiz4_Level14_Stage3_Jawa, choice4_Quiz4_Level14_Stage3_Jawa]
        quiz4_level14_stage3_Jawa.images = [image1_Quiz4_Level14_Stage3_Jawa, image2_Quiz4_Level14_Stage3_Jawa, image3_Quiz4_Level14_Stage3_Jawa, image4_Quiz4_Level14_Stage3_Jawa]
        
        let quiz5_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level14_stage3_Jawa.id = 5
        quiz5_level14_stage3_Jawa.name = "Kuis 4"
        quiz5_level14_stage3_Jawa.type = "D"
        quiz5_level14_stage3_Jawa.isCorrect = false
        quiz5_level14_stage3_Jawa.question = "Nyér"
        quiz5_level14_stage3_Jawa.choices = []
        quiz5_level14_stage3_Jawa.images = []
        
        let quiz6_level14_stage3_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level14_stage3_Jawa.id = 6
        quiz6_level14_stage3_Jawa.name = "Kuis 5"
        quiz6_level14_stage3_Jawa.type = "E"
        quiz6_level14_stage3_Jawa.isCorrect = false
        quiz6_level14_stage3_Jawa.question = "Nyér"
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
        firstLevelStage1Jawa.isInitial = true
        firstLevelStage1Jawa.totalMedal = 0
        firstLevelStage1Jawa.quizes = [quiz1_level1_stage1_Jawa, quiz2_level1_stage1_Jawa, quiz3_level1_stage1_Jawa, quiz4_level1_stage1_Jawa, quiz5_level1_stage1_Jawa, quiz6_level1_stage1_Jawa]
        
        let secondLevelStage1Jawa = Level(context: PersistenceService.context)
        secondLevelStage1Jawa.id = 2
        secondLevelStage1Jawa.name = "Level 2"
        secondLevelStage1Jawa.isLocked = true
        secondLevelStage1Jawa.isInitial = true
        secondLevelStage1Jawa.totalMedal = 0
        secondLevelStage1Jawa.quizes = [quiz1_level2_stage1_Jawa, quiz2_level2_stage1_Jawa, quiz3_level2_stage1_Jawa, quiz4_level2_stage1_Jawa, quiz5_level2_stage1_Jawa, quiz6_level2_stage1_Jawa]
        
        let thirdLevelStage1Jawa = Level(context: PersistenceService.context)
        thirdLevelStage1Jawa.id = 3
        thirdLevelStage1Jawa.name = "Level 3"
        thirdLevelStage1Jawa.isLocked = true
        thirdLevelStage1Jawa.isInitial = true
        thirdLevelStage1Jawa.totalMedal = 0
        thirdLevelStage1Jawa.quizes = [quiz1_level3_stage1_Jawa, quiz2_level3_stage1_Jawa, quiz3_level3_stage1_Jawa, quiz4_level3_stage1_Jawa, quiz5_level3_stage1_Jawa, quiz6_level3_stage1_Jawa]
        
        let fourthLevelStage1Jawa = Level(context: PersistenceService.context)
        fourthLevelStage1Jawa.id = 4
        fourthLevelStage1Jawa.name = "Level 4"
        fourthLevelStage1Jawa.isLocked = true
        fourthLevelStage1Jawa.isInitial = true
        fourthLevelStage1Jawa.totalMedal = 0
        fourthLevelStage1Jawa.quizes = [quiz1_level4_stage1_Jawa, quiz2_level4_stage1_Jawa, quiz3_level4_stage1_Jawa, quiz4_level4_stage1_Jawa, quiz5_level4_stage1_Jawa, quiz6_level4_stage1_Jawa]
        
        let fifthLevelStage1Jawa = Level(context: PersistenceService.context)
        fifthLevelStage1Jawa.id = 5
        fifthLevelStage1Jawa.name = "Level 5"
        fifthLevelStage1Jawa.isLocked = true
        fifthLevelStage1Jawa.isInitial = true
        fifthLevelStage1Jawa.totalMedal = 0
        fifthLevelStage1Jawa.quizes = [quiz1_level5_stage1_Jawa, quiz2_level5_stage1_Jawa, quiz3_level5_stage1_Jawa, quiz4_level5_stage1_Jawa, quiz5_level5_stage1_Jawa, quiz6_level5_stage1_Jawa]
        
        let sixthLevelStage1Jawa = Level(context: PersistenceService.context)
        sixthLevelStage1Jawa.id = 6
        sixthLevelStage1Jawa.name = "Level 6"
        sixthLevelStage1Jawa.isLocked = true
        sixthLevelStage1Jawa.isInitial = true
        sixthLevelStage1Jawa.totalMedal = 0
        sixthLevelStage1Jawa.quizes = [quiz1_level6_stage1_Jawa, quiz2_level6_stage1_Jawa, quiz3_level6_stage1_Jawa, quiz4_level6_stage1_Jawa, quiz5_level6_stage1_Jawa, quiz6_level6_stage1_Jawa]
        
        let seventhLevelStage1Jawa = Level(context: PersistenceService.context)
        seventhLevelStage1Jawa.id = 7
        seventhLevelStage1Jawa.name = "Level 7"
        seventhLevelStage1Jawa.isLocked = true
        seventhLevelStage1Jawa.isInitial = true
        seventhLevelStage1Jawa.totalMedal = 0
        seventhLevelStage1Jawa.quizes = [quiz1_level7_stage1_Jawa, quiz2_level7_stage1_Jawa, quiz3_level7_stage1_Jawa, quiz4_level7_stage1_Jawa, quiz5_level7_stage1_Jawa, quiz6_level7_stage1_Jawa]
        
        let eightLevelStage1Jawa = Level(context: PersistenceService.context)
        eightLevelStage1Jawa.id = 8
        eightLevelStage1Jawa.name = "Level 8"
        eightLevelStage1Jawa.isLocked = true
        eightLevelStage1Jawa.isInitial = true
        eightLevelStage1Jawa.totalMedal = 0
        eightLevelStage1Jawa.quizes = [quiz1_level8_stage1_Jawa, quiz2_level8_stage1_Jawa, quiz3_level8_stage1_Jawa, quiz4_level8_stage1_Jawa, quiz5_level8_stage1_Jawa, quiz6_level8_stage1_Jawa]
        
        let ninthLevelStage1Jawa = Level(context: PersistenceService.context)
        ninthLevelStage1Jawa.id = 9
        ninthLevelStage1Jawa.name = "Level 9"
        ninthLevelStage1Jawa.isLocked = true
        ninthLevelStage1Jawa.isInitial = true
        ninthLevelStage1Jawa.totalMedal = 0
        ninthLevelStage1Jawa.quizes = [quiz1_level9_stage1_Jawa, quiz2_level9_stage1_Jawa, quiz3_level9_stage1_Jawa, quiz4_level9_stage1_Jawa, quiz5_level9_stage1_Jawa, quiz6_level9_stage1_Jawa]
        
        let tenthLevelStage1Jawa = Level(context: PersistenceService.context)
        tenthLevelStage1Jawa.id = 10
        tenthLevelStage1Jawa.name = "Level 10"
        tenthLevelStage1Jawa.isLocked = true
        tenthLevelStage1Jawa.isInitial = true
        tenthLevelStage1Jawa.totalMedal = 0
        tenthLevelStage1Jawa.quizes = [quiz1_level10_stage1_Jawa, quiz2_level10_stage1_Jawa, quiz3_level10_stage1_Jawa, quiz4_level10_stage1_Jawa, quiz5_level10_stage1_Jawa, quiz6_level10_stage1_Jawa]
        
        let eleventhLevelStage1Jawa = Level(context: PersistenceService.context)
        eleventhLevelStage1Jawa.id = 11
        eleventhLevelStage1Jawa.name = "Level 11"
        eleventhLevelStage1Jawa.isLocked = true
        eleventhLevelStage1Jawa.isInitial = true
        eleventhLevelStage1Jawa.totalMedal = 0
        eleventhLevelStage1Jawa.quizes = [quiz1_level11_stage1_Jawa, quiz2_level11_stage1_Jawa, quiz3_level11_stage1_Jawa, quiz4_level11_stage1_Jawa, quiz5_level11_stage1_Jawa, quiz6_level11_stage1_Jawa]
        
        let twelfthLevelStage1Jawa = Level(context: PersistenceService.context)
        twelfthLevelStage1Jawa.id = 12
        twelfthLevelStage1Jawa.name = "Level 12"
        twelfthLevelStage1Jawa.isLocked = true
        twelfthLevelStage1Jawa.isInitial = true
        twelfthLevelStage1Jawa.totalMedal = 0
        twelfthLevelStage1Jawa.quizes = [quiz1_level12_stage1_Jawa, quiz2_level12_stage1_Jawa, quiz3_level12_stage1_Jawa, quiz4_level12_stage1_Jawa, quiz5_level12_stage1_Jawa, quiz6_level12_stage1_Jawa]
        
        let thirteenthLevelStage1Jawa = Level(context: PersistenceService.context)
        thirteenthLevelStage1Jawa.id = 13
        thirteenthLevelStage1Jawa.name = "Level 13"
        thirteenthLevelStage1Jawa.isLocked = true
        thirteenthLevelStage1Jawa.isInitial = true
        thirteenthLevelStage1Jawa.totalMedal = 0
        thirteenthLevelStage1Jawa.quizes = [quiz1_level13_stage1_Jawa, quiz2_level13_stage1_Jawa, quiz3_level13_stage1_Jawa, quiz4_level13_stage1_Jawa, quiz5_level13_stage1_Jawa, quiz6_level13_stage1_Jawa]
        
        let fourteenthLevelStage1Jawa = Level(context: PersistenceService.context)
        fourteenthLevelStage1Jawa.id = 14
        fourteenthLevelStage1Jawa.name = "Level 14"
        fourteenthLevelStage1Jawa.isLocked = true
        fourteenthLevelStage1Jawa.isInitial = true
        fourteenthLevelStage1Jawa.totalMedal = 0
        fourteenthLevelStage1Jawa.quizes = [quiz1_level14_stage1_Jawa, quiz2_level14_stage1_Jawa, quiz3_level14_stage1_Jawa, quiz4_level14_stage1_Jawa, quiz5_level14_stage1_Jawa, quiz6_level14_stage1_Jawa]
        
        let fifteenthLevelStage1Jawa = Level(context: PersistenceService.context)
        fifteenthLevelStage1Jawa.id = 15
        fifteenthLevelStage1Jawa.name = "Level 15"
        fifteenthLevelStage1Jawa.isLocked = true
        fifteenthLevelStage1Jawa.isInitial = true
        fifteenthLevelStage1Jawa.totalMedal = 0
        fifteenthLevelStage1Jawa.quizes = [quiz1_level15_stage1_Jawa, quiz2_level15_stage1_Jawa, quiz3_level15_stage1_Jawa, quiz4_level15_stage1_Jawa, quiz5_level15_stage1_Jawa, quiz6_level15_stage1_Jawa]
        
        // MARK: Level for Stage 2 Jawa
        let firstLevelStage2Jawa = Level(context: PersistenceService.context)
        firstLevelStage2Jawa.id = 1
        firstLevelStage2Jawa.name = "Level 1"
        firstLevelStage2Jawa.isLocked = false
        firstLevelStage2Jawa.isInitial = true
        firstLevelStage2Jawa.totalMedal = 0
        firstLevelStage2Jawa.quizes = [quiz1_level1_stage2_Jawa, quiz2_level1_stage2_Jawa, quiz3_level1_stage2_Jawa, quiz4_level1_stage2_Jawa, quiz5_level1_stage2_Jawa, quiz6_level1_stage2_Jawa]
        
        let secondLevelStage2Jawa = Level(context: PersistenceService.context)
        secondLevelStage2Jawa.id = 2
        secondLevelStage2Jawa.name = "Level 2"
        secondLevelStage2Jawa.isLocked = true
        secondLevelStage2Jawa.isInitial = true
        secondLevelStage2Jawa.totalMedal = 0
        secondLevelStage2Jawa.quizes = [quiz1_level2_stage2_Jawa, quiz2_level2_stage2_Jawa, quiz3_level2_stage2_Jawa, quiz4_level2_stage2_Jawa, quiz5_level2_stage2_Jawa, quiz6_level2_stage2_Jawa]
        
        let thirdLevelStage2Jawa = Level(context: PersistenceService.context)
        thirdLevelStage2Jawa.id = 3
        thirdLevelStage2Jawa.name = "Level 3"
        thirdLevelStage2Jawa.isLocked = true
        thirdLevelStage2Jawa.isInitial = true
        thirdLevelStage2Jawa.totalMedal = 0
        thirdLevelStage2Jawa.quizes = [quiz1_level3_stage2_Jawa, quiz2_level3_stage2_Jawa, quiz3_level3_stage2_Jawa, quiz4_level3_stage2_Jawa, quiz5_level3_stage2_Jawa, quiz6_level3_stage2_Jawa]
        
        let fourthLevelStage2Jawa = Level(context: PersistenceService.context)
        fourthLevelStage2Jawa.id = 4
        fourthLevelStage2Jawa.name = "Level 4"
        fourthLevelStage2Jawa.isLocked = true
        fourthLevelStage2Jawa.isInitial = true
        fourthLevelStage2Jawa.totalMedal = 0
        fourthLevelStage2Jawa.quizes = [quiz1_level4_stage2_Jawa, quiz2_level4_stage2_Jawa, quiz3_level4_stage2_Jawa, quiz4_level4_stage2_Jawa, quiz5_level4_stage2_Jawa, quiz6_level4_stage2_Jawa]
        
        let fifthLevelStage2Jawa = Level(context: PersistenceService.context)
        fifthLevelStage2Jawa.id = 5
        fifthLevelStage2Jawa.name = "Level 5"
        fifthLevelStage2Jawa.isLocked = true
        fifthLevelStage2Jawa.isInitial = true
        fifthLevelStage2Jawa.totalMedal = 0
        fifthLevelStage2Jawa.quizes = [quiz1_level5_stage2_Jawa, quiz2_level5_stage2_Jawa, quiz3_level5_stage2_Jawa, quiz4_level5_stage2_Jawa, quiz5_level5_stage2_Jawa, quiz6_level5_stage2_Jawa]
        
        let sixthLevelStage2Jawa = Level(context: PersistenceService.context)
        sixthLevelStage2Jawa.id = 6
        sixthLevelStage2Jawa.name = "Level 6"
        sixthLevelStage2Jawa.isLocked = true
        sixthLevelStage2Jawa.isInitial = true
        sixthLevelStage2Jawa.totalMedal = 0
        sixthLevelStage2Jawa.quizes = [quiz1_level6_stage2_Jawa, quiz2_level6_stage2_Jawa, quiz3_level6_stage2_Jawa, quiz4_level6_stage2_Jawa, quiz5_level6_stage2_Jawa, quiz6_level6_stage2_Jawa]
        
        let seventhLevelStage2Jawa = Level(context: PersistenceService.context)
        seventhLevelStage2Jawa.id = 7
        seventhLevelStage2Jawa.name = "Level 7"
        seventhLevelStage2Jawa.isLocked = true
        seventhLevelStage2Jawa.isInitial = true
        seventhLevelStage2Jawa.totalMedal = 0
        seventhLevelStage2Jawa.quizes = [quiz1_level7_stage2_Jawa, quiz2_level7_stage2_Jawa, quiz3_level7_stage2_Jawa, quiz4_level7_stage2_Jawa, quiz5_level7_stage2_Jawa, quiz6_level7_stage2_Jawa]
        
        let eightLevelStage2Jawa = Level(context: PersistenceService.context)
        eightLevelStage2Jawa.id = 8
        eightLevelStage2Jawa.name = "Level 8"
        eightLevelStage2Jawa.isLocked = true
        eightLevelStage2Jawa.isInitial = true
        eightLevelStage2Jawa.totalMedal = 0
        eightLevelStage2Jawa.quizes = [quiz1_level8_stage2_Jawa, quiz2_level8_stage2_Jawa, quiz3_level8_stage2_Jawa, quiz4_level8_stage2_Jawa, quiz5_level8_stage2_Jawa, quiz6_level8_stage2_Jawa]
        
        let ninthLevelStage2Jawa = Level(context: PersistenceService.context)
        ninthLevelStage2Jawa.id = 9
        ninthLevelStage2Jawa.name = "Level 9"
        ninthLevelStage2Jawa.isLocked = true
        ninthLevelStage2Jawa.isInitial = true
        ninthLevelStage2Jawa.totalMedal = 0
        ninthLevelStage2Jawa.quizes = [quiz1_level9_stage2_Jawa, quiz2_level9_stage2_Jawa, quiz3_level9_stage2_Jawa, quiz4_level9_stage2_Jawa, quiz5_level9_stage2_Jawa, quiz6_level9_stage2_Jawa]
        
        let tenthLevelStage2Jawa = Level(context: PersistenceService.context)
        tenthLevelStage2Jawa.id = 10
        tenthLevelStage2Jawa.name = "Level 10"
        tenthLevelStage2Jawa.isLocked = true
        tenthLevelStage2Jawa.isInitial = true
        tenthLevelStage2Jawa.totalMedal = 0
        tenthLevelStage2Jawa.quizes = [quiz1_level10_stage2_Jawa, quiz2_level10_stage2_Jawa, quiz3_level10_stage2_Jawa, quiz4_level10_stage2_Jawa, quiz5_level10_stage2_Jawa, quiz6_level10_stage2_Jawa]
        
        let eleventhLevelStage2Jawa = Level(context: PersistenceService.context)
        eleventhLevelStage2Jawa.id = 11
        eleventhLevelStage2Jawa.name = "Level 11"
        eleventhLevelStage2Jawa.isLocked = true
        eleventhLevelStage2Jawa.isInitial = true
        eleventhLevelStage2Jawa.totalMedal = 0
        eleventhLevelStage2Jawa.quizes = [quiz1_level11_stage2_Jawa, quiz2_level11_stage2_Jawa, quiz3_level11_stage2_Jawa, quiz4_level11_stage2_Jawa, quiz5_level11_stage2_Jawa, quiz6_level11_stage2_Jawa]
        
        let twelfthLevelStage2Jawa = Level(context: PersistenceService.context)
        twelfthLevelStage2Jawa.id = 12
        twelfthLevelStage2Jawa.name = "Level 12"
        twelfthLevelStage2Jawa.isLocked = true
        twelfthLevelStage2Jawa.isInitial = true
        twelfthLevelStage2Jawa.totalMedal = 0
        twelfthLevelStage2Jawa.quizes = [quiz1_level12_stage2_Jawa, quiz2_level12_stage2_Jawa, quiz3_level12_stage2_Jawa, quiz4_level12_stage2_Jawa, quiz5_level12_stage2_Jawa, quiz6_level12_stage2_Jawa]
        
        let thirteenthLevelStage2Jawa = Level(context: PersistenceService.context)
        thirteenthLevelStage2Jawa.id = 13
        thirteenthLevelStage2Jawa.name = "Level 13"
        thirteenthLevelStage2Jawa.isLocked = true
        thirteenthLevelStage2Jawa.isInitial = true
        thirteenthLevelStage2Jawa.totalMedal = 0
        thirteenthLevelStage2Jawa.quizes = [quiz1_level13_stage2_Jawa, quiz2_level13_stage2_Jawa, quiz3_level13_stage2_Jawa, quiz4_level13_stage2_Jawa, quiz5_level13_stage2_Jawa, quiz6_level13_stage2_Jawa]
        
        let fourteenthLevelStage2Jawa = Level(context: PersistenceService.context)
        fourteenthLevelStage2Jawa.id = 14
        fourteenthLevelStage2Jawa.name = "Level 14"
        fourteenthLevelStage2Jawa.isLocked = true
        fourteenthLevelStage2Jawa.isInitial = true
        fourteenthLevelStage2Jawa.totalMedal = 0
        fourteenthLevelStage2Jawa.quizes = [quiz1_level14_stage2_Jawa, quiz2_level14_stage2_Jawa, quiz3_level14_stage2_Jawa, quiz4_level14_stage2_Jawa, quiz5_level14_stage2_Jawa, quiz6_level14_stage2_Jawa]
        
        let fifteenthLevelStage2Jawa = Level(context: PersistenceService.context)
        fifteenthLevelStage2Jawa.id = 15
        fifteenthLevelStage2Jawa.name = "Level 15"
        fifteenthLevelStage2Jawa.isLocked = true
        fifteenthLevelStage2Jawa.isInitial = true
        fifteenthLevelStage2Jawa.totalMedal = 0
        fifteenthLevelStage2Jawa.quizes = [quiz1_level15_stage2_Jawa, quiz2_level15_stage2_Jawa, quiz3_level15_stage2_Jawa, quiz4_level15_stage2_Jawa, quiz5_level15_stage2_Jawa, quiz6_level15_stage2_Jawa]
        
        // MARK: Level for Stage 3 Jawa
        let firstLevelStage3Jawa = Level(context: PersistenceService.context)
        firstLevelStage3Jawa.id = 1
        firstLevelStage3Jawa.name = "Level 1"
        firstLevelStage3Jawa.isLocked = false
        firstLevelStage3Jawa.isInitial = true
        firstLevelStage3Jawa.totalMedal = 0
        firstLevelStage3Jawa.quizes = [quiz1_level1_stage3_Jawa, quiz2_level1_stage3_Jawa, quiz3_level1_stage3_Jawa, quiz4_level1_stage3_Jawa, quiz5_level1_stage3_Jawa, quiz6_level1_stage3_Jawa]
        
        let secondLevelStage3Jawa = Level(context: PersistenceService.context)
        secondLevelStage3Jawa.id = 2
        secondLevelStage3Jawa.name = "Level 2"
        secondLevelStage3Jawa.isLocked = true
        secondLevelStage3Jawa.isInitial = true
        secondLevelStage3Jawa.totalMedal = 0
        secondLevelStage3Jawa.quizes = [quiz1_level2_stage3_Jawa, quiz2_level2_stage3_Jawa, quiz3_level2_stage3_Jawa, quiz4_level2_stage3_Jawa, quiz5_level2_stage3_Jawa, quiz6_level2_stage3_Jawa]
        
        let thirdLevelStage3Jawa = Level(context: PersistenceService.context)
        thirdLevelStage3Jawa.id = 3
        thirdLevelStage3Jawa.name = "Level 3"
        thirdLevelStage3Jawa.isLocked = true
        thirdLevelStage3Jawa.isInitial = true
        thirdLevelStage3Jawa.totalMedal = 0
        thirdLevelStage3Jawa.quizes = [quiz1_level3_stage3_Jawa, quiz2_level3_stage3_Jawa, quiz3_level3_stage3_Jawa, quiz4_level3_stage3_Jawa, quiz5_level3_stage3_Jawa, quiz6_level3_stage3_Jawa]
        
        let fourthLevelStage3Jawa = Level(context: PersistenceService.context)
        fourthLevelStage3Jawa.id = 4
        fourthLevelStage3Jawa.name = "Level 4"
        fourthLevelStage3Jawa.isLocked = true
        fourthLevelStage3Jawa.isInitial = true
        fourthLevelStage3Jawa.totalMedal = 0
        fourthLevelStage3Jawa.quizes = [quiz1_level4_stage3_Jawa, quiz2_level4_stage3_Jawa, quiz3_level4_stage3_Jawa, quiz4_level4_stage3_Jawa, quiz5_level4_stage3_Jawa, quiz6_level4_stage3_Jawa]
        
        let fifthLevelStage3Jawa = Level(context: PersistenceService.context)
        fifthLevelStage3Jawa.id = 5
        fifthLevelStage3Jawa.name = "Level 5"
        fifthLevelStage3Jawa.isLocked = true
        fifthLevelStage3Jawa.isInitial = true
        fifthLevelStage3Jawa.totalMedal = 0
        fifthLevelStage3Jawa.quizes = [quiz1_level5_stage3_Jawa, quiz2_level5_stage3_Jawa, quiz3_level5_stage3_Jawa, quiz4_level5_stage3_Jawa, quiz5_level5_stage3_Jawa, quiz6_level5_stage3_Jawa]
        
        let sixthLevelStage3Jawa = Level(context: PersistenceService.context)
        sixthLevelStage3Jawa.id = 6
        sixthLevelStage3Jawa.name = "Level 6"
        sixthLevelStage3Jawa.isLocked = true
        sixthLevelStage3Jawa.isInitial = true
        sixthLevelStage3Jawa.totalMedal = 0
        sixthLevelStage3Jawa.quizes = [quiz1_level6_stage3_Jawa, quiz2_level6_stage3_Jawa, quiz3_level6_stage3_Jawa, quiz4_level6_stage3_Jawa, quiz5_level6_stage3_Jawa, quiz6_level6_stage3_Jawa]
        
        let seventhLevelStage3Jawa = Level(context: PersistenceService.context)
        seventhLevelStage3Jawa.id = 7
        seventhLevelStage3Jawa.name = "Level 7"
        seventhLevelStage3Jawa.isLocked = true
        seventhLevelStage3Jawa.isInitial = true
        seventhLevelStage3Jawa.totalMedal = 0
        seventhLevelStage3Jawa.quizes = [quiz1_level7_stage3_Jawa, quiz2_level7_stage3_Jawa, quiz3_level7_stage3_Jawa, quiz4_level7_stage3_Jawa, quiz5_level7_stage3_Jawa, quiz6_level7_stage3_Jawa]
        
        let eightLevelStage3Jawa = Level(context: PersistenceService.context)
        eightLevelStage3Jawa.id = 8
        eightLevelStage3Jawa.name = "Level 8"
        eightLevelStage3Jawa.isLocked = true
        eightLevelStage3Jawa.isInitial = true
        eightLevelStage3Jawa.totalMedal = 0
        eightLevelStage3Jawa.quizes = [quiz1_level8_stage3_Jawa, quiz2_level8_stage3_Jawa, quiz3_level8_stage3_Jawa, quiz4_level8_stage3_Jawa, quiz5_level8_stage3_Jawa, quiz6_level8_stage3_Jawa]
        
        let ninthLevelStage3Jawa = Level(context: PersistenceService.context)
        ninthLevelStage3Jawa.id = 9
        ninthLevelStage3Jawa.name = "Level 9"
        ninthLevelStage3Jawa.isLocked = true
        ninthLevelStage3Jawa.isInitial = true
        ninthLevelStage3Jawa.totalMedal = 0
        ninthLevelStage3Jawa.quizes = [quiz1_level9_stage3_Jawa, quiz2_level9_stage3_Jawa, quiz3_level9_stage3_Jawa, quiz4_level9_stage3_Jawa, quiz5_level9_stage3_Jawa, quiz6_level9_stage3_Jawa]
        
        let tenthLevelStage3Jawa = Level(context: PersistenceService.context)
        tenthLevelStage3Jawa.id = 10
        tenthLevelStage3Jawa.name = "Level 10"
        tenthLevelStage3Jawa.isLocked = true
        tenthLevelStage3Jawa.isInitial = true
        tenthLevelStage3Jawa.totalMedal = 0
        tenthLevelStage3Jawa.quizes = [quiz1_level10_stage3_Jawa, quiz2_level10_stage3_Jawa, quiz3_level10_stage3_Jawa, quiz4_level10_stage3_Jawa, quiz5_level10_stage3_Jawa, quiz6_level10_stage3_Jawa]
        
        let eleventhLevelStage3Jawa = Level(context: PersistenceService.context)
        eleventhLevelStage3Jawa.id = 11
        eleventhLevelStage3Jawa.name = "Level 11"
        eleventhLevelStage3Jawa.isLocked = true
        eleventhLevelStage3Jawa.isInitial = true
        eleventhLevelStage3Jawa.totalMedal = 0
        eleventhLevelStage3Jawa.quizes = [quiz1_level11_stage3_Jawa, quiz2_level11_stage3_Jawa, quiz3_level11_stage3_Jawa, quiz4_level11_stage3_Jawa, quiz5_level11_stage3_Jawa, quiz6_level11_stage3_Jawa]
        
        let twelfthLevelStage3Jawa = Level(context: PersistenceService.context)
        twelfthLevelStage3Jawa.id = 12
        twelfthLevelStage3Jawa.name = "Level 12"
        twelfthLevelStage3Jawa.isLocked = true
        twelfthLevelStage3Jawa.isInitial = true
        twelfthLevelStage3Jawa.totalMedal = 0
        twelfthLevelStage3Jawa.quizes = [quiz1_level12_stage3_Jawa, quiz2_level12_stage3_Jawa, quiz3_level12_stage3_Jawa, quiz4_level12_stage3_Jawa, quiz5_level12_stage3_Jawa, quiz6_level12_stage3_Jawa]
        
        let thirteenthLevelStage3Jawa = Level(context: PersistenceService.context)
        thirteenthLevelStage3Jawa.id = 13
        thirteenthLevelStage3Jawa.name = "Level 13"
        thirteenthLevelStage3Jawa.isLocked = true
        thirteenthLevelStage3Jawa.isInitial = true
        thirteenthLevelStage3Jawa.totalMedal = 0
        thirteenthLevelStage3Jawa.quizes = [quiz1_level13_stage3_Jawa, quiz2_level13_stage3_Jawa, quiz3_level13_stage3_Jawa, quiz4_level13_stage3_Jawa, quiz5_level13_stage3_Jawa, quiz6_level13_stage3_Jawa]
        
        let fourteenthLevelStage3Jawa = Level(context: PersistenceService.context)
        fourteenthLevelStage3Jawa.id = 14
        fourteenthLevelStage3Jawa.name = "Level 14"
        fourteenthLevelStage3Jawa.isLocked = true
        fourteenthLevelStage3Jawa.isInitial = true
        fourteenthLevelStage3Jawa.totalMedal = 0
        fourteenthLevelStage3Jawa.quizes = [quiz1_level14_stage3_Jawa, quiz2_level14_stage3_Jawa, quiz3_level14_stage3_Jawa, quiz4_level14_stage3_Jawa, quiz5_level14_stage3_Jawa, quiz6_level14_stage3_Jawa]
        
        let fifteenthLevelStage3Jawa = Level(context: PersistenceService.context)
        fifteenthLevelStage3Jawa.id = 15
        fifteenthLevelStage3Jawa.name = "Level 15"
        fifteenthLevelStage3Jawa.isLocked = true
        fifteenthLevelStage3Jawa.isInitial = true
        fifteenthLevelStage3Jawa.totalMedal = 0
        fifteenthLevelStage3Jawa.quizes = [quiz1_level15_stage3_Jawa, quiz2_level15_stage3_Jawa, quiz3_level15_stage3_Jawa, quiz4_level15_stage3_Jawa, quiz5_level15_stage3_Jawa, quiz6_level15_stage3_Jawa]
        
        // ================================================================================================================= //
        // MARK: Quiz for Level 1 Stage 1 Sunda
        let quiz1_level1_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level1_stage1_Sunda.id = 1
        quiz1_level1_stage1_Sunda.name = "Panduan"
        quiz1_level1_stage1_Sunda.type = "Panduan"
        quiz1_level1_stage1_Sunda.isCorrect = false
        quiz1_level1_stage1_Sunda.question = "Ka"
        quiz1_level1_stage1_Sunda.choices = []
        quiz1_level1_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level1_Stage1_Sunda.id = 1
        choice1_Quiz2_Level1_Stage1_Sunda.name = "Ha"
        
        let choice2_Quiz2_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level1_Stage1_Sunda.id = 2
        choice2_Quiz2_Level1_Stage1_Sunda.name = "Ka"
        
        let choice3_Quiz2_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level1_Stage1_Sunda.id = 3
        choice3_Quiz2_Level1_Stage1_Sunda.name = "Da"
        
        let choice4_Quiz2_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level1_Stage1_Sunda.id = 4
        choice4_Quiz2_Level1_Stage1_Sunda.name = "Ba"
        
        let quiz2_level1_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level1_stage1_Sunda.id = 2
        quiz2_level1_stage1_Sunda.name = "Kuis 1"
        quiz2_level1_stage1_Sunda.type = "A"
        quiz2_level1_stage1_Sunda.isCorrect = false
        quiz2_level1_stage1_Sunda.question = "Ka"
        quiz2_level1_stage1_Sunda.choices = [choice1_Quiz2_Level1_Stage1_Sunda, choice2_Quiz2_Level1_Stage1_Sunda, choice3_Quiz2_Level1_Stage1_Sunda, choice4_Quiz2_Level1_Stage1_Sunda]
        quiz2_level1_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level1_Stage1_Sunda.id = 1
        choice1_Quiz3_Level1_Stage1_Sunda.name = "Sa"
        
        let choice2_Quiz3_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level1_Stage1_Sunda.id = 2
        choice2_Quiz3_Level1_Stage1_Sunda.name = "Pa"
        
        let choice3_Quiz3_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level1_Stage1_Sunda.id = 3
        choice3_Quiz3_Level1_Stage1_Sunda.name = "Nya"
        
        let choice4_Quiz3_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level1_Stage1_Sunda.id = 4
        choice4_Quiz3_Level1_Stage1_Sunda.name = "Ka"
        
        let quiz3_level1_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level1_stage1_Sunda.id = 3
        quiz3_level1_stage1_Sunda.name = "Kuis 2"
        quiz3_level1_stage1_Sunda.type = "B"
        quiz3_level1_stage1_Sunda.isCorrect = false
        quiz3_level1_stage1_Sunda.question = "Ka"
        quiz3_level1_stage1_Sunda.choices = [choice1_Quiz3_Level1_Stage1_Sunda, choice2_Quiz3_Level1_Stage1_Sunda, choice3_Quiz3_Level1_Stage1_Sunda, choice4_Quiz3_Level1_Stage1_Sunda]
        quiz3_level1_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level1_Stage1_Sunda.id = 1
        choice1_Quiz4_Level1_Stage1_Sunda.name = "Sa"
        
        let choice2_Quiz4_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level1_Stage1_Sunda.id = 2
        choice2_Quiz4_Level1_Stage1_Sunda.name = "Ka"
        
        let choice3_Quiz4_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level1_Stage1_Sunda.id = 3
        choice3_Quiz4_Level1_Stage1_Sunda.name = "Nya"
        
        let choice4_Quiz4_Level1_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level1_Stage1_Sunda.id = 4
        choice4_Quiz4_Level1_Stage1_Sunda.name = "Pa"
        
        let quiz4_level1_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level1_stage1_Sunda.id = 4
        quiz4_level1_stage1_Sunda.name = "Kuis 3"
        quiz4_level1_stage1_Sunda.type = "C"
        quiz4_level1_stage1_Sunda.isCorrect = false
        quiz4_level1_stage1_Sunda.question = "Ka"
        quiz4_level1_stage1_Sunda.choices = [choice1_Quiz4_Level1_Stage1_Sunda, choice2_Quiz4_Level1_Stage1_Sunda, choice3_Quiz4_Level1_Stage1_Sunda, choice4_Quiz4_Level1_Stage1_Sunda]
        quiz4_level1_stage1_Sunda.images = []
        
        let quiz5_level1_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level1_stage1_Sunda.id = 5
        quiz5_level1_stage1_Sunda.name = "Kuis 4"
        quiz5_level1_stage1_Sunda.type = "D"
        quiz5_level1_stage1_Sunda.isCorrect = false
        quiz5_level1_stage1_Sunda.question = "Ka"
        quiz5_level1_stage1_Sunda.choices = []
        quiz5_level1_stage1_Sunda.images = []
        
        let quiz6_level1_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level1_stage1_Sunda.id = 6
        quiz6_level1_stage1_Sunda.name = "Kuis 5"
        quiz6_level1_stage1_Sunda.type = "E"
        quiz6_level1_stage1_Sunda.isCorrect = false
        quiz6_level1_stage1_Sunda.question = "Ka"
        quiz6_level1_stage1_Sunda.choices = []
        quiz6_level1_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 2 Stage 1 Sunda
        let quiz1_level2_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level2_stage1_Sunda.id = 1
        quiz1_level2_stage1_Sunda.name = "Panduan"
        quiz1_level2_stage1_Sunda.type = "Panduan"
        quiz1_level2_stage1_Sunda.isCorrect = false
        quiz1_level2_stage1_Sunda.question = "Nya"
        quiz1_level2_stage1_Sunda.choices = []
        quiz1_level2_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level2_Stage1_Sunda.id = 1
        choice1_Quiz2_Level2_Stage1_Sunda.name = "Na"
        
        let choice2_Quiz2_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level2_Stage1_Sunda.id = 2
        choice2_Quiz2_Level2_Stage1_Sunda.name = "Nya"
        
        let choice3_Quiz2_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level2_Stage1_Sunda.id = 3
        choice3_Quiz2_Level2_Stage1_Sunda.name = "Ca"
        
        let choice4_Quiz2_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level2_Stage1_Sunda.id = 4
        choice4_Quiz2_Level2_Stage1_Sunda.name = "Nga"
        
        let quiz2_level2_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level2_stage1_Sunda.id = 2
        quiz2_level2_stage1_Sunda.name = "Kuis 1"
        quiz2_level2_stage1_Sunda.type = "A"
        quiz2_level2_stage1_Sunda.isCorrect = false
        quiz2_level2_stage1_Sunda.question = "Nya"
        quiz2_level2_stage1_Sunda.choices = [choice1_Quiz2_Level2_Stage1_Sunda, choice2_Quiz2_Level2_Stage1_Sunda, choice3_Quiz2_Level2_Stage1_Sunda, choice4_Quiz2_Level2_Stage1_Sunda]
        quiz2_level2_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level2_Stage1_Sunda.id = 1
        choice1_Quiz3_Level2_Stage1_Sunda.name = "Ja"
        
        let choice2_Quiz3_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level2_Stage1_Sunda.id = 2
        choice2_Quiz3_Level2_Stage1_Sunda.name = "Ba"
        
        let choice3_Quiz3_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level2_Stage1_Sunda.id = 3
        choice3_Quiz3_Level2_Stage1_Sunda.name = "Nya"
        
        let choice4_Quiz3_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level2_Stage1_Sunda.id = 4
        choice4_Quiz3_Level2_Stage1_Sunda.name = "Da"
        
        let quiz3_level2_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level2_stage1_Sunda.id = 3
        quiz3_level2_stage1_Sunda.name = "Kuis 2"
        quiz3_level2_stage1_Sunda.type = "B"
        quiz3_level2_stage1_Sunda.isCorrect = false
        quiz3_level2_stage1_Sunda.question = "Nya"
        quiz3_level2_stage1_Sunda.choices = [choice1_Quiz3_Level2_Stage1_Sunda, choice2_Quiz3_Level2_Stage1_Sunda, choice3_Quiz3_Level2_Stage1_Sunda, choice4_Quiz3_Level2_Stage1_Sunda]
        quiz3_level2_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level2_Stage1_Sunda.id = 1
        choice1_Quiz4_Level2_Stage1_Sunda.name = "Ba"
        
        let choice2_Quiz4_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level2_Stage1_Sunda.id = 2
        choice2_Quiz4_Level2_Stage1_Sunda.name = "Pa"
        
        let choice3_Quiz4_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level2_Stage1_Sunda.id = 3
        choice3_Quiz4_Level2_Stage1_Sunda.name = "Da"
        
        let choice4_Quiz4_Level2_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level2_Stage1_Sunda.id = 4
        choice4_Quiz4_Level2_Stage1_Sunda.name = "Nya"
        
        let quiz4_level2_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level2_stage1_Sunda.id = 4
        quiz4_level2_stage1_Sunda.name = "Kuis 3"
        quiz4_level2_stage1_Sunda.type = "C"
        quiz4_level2_stage1_Sunda.isCorrect = false
        quiz4_level2_stage1_Sunda.question = "Nya"
        quiz4_level2_stage1_Sunda.choices = [choice1_Quiz4_Level2_Stage1_Sunda, choice2_Quiz4_Level2_Stage1_Sunda, choice3_Quiz4_Level2_Stage1_Sunda, choice4_Quiz4_Level2_Stage1_Sunda]
        quiz4_level2_stage1_Sunda.images = []
        
        let quiz5_level2_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level2_stage1_Sunda.id = 5
        quiz5_level2_stage1_Sunda.name = "Kuis 4"
        quiz5_level2_stage1_Sunda.type = "D"
        quiz5_level2_stage1_Sunda.isCorrect = false
        quiz5_level2_stage1_Sunda.question = "Nya"
        quiz5_level2_stage1_Sunda.choices = []
        quiz5_level2_stage1_Sunda.images = []
        
        let quiz6_level2_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level2_stage1_Sunda.id = 6
        quiz6_level2_stage1_Sunda.name = "Kuis 5"
        quiz6_level2_stage1_Sunda.type = "E"
        quiz6_level2_stage1_Sunda.isCorrect = false
        quiz6_level2_stage1_Sunda.question = "Nya"
        quiz6_level2_stage1_Sunda.choices = []
        quiz6_level2_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 3 Stage 1 Jawa
        let quiz1_level3_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level3_stage1_Sunda.id = 1
        quiz1_level3_stage1_Sunda.name = "Panduan"
        quiz1_level3_stage1_Sunda.type = "Panduan"
        quiz1_level3_stage1_Sunda.isCorrect = false
        quiz1_level3_stage1_Sunda.question = "Pa"
        quiz1_level3_stage1_Sunda.choices = []
        quiz1_level3_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level3_Stage1_Sunda.id = 1
        choice1_Quiz2_Level3_Stage1_Sunda.name = "Fa"
        
        let choice2_Quiz2_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level3_Stage1_Sunda.id = 2
        choice2_Quiz2_Level3_Stage1_Sunda.name = "Pa"
        
        let choice3_Quiz2_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level3_Stage1_Sunda.id = 3
        choice3_Quiz2_Level3_Stage1_Sunda.name = "Ba"
        
        let choice4_Quiz2_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level3_Stage1_Sunda.id = 4
        choice4_Quiz2_Level3_Stage1_Sunda.name = "Da"
        
        let quiz2_level3_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level3_stage1_Sunda.id = 2
        quiz2_level3_stage1_Sunda.name = "Kuis 1"
        quiz2_level3_stage1_Sunda.type = "A"
        quiz2_level3_stage1_Sunda.isCorrect = false
        quiz2_level3_stage1_Sunda.question = "Pa"
        quiz2_level3_stage1_Sunda.choices = [choice1_Quiz2_Level3_Stage1_Sunda, choice2_Quiz2_Level3_Stage1_Sunda, choice3_Quiz2_Level3_Stage1_Sunda, choice4_Quiz2_Level3_Stage1_Sunda]
        quiz2_level3_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level3_Stage1_Sunda.id = 1
        choice1_Quiz3_Level3_Stage1_Sunda.name = "Pa"
        
        let choice2_Quiz3_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level3_Stage1_Sunda.id = 2
        choice2_Quiz3_Level3_Stage1_Sunda.name = "Sa"
        
        let choice3_Quiz3_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level3_Stage1_Sunda.id = 3
        choice3_Quiz3_Level3_Stage1_Sunda.name = "Xa"
        
        let choice4_Quiz3_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level3_Stage1_Sunda.id = 4
        choice4_Quiz3_Level3_Stage1_Sunda.name = "Fa"
        
        let quiz3_level3_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level3_stage1_Sunda.id = 3
        quiz3_level3_stage1_Sunda.name = "Kuis 2"
        quiz3_level3_stage1_Sunda.type = "B"
        quiz3_level3_stage1_Sunda.isCorrect = false
        quiz3_level3_stage1_Sunda.question = "Pa"
        quiz3_level3_stage1_Sunda.choices = [choice1_Quiz3_Level3_Stage1_Sunda, choice2_Quiz3_Level3_Stage1_Sunda, choice3_Quiz3_Level3_Stage1_Sunda, choice4_Quiz3_Level3_Stage1_Sunda]
        quiz3_level3_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level3_Stage1_Sunda.id = 1
        choice1_Quiz4_Level3_Stage1_Sunda.name = "Fa"
        
        let choice2_Quiz4_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level3_Stage1_Sunda.id = 2
        choice2_Quiz4_Level3_Stage1_Sunda.name = "Sa"
        
        let choice3_Quiz4_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level3_Stage1_Sunda.id = 3
        choice3_Quiz4_Level3_Stage1_Sunda.name = "Pa"
        
        let choice4_Quiz4_Level3_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level3_Stage1_Sunda.id = 4
        choice4_Quiz4_Level3_Stage1_Sunda.name = "Xa"
        
        let quiz4_level3_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level3_stage1_Sunda.id = 4
        quiz4_level3_stage1_Sunda.name = "Kuis 3"
        quiz4_level3_stage1_Sunda.type = "C"
        quiz4_level3_stage1_Sunda.isCorrect = false
        quiz4_level3_stage1_Sunda.question = "Pa"
        quiz4_level3_stage1_Sunda.choices = [choice1_Quiz4_Level3_Stage1_Sunda, choice2_Quiz4_Level3_Stage1_Sunda, choice3_Quiz4_Level3_Stage1_Sunda, choice4_Quiz4_Level3_Stage1_Sunda]
        quiz4_level3_stage1_Sunda.images = []
        
        let quiz5_level3_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level3_stage1_Sunda.id = 5
        quiz5_level3_stage1_Sunda.name = "Kuis 4"
        quiz5_level3_stage1_Sunda.type = "D"
        quiz5_level3_stage1_Sunda.isCorrect = false
        quiz5_level3_stage1_Sunda.question = "Pa"
        quiz5_level3_stage1_Sunda.choices = []
        quiz5_level3_stage1_Sunda.images = []
        
        let quiz6_level3_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level3_stage1_Sunda.id = 6
        quiz6_level3_stage1_Sunda.name = "Kuis 5"
        quiz6_level3_stage1_Sunda.type = "E"
        quiz6_level3_stage1_Sunda.isCorrect = false
        quiz6_level3_stage1_Sunda.question = "Pa"
        quiz6_level3_stage1_Sunda.choices = []
        quiz6_level3_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 4 Stage 1 Jawa
        let quiz1_level4_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level4_stage1_Sunda.id = 1
        quiz1_level4_stage1_Sunda.name = "Panduan"
        quiz1_level4_stage1_Sunda.type = "Panduan"
        quiz1_level4_stage1_Sunda.isCorrect = false
        quiz1_level4_stage1_Sunda.question = "Ba"
        quiz1_level4_stage1_Sunda.choices = []
        quiz1_level4_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level4_Stage1_Sunda.id = 1
        choice1_Quiz2_Level4_Stage1_Sunda.name = "Ka"
        
        let choice2_Quiz2_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level4_Stage1_Sunda.id = 2
        choice2_Quiz2_Level4_Stage1_Sunda.name = "Da"
        
        let choice3_Quiz2_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level4_Stage1_Sunda.id = 3
        choice3_Quiz2_Level4_Stage1_Sunda.name = "Ba"
        
        let choice4_Quiz2_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level4_Stage1_Sunda.id = 4
        choice4_Quiz2_Level4_Stage1_Sunda.name = "Ma"
        
        let quiz2_level4_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level4_stage1_Sunda.id = 2
        quiz2_level4_stage1_Sunda.name = "Kuis 1"
        quiz2_level4_stage1_Sunda.type = "A"
        quiz2_level4_stage1_Sunda.isCorrect = false
        quiz2_level4_stage1_Sunda.question = "Ba"
        quiz2_level4_stage1_Sunda.choices = [choice1_Quiz2_Level4_Stage1_Sunda, choice2_Quiz2_Level4_Stage1_Sunda, choice3_Quiz2_Level4_Stage1_Sunda, choice4_Quiz2_Level4_Stage1_Sunda]
        quiz2_level4_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level4_Stage1_Sunda.id = 1
        choice1_Quiz3_Level4_Stage1_Sunda.name = "Ja"
        
        let choice2_Quiz3_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level4_Stage1_Sunda.id = 2
        choice2_Quiz3_Level4_Stage1_Sunda.name = "Ma"
        
        let choice3_Quiz3_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level4_Stage1_Sunda.id = 3
        choice3_Quiz3_Level4_Stage1_Sunda.name = "Ba"
        
        let choice4_Quiz3_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level4_Stage1_Sunda.id = 4
        choice4_Quiz3_Level4_Stage1_Sunda.name = "Da"
        
        let quiz3_level4_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level4_stage1_Sunda.id = 3
        quiz3_level4_stage1_Sunda.name = "Kuis 2"
        quiz3_level4_stage1_Sunda.type = "B"
        quiz3_level4_stage1_Sunda.isCorrect = false
        quiz3_level4_stage1_Sunda.question = "Ba"
        quiz3_level4_stage1_Sunda.choices = [choice1_Quiz3_Level4_Stage1_Sunda, choice2_Quiz3_Level4_Stage1_Sunda, choice3_Quiz3_Level4_Stage1_Sunda, choice4_Quiz3_Level4_Stage1_Sunda]
        quiz3_level4_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level4_Stage1_Sunda.id = 1
        choice1_Quiz4_Level4_Stage1_Sunda.name = "Da"
        
        let choice2_Quiz4_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level4_Stage1_Sunda.id = 2
        choice2_Quiz4_Level4_Stage1_Sunda.name = "Ba"
        
        let choice3_Quiz4_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level4_Stage1_Sunda.id = 3
        choice3_Quiz4_Level4_Stage1_Sunda.name = "Ja"
        
        let choice4_Quiz4_Level4_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level4_Stage1_Sunda.id = 4
        choice4_Quiz4_Level4_Stage1_Sunda.name = "Ma"
        
        let quiz4_level4_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level4_stage1_Sunda.id = 4
        quiz4_level4_stage1_Sunda.name = "Kuis 3"
        quiz4_level4_stage1_Sunda.type = "C"
        quiz4_level4_stage1_Sunda.isCorrect = false
        quiz4_level4_stage1_Sunda.question = "Ba"
        quiz4_level4_stage1_Sunda.choices = [choice1_Quiz4_Level4_Stage1_Sunda, choice2_Quiz4_Level4_Stage1_Sunda, choice3_Quiz4_Level4_Stage1_Sunda, choice4_Quiz4_Level4_Stage1_Sunda]
        quiz4_level4_stage1_Jawa.images = []
        
        let quiz5_level4_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level4_stage1_Sunda.id = 5
        quiz5_level4_stage1_Sunda.name = "Kuis 4"
        quiz5_level4_stage1_Sunda.type = "D"
        quiz5_level4_stage1_Sunda.isCorrect = false
        quiz5_level4_stage1_Sunda.question = "Ba"
        quiz5_level4_stage1_Sunda.choices = []
        quiz5_level4_stage1_Sunda.images = []
        
        let quiz6_level4_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level4_stage1_Sunda.id = 6
        quiz6_level4_stage1_Sunda.name = "Kuis 5"
        quiz6_level4_stage1_Sunda.type = "E"
        quiz6_level4_stage1_Sunda.isCorrect = false
        quiz6_level4_stage1_Sunda.question = "Ba"
        quiz6_level4_stage1_Sunda.choices = []
        quiz6_level4_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 5 Stage 1 Jawa
        let quiz1_level5_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level5_stage1_Sunda.id = 1
        quiz1_level5_stage1_Sunda.name = "Panduan"
        quiz1_level5_stage1_Sunda.type = "Panduan"
        quiz1_level5_stage1_Sunda.isCorrect = false
        quiz1_level5_stage1_Sunda.question = "Nga"
        quiz1_level5_stage1_Sunda.choices = []
        quiz1_level5_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level5_Stage1_Sunda.id = 1
        choice1_Quiz2_Level5_Stage1_Sunda.name = "Nga"
        
        let choice2_Quiz2_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level5_Stage1_Sunda.id = 2
        choice2_Quiz2_Level5_Stage1_Sunda.name = "La"
        
        let choice3_Quiz2_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level5_Stage1_Sunda.id = 3
        choice3_Quiz2_Level5_Stage1_Sunda.name = "Ga"
        
        let choice4_Quiz2_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level5_Stage1_Sunda.id = 4
        choice4_Quiz2_Level5_Stage1_Sunda.name = "Na"
        
        let quiz2_level5_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level5_stage1_Sunda.id = 2
        quiz2_level5_stage1_Sunda.name = "Kuis 1"
        quiz2_level5_stage1_Sunda.type = "A"
        quiz2_level5_stage1_Sunda.isCorrect = false
        quiz2_level5_stage1_Sunda.question = "Nga"
        quiz2_level5_stage1_Sunda.choices = [choice1_Quiz2_Level5_Stage1_Sunda, choice2_Quiz2_Level5_Stage1_Sunda, choice3_Quiz2_Level5_Stage1_Sunda, choice4_Quiz2_Level5_Stage1_Sunda]
        quiz2_level5_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level5_Stage1_Sunda.id = 1
        choice1_Quiz3_Level5_Stage1_Sunda.name = "Ga"
        
        let choice2_Quiz3_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level5_Stage1_Sunda.id = 2
        choice2_Quiz3_Level5_Stage1_Sunda.name = "Nga"
        
        let choice3_Quiz3_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level5_Stage1_Sunda.id = 3
        choice3_Quiz3_Level5_Stage1_Sunda.name = "Ja"
        
        let choice4_Quiz3_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level5_Stage1_Sunda.id = 4
        choice4_Quiz3_Level5_Stage1_Sunda.name = "Na"
        
        let quiz3_level5_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level5_stage1_Sunda.id = 3
        quiz3_level5_stage1_Sunda.name = "Kuis 2"
        quiz3_level5_stage1_Sunda.type = "B"
        quiz3_level5_stage1_Sunda.isCorrect = false
        quiz3_level5_stage1_Sunda.question = "Nga"
        quiz3_level5_stage1_Sunda.choices = [choice1_Quiz3_Level5_Stage1_Sunda, choice2_Quiz3_Level5_Stage1_Sunda, choice3_Quiz3_Level5_Stage1_Sunda, choice4_Quiz3_Level5_Stage1_Sunda]
        quiz3_level5_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level5_Stage1_Sunda.id = 1
        choice1_Quiz4_Level5_Stage1_Sunda.name = "Nga"
        
        let choice2_Quiz4_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level5_Stage1_Sunda.id = 2
        choice2_Quiz4_Level5_Stage1_Sunda.name = "Na"
        
        let choice3_Quiz4_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level5_Stage1_Sunda.id = 3
        choice3_Quiz4_Level5_Stage1_Sunda.name = "Ga"
        
        let choice4_Quiz4_Level5_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level5_Stage1_Sunda.id = 4
        choice4_Quiz4_Level5_Stage1_Sunda.name = "Ja"
        
        let quiz4_level5_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level5_stage1_Sunda.id = 4
        quiz4_level5_stage1_Sunda.name = "Kuis 3"
        quiz4_level5_stage1_Sunda.type = "C"
        quiz4_level5_stage1_Sunda.isCorrect = false
        quiz4_level5_stage1_Sunda.question = "Nga"
        quiz4_level5_stage1_Sunda.choices = [choice1_Quiz4_Level5_Stage1_Sunda, choice2_Quiz4_Level5_Stage1_Sunda, choice3_Quiz4_Level5_Stage1_Sunda, choice4_Quiz4_Level5_Stage1_Sunda]
        quiz4_level5_stage1_Sunda.images = []
        
        let quiz5_level5_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level5_stage1_Sunda.id = 5
        quiz5_level5_stage1_Sunda.name = "Kuis 4"
        quiz5_level5_stage1_Sunda.type = "D"
        quiz5_level5_stage1_Sunda.isCorrect = false
        quiz5_level5_stage1_Sunda.question = "Nga"
        quiz5_level5_stage1_Sunda.choices = []
        quiz5_level5_stage1_Sunda.images = []
        
        let quiz6_level5_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level5_stage1_Sunda.id = 6
        quiz6_level5_stage1_Sunda.name = "Kuis 5"
        quiz6_level5_stage1_Sunda.type = "E"
        quiz6_level5_stage1_Sunda.isCorrect = false
        quiz6_level5_stage1_Sunda.question = "Nga"
        quiz6_level5_stage1_Sunda.choices = []
        quiz6_level5_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 6 Stage 1 Jawa
        let quiz1_level6_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level6_stage1_Sunda.id = 1
        quiz1_level6_stage1_Sunda.name = "Panduan"
        quiz1_level6_stage1_Sunda.type = "Panduan"
        quiz1_level6_stage1_Sunda.isCorrect = false
        quiz1_level6_stage1_Sunda.question = "Da"
        quiz1_level6_stage1_Sunda.choices = []
        quiz1_level6_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level6_Stage1_Sunda.id = 1
        choice1_Quiz2_Level6_Stage1_Sunda.name = "Ga"
        
        let choice2_Quiz2_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level6_Stage1_Sunda.id = 2
        choice2_Quiz2_Level6_Stage1_Sunda.name = "Wa"
        
        let choice3_Quiz2_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level6_Stage1_Sunda.id = 3
        choice3_Quiz2_Level6_Stage1_Sunda.name = "Da"
        
        let choice4_Quiz2_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level6_Stage1_Sunda.id = 4
        choice4_Quiz2_Level6_Stage1_Sunda.name = "Ja"
        
        let quiz2_level6_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level6_stage1_Sunda.id = 2
        quiz2_level6_stage1_Sunda.name = "Kuis 1"
        quiz2_level6_stage1_Sunda.type = "A"
        quiz2_level6_stage1_Sunda.isCorrect = false
        quiz2_level6_stage1_Sunda.question = "Da"
        quiz2_level6_stage1_Sunda.choices = [choice1_Quiz2_Level6_Stage1_Sunda, choice2_Quiz2_Level6_Stage1_Sunda, choice3_Quiz2_Level6_Stage1_Sunda, choice4_Quiz2_Level6_Stage1_Sunda]
        quiz2_level6_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level6_Stage1_Sunda.id = 1
        choice1_Quiz3_Level6_Stage1_Sunda.name = "Da"
        
        let choice2_Quiz3_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level6_Stage1_Sunda.id = 2
        choice2_Quiz3_Level6_Stage1_Sunda.name = "I"
        
        let choice3_Quiz3_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level6_Stage1_Sunda.id = 3
        choice3_Quiz3_Level6_Stage1_Sunda.name = "Ga"
        
        let choice4_Quiz3_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level6_Stage1_Sunda.id = 4
        choice4_Quiz3_Level6_Stage1_Sunda.name = "Ja"
        
        let quiz3_level6_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level6_stage1_Sunda.id = 3
        quiz3_level6_stage1_Sunda.name = "Kuis 2"
        quiz3_level6_stage1_Sunda.type = "B"
        quiz3_level6_stage1_Sunda.isCorrect = false
        quiz3_level6_stage1_Sunda.question = "Da"
        quiz3_level6_stage1_Sunda.choices = [choice1_Quiz3_Level6_Stage1_Sunda, choice2_Quiz3_Level6_Stage1_Sunda, choice3_Quiz3_Level6_Stage1_Sunda, choice4_Quiz3_Level6_Stage1_Sunda]
        quiz3_level6_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level6_Stage1_Sunda.id = 1
        choice1_Quiz4_Level6_Stage1_Sunda.name = "Ia"
        
        let choice2_Quiz4_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level6_Stage1_Sunda.id = 2
        choice2_Quiz4_Level6_Stage1_Sunda.name = "Da"
        
        let choice3_Quiz4_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level6_Stage1_Sunda.id = 3
        choice3_Quiz4_Level6_Stage1_Sunda.name = "Ja"
        
        let choice4_Quiz4_Level6_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level6_Stage1_Sunda.id = 4
        choice4_Quiz4_Level6_Stage1_Sunda.name = "Ga"
        
        let quiz4_level6_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level6_stage1_Sunda.id = 4
        quiz4_level6_stage1_Sunda.name = "Kuis 3"
        quiz4_level6_stage1_Sunda.type = "C"
        quiz4_level6_stage1_Sunda.isCorrect = false
        quiz4_level6_stage1_Sunda.question = "Da"
        quiz4_level6_stage1_Sunda.choices = [choice1_Quiz4_Level6_Stage1_Sunda, choice2_Quiz4_Level6_Stage1_Sunda, choice3_Quiz4_Level6_Stage1_Sunda, choice4_Quiz4_Level6_Stage1_Sunda]
        quiz4_level6_stage1_Sunda.images = []
        
        let quiz5_level6_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level6_stage1_Sunda.id = 5
        quiz5_level6_stage1_Sunda.name = "Kuis 4"
        quiz5_level6_stage1_Sunda.type = "D"
        quiz5_level6_stage1_Sunda.isCorrect = false
        quiz5_level6_stage1_Sunda.question = "Da"
        quiz5_level6_stage1_Sunda.choices = []
        quiz5_level6_stage1_Sunda.images = []
        
        let quiz6_level6_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level6_stage1_Sunda.id = 6
        quiz6_level6_stage1_Sunda.name = "Kuis 5"
        quiz6_level6_stage1_Sunda.type = "E"
        quiz6_level6_stage1_Sunda.isCorrect = false
        quiz6_level6_stage1_Sunda.question = "Da"
        quiz6_level6_stage1_Sunda.choices = []
        quiz6_level6_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 7 Stage 1 Jawa
        let quiz1_level7_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level7_stage1_Sunda.id = 1
        quiz1_level7_stage1_Sunda.name = "Panduan"
        quiz1_level7_stage1_Sunda.type = "Panduan"
        quiz1_level7_stage1_Sunda.isCorrect = false
        quiz1_level7_stage1_Sunda.question = "É"
        quiz1_level7_stage1_Sunda.choices = []
        quiz1_level7_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level7_Stage1_Sunda.id = 1
        choice1_Quiz2_Level7_Stage1_Sunda.name = "A"
        
        let choice2_Quiz2_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level7_Stage1_Sunda.id = 2
        choice2_Quiz2_Level7_Stage1_Sunda.name = "É"
        
        let choice3_Quiz2_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level7_Stage1_Sunda.id = 3
        choice3_Quiz2_Level7_Stage1_Sunda.name = "U"
        
        let choice4_Quiz2_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level7_Stage1_Sunda.id = 4
        choice4_Quiz2_Level7_Stage1_Sunda.name = "E"
        
        let quiz2_level7_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level7_stage1_Sunda.id = 2
        quiz2_level7_stage1_Sunda.name = "Kuis 1"
        quiz2_level7_stage1_Sunda.type = "A"
        quiz2_level7_stage1_Sunda.isCorrect = false
        quiz2_level7_stage1_Sunda.question = "É"
        quiz2_level7_stage1_Sunda.choices = [choice1_Quiz2_Level7_Stage1_Sunda, choice2_Quiz2_Level7_Stage1_Sunda, choice3_Quiz2_Level7_Stage1_Sunda, choice4_Quiz2_Level7_Stage1_Sunda]
        quiz2_level7_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level7_Stage1_Sunda.id = 1
        choice1_Quiz3_Level7_Stage1_Sunda.name = "Ya"
        
        let choice2_Quiz3_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level7_Stage1_Sunda.id = 2
        choice2_Quiz3_Level7_Stage1_Sunda.name = "É"
        
        let choice3_Quiz3_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level7_Stage1_Sunda.id = 3
        choice3_Quiz3_Level7_Stage1_Sunda.name = "A"
        
        let choice4_Quiz3_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level7_Stage1_Sunda.id = 4
        choice4_Quiz3_Level7_Stage1_Sunda.name = "Ta"
        
        let quiz3_level7_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level7_stage1_Sunda.id = 3
        quiz3_level7_stage1_Sunda.name = "Kuis 2"
        quiz3_level7_stage1_Sunda.type = "B"
        quiz3_level7_stage1_Sunda.isCorrect = false
        quiz3_level7_stage1_Sunda.question = "É"
        quiz3_level7_stage1_Sunda.choices = [choice1_Quiz3_Level7_Stage1_Sunda, choice2_Quiz3_Level7_Stage1_Sunda, choice3_Quiz3_Level7_Stage1_Sunda, choice4_Quiz3_Level7_Stage1_Sunda]
        quiz3_level7_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level7_Stage1_Sunda.id = 1
        choice1_Quiz4_Level7_Stage1_Sunda.name = "A"
        
        let choice2_Quiz4_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level7_Stage1_Sunda.id = 2
        choice2_Quiz4_Level7_Stage1_Sunda.name = "Ta"
        
        let choice3_Quiz4_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level7_Stage1_Sunda.id = 3
        choice3_Quiz4_Level7_Stage1_Sunda.name = "É"
        
        let choice4_Quiz4_Level7_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level7_Stage1_Sunda.id = 4
        choice4_Quiz4_Level7_Stage1_Sunda.name = "Ya"
        
        let quiz4_level7_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level7_stage1_Sunda.id = 4
        quiz4_level7_stage1_Sunda.name = "Kuis 3"
        quiz4_level7_stage1_Sunda.type = "C"
        quiz4_level7_stage1_Sunda.isCorrect = false
        quiz4_level7_stage1_Sunda.question = "É"
        quiz4_level7_stage1_Sunda.choices = [choice1_Quiz4_Level7_Stage1_Sunda, choice2_Quiz4_Level7_Stage1_Sunda, choice3_Quiz4_Level7_Stage1_Sunda, choice4_Quiz4_Level7_Stage1_Sunda]
        quiz4_level7_stage1_Sunda.images = []
        
        let quiz5_level7_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level7_stage1_Sunda.id = 5
        quiz5_level7_stage1_Sunda.name = "Kuis 4"
        quiz5_level7_stage1_Sunda.type = "D"
        quiz5_level7_stage1_Sunda.isCorrect = false
        quiz5_level7_stage1_Sunda.question = "É"
        quiz5_level7_stage1_Sunda.choices = []
        quiz5_level7_stage1_Sunda.images = []
        
        let quiz6_level7_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level7_stage1_Sunda.id = 6
        quiz6_level7_stage1_Sunda.name = "Kuis 5"
        quiz6_level7_stage1_Sunda.type = "E"
        quiz6_level7_stage1_Sunda.isCorrect = false
        quiz6_level7_stage1_Sunda.question = "É"
        quiz6_level7_stage1_Sunda.choices = []
        quiz6_level7_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 8 Stage 1 Jawa
        let quiz1_level8_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level8_stage1_Sunda.id = 1
        quiz1_level8_stage1_Sunda.name = "Panduan"
        quiz1_level8_stage1_Sunda.type = "Panduan"
        quiz1_level8_stage1_Sunda.isCorrect = false
        quiz1_level8_stage1_Sunda.question = "Ga"
        quiz1_level8_stage1_Sunda.choices = []
        quiz1_level8_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level8_Stage1_Sunda.id = 1
        choice1_Quiz2_Level8_Stage1_Sunda.name = "Ja"
        
        let choice2_Quiz2_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level8_Stage1_Sunda.id = 2
        choice2_Quiz2_Level8_Stage1_Sunda.name = "Ga"
        
        let choice3_Quiz2_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level8_Stage1_Sunda.id = 3
        choice3_Quiz2_Level8_Stage1_Sunda.name = "Ma"
        
        let choice4_Quiz2_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level8_Stage1_Sunda.id = 4
        choice4_Quiz2_Level8_Stage1_Sunda.name = "Ta"
        
        let quiz2_level8_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level8_stage1_Sunda.id = 2
        quiz2_level8_stage1_Sunda.name = "Kuis 1"
        quiz2_level8_stage1_Sunda.type = "A"
        quiz2_level8_stage1_Sunda.isCorrect = false
        quiz2_level8_stage1_Sunda.question = "Ga"
        quiz2_level8_stage1_Sunda.choices = [choice1_Quiz2_Level8_Stage1_Sunda, choice2_Quiz2_Level8_Stage1_Sunda, choice3_Quiz2_Level8_Stage1_Sunda, choice4_Quiz2_Level8_Stage1_Sunda]
        quiz2_level8_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level8_Stage1_Sunda.id = 1
        choice1_Quiz3_Level8_Stage1_Sunda.name = "Ma"
        
        let choice2_Quiz3_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level8_Stage1_Sunda.id = 2
        choice2_Quiz3_Level8_Stage1_Sunda.name = "Na"
        
        let choice3_Quiz3_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level8_Stage1_Sunda.id = 3
        choice3_Quiz3_Level8_Stage1_Sunda.name = "Wa"
        
        let choice4_Quiz3_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level8_Stage1_Sunda.id = 4
        choice4_Quiz3_Level8_Stage1_Sunda.name = "Ga"
        
        let quiz3_level8_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level8_stage1_Sunda.id = 3
        quiz3_level8_stage1_Sunda.name = "Kuis 2"
        quiz3_level8_stage1_Sunda.type = "B"
        quiz3_level8_stage1_Sunda.isCorrect = false
        quiz3_level8_stage1_Sunda.question = "Ga"
        quiz3_level8_stage1_Sunda.choices = [choice1_Quiz3_Level8_Stage1_Sunda, choice2_Quiz3_Level8_Stage1_Sunda, choice3_Quiz3_Level8_Stage1_Sunda, choice4_Quiz3_Level8_Stage1_Sunda]
        quiz3_level8_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level8_Stage1_Sunda.id = 1
        choice1_Quiz4_Level8_Stage1_Sunda.name = "Na"
        
        let choice2_Quiz4_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level8_Stage1_Sunda.id = 2
        choice2_Quiz4_Level8_Stage1_Sunda.name = "Ga"
        
        let choice3_Quiz4_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level8_Stage1_Sunda.id = 3
        choice3_Quiz4_Level8_Stage1_Sunda.name = "Wa"
        
        let choice4_Quiz4_Level8_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level8_Stage1_Sunda.id = 4
        choice4_Quiz4_Level8_Stage1_Sunda.name = "Ma"
        
        let quiz4_level8_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level8_stage1_Sunda.id = 4
        quiz4_level8_stage1_Sunda.name = "Kuis 3"
        quiz4_level8_stage1_Sunda.type = "C"
        quiz4_level8_stage1_Sunda.isCorrect = false
        quiz4_level8_stage1_Sunda.question = "Ga"
        quiz4_level8_stage1_Sunda.choices = [choice1_Quiz4_Level8_Stage1_Sunda, choice2_Quiz4_Level8_Stage1_Sunda, choice3_Quiz4_Level8_Stage1_Sunda, choice4_Quiz4_Level8_Stage1_Sunda]
        quiz4_level8_stage1_Sunda.images = []
        
        let quiz5_level8_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level8_stage1_Sunda.id = 5
        quiz5_level8_stage1_Sunda.name = "Kuis 4"
        quiz5_level8_stage1_Sunda.type = "D"
        quiz5_level8_stage1_Sunda.isCorrect = false
        quiz5_level8_stage1_Sunda.question = "Ga"
        quiz5_level8_stage1_Sunda.choices = []
        quiz5_level8_stage1_Sunda.images = []
        
        let quiz6_level8_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level8_stage1_Sunda.id = 6
        quiz6_level8_stage1_Sunda.name = "Kuis 5"
        quiz6_level8_stage1_Sunda.type = "E"
        quiz6_level8_stage1_Sunda.isCorrect = false
        quiz6_level8_stage1_Sunda.question = "Ga"
        quiz6_level8_stage1_Sunda.choices = []
        quiz6_level8_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 9 Stage 1 Jawa
        let quiz1_level9_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level9_stage1_Sunda.id = 1
        quiz1_level9_stage1_Sunda.name = "Panduan"
        quiz1_level9_stage1_Sunda.type = "Panduan"
        quiz1_level9_stage1_Sunda.isCorrect = false
        quiz1_level9_stage1_Sunda.question = "U"
        quiz1_level9_stage1_Sunda.choices = []
        quiz1_level9_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level9_Stage1_Sunda.id = 1
        choice1_Quiz2_Level9_Stage1_Sunda.name = "U"
        
        let choice2_Quiz2_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level9_Stage1_Sunda.id = 2
        choice2_Quiz2_Level9_Stage1_Sunda.name = "Va"
        
        let choice3_Quiz2_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level9_Stage1_Sunda.id = 3
        choice3_Quiz2_Level9_Stage1_Sunda.name = "Wa"
        
        let choice4_Quiz2_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level9_Stage1_Sunda.id = 4
        choice4_Quiz2_Level9_Stage1_Sunda.name = "O"
        
        let quiz2_level9_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level9_stage1_Sunda.id = 2
        quiz2_level9_stage1_Sunda.name = "Kuis 1"
        quiz2_level9_stage1_Sunda.type = "A"
        quiz2_level9_stage1_Sunda.isCorrect = false
        quiz2_level9_stage1_Sunda.question = "U"
        quiz2_level9_stage1_Sunda.choices = [choice1_Quiz2_Level9_Stage1_Sunda, choice2_Quiz2_Level9_Stage1_Sunda, choice3_Quiz2_Level9_Stage1_Sunda, choice4_Quiz2_Level9_Stage1_Sunda]
        quiz2_level9_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level9_Stage1_Sunda.id = 1
        choice1_Quiz3_Level9_Stage1_Sunda.name = "Va"
        
        let choice2_Quiz3_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level9_Stage1_Sunda.id = 2
        choice2_Quiz3_Level9_Stage1_Sunda.name = "Za"
        
        let choice3_Quiz3_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level9_Stage1_Sunda.id = 3
        choice3_Quiz3_Level9_Stage1_Sunda.name = "Ha"
        
        let choice4_Quiz3_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level9_Stage1_Sunda.id = 4
        choice4_Quiz3_Level9_Stage1_Sunda.name = "U"
        
        let quiz3_level9_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level9_stage1_Sunda.id = 3
        quiz3_level9_stage1_Sunda.name = "Kuis 2"
        quiz3_level9_stage1_Sunda.type = "B"
        quiz3_level9_stage1_Sunda.isCorrect = false
        quiz3_level9_stage1_Sunda.question = "U"
        quiz3_level9_stage1_Sunda.choices = [choice1_Quiz3_Level9_Stage1_Sunda, choice2_Quiz3_Level9_Stage1_Sunda, choice3_Quiz3_Level9_Stage1_Sunda, choice4_Quiz3_Level9_Stage1_Sunda]
        quiz3_level9_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level9_Stage1_Sunda.id = 1
        choice1_Quiz4_Level9_Stage1_Sunda.name = "Za"
        
        let choice2_Quiz4_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level9_Stage1_Sunda.id = 2
        choice2_Quiz4_Level9_Stage1_Sunda.name = "Ha"
        
        let choice3_Quiz4_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level9_Stage1_Sunda.id = 3
        choice3_Quiz4_Level9_Stage1_Sunda.name = "U"
        
        let choice4_Quiz4_Level9_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level9_Stage1_Sunda.id = 4
        choice4_Quiz4_Level9_Stage1_Sunda.name = "Va"
        
        let quiz4_level9_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level9_stage1_Sunda.id = 4
        quiz4_level9_stage1_Sunda.name = "Kuis 3"
        quiz4_level9_stage1_Sunda.type = "C"
        quiz4_level9_stage1_Sunda.isCorrect = false
        quiz4_level9_stage1_Sunda.question = "U"
        quiz4_level9_stage1_Sunda.choices = [choice1_Quiz4_Level9_Stage1_Sunda, choice2_Quiz4_Level9_Stage1_Sunda, choice3_Quiz4_Level9_Stage1_Sunda, choice4_Quiz4_Level9_Stage1_Sunda]
        quiz4_level9_stage1_Sunda.images = []
        
        let quiz5_level9_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level9_stage1_Sunda.id = 5
        quiz5_level9_stage1_Sunda.name = "Kuis 4"
        quiz5_level9_stage1_Sunda.type = "D"
        quiz5_level9_stage1_Sunda.isCorrect = false
        quiz5_level9_stage1_Sunda.question = "U"
        quiz5_level9_stage1_Sunda.choices = []
        quiz5_level9_stage1_Sunda.images = []
        
        let quiz6_level9_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level9_stage1_Sunda.id = 6
        quiz6_level9_stage1_Sunda.name = "Kuis 5"
        quiz6_level9_stage1_Sunda.type = "E"
        quiz6_level9_stage1_Sunda.isCorrect = false
        quiz6_level9_stage1_Sunda.question = "U"
        quiz6_level9_stage1_Sunda.choices = []
        quiz6_level9_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 10 Stage 1 Jawa
        let quiz1_level10_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level10_stage1_Sunda.id = 1
        quiz1_level10_stage1_Sunda.name = "Panduan"
        quiz1_level10_stage1_Sunda.type = "Panduan"
        quiz1_level10_stage1_Sunda.isCorrect = false
        quiz1_level10_stage1_Sunda.question = "E"
        quiz1_level10_stage1_Sunda.choices = []
        quiz1_level10_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level10_Stage1_Sunda.id = 1
        choice1_Quiz2_Level10_Stage1_Sunda.name = "Eu"
        
        let choice2_Quiz2_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level10_Stage1_Sunda.id = 2
        choice2_Quiz2_Level10_Stage1_Sunda.name = "Sa"
        
        let choice3_Quiz2_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level10_Stage1_Sunda.id = 3
        choice3_Quiz2_Level10_Stage1_Sunda.name = "Za"
        
        let choice4_Quiz2_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level10_Stage1_Sunda.id = 4
        choice4_Quiz2_Level10_Stage1_Sunda.name = "E"
        
        let quiz2_level10_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level10_stage1_Sunda.id = 2
        quiz2_level10_stage1_Sunda.name = "Kuis 1"
        quiz2_level10_stage1_Sunda.type = "A"
        quiz2_level10_stage1_Sunda.isCorrect = false
        quiz2_level10_stage1_Sunda.question = "E"
        quiz2_level10_stage1_Sunda.choices = [choice1_Quiz2_Level10_Stage1_Sunda, choice2_Quiz2_Level10_Stage1_Sunda, choice3_Quiz2_Level10_Stage1_Sunda, choice4_Quiz2_Level10_Stage1_Sunda]
        quiz2_level10_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level10_Stage1_Sunda.id = 1
        choice1_Quiz3_Level10_Stage1_Sunda.name = "Wa"
        
        let choice2_Quiz3_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level10_Stage1_Sunda.id = 2
        choice2_Quiz3_Level10_Stage1_Sunda.name = "Na"
        
        let choice3_Quiz3_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level10_Stage1_Sunda.id = 3
        choice3_Quiz3_Level10_Stage1_Sunda.name = "E"
        
        let choice4_Quiz3_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level10_Stage1_Sunda.id = 4
        choice4_Quiz3_Level10_Stage1_Sunda.name = "Qa"
        
        let quiz3_level10_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level10_stage1_Sunda.id = 3
        quiz3_level10_stage1_Sunda.name = "Kuis 2"
        quiz3_level10_stage1_Sunda.type = "B"
        quiz3_level10_stage1_Sunda.isCorrect = false
        quiz3_level10_stage1_Sunda.question = "E"
        quiz3_level10_stage1_Sunda.choices = [choice1_Quiz3_Level10_Stage1_Sunda, choice2_Quiz3_Level10_Stage1_Sunda, choice3_Quiz3_Level10_Stage1_Sunda, choice4_Quiz3_Level10_Stage1_Sunda]
        quiz3_level10_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level10_Stage1_Sunda.id = 1
        choice1_Quiz4_Level10_Stage1_Sunda.name = "E"
        
        let choice2_Quiz4_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level10_Stage1_Sunda.id = 2
        choice2_Quiz4_Level10_Stage1_Sunda.name = "Qa"
        
        let choice3_Quiz4_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level10_Stage1_Sunda.id = 3
        choice3_Quiz4_Level10_Stage1_Sunda.name = "Na"
        
        let choice4_Quiz4_Level10_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level10_Stage1_Sunda.id = 4
        choice4_Quiz4_Level10_Stage1_Sunda.name = "Wa"
        
        let quiz4_level10_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level10_stage1_Sunda.id = 4
        quiz4_level10_stage1_Sunda.name = "Kuis 3"
        quiz4_level10_stage1_Sunda.type = "C"
        quiz4_level10_stage1_Sunda.isCorrect = false
        quiz4_level10_stage1_Sunda.question = "E"
        quiz4_level10_stage1_Sunda.choices = [choice1_Quiz4_Level10_Stage1_Sunda, choice2_Quiz4_Level10_Stage1_Sunda, choice3_Quiz4_Level10_Stage1_Sunda, choice4_Quiz4_Level10_Stage1_Sunda]
        quiz4_level10_stage1_Sunda.images = []
        
        let quiz5_level10_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level10_stage1_Sunda.id = 5
        quiz5_level10_stage1_Sunda.name = "Kuis 4"
        quiz5_level10_stage1_Sunda.type = "D"
        quiz5_level10_stage1_Sunda.isCorrect = false
        quiz5_level10_stage1_Sunda.question = "E"
        quiz5_level10_stage1_Sunda.choices = []
        quiz5_level10_stage1_Sunda.images = []
        
        let quiz6_level10_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level10_stage1_Sunda.id = 6
        quiz6_level10_stage1_Sunda.name = "Kuis 5"
        quiz6_level10_stage1_Sunda.type = "E"
        quiz6_level10_stage1_Sunda.isCorrect = false
        quiz6_level10_stage1_Sunda.question = "Ya"
        quiz6_level10_stage1_Sunda.choices = []
        quiz6_level10_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 11 Stage 1 Jawa
        let quiz1_level11_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level11_stage1_Sunda.id = 1
        quiz1_level11_stage1_Sunda.name = "Panduan"
        quiz1_level11_stage1_Sunda.type = "Panduan"
        quiz1_level11_stage1_Sunda.isCorrect = false
        quiz1_level11_stage1_Sunda.question = "La"
        quiz1_level11_stage1_Sunda.choices = []
        quiz1_level11_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level11_Stage1_Sunda.id = 1
        choice1_Quiz2_Level11_Stage1_Sunda.name = "Qa"
        
        let choice2_Quiz2_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level11_Stage1_Sunda.id = 2
        choice2_Quiz2_Level11_Stage1_Sunda.name = "Ra"
        
        let choice3_Quiz2_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level11_Stage1_Sunda.id = 3
        choice3_Quiz2_Level11_Stage1_Sunda.name = "La"
        
        let choice4_Quiz2_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level11_Stage1_Sunda.id = 4
        choice4_Quiz2_Level11_Stage1_Sunda.name = "O"
        
        let quiz2_level11_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level11_stage1_Sunda.id = 2
        quiz2_level11_stage1_Sunda.name = "Kuis 1"
        quiz2_level11_stage1_Sunda.type = "A"
        quiz2_level11_stage1_Sunda.isCorrect = false
        quiz2_level11_stage1_Sunda.question = "La"
        quiz2_level11_stage1_Sunda.choices = [choice1_Quiz2_Level11_Stage1_Sunda, choice2_Quiz2_Level11_Stage1_Sunda, choice3_Quiz2_Level11_Stage1_Sunda, choice4_Quiz2_Level11_Stage1_Sunda]
        quiz2_level11_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level11_Stage1_Sunda.id = 1
        choice1_Quiz3_Level11_Stage1_Sunda.name = "Na"
        
        let choice2_Quiz3_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level11_Stage1_Sunda.id = 2
        choice2_Quiz3_Level11_Stage1_Sunda.name = "La"
        
        let choice3_Quiz3_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level11_Stage1_Sunda.id = 3
        choice3_Quiz3_Level11_Stage1_Sunda.name = "I"
        
        let choice4_Quiz3_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level11_Stage1_Sunda.id = 4
        choice4_Quiz3_Level11_Stage1_Sunda.name = "Wa"
        
        let quiz3_level11_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level11_stage1_Sunda.id = 3
        quiz3_level11_stage1_Sunda.name = "Kuis 2"
        quiz3_level11_stage1_Sunda.type = "B"
        quiz3_level11_stage1_Sunda.isCorrect = false
        quiz3_level11_stage1_Sunda.question = "La"
        quiz3_level11_stage1_Sunda.choices = [choice1_Quiz3_Level11_Stage1_Sunda, choice2_Quiz3_Level11_Stage1_Sunda, choice3_Quiz3_Level11_Stage1_Sunda, choice4_Quiz3_Level11_Stage1_Sunda]
        quiz3_level11_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level11_Stage1_Sunda.id = 1
        choice1_Quiz4_Level11_Stage1_Sunda.name = "I"
        
        let choice2_Quiz4_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level11_Stage1_Sunda.id = 2
        choice2_Quiz4_Level11_Stage1_Sunda.name = "Wa"
        
        let choice3_Quiz4_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level11_Stage1_Sunda.id = 3
        choice3_Quiz4_Level11_Stage1_Sunda.name = "La"
        
        let choice4_Quiz4_Level11_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level11_Stage1_Sunda.id = 4
        choice4_Quiz4_Level11_Stage1_Sunda.name = "Na"
        
        let quiz4_level11_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level11_stage1_Sunda.id = 4
        quiz4_level11_stage1_Sunda.name = "Kuis 3"
        quiz4_level11_stage1_Sunda.type = "C"
        quiz4_level11_stage1_Sunda.isCorrect = false
        quiz4_level11_stage1_Sunda.question = "La"
        quiz4_level11_stage1_Sunda.choices = [choice1_Quiz4_Level11_Stage1_Sunda, choice2_Quiz4_Level11_Stage1_Sunda, choice3_Quiz4_Level11_Stage1_Sunda, choice4_Quiz4_Level11_Stage1_Sunda]
        quiz4_level11_stage1_Sunda.images = []
        
        let quiz5_level11_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level11_stage1_Sunda.id = 5
        quiz5_level11_stage1_Sunda.name = "Kuis 4"
        quiz5_level11_stage1_Sunda.type = "D"
        quiz5_level11_stage1_Sunda.isCorrect = false
        quiz5_level11_stage1_Sunda.question = "La"
        quiz5_level11_stage1_Sunda.choices = []
        quiz5_level11_stage1_Sunda.images = []
        
        let quiz6_level11_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level11_stage1_Sunda.id = 6
        quiz6_level11_stage1_Sunda.name = "Kuis 5"
        quiz6_level11_stage1_Sunda.type = "E"
        quiz6_level11_stage1_Sunda.isCorrect = false
        quiz6_level11_stage1_Sunda.question = "La"
        quiz6_level11_stage1_Sunda.choices = []
        quiz6_level11_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 12 Stage 1 Jawa
        let quiz1_level12_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level12_stage1_Sunda.id = 1
        quiz1_level12_stage1_Sunda.name = "Panduan"
        quiz1_level12_stage1_Sunda.type = "Panduan"
        quiz1_level12_stage1_Sunda.isCorrect = false
        quiz1_level12_stage1_Sunda.question = "Ha"
        quiz1_level12_stage1_Sunda.choices = []
        quiz1_level12_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level12_Stage1_Sunda.id = 1
        choice1_Quiz2_Level12_Stage1_Sunda.name = "Ha"
        
        let choice2_Quiz2_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level12_Stage1_Sunda.id = 2
        choice2_Quiz2_Level12_Stage1_Sunda.name = "Na"
        
        let choice3_Quiz2_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level12_Stage1_Sunda.id = 3
        choice3_Quiz2_Level12_Stage1_Sunda.name = "Ca"
        
        let choice4_Quiz2_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level12_Stage1_Sunda.id = 4
        choice4_Quiz2_Level12_Stage1_Sunda.name = "Ra"
        
        let quiz2_level12_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level12_stage1_Sunda.id = 2
        quiz2_level12_stage1_Sunda.name = "Kuis 1"
        quiz2_level12_stage1_Sunda.type = "A"
        quiz2_level12_stage1_Sunda.isCorrect = false
        quiz2_level12_stage1_Sunda.question = "Ha"
        quiz2_level12_stage1_Sunda.choices = [choice1_Quiz2_Level12_Stage1_Sunda, choice2_Quiz2_Level12_Stage1_Sunda, choice3_Quiz2_Level12_Stage1_Sunda, choice4_Quiz2_Level12_Stage1_Sunda]
        quiz2_level12_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level12_Stage1_Sunda.id = 1
        choice1_Quiz3_Level12_Stage1_Sunda.name = "Ha"
        
        let choice2_Quiz3_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level12_Stage1_Sunda.id = 2
        choice2_Quiz3_Level12_Stage1_Sunda.name = "Ma"
        
        let choice3_Quiz3_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level12_Stage1_Sunda.id = 3
        choice3_Quiz3_Level12_Stage1_Sunda.name = "Ta"
        
        let choice4_Quiz3_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level12_Stage1_Sunda.id = 4
        choice4_Quiz3_Level12_Stage1_Sunda.name = "Ya"
        
        let quiz3_level12_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level12_stage1_Sunda.id = 3
        quiz3_level12_stage1_Sunda.name = "Kuis 2"
        quiz3_level12_stage1_Sunda.type = "B"
        quiz3_level12_stage1_Sunda.isCorrect = false
        quiz3_level12_stage1_Sunda.question = "Ha"
        quiz3_level12_stage1_Sunda.choices = [choice1_Quiz3_Level12_Stage1_Sunda, choice2_Quiz3_Level12_Stage1_Sunda, choice3_Quiz3_Level12_Stage1_Sunda, choice4_Quiz3_Level12_Stage1_Sunda]
        quiz3_level12_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level12_Stage1_Sunda.id = 1
        choice1_Quiz4_Level12_Stage1_Sunda.name = "Ta"
        
        let choice2_Quiz4_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level12_Stage1_Sunda.id = 2
        choice2_Quiz4_Level12_Stage1_Sunda.name = "Ma"
        
        let choice3_Quiz4_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level12_Stage1_Sunda.id = 3
        choice3_Quiz4_Level12_Stage1_Sunda.name = "Ya"
        
        let choice4_Quiz4_Level12_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level12_Stage1_Sunda.id = 4
        choice4_Quiz4_Level12_Stage1_Sunda.name = "Ha"
        
        let quiz4_level12_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level12_stage1_Sunda.id = 4
        quiz4_level12_stage1_Sunda.name = "Kuis 3"
        quiz4_level12_stage1_Sunda.type = "C"
        quiz4_level12_stage1_Sunda.isCorrect = false
        quiz4_level12_stage1_Sunda.question = "Ha"
        quiz4_level12_stage1_Sunda.choices = [choice1_Quiz4_Level12_Stage1_Sunda, choice2_Quiz4_Level12_Stage1_Sunda, choice3_Quiz4_Level12_Stage1_Sunda, choice4_Quiz4_Level12_Stage1_Sunda]
        quiz4_level12_stage1_Sunda.images = []
        
        let quiz5_level12_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level12_stage1_Sunda.id = 5
        quiz5_level12_stage1_Sunda.name = "Kuis 4"
        quiz5_level12_stage1_Sunda.type = "D"
        quiz5_level12_stage1_Sunda.isCorrect = false
        quiz5_level12_stage1_Sunda.question = "Ha"
        quiz5_level12_stage1_Sunda.choices = []
        quiz5_level12_stage1_Sunda.images = []
        
        let quiz6_level12_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level12_stage1_Sunda.id = 6
        quiz6_level12_stage1_Sunda.name = "Kuis 5"
        quiz6_level12_stage1_Sunda.type = "E"
        quiz6_level12_stage1_Sunda.isCorrect = false
        quiz6_level12_stage1_Sunda.question = "Ha"
        quiz6_level12_stage1_Sunda.choices = []
        quiz6_level12_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 13 Stage 1 Jawa
        let quiz1_level13_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level13_stage1_Sunda.id = 1
        quiz1_level13_stage1_Sunda.name = "Panduan"
        quiz1_level13_stage1_Sunda.type = "Panduan"
        quiz1_level13_stage1_Sunda.isCorrect = false
        quiz1_level13_stage1_Sunda.question = "Sa"
        quiz1_level13_stage1_Sunda.choices = []
        quiz1_level13_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level13_Stage1_Sunda.id = 1
        choice1_Quiz2_Level13_Stage1_Sunda.name = "Sa"
        
        let choice2_Quiz2_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level13_Stage1_Sunda.id = 2
        choice2_Quiz2_Level13_Stage1_Sunda.name = "Za"
        
        let choice3_Quiz2_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level13_Stage1_Sunda.id = 3
        choice3_Quiz2_Level13_Stage1_Sunda.name = "Ja"
        
        let choice4_Quiz2_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level13_Stage1_Sunda.id = 4
        choice4_Quiz2_Level13_Stage1_Sunda.name = "Ca"
        
        let quiz2_level13_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level13_stage1_Sunda.id = 2
        quiz2_level13_stage1_Sunda.name = "Kuis 1"
        quiz2_level13_stage1_Sunda.type = "A"
        quiz2_level13_stage1_Sunda.isCorrect = false
        quiz2_level13_stage1_Sunda.question = "Sa"
        quiz2_level13_stage1_Sunda.choices = [choice1_Quiz2_Level13_Stage1_Sunda, choice2_Quiz2_Level13_Stage1_Sunda, choice3_Quiz2_Level13_Stage1_Sunda, choice4_Quiz2_Level13_Stage1_Sunda]
        quiz2_level13_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level13_Stage1_Sunda.id = 1
        choice1_Quiz3_Level13_Stage1_Sunda.name = "Ka"
        
        let choice2_Quiz3_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level13_Stage1_Sunda.id = 2
        choice2_Quiz3_Level13_Stage1_Sunda.name = "Sa"
        
        let choice3_Quiz3_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level13_Stage1_Sunda.id = 3
        choice3_Quiz3_Level13_Stage1_Sunda.name = "Xa"
        
        let choice4_Quiz3_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level13_Stage1_Sunda.id = 4
        choice4_Quiz3_Level13_Stage1_Sunda.name = "Pa"
        
        let quiz3_level13_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level13_stage1_Sunda.id = 3
        quiz3_level13_stage1_Sunda.name = "Kuis 2"
        quiz3_level13_stage1_Sunda.type = "B"
        quiz3_level13_stage1_Sunda.isCorrect = false
        quiz3_level13_stage1_Sunda.question = "Sa"
        quiz3_level13_stage1_Sunda.choices = [choice1_Quiz3_Level13_Stage1_Sunda, choice2_Quiz3_Level13_Stage1_Sunda, choice3_Quiz3_Level13_Stage1_Sunda, choice4_Quiz3_Level13_Stage1_Sunda]
        quiz3_level13_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level13_Stage1_Sunda.id = 1
        choice1_Quiz4_Level13_Stage1_Sunda.name = "Pa"
        
        let choice2_Quiz4_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level13_Stage1_Sunda.id = 2
        choice2_Quiz4_Level13_Stage1_Sunda.name = "Xa"
        
        let choice3_Quiz4_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level13_Stage1_Sunda.id = 3
        choice3_Quiz4_Level13_Stage1_Sunda.name = "Sa"
        
        let choice4_Quiz4_Level13_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level13_Stage1_Sunda.id = 4
        choice4_Quiz4_Level13_Stage1_Sunda.name = "Ka"
        
        let quiz4_level13_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level13_stage1_Sunda.id = 4
        quiz4_level13_stage1_Sunda.name = "Kuis 3"
        quiz4_level13_stage1_Sunda.type = "C"
        quiz4_level13_stage1_Sunda.isCorrect = false
        quiz4_level13_stage1_Sunda.question = "Sa"
        quiz4_level13_stage1_Sunda.choices = [choice1_Quiz4_Level13_Stage1_Sunda, choice2_Quiz4_Level13_Stage1_Sunda, choice3_Quiz4_Level13_Stage1_Sunda, choice4_Quiz4_Level13_Stage1_Sunda]
        quiz4_level13_stage1_Sunda.images = []
        
        let quiz5_level13_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level13_stage1_Sunda.id = 5
        quiz5_level13_stage1_Sunda.name = "Kuis 4"
        quiz5_level13_stage1_Sunda.type = "D"
        quiz5_level13_stage1_Sunda.isCorrect = false
        quiz5_level13_stage1_Sunda.question = "Sa"
        quiz5_level13_stage1_Sunda.choices = []
        quiz5_level13_stage1_Sunda.images = []
        
        let quiz6_level13_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level13_stage1_Sunda.id = 6
        quiz6_level13_stage1_Sunda.name = "Kuis 5"
        quiz6_level13_stage1_Sunda.type = "E"
        quiz6_level13_stage1_Sunda.isCorrect = false
        quiz6_level13_stage1_Sunda.question = "Sa"
        quiz6_level13_stage1_Sunda.choices = []
        quiz6_level13_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 14 Stage 1 Jawa
        let quiz1_level14_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level14_stage1_Sunda.id = 1
        quiz1_level14_stage1_Sunda.name = "Panduan"
        quiz1_level14_stage1_Sunda.type = "Panduan"
        quiz1_level14_stage1_Sunda.isCorrect = false
        quiz1_level14_stage1_Sunda.question = "Za"
        quiz1_level14_stage1_Sunda.choices = []
        quiz1_level14_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level14_Stage1_Sunda.id = 1
        choice1_Quiz2_Level14_Stage1_Sunda.name = "O"
        
        let choice2_Quiz2_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level14_Stage1_Sunda.id = 2
        choice2_Quiz2_Level14_Stage1_Sunda.name = "Za"
        
        let choice3_Quiz2_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level14_Stage1_Sunda.id = 3
        choice3_Quiz2_Level14_Stage1_Sunda.name = "Ca"
        
        let choice4_Quiz2_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level14_Stage1_Sunda.id = 4
        choice4_Quiz2_Level14_Stage1_Sunda.name = "Xa"
        
        let quiz2_level14_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level14_stage1_Sunda.id = 2
        quiz2_level14_stage1_Sunda.name = "Kuis 1"
        quiz2_level14_stage1_Sunda.type = "A"
        quiz2_level14_stage1_Sunda.isCorrect = false
        quiz2_level14_stage1_Sunda.question = "Za"
        quiz2_level14_stage1_Sunda.choices = [choice1_Quiz2_Level14_Stage1_Sunda, choice2_Quiz2_Level14_Stage1_Sunda, choice3_Quiz2_Level14_Stage1_Sunda, choice4_Quiz2_Level14_Stage1_Sunda]
        quiz2_level14_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level14_Stage1_Sunda.id = 1
        choice1_Quiz3_Level14_Stage1_Sunda.name = "O"
        
        let choice2_Quiz3_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level14_Stage1_Sunda.id = 2
        choice2_Quiz3_Level14_Stage1_Sunda.name = "Za"
        
        let choice3_Quiz3_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level14_Stage1_Sunda.id = 3
        choice3_Quiz3_Level14_Stage1_Sunda.name = "Ca"
        
        let choice4_Quiz3_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level14_Stage1_Sunda.id = 4
        choice4_Quiz3_Level14_Stage1_Sunda.name = "Xa"
        
        let quiz3_level14_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level14_stage1_Sunda.id = 3
        quiz3_level14_stage1_Sunda.name = "Kuis 2"
        quiz3_level14_stage1_Sunda.type = "B"
        quiz3_level14_stage1_Sunda.isCorrect = false
        quiz3_level14_stage1_Sunda.question = "Za"
        quiz3_level14_stage1_Sunda.choices = [choice1_Quiz3_Level14_Stage1_Sunda, choice2_Quiz3_Level14_Stage1_Sunda, choice3_Quiz3_Level14_Stage1_Sunda, choice4_Quiz3_Level14_Stage1_Sunda]
        quiz3_level14_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level14_Stage1_Sunda.id = 1
        choice1_Quiz4_Level14_Stage1_Sunda.name = "Za"
        
        let choice2_Quiz4_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level14_Stage1_Sunda.id = 2
        choice2_Quiz4_Level14_Stage1_Sunda.name = "O"
        
        let choice3_Quiz4_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level14_Stage1_Sunda.id = 3
        choice3_Quiz4_Level14_Stage1_Sunda.name = "Ha"
        
        let choice4_Quiz4_Level14_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level14_Stage1_Sunda.id = 4
        choice4_Quiz4_Level14_Stage1_Sunda.name = "U"
        
        let quiz4_level14_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level14_stage1_Sunda.id = 4
        quiz4_level14_stage1_Sunda.name = "Kuis 3"
        quiz4_level14_stage1_Sunda.type = "C"
        quiz4_level14_stage1_Sunda.isCorrect = false
        quiz4_level14_stage1_Sunda.question = "Za"
        quiz4_level14_stage1_Sunda.choices = [choice1_Quiz4_Level14_Stage1_Sunda, choice2_Quiz4_Level14_Stage1_Sunda, choice3_Quiz4_Level14_Stage1_Sunda, choice4_Quiz4_Level14_Stage1_Sunda]
        quiz4_level14_stage1_Sunda.images = []
        
        let quiz5_level14_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level14_stage1_Sunda.id = 5
        quiz5_level14_stage1_Sunda.name = "Kuis 4"
        quiz5_level14_stage1_Sunda.type = "D"
        quiz5_level14_stage1_Sunda.isCorrect = false
        quiz5_level14_stage1_Sunda.question = "Za"
        quiz5_level14_stage1_Sunda.choices = []
        quiz5_level14_stage1_Sunda.images = []
        
        let quiz6_level14_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level14_stage1_Sunda.id = 6
        quiz6_level14_stage1_Sunda.name = "Kuis 5"
        quiz6_level14_stage1_Sunda.type = "E"
        quiz6_level14_stage1_Sunda.isCorrect = false
        quiz6_level14_stage1_Sunda.question = "Za"
        quiz6_level14_stage1_Sunda.choices = []
        quiz6_level14_stage1_Sunda.images = []
        
        // MARK: Quiz for Level 15 Stage 1 Jawa
        let quiz1_level15_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz1_level15_stage1_Sunda.id = 1
        quiz1_level15_stage1_Sunda.name = "Panduan"
        quiz1_level15_stage1_Sunda.type = "Panduan"
        quiz1_level15_stage1_Sunda.isCorrect = false
        quiz1_level15_stage1_Sunda.question = "O"
        quiz1_level15_stage1_Sunda.choices = []
        quiz1_level15_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz2_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz2_Level15_Stage1_Sunda.id = 1
        choice1_Quiz2_Level15_Stage1_Sunda.name = "Wa"
        
        let choice2_Quiz2_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz2_Level15_Stage1_Sunda.id = 2
        choice2_Quiz2_Level15_Stage1_Sunda.name = "Ca"
        
        let choice3_Quiz2_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz2_Level15_Stage1_Sunda.id = 3
        choice3_Quiz2_Level15_Stage1_Sunda.name = "O"
        
        let choice4_Quiz2_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz2_Level15_Stage1_Sunda.id = 4
        choice4_Quiz2_Level15_Stage1_Sunda.name = "Qa"
        
        let quiz2_level15_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz2_level15_stage1_Sunda.id = 2
        quiz2_level15_stage1_Sunda.name = "Kuis 1"
        quiz2_level15_stage1_Sunda.type = "A"
        quiz2_level15_stage1_Sunda.isCorrect = false
        quiz2_level15_stage1_Sunda.question = "O"
        quiz2_level15_stage1_Sunda.choices = [choice1_Quiz2_Level15_Stage1_Sunda, choice2_Quiz2_Level15_Stage1_Sunda, choice3_Quiz2_Level15_Stage1_Sunda, choice4_Quiz2_Level15_Stage1_Sunda]
        quiz2_level15_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz3_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz3_Level15_Stage1_Sunda.id = 1
        choice1_Quiz3_Level15_Stage1_Sunda.name = "Ta"
        
        let choice2_Quiz3_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz3_Level15_Stage1_Sunda.id = 2
        choice2_Quiz3_Level15_Stage1_Sunda.name = "Ya"
        
        let choice3_Quiz3_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz3_Level15_Stage1_Sunda.id = 3
        choice3_Quiz3_Level15_Stage1_Sunda.name = "O"
        
        let choice4_Quiz3_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz3_Level15_Stage1_Sunda.id = 4
        choice4_Quiz3_Level15_Stage1_Sunda.name = "Ja"
        
        let quiz3_level15_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz3_level15_stage1_Sunda.id = 3
        quiz3_level15_stage1_Sunda.name = "Kuis 2"
        quiz3_level15_stage1_Sunda.type = "B"
        quiz3_level15_stage1_Sunda.isCorrect = false
        quiz3_level15_stage1_Sunda.question = "O"
        quiz3_level15_stage1_Sunda.choices = [choice1_Quiz3_Level15_Stage1_Sunda, choice2_Quiz3_Level15_Stage1_Sunda, choice3_Quiz3_Level15_Stage1_Sunda, choice4_Quiz3_Level15_Stage1_Sunda]
        quiz3_level15_stage1_Sunda.images = []
        
        //MARK: Choice
        let choice1_Quiz4_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice1_Quiz4_Level15_Stage1_Sunda.id = 1
        choice1_Quiz4_Level15_Stage1_Sunda.name = "Ja"
        
        let choice2_Quiz4_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice2_Quiz4_Level15_Stage1_Sunda.id = 2
        choice2_Quiz4_Level15_Stage1_Sunda.name = "O"
        
        let choice3_Quiz4_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice3_Quiz4_Level15_Stage1_Sunda.id = 3
        choice3_Quiz4_Level15_Stage1_Sunda.name = "Ya"
        
        let choice4_Quiz4_Level15_Stage1_Sunda = Choice(context: PersistenceService.context)
        choice4_Quiz4_Level15_Stage1_Sunda.id = 4
        choice4_Quiz4_Level15_Stage1_Sunda.name = "Ta"
        
        let quiz4_level15_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz4_level15_stage1_Sunda.id = 4
        quiz4_level15_stage1_Sunda.name = "Kuis 3"
        quiz4_level15_stage1_Sunda.type = "C"
        quiz4_level15_stage1_Sunda.isCorrect = false
        quiz4_level15_stage1_Sunda.question = "O"
        quiz4_level15_stage1_Sunda.choices = [choice1_Quiz4_Level15_Stage1_Sunda, choice2_Quiz4_Level15_Stage1_Sunda, choice3_Quiz4_Level15_Stage1_Sunda, choice4_Quiz4_Level15_Stage1_Sunda]
        quiz4_level15_stage1_Sunda.images = []
        
        let quiz5_level15_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz5_level15_stage1_Sunda.id = 5
        quiz5_level15_stage1_Sunda.name = "Kuis 4"
        quiz5_level15_stage1_Sunda.type = "D"
        quiz5_level15_stage1_Sunda.isCorrect = false
        quiz5_level15_stage1_Sunda.question = "O"
        quiz5_level15_stage1_Sunda.choices = []
        quiz5_level15_stage1_Sunda.images = []
        
        let quiz6_level15_stage1_Sunda = Quiz(context: PersistenceService.context)
        quiz6_level15_stage1_Sunda.id = 6
        quiz6_level15_stage1_Sunda.name = "Kuis 5"
        quiz6_level15_stage1_Sunda.type = "E"
        quiz6_level15_stage1_Sunda.isCorrect = false
        quiz6_level15_stage1_Sunda.question = "O"
        quiz6_level15_stage1_Sunda.choices = []
        quiz6_level15_stage1_Sunda.images = []
        
        // MARK: Level for Stage 1 Sunda
        let firstLevelStage1Sunda = Level(context: PersistenceService.context)
        firstLevelStage1Sunda.id = 1
        firstLevelStage1Sunda.name = "Level 1"
        firstLevelStage1Sunda.isLocked = false
        firstLevelStage1Sunda.isInitial = true
        firstLevelStage1Sunda.totalMedal = 0
        firstLevelStage1Sunda.quizes = [quiz1_level1_stage1_Sunda, quiz2_level1_stage1_Sunda, quiz3_level1_stage1_Sunda, quiz4_level1_stage1_Sunda, quiz5_level1_stage1_Sunda, quiz6_level1_stage1_Sunda]
        
        let secondLevelStage1Sunda = Level(context: PersistenceService.context)
        secondLevelStage1Sunda.id = 2
        secondLevelStage1Sunda.name = "Level 2"
        secondLevelStage1Sunda.isLocked = true
        secondLevelStage1Sunda.isInitial = true
        secondLevelStage1Sunda.totalMedal = 0
        secondLevelStage1Sunda.quizes = [quiz1_level2_stage1_Sunda, quiz2_level2_stage1_Sunda, quiz3_level2_stage1_Sunda, quiz4_level2_stage1_Sunda, quiz5_level2_stage1_Sunda, quiz6_level2_stage1_Sunda]
        
        let thirdLevelStage1Sunda = Level(context: PersistenceService.context)
        thirdLevelStage1Sunda.id = 3
        thirdLevelStage1Sunda.name = "Level 3"
        thirdLevelStage1Sunda.isLocked = true
        thirdLevelStage1Sunda.isInitial = true
        thirdLevelStage1Sunda.totalMedal = 0
        thirdLevelStage1Sunda.quizes = [quiz1_level3_stage1_Sunda, quiz2_level3_stage1_Sunda, quiz3_level3_stage1_Sunda, quiz4_level3_stage1_Sunda, quiz5_level3_stage1_Sunda, quiz6_level3_stage1_Sunda]
        
        let fourthLevelStage1Sunda = Level(context: PersistenceService.context)
        fourthLevelStage1Sunda.id = 4
        fourthLevelStage1Sunda.name = "Level 4"
        fourthLevelStage1Sunda.isLocked = true
        fourthLevelStage1Sunda.isInitial = true
        fourthLevelStage1Sunda.totalMedal = 0
        fourthLevelStage1Sunda.quizes = [quiz1_level4_stage1_Sunda, quiz2_level4_stage1_Sunda, quiz3_level4_stage1_Sunda, quiz4_level4_stage1_Sunda, quiz5_level4_stage1_Sunda, quiz6_level4_stage1_Sunda]
        
        let fifthLevelStage1Sunda = Level(context: PersistenceService.context)
        fifthLevelStage1Sunda.id = 5
        fifthLevelStage1Sunda.name = "Level 5"
        fifthLevelStage1Sunda.isLocked = true
        fifthLevelStage1Sunda.isInitial = true
        fifthLevelStage1Sunda.totalMedal = 0
        fifthLevelStage1Sunda.quizes = [quiz1_level5_stage1_Sunda, quiz2_level5_stage1_Sunda, quiz3_level5_stage1_Sunda, quiz4_level5_stage1_Sunda, quiz5_level5_stage1_Sunda, quiz6_level5_stage1_Sunda]
        
        let sixthLevelStage1Sunda = Level(context: PersistenceService.context)
        sixthLevelStage1Sunda.id = 6
        sixthLevelStage1Sunda.name = "Level 6"
        sixthLevelStage1Sunda.isLocked = true
        sixthLevelStage1Sunda.isInitial = true
        sixthLevelStage1Sunda.totalMedal = 0
        sixthLevelStage1Sunda.quizes = [quiz1_level6_stage1_Sunda, quiz2_level6_stage1_Sunda, quiz3_level6_stage1_Sunda, quiz4_level6_stage1_Sunda, quiz5_level6_stage1_Sunda, quiz6_level6_stage1_Sunda]
        
        let seventhLevelStage1Sunda = Level(context: PersistenceService.context)
        seventhLevelStage1Sunda.id = 7
        seventhLevelStage1Sunda.name = "Level 7"
        seventhLevelStage1Sunda.isLocked = true
        seventhLevelStage1Sunda.isInitial = true
        seventhLevelStage1Sunda.totalMedal = 0
        seventhLevelStage1Sunda.quizes = [quiz1_level7_stage1_Sunda, quiz2_level7_stage1_Sunda, quiz3_level7_stage1_Sunda, quiz4_level7_stage1_Sunda, quiz5_level7_stage1_Sunda, quiz6_level7_stage1_Sunda]
        
        let eightLevelStage1Sunda = Level(context: PersistenceService.context)
        eightLevelStage1Sunda.id = 8
        eightLevelStage1Sunda.name = "Level 8"
        eightLevelStage1Sunda.isLocked = true
        eightLevelStage1Sunda.isInitial = true
        eightLevelStage1Sunda.totalMedal = 0
        eightLevelStage1Sunda.quizes = [quiz1_level8_stage1_Sunda, quiz2_level8_stage1_Sunda, quiz3_level8_stage1_Sunda, quiz4_level8_stage1_Sunda, quiz5_level8_stage1_Sunda, quiz6_level8_stage1_Sunda]
        
        let ninthLevelStage1Sunda = Level(context: PersistenceService.context)
        ninthLevelStage1Sunda.id = 9
        ninthLevelStage1Sunda.name = "Level 9"
        ninthLevelStage1Sunda.isLocked = true
        ninthLevelStage1Sunda.isInitial = true
        ninthLevelStage1Sunda.totalMedal = 0
        ninthLevelStage1Sunda.quizes = [quiz1_level9_stage1_Sunda, quiz2_level9_stage1_Sunda, quiz3_level9_stage1_Sunda, quiz4_level9_stage1_Sunda, quiz5_level9_stage1_Sunda, quiz6_level9_stage1_Sunda]
        
        let tenthLevelStage1Sunda = Level(context: PersistenceService.context)
        tenthLevelStage1Sunda.id = 10
        tenthLevelStage1Sunda.name = "Level 10"
        tenthLevelStage1Sunda.isLocked = true
        tenthLevelStage1Sunda.isInitial = true
        tenthLevelStage1Sunda.totalMedal = 0
        tenthLevelStage1Sunda.quizes = [quiz1_level10_stage1_Sunda, quiz2_level10_stage1_Sunda, quiz3_level10_stage1_Sunda, quiz4_level10_stage1_Sunda, quiz5_level10_stage1_Sunda, quiz6_level10_stage1_Sunda]
        
        let eleventhLevelStage1Sunda = Level(context: PersistenceService.context)
        eleventhLevelStage1Sunda.id = 11
        eleventhLevelStage1Sunda.name = "Level 11"
        eleventhLevelStage1Sunda.isLocked = true
        eleventhLevelStage1Sunda.isInitial = true
        eleventhLevelStage1Sunda.totalMedal = 0
        eleventhLevelStage1Sunda.quizes = [quiz1_level11_stage1_Sunda, quiz2_level11_stage1_Sunda, quiz3_level11_stage1_Sunda, quiz4_level11_stage1_Sunda, quiz5_level11_stage1_Sunda, quiz6_level11_stage1_Sunda]
        
        let twelfthLevelStage1Sunda = Level(context: PersistenceService.context)
        twelfthLevelStage1Sunda.id = 12
        twelfthLevelStage1Sunda.name = "Level 12"
        twelfthLevelStage1Sunda.isLocked = true
        twelfthLevelStage1Sunda.isInitial = true
        twelfthLevelStage1Sunda.totalMedal = 0
        twelfthLevelStage1Sunda.quizes = [quiz1_level12_stage1_Sunda, quiz2_level12_stage1_Sunda, quiz3_level12_stage1_Sunda, quiz4_level12_stage1_Sunda, quiz5_level12_stage1_Sunda, quiz6_level12_stage1_Sunda]
        
        let thirteenthLevelStage1Sunda = Level(context: PersistenceService.context)
        thirteenthLevelStage1Sunda.id = 13
        thirteenthLevelStage1Sunda.name = "Level 13"
        thirteenthLevelStage1Sunda.isLocked = true
        thirteenthLevelStage1Sunda.isInitial = true
        thirteenthLevelStage1Sunda.totalMedal = 0
        thirteenthLevelStage1Sunda.quizes = [quiz1_level13_stage1_Sunda, quiz2_level13_stage1_Sunda, quiz3_level13_stage1_Sunda, quiz4_level13_stage1_Sunda, quiz5_level13_stage1_Sunda, quiz6_level13_stage1_Sunda]
        
        let fourteenthLevelStage1Sunda = Level(context: PersistenceService.context)
        fourteenthLevelStage1Sunda.id = 14
        fourteenthLevelStage1Sunda.name = "Level 14"
        fourteenthLevelStage1Sunda.isLocked = true
        fourteenthLevelStage1Sunda.isInitial = true
        fourteenthLevelStage1Sunda.totalMedal = 0
        fourteenthLevelStage1Sunda.quizes = [quiz1_level14_stage1_Sunda, quiz2_level14_stage1_Sunda, quiz3_level14_stage1_Sunda, quiz4_level14_stage1_Sunda, quiz5_level14_stage1_Sunda, quiz6_level14_stage1_Sunda]
        
        let fifteenthLevelStage1Sunda = Level(context: PersistenceService.context)
        fifteenthLevelStage1Sunda.id = 15
        fifteenthLevelStage1Sunda.name = "Level 15"
        fifteenthLevelStage1Sunda.isLocked = true
        fifteenthLevelStage1Sunda.isInitial = true
        fifteenthLevelStage1Sunda.totalMedal = 0
        fifteenthLevelStage1Sunda.quizes = [quiz1_level15_stage1_Sunda, quiz2_level15_stage1_Sunda, quiz3_level15_stage1_Sunda, quiz4_level15_stage1_Sunda, quiz5_level15_stage1_Sunda, quiz6_level15_stage1_Sunda]
        
        // MARK: Level for Stage 2 Jawa
        let firstLevelStage2Sunda = Level(context: PersistenceService.context)
        firstLevelStage2Sunda.id = 1
        firstLevelStage2Sunda.name = "Level 1"
        firstLevelStage2Sunda.isLocked = false
        firstLevelStage2Sunda.isInitial = true
        firstLevelStage2Sunda.totalMedal = 0
        firstLevelStage2Sunda.quizes = []
        
        let secondLevelStage2Sunda = Level(context: PersistenceService.context)
        secondLevelStage2Sunda.id = 2
        secondLevelStage2Sunda.name = "Level 2"
        secondLevelStage2Sunda.isLocked = true
        secondLevelStage2Sunda.isInitial = true
        secondLevelStage2Sunda.totalMedal = 0
        secondLevelStage2Sunda.quizes = []
        
        let thirdLevelStage2Sunda = Level(context: PersistenceService.context)
        thirdLevelStage2Sunda.id = 3
        thirdLevelStage2Sunda.name = "Level 3"
        thirdLevelStage2Sunda.isLocked = true
        thirdLevelStage2Sunda.isInitial = true
        thirdLevelStage2Sunda.totalMedal = 0
        thirdLevelStage2Sunda.quizes = []
        
        let fourthLevelStage2Sunda = Level(context: PersistenceService.context)
        fourthLevelStage2Sunda.id = 4
        fourthLevelStage2Sunda.name = "Level 4"
        fourthLevelStage2Sunda.isLocked = true
        fourthLevelStage2Sunda.isInitial = true
        fourthLevelStage2Sunda.totalMedal = 0
        fourthLevelStage2Sunda.quizes = []
        
        let fifthLevelStage2Sunda = Level(context: PersistenceService.context)
        fifthLevelStage2Sunda.id = 5
        fifthLevelStage2Sunda.name = "Level 5"
        fifthLevelStage2Sunda.isLocked = true
        fifthLevelStage2Sunda.isInitial = true
        fifthLevelStage2Sunda.totalMedal = 0
        fifthLevelStage2Sunda.quizes = []
        
        let sixthLevelStage2Sunda = Level(context: PersistenceService.context)
        sixthLevelStage2Sunda.id = 6
        sixthLevelStage2Sunda.name = "Level 6"
        sixthLevelStage2Sunda.isLocked = true
        sixthLevelStage2Sunda.isInitial = true
        sixthLevelStage2Sunda.totalMedal = 0
        sixthLevelStage2Sunda.quizes = []
        
        let seventhLevelStage2Sunda = Level(context: PersistenceService.context)
        seventhLevelStage2Sunda.id = 7
        seventhLevelStage2Sunda.name = "Level 7"
        seventhLevelStage2Sunda.isLocked = true
        seventhLevelStage2Sunda.isInitial = true
        seventhLevelStage2Sunda.totalMedal = 0
        seventhLevelStage2Sunda.quizes = []
        
        let eightLevelStage2Sunda = Level(context: PersistenceService.context)
        eightLevelStage2Sunda.id = 8
        eightLevelStage2Sunda.name = "Level 8"
        eightLevelStage2Sunda.isLocked = true
        eightLevelStage2Sunda.isInitial = true
        eightLevelStage2Sunda.totalMedal = 0
        eightLevelStage2Sunda.quizes = []
        
        let ninthLevelStage2Sunda = Level(context: PersistenceService.context)
        ninthLevelStage2Sunda.id = 9
        ninthLevelStage2Sunda.name = "Level 9"
        ninthLevelStage2Sunda.isLocked = true
        ninthLevelStage2Sunda.isInitial = true
        ninthLevelStage2Sunda.totalMedal = 0
        ninthLevelStage2Sunda.quizes = []
        
        let tenthLevelStage2Sunda = Level(context: PersistenceService.context)
        tenthLevelStage2Sunda.id = 10
        tenthLevelStage2Sunda.name = "Level 10"
        tenthLevelStage2Sunda.isLocked = true
        tenthLevelStage2Sunda.isInitial = true
        tenthLevelStage2Sunda.totalMedal = 0
        tenthLevelStage2Sunda.quizes = []
        
        let eleventhLevelStage2Sunda = Level(context: PersistenceService.context)
        eleventhLevelStage2Sunda.id = 11
        eleventhLevelStage2Sunda.name = "Level 11"
        eleventhLevelStage2Sunda.isLocked = true
        eleventhLevelStage2Sunda.isInitial = true
        eleventhLevelStage2Sunda.totalMedal = 0
        eleventhLevelStage2Sunda.quizes = []
        
        let twelfthLevelStage2Sunda = Level(context: PersistenceService.context)
        twelfthLevelStage2Sunda.id = 12
        twelfthLevelStage2Sunda.name = "Level 12"
        twelfthLevelStage2Sunda.isLocked = true
        twelfthLevelStage2Sunda.isInitial = true
        twelfthLevelStage2Sunda.totalMedal = 0
        twelfthLevelStage2Sunda.quizes = []
        
        let thirteenthLevelStage2Sunda = Level(context: PersistenceService.context)
        thirteenthLevelStage2Sunda.id = 13
        thirteenthLevelStage2Sunda.name = "Level 13"
        thirteenthLevelStage2Sunda.isLocked = true
        thirteenthLevelStage2Sunda.isInitial = true
        thirteenthLevelStage2Sunda.totalMedal = 0
        thirteenthLevelStage2Sunda.quizes = []
        
        let fourteenthLevelStage2Sunda = Level(context: PersistenceService.context)
        fourteenthLevelStage2Sunda.id = 14
        fourteenthLevelStage2Sunda.name = "Level 14"
        fourteenthLevelStage2Sunda.isLocked = true
        fourteenthLevelStage2Sunda.isInitial = true
        fourteenthLevelStage2Sunda.totalMedal = 0
        fourteenthLevelStage2Sunda.quizes = []
        
        let fifteenthLevelStage2Sunda = Level(context: PersistenceService.context)
        fifteenthLevelStage2Sunda.id = 15
        fifteenthLevelStage2Sunda.name = "Level 15"
        fifteenthLevelStage2Sunda.isLocked = true
        fifteenthLevelStage2Sunda.isInitial = true
        fifteenthLevelStage2Sunda.totalMedal = 0
        fifteenthLevelStage2Sunda.quizes = []
        
        // MARK: Level for Stage 3 Jawa
        let firstLevelStage3Sunda = Level(context: PersistenceService.context)
        firstLevelStage3Sunda.id = 1
        firstLevelStage3Sunda.name = "Level 1"
        firstLevelStage3Sunda.isLocked = false
        firstLevelStage3Sunda.isInitial = true
        firstLevelStage3Sunda.totalMedal = 0
        firstLevelStage3Sunda.quizes = []
        
        let secondLevelStage3Sunda = Level(context: PersistenceService.context)
        secondLevelStage3Sunda.id = 2
        secondLevelStage3Sunda.name = "Level 2"
        secondLevelStage3Sunda.isLocked = true
        secondLevelStage3Sunda.isInitial = true
        secondLevelStage3Sunda.totalMedal = 0
        secondLevelStage3Sunda.quizes = []
        
        let thirdLevelStage3Sunda = Level(context: PersistenceService.context)
        thirdLevelStage3Sunda.id = 3
        thirdLevelStage3Sunda.name = "Level 3"
        thirdLevelStage3Sunda.isLocked = true
        thirdLevelStage3Sunda.isInitial = true
        thirdLevelStage3Sunda.totalMedal = 0
        thirdLevelStage3Sunda.quizes = []
        
        let fourthLevelStage3Sunda = Level(context: PersistenceService.context)
        fourthLevelStage3Sunda.id = 4
        fourthLevelStage3Sunda.name = "Level 4"
        fourthLevelStage3Sunda.isLocked = true
        fourthLevelStage3Sunda.isInitial = true
        fourthLevelStage3Sunda.totalMedal = 0
        fourthLevelStage3Sunda.quizes = []
        
        let fifthLevelStage3Sunda = Level(context: PersistenceService.context)
        fifthLevelStage3Sunda.id = 5
        fifthLevelStage3Sunda.name = "Level 5"
        fifthLevelStage3Sunda.isLocked = true
        fifthLevelStage3Sunda.isInitial = true
        fifthLevelStage3Sunda.totalMedal = 0
        fifthLevelStage3Sunda.quizes = []
        
        let sixthLevelStage3Sunda = Level(context: PersistenceService.context)
        sixthLevelStage3Sunda.id = 6
        sixthLevelStage3Sunda.name = "Level 6"
        sixthLevelStage3Sunda.isLocked = true
        sixthLevelStage3Sunda.isInitial = true
        sixthLevelStage3Sunda.totalMedal = 0
        sixthLevelStage3Sunda.quizes = []
        
        let seventhLevelStage3Sunda = Level(context: PersistenceService.context)
        seventhLevelStage3Sunda.id = 7
        seventhLevelStage3Sunda.name = "Level 7"
        seventhLevelStage3Sunda.isLocked = true
        seventhLevelStage3Sunda.isInitial = true
        seventhLevelStage3Sunda.totalMedal = 0
        seventhLevelStage3Sunda.quizes = []
        
        let eightLevelStage3Sunda = Level(context: PersistenceService.context)
        eightLevelStage3Sunda.id = 8
        eightLevelStage3Sunda.name = "Level 8"
        eightLevelStage3Sunda.isLocked = true
        eightLevelStage3Sunda.isInitial = true
        eightLevelStage3Sunda.totalMedal = 0
        eightLevelStage3Sunda.quizes = []
        
        let ninthLevelStage3Sunda = Level(context: PersistenceService.context)
        ninthLevelStage3Sunda.id = 9
        ninthLevelStage3Sunda.name = "Level 9"
        ninthLevelStage3Sunda.isLocked = true
        ninthLevelStage3Sunda.isInitial = true
        ninthLevelStage3Sunda.totalMedal = 0
        ninthLevelStage3Sunda.quizes = []
        
        let tenthLevelStage3Sunda = Level(context: PersistenceService.context)
        tenthLevelStage3Sunda.id = 10
        tenthLevelStage3Sunda.name = "Level 10"
        tenthLevelStage3Sunda.isLocked = true
        tenthLevelStage3Sunda.isInitial = true
        tenthLevelStage3Sunda.totalMedal = 0
        tenthLevelStage3Sunda.quizes = []
        
        let eleventhLevelStage3Sunda = Level(context: PersistenceService.context)
        eleventhLevelStage3Sunda.id = 11
        eleventhLevelStage3Sunda.name = "Level 11"
        eleventhLevelStage3Sunda.isLocked = true
        eleventhLevelStage3Sunda.isInitial = true
        eleventhLevelStage3Sunda.totalMedal = 0
        eleventhLevelStage3Sunda.quizes = []
        
        let twelfthLevelStage3Sunda = Level(context: PersistenceService.context)
        twelfthLevelStage3Sunda.id = 12
        twelfthLevelStage3Sunda.name = "Level 12"
        twelfthLevelStage3Sunda.isLocked = true
        twelfthLevelStage3Sunda.isInitial = true
        twelfthLevelStage3Sunda.totalMedal = 0
        twelfthLevelStage3Sunda.quizes = []
        
        let thirteenthLevelStage3Sunda = Level(context: PersistenceService.context)
        thirteenthLevelStage3Sunda.id = 13
        thirteenthLevelStage3Sunda.name = "Level 13"
        thirteenthLevelStage3Sunda.isLocked = true
        thirteenthLevelStage3Sunda.isInitial = true
        thirteenthLevelStage3Sunda.totalMedal = 0
        thirteenthLevelStage3Sunda.quizes = []
        
        let fourteenthLevelStage3Sunda = Level(context: PersistenceService.context)
        fourteenthLevelStage3Sunda.id = 14
        fourteenthLevelStage3Sunda.name = "Level 14"
        fourteenthLevelStage3Sunda.isLocked = true
        fourteenthLevelStage3Sunda.isInitial = true
        fourteenthLevelStage3Sunda.totalMedal = 0
        fourteenthLevelStage3Sunda.quizes = []
        
        let fifteenthLevelStage3Sunda = Level(context: PersistenceService.context)
        fifteenthLevelStage3Sunda.id = 15
        fifteenthLevelStage3Sunda.name = "Level 15"
        fifteenthLevelStage3Sunda.isLocked = true
        fifteenthLevelStage3Sunda.isInitial = true
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
        
        //MARK: AKSARA JAWA
        
        //MARK: Carakan
        let aksara_1_Carakan = Aksara(context: PersistenceService.context)
        aksara_1_Carakan.id = 1
        aksara_1_Carakan.name = "Ha"
        
        let aksara_2_Carakan = Aksara(context: PersistenceService.context)
        aksara_2_Carakan.id = 2
        aksara_2_Carakan.name = "Na"
        
        let aksara_3_Carakan = Aksara(context: PersistenceService.context)
        aksara_3_Carakan.id = 3
        aksara_3_Carakan.name = "Ca"
        
        let aksara_4_Carakan = Aksara(context: PersistenceService.context)
        aksara_4_Carakan.id = 4
        aksara_4_Carakan.name = "Ra"
        
        let aksara_5_Carakan = Aksara(context: PersistenceService.context)
        aksara_5_Carakan.id = 5
        aksara_5_Carakan.name = "Ka"
        
        let aksara_6_Carakan = Aksara(context: PersistenceService.context)
        aksara_6_Carakan.id = 6
        aksara_6_Carakan.name = "Da"
        
        let aksara_7_Carakan = Aksara(context: PersistenceService.context)
        aksara_7_Carakan.id = 7
        aksara_7_Carakan.name = "Ta"
        
        let aksara_8_Carakan = Aksara(context: PersistenceService.context)
        aksara_8_Carakan.id = 8
        aksara_8_Carakan.name = "Sa"
        
        let aksara_9_Carakan = Aksara(context: PersistenceService.context)
        aksara_9_Carakan.id = 9
        aksara_9_Carakan.name = "Wa"
        
        let aksara_10_Carakan = Aksara(context: PersistenceService.context)
        aksara_10_Carakan.id = 10
        aksara_10_Carakan.name = "La"
        
        let aksara_11_Carakan = Aksara(context: PersistenceService.context)
        aksara_11_Carakan.id = 11
        aksara_11_Carakan.name = "Pa"
        
        let aksara_12_Carakan = Aksara(context: PersistenceService.context)
        aksara_12_Carakan.id = 12
        aksara_12_Carakan.name = "Dha"
        
        let aksara_13_Carakan = Aksara(context: PersistenceService.context)
        aksara_13_Carakan.id = 13
        aksara_13_Carakan.name = "Ja"
        
        let aksara_14_Carakan = Aksara(context: PersistenceService.context)
        aksara_14_Carakan.id = 14
        aksara_14_Carakan.name = "Ya"
        
        let aksara_15_Carakan = Aksara(context: PersistenceService.context)
        aksara_15_Carakan.id = 15
        aksara_15_Carakan.name = "Nya"
        
        let aksara_16_Carakan = Aksara(context: PersistenceService.context)
        aksara_16_Carakan.id = 16
        aksara_16_Carakan.name = "Ma"
        
        let aksara_17_Carakan = Aksara(context: PersistenceService.context)
        aksara_17_Carakan.id = 17
        aksara_17_Carakan.name = "Ga"
        
        let aksara_18_Carakan = Aksara(context: PersistenceService.context)
        aksara_18_Carakan.id = 18
        aksara_18_Carakan.name = "Ba"
        
        let aksara_19_Carakan = Aksara(context: PersistenceService.context)
        aksara_19_Carakan.id = 19
        aksara_19_Carakan.name = "Tha"
        
        let aksara_20_Carakan = Aksara(context: PersistenceService.context)
        aksara_20_Carakan.id = 20
        aksara_20_Carakan.name = "Nga"
        
        //MARK: Sandangan
        let aksara_1_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_1_Sandhangan.id = 1
        aksara_1_Sandhangan.name = "Wulu"
        
        let aksara_2_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_2_Sandhangan.id = 2
        aksara_2_Sandhangan.name = "Suku"
        
        let aksara_3_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_3_Sandhangan.id = 3
        aksara_3_Sandhangan.name = "Taling"
        
        let aksara_4_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_4_Sandhangan.id = 4
        aksara_4_Sandhangan.name = "Pepet"
        
        let aksara_5_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_5_Sandhangan.id = 5
        aksara_5_Sandhangan.name = "Taling Tarung"
        
        let aksara_6_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_6_Sandhangan.id = 6
        aksara_6_Sandhangan.name = "Layar"
        
        let aksara_7_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_7_Sandhangan.id = 7
        aksara_7_Sandhangan.name = "Wignyan"
        
        let aksara_8_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_8_Sandhangan.id = 8
        aksara_8_Sandhangan.name = "Cecek"
        
        let aksara_9_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_9_Sandhangan.id = 9
        aksara_9_Sandhangan.name = "Pangkon"
        
        let aksara_10_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_10_Sandhangan.id = 10
        aksara_10_Sandhangan.name = "Pengkal"
        
        let aksara_11_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_11_Sandhangan.id = 11
        aksara_11_Sandhangan.name = "Cakra"
        
        let aksara_12_Sandhangan = Aksara(context: PersistenceService.context)
        aksara_12_Sandhangan.id = 12
        aksara_12_Sandhangan.name = "Cakra Keret"
        
        
        //MARK: DICTIONARY JAWA
        let carakan = Dictionary(context: PersistenceService.context)
        carakan.id = 1
        carakan.name = "Carakan"
        carakan.isLocked = false
        carakan.title = "Huruf konsonan"
        carakan.titleDescription = "Memiliki vokal dasar /a/"
        carakan.aksaras = [aksara_1_Carakan, aksara_2_Carakan, aksara_3_Carakan, aksara_4_Carakan, aksara_5_Carakan, aksara_6_Carakan, aksara_7_Carakan, aksara_8_Carakan, aksara_9_Carakan, aksara_10_Carakan, aksara_11_Carakan, aksara_12_Carakan, aksara_13_Carakan, aksara_14_Carakan, aksara_15_Carakan, aksara_16_Carakan, aksara_17_Carakan, aksara_18_Carakan, aksara_19_Carakan, aksara_20_Carakan]
        
        let sandhangan = Dictionary(context: PersistenceService.context)
        sandhangan.id = 2
        sandhangan.name = "Sandhangan"
        sandhangan.isLocked = false
        sandhangan.title = "Vokalisasi"
        sandhangan.titleDescription = "Merubah vokal dasar Carakan atau dapat mematikan vokalnya"
        sandhangan.aksaras = [aksara_1_Sandhangan, aksara_2_Sandhangan, aksara_3_Sandhangan, aksara_4_Sandhangan, aksara_5_Sandhangan, aksara_6_Sandhangan, aksara_7_Sandhangan, aksara_8_Sandhangan, aksara_9_Sandhangan, aksara_10_Sandhangan, aksara_11_Sandhangan, aksara_12_Sandhangan]
        
        let pasangan = Dictionary(context: PersistenceService.context)
        pasangan.id = 3
        pasangan.name = "Pasangan"
        pasangan.isLocked = true
        pasangan.title = "Pasangan"
        pasangan.titleDescription = "Mematikan huruf sebelumnya sekaligus menjadi huruf selanjutnya"
        pasangan.aksaras = []
        
        
        //MARK: AKSARA SUNDA
        
        //MARK: Ngalegena
        let aksara_1_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_1_Ngalegena.id = 1
        aksara_1_Ngalegena.name = "Ka"
        
        let aksara_2_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_2_Ngalegena.id = 2
        aksara_2_Ngalegena.name = "Ga"
        
        let aksara_3_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_3_Ngalegena.id = 3
        aksara_3_Ngalegena.name = "Nga"
        
        let aksara_4_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_4_Ngalegena.id = 4
        aksara_4_Ngalegena.name = "Ca"
        
        let aksara_5_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_5_Ngalegena.id = 5
        aksara_5_Ngalegena.name = "Ja"
        
        let aksara_6_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_6_Ngalegena.id = 6
        aksara_6_Ngalegena.name = "Nya"
        
        let aksara_7_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_7_Ngalegena.id = 7
        aksara_7_Ngalegena.name = "Ta"
        
        let aksara_8_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_8_Ngalegena.id = 8
        aksara_8_Ngalegena.name = "Da"
        
        let aksara_9_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_9_Ngalegena.id = 9
        aksara_9_Ngalegena.name = "Na"
        
        let aksara_10_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_10_Ngalegena.id = 10
        aksara_10_Ngalegena.name = "Pa"
        
        let aksara_11_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_11_Ngalegena.id = 11
        aksara_11_Ngalegena.name = "Ba"
        
        let aksara_12_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_12_Ngalegena.id = 12
        aksara_12_Ngalegena.name = "Ma"
        
        let aksara_13_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_13_Ngalegena.id = 13
        aksara_13_Ngalegena.name = "Ya"
        
        let aksara_14_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_14_Ngalegena.id = 14
        aksara_14_Ngalegena.name = "Ra"
        
        let aksara_15_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_15_Ngalegena.id = 15
        aksara_15_Ngalegena.name = "La"
        
        let aksara_16_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_16_Ngalegena.id = 16
        aksara_16_Ngalegena.name = "Wa"
        
        let aksara_17_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_17_Ngalegena.id = 17
        aksara_17_Ngalegena.name = "Sa"
        
        let aksara_18_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_18_Ngalegena.id = 18
        aksara_18_Ngalegena.name = "Ha"
        
        let aksara_19_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_19_Ngalegena.id = 19
        aksara_19_Ngalegena.name = "Fa"
        
        let aksara_20_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_20_Ngalegena.id = 20
        aksara_20_Ngalegena.name = "Va"
        
        let aksara_21_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_21_Ngalegena.id = 21
        aksara_21_Ngalegena.name = "Qa"
        
        let aksara_22_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_22_Ngalegena.id = 22
        aksara_22_Ngalegena.name = "Xa"
        
        let aksara_23_Ngalegena = Aksara(context: PersistenceService.context)
        aksara_23_Ngalegena.id = 23
        aksara_23_Ngalegena.name = "Za"
        
        //MARK: Swara
        let aksara_1_Swara = Aksara(context: PersistenceService.context)
        aksara_1_Swara.id = 1
        aksara_1_Swara.name = "A/a"
        
        let aksara_2_Swara = Aksara(context: PersistenceService.context)
        aksara_2_Swara.id = 2
        aksara_2_Swara.name = "I/i"
        
        let aksara_3_Swara = Aksara(context: PersistenceService.context)
        aksara_3_Swara.id = 3
        aksara_3_Swara.name = "U/u"
        
        let aksara_4_Swara = Aksara(context: PersistenceService.context)
        aksara_4_Swara.id = 4
        aksara_4_Swara.name = "O/o"
        
        let aksara_5_Swara = Aksara(context: PersistenceService.context)
        aksara_5_Swara.id = 5
        aksara_5_Swara.name = "E/e"
        
        let aksara_6_Swara = Aksara(context: PersistenceService.context)
        aksara_6_Swara.id = 6
        aksara_6_Swara.name = "É/ê"
        
        let aksara_7_Swara = Aksara(context: PersistenceService.context)
        aksara_7_Swara.id = 7
        aksara_7_Swara.name = "Eu/eu"
        
        //MARK: Rarangken
        let aksara_1_Rarangken = Aksara(context: PersistenceService.context)
        aksara_1_Rarangken.id = 1
        aksara_1_Rarangken.name = "Panghulu"
        
        let aksara_2_Rarangken = Aksara(context: PersistenceService.context)
        aksara_2_Rarangken.id = 2
        aksara_2_Rarangken.name = "Pamepet"
        
        let aksara_3_Rarangken = Aksara(context: PersistenceService.context)
        aksara_3_Rarangken.id = 3
        aksara_3_Rarangken.name = "Paneuleung"
        
        let aksara_4_Rarangken = Aksara(context: PersistenceService.context)
        aksara_4_Rarangken.id = 4
        aksara_4_Rarangken.name = "Panglayar"
        
        let aksara_5_Rarangken = Aksara(context: PersistenceService.context)
        aksara_5_Rarangken.id = 5
        aksara_5_Rarangken.name = "Panyecek"
        
        let aksara_6_Rarangken = Aksara(context: PersistenceService.context)
        aksara_6_Rarangken.id = 6
        aksara_6_Rarangken.name = "Paneleng"
        
        let aksara_7_Rarangken = Aksara(context: PersistenceService.context)
        aksara_7_Rarangken.id = 7
        aksara_7_Rarangken.name = "Panolong"
        
        let aksara_8_Rarangken = Aksara(context: PersistenceService.context)
        aksara_8_Rarangken.id = 8
        aksara_8_Rarangken.name = "Pamingkal"
        
        let aksara_9_Rarangken = Aksara(context: PersistenceService.context)
        aksara_9_Rarangken.id = 9
        aksara_9_Rarangken.name = "Pangwisad"
        
        let aksara_10_Rarangken = Aksara(context: PersistenceService.context)
        aksara_10_Rarangken.id = 10
        aksara_10_Rarangken.name = "Pamaeh"
        
        let aksara_11_Rarangken = Aksara(context: PersistenceService.context)
        aksara_11_Rarangken.id = 11
        aksara_11_Rarangken.name = "Panyuku"
        
        let aksara_12_Rarangken = Aksara(context: PersistenceService.context)
        aksara_12_Rarangken.id = 12
        aksara_12_Rarangken.name = "Panyakra"
        
        let aksara_13_Rarangken = Aksara(context: PersistenceService.context)
        aksara_13_Rarangken.id = 13
        aksara_13_Rarangken.name = "Panyiku"
        
        //MARK: DICTIONARY SUNDA
        let ngalegena = Dictionary(context: PersistenceService.context)
        ngalegena.id = 1
        ngalegena.name = "Ngalegena"
        ngalegena.isLocked = false
        ngalegena.title = "Huruf konsonan"
        ngalegena.titleDescription = "Memiliki vokal dasar /a/"
        ngalegena.aksaras = [aksara_1_Ngalegena, aksara_2_Ngalegena, aksara_3_Ngalegena, aksara_4_Ngalegena, aksara_5_Ngalegena, aksara_6_Ngalegena, aksara_7_Ngalegena, aksara_8_Ngalegena, aksara_9_Ngalegena, aksara_10_Ngalegena, aksara_11_Ngalegena, aksara_12_Ngalegena, aksara_13_Ngalegena, aksara_14_Ngalegena, aksara_15_Ngalegena, aksara_16_Ngalegena, aksara_17_Ngalegena, aksara_18_Ngalegena, aksara_19_Ngalegena, aksara_20_Ngalegena, aksara_21_Ngalegena, aksara_22_Ngalegena, aksara_23_Ngalegena]
        
        let swara = Dictionary(context: PersistenceService.context)
        swara.id = 2
        swara.name = "Swara"
        swara.isLocked = false
        swara.title = "Huruf vokal"
        swara.titleDescription = "Huruf vokal a, i, u, e, o yang dapat berdiri sendiri sebagai suku kata"
        swara.aksaras = [aksara_1_Swara, aksara_2_Swara, aksara_3_Swara, aksara_4_Swara, aksara_5_Swara, aksara_6_Swara, aksara_7_Swara]
        
        let rarangken = Dictionary(context: PersistenceService.context)
        rarangken.id = 3
        rarangken.name = "Rarangken"
        rarangken.isLocked = false
        rarangken.title = "Vokalisasi"
        rarangken.titleDescription = "Merubah vokal dasar Ngalegena atau dapat mematikan vokalnya"
        rarangken.aksaras = [aksara_1_Rarangken, aksara_2_Rarangken, aksara_3_Rarangken, aksara_4_Rarangken, aksara_5_Rarangken, aksara_6_Rarangken, aksara_7_Rarangken, aksara_8_Rarangken, aksara_9_Rarangken, aksara_10_Rarangken, aksara_11_Rarangken, aksara_12_Rarangken, aksara_13_Rarangken]
        
        // MARK: Stage Sunda
        let firstStageSunda = Stage(context: PersistenceService.context)
        firstStageSunda.id = 5
        firstStageSunda.name = "Stage 1"
        firstStageSunda.currentMedal = 0
        firstStageSunda.totalMedal = 45
        firstStageSunda.isLocked = false
        firstStageSunda.levels = [firstLevelStage1Sunda, secondLevelStage1Sunda, thirdLevelStage1Sunda, fourthLevelStage1Sunda, fifthLevelStage1Sunda, sixthLevelStage1Sunda, seventhLevelStage1Sunda, eightLevelStage1Sunda, ninthLevelStage1Sunda, tenthLevelStage1Sunda, eleventhLevelStage1Sunda, twelfthLevelStage1Sunda, thirteenthLevelStage1Sunda, fourteenthLevelStage1Sunda, fifteenthLevelStage1Sunda]
        
        let secondStageSunda = Stage(context: PersistenceService.context)
        secondStageSunda.id = 6
        secondStageSunda.name = "Stage 2"
        secondStageSunda.currentMedal = 0
        secondStageSunda.totalMedal = 45
        secondStageSunda.isLocked = true
        secondStageSunda.levels = []
        
        let thirdStageSunda = Stage(context: PersistenceService.context)
        thirdStageSunda.id = 7
        thirdStageSunda.name = "Stage 3"
        thirdStageSunda.currentMedal = 0
        thirdStageSunda.totalMedal = 45
        thirdStageSunda.isLocked = true
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
        firstRegion.dictionaries = [carakan, sandhangan, pasangan]
        
        let secondRegion = Region(context: PersistenceService.context)
        secondRegion.id = 2
        secondRegion.name = "Sunda"
        secondRegion.isLocked = false
        secondRegion.stages = [firstStageSunda, secondStageSunda, thirdStageSunda, fourthStageSunda]
        secondRegion.dictionaries = [ngalegena, swara, rarangken]
        
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
