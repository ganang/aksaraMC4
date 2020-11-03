//
//  CoreDataRecordV2.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 30/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class CoreDataRecordV2 {
    static let shared = CoreDataRecordV2()
    
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
    
    func saveRecord() {
        
        // MARK: QUIZES FOR JAWA
        
        //MARK: QUESTIONS
        let question1_Quiz1_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz1_Level1_Stage1_Jawa.id = 1
        question1_Quiz1_Level1_Stage1_Jawa.name = "Wa"
        
        let quiz1_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz1_level1_stage1_Jawa.id = 1
        quiz1_level1_stage1_Jawa.title = "Panduan"
        quiz1_level1_stage1_Jawa.type = "Guide"
        quiz1_level1_stage1_Jawa.isCorrect = false
        quiz1_level1_stage1_Jawa.questions = [question1_Quiz1_Level1_Stage1_Jawa]
        quiz1_level1_stage1_Jawa.answerChoices = []
        quiz1_level1_stage1_Jawa.time = 0
        
        let question1_Quiz2_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz2_Level1_Stage1_Jawa.id = 1
        question1_Quiz2_Level1_Stage1_Jawa.name = "Wa"
        
        let answerChoice1_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz2_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz2_Level1_Stage1_Jawa.name = "Head Dha"
        answerChoice1_Quiz2_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice2_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz2_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz2_Level1_Stage1_Jawa.name = "Head Ca"
        answerChoice2_Quiz2_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice3_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz2_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz2_Level1_Stage1_Jawa.name = "Head Da"
        answerChoice3_Quiz2_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice4_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz2_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz2_Level1_Stage1_Jawa.name = "Head Wa"
        answerChoice4_Quiz2_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice5_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice5_Quiz2_Level1_Stage1_Jawa.id = 5
        answerChoice5_Quiz2_Level1_Stage1_Jawa.name = "Tail Wa"
        answerChoice5_Quiz2_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice6_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice6_Quiz2_Level1_Stage1_Jawa.id = 6
        answerChoice6_Quiz2_Level1_Stage1_Jawa.name = "Tail Pa"
        answerChoice6_Quiz2_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice7_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice7_Quiz2_Level1_Stage1_Jawa.id = 7
        answerChoice7_Quiz2_Level1_Stage1_Jawa.name = "Tail Dha"
        answerChoice7_Quiz2_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice8_Quiz2_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice8_Quiz2_Level1_Stage1_Jawa.id = 8
        answerChoice8_Quiz2_Level1_Stage1_Jawa.name = "Tail Ca"
        answerChoice8_Quiz2_Level1_Stage1_Jawa.type = "Tail"
        
        let quiz2_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz2_level1_stage1_Jawa.id = 2
        quiz2_level1_stage1_Jawa.title = "Kuis 1"
        quiz2_level1_stage1_Jawa.type = "D"
        quiz2_level1_stage1_Jawa.isCorrect = false
        quiz2_level1_stage1_Jawa.questions = [question1_Quiz2_Level1_Stage1_Jawa]
        quiz2_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz2_Level1_Stage1_Jawa, answerChoice2_Quiz2_Level1_Stage1_Jawa, answerChoice3_Quiz2_Level1_Stage1_Jawa, answerChoice4_Quiz2_Level1_Stage1_Jawa, answerChoice5_Quiz2_Level1_Stage1_Jawa, answerChoice6_Quiz2_Level1_Stage1_Jawa, answerChoice7_Quiz2_Level1_Stage1_Jawa, answerChoice8_Quiz2_Level1_Stage1_Jawa]
        quiz2_level1_stage1_Jawa.time = 15
        
        
        let question1_Quiz3_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz3_Level1_Stage1_Jawa.id = 1
        question1_Quiz3_Level1_Stage1_Jawa.name = "Wa"
        
        let answerChoice1_Quiz3_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz3_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz3_Level1_Stage1_Jawa.name = "Dha"
        answerChoice1_Quiz3_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz3_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz3_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz3_Level1_Stage1_Jawa.name = "Wa"
        answerChoice2_Quiz3_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz3_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz3_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz3_Level1_Stage1_Jawa.name = "Da"
        answerChoice3_Quiz3_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz3_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz3_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz3_Level1_Stage1_Jawa.name = "Ca"
        answerChoice4_Quiz3_Level1_Stage1_Jawa.type = ""
        
        let quiz3_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz3_level1_stage1_Jawa.id = 3
        quiz3_level1_stage1_Jawa.title = "Kuis 2"
        quiz3_level1_stage1_Jawa.type = "A"
        quiz3_level1_stage1_Jawa.isCorrect = false
        quiz3_level1_stage1_Jawa.questions = [question1_Quiz3_Level1_Stage1_Jawa]
        quiz3_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz3_Level1_Stage1_Jawa, answerChoice2_Quiz3_Level1_Stage1_Jawa, answerChoice3_Quiz3_Level1_Stage1_Jawa, answerChoice4_Quiz3_Level1_Stage1_Jawa]
        quiz3_level1_stage1_Jawa.time = 10
        
        let question1_Quiz4_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz4_Level1_Stage1_Jawa.id = 1
        question1_Quiz4_Level1_Stage1_Jawa.name = "Ha"
        
        let quiz4_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz4_level1_stage1_Jawa.id = 4
        quiz4_level1_stage1_Jawa.title = "Panduan"
        quiz4_level1_stage1_Jawa.type = "Guide"
        quiz4_level1_stage1_Jawa.isCorrect = false
        quiz4_level1_stage1_Jawa.questions = [question1_Quiz4_Level1_Stage1_Jawa]
        quiz4_level1_stage1_Jawa.answerChoices = []
        quiz4_level1_stage1_Jawa.time = 0
        
        let question1_Quiz5_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz5_Level1_Stage1_Jawa.id = 1
        question1_Quiz5_Level1_Stage1_Jawa.name = "Ha"
        
        let answerChoice1_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz5_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz5_Level1_Stage1_Jawa.name = "Head Ka"
        answerChoice1_Quiz5_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice2_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz5_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz5_Level1_Stage1_Jawa.name = "Head Ta"
        answerChoice2_Quiz5_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice3_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz5_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz5_Level1_Stage1_Jawa.name = "Head Ha"
        answerChoice3_Quiz5_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice4_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz5_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz5_Level1_Stage1_Jawa.name = "Head La"
        answerChoice4_Quiz5_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice5_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice5_Quiz5_Level1_Stage1_Jawa.id = 5
        answerChoice5_Quiz5_Level1_Stage1_Jawa.name = "Tail La"
        answerChoice5_Quiz5_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice6_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice6_Quiz5_Level1_Stage1_Jawa.id = 6
        answerChoice6_Quiz5_Level1_Stage1_Jawa.name = "Tail Ta"
        answerChoice6_Quiz5_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice7_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice7_Quiz5_Level1_Stage1_Jawa.id = 7
        answerChoice7_Quiz5_Level1_Stage1_Jawa.name = "Tail Ha"
        answerChoice7_Quiz5_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice8_Quiz5_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice8_Quiz5_Level1_Stage1_Jawa.id = 8
        answerChoice8_Quiz5_Level1_Stage1_Jawa.name = "Tail Ka"
        answerChoice8_Quiz5_Level1_Stage1_Jawa.type = "Tail"
        
        let quiz5_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz5_level1_stage1_Jawa.id = 5
        quiz5_level1_stage1_Jawa.title = "Kuis 3"
        quiz5_level1_stage1_Jawa.type = "D"
        quiz5_level1_stage1_Jawa.isCorrect = false
        quiz5_level1_stage1_Jawa.questions = [question1_Quiz5_Level1_Stage1_Jawa]
        quiz5_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz5_Level1_Stage1_Jawa, answerChoice2_Quiz5_Level1_Stage1_Jawa, answerChoice3_Quiz5_Level1_Stage1_Jawa, answerChoice4_Quiz5_Level1_Stage1_Jawa, answerChoice5_Quiz5_Level1_Stage1_Jawa, answerChoice6_Quiz5_Level1_Stage1_Jawa, answerChoice7_Quiz5_Level1_Stage1_Jawa, answerChoice8_Quiz5_Level1_Stage1_Jawa]
        quiz5_level1_stage1_Jawa.time = 15
        
        let question1_Quiz6_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz6_Level1_Stage1_Jawa.id = 1
        question1_Quiz6_Level1_Stage1_Jawa.name = "Ha"
        
        let answerChoice1_Quiz6_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz6_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz6_Level1_Stage1_Jawa.name = "Ka"
        answerChoice1_Quiz6_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz6_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz6_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz6_Level1_Stage1_Jawa.name = "Ha"
        answerChoice2_Quiz6_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz6_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz6_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz6_Level1_Stage1_Jawa.name = "Da"
        answerChoice3_Quiz6_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz6_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz6_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz6_Level1_Stage1_Jawa.name = "Ba"
        answerChoice4_Quiz6_Level1_Stage1_Jawa.type = ""
        
        let quiz6_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz6_level1_stage1_Jawa.id = 6
        quiz6_level1_stage1_Jawa.title = "Kuis 4"
        quiz6_level1_stage1_Jawa.type = "A"
        quiz6_level1_stage1_Jawa.isCorrect = false
        quiz6_level1_stage1_Jawa.questions = [question1_Quiz6_Level1_Stage1_Jawa]
        quiz6_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz6_Level1_Stage1_Jawa, answerChoice2_Quiz6_Level1_Stage1_Jawa, answerChoice3_Quiz6_Level1_Stage1_Jawa, answerChoice4_Quiz6_Level1_Stage1_Jawa]
        quiz6_level1_stage1_Jawa.time = 10
        
        let question1_Quiz7_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz7_Level1_Stage1_Jawa.id = 1
        question1_Quiz7_Level1_Stage1_Jawa.name = "Wa"
        
        let answerChoice1_Quiz7_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz7_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz7_Level1_Stage1_Jawa.name = "Pa"
        answerChoice1_Quiz7_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz7_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz7_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz7_Level1_Stage1_Jawa.name = "Wa"
        answerChoice2_Quiz7_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz7_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz7_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz7_Level1_Stage1_Jawa.name = "Dha"
        answerChoice3_Quiz7_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz7_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz7_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz7_Level1_Stage1_Jawa.name = "Ca"
        answerChoice4_Quiz7_Level1_Stage1_Jawa.type = ""
        
        let quiz7_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz7_level1_stage1_Jawa.id = 7
        quiz7_level1_stage1_Jawa.title = "Kuis 5"
        quiz7_level1_stage1_Jawa.type = "B"
        quiz7_level1_stage1_Jawa.isCorrect = false
        quiz7_level1_stage1_Jawa.questions = [question1_Quiz7_Level1_Stage1_Jawa]
        quiz7_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz7_Level1_Stage1_Jawa, answerChoice2_Quiz7_Level1_Stage1_Jawa, answerChoice3_Quiz7_Level1_Stage1_Jawa, answerChoice4_Quiz7_Level1_Stage1_Jawa]
        quiz7_level1_stage1_Jawa.time = 10
        
        let question1_Quiz8_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz8_Level1_Stage1_Jawa.id = 1
        question1_Quiz8_Level1_Stage1_Jawa.name = "Ha"
        
        let answerChoice1_Quiz8_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz8_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz8_Level1_Stage1_Jawa.name = "La"
        answerChoice1_Quiz8_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz8_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz8_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz8_Level1_Stage1_Jawa.name = "Ha"
        answerChoice2_Quiz8_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz8_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz8_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz8_Level1_Stage1_Jawa.name = "Ta"
        answerChoice3_Quiz8_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz8_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz8_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz8_Level1_Stage1_Jawa.name = "Pa"
        answerChoice4_Quiz8_Level1_Stage1_Jawa.type = ""
        
        let quiz8_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz8_level1_stage1_Jawa.id = 8
        quiz8_level1_stage1_Jawa.title = "Kuis 6"
        quiz8_level1_stage1_Jawa.type = "C"
        quiz8_level1_stage1_Jawa.isCorrect = false
        quiz8_level1_stage1_Jawa.questions = [question1_Quiz8_Level1_Stage1_Jawa]
        quiz8_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz8_Level1_Stage1_Jawa, answerChoice2_Quiz8_Level1_Stage1_Jawa, answerChoice3_Quiz8_Level1_Stage1_Jawa, answerChoice4_Quiz8_Level1_Stage1_Jawa]
        quiz8_level1_stage1_Jawa.time = 10
        
        let question1_Quiz9_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz9_Level1_Stage1_Jawa.id = 1
        question1_Quiz9_Level1_Stage1_Jawa.name = "Wa"
        
        let quiz9_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz9_level1_stage1_Jawa.id = 9
        quiz9_level1_stage1_Jawa.title = "Kuis 7"
        quiz9_level1_stage1_Jawa.type = "I1"
        quiz9_level1_stage1_Jawa.isCorrect = false
        quiz9_level1_stage1_Jawa.questions = [question1_Quiz9_Level1_Stage1_Jawa]
        quiz9_level1_stage1_Jawa.answerChoices = []
        quiz9_level1_stage1_Jawa.time = 30
        
        let question1_Quiz10_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz10_Level1_Stage1_Jawa.id = 1
        question1_Quiz10_Level1_Stage1_Jawa.name = "Ha"
        
        let quiz10_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz10_level1_stage1_Jawa.id = 10
        quiz10_level1_stage1_Jawa.title = "Kuis 8"
        quiz10_level1_stage1_Jawa.type = "I1"
        quiz10_level1_stage1_Jawa.isCorrect = false
        quiz10_level1_stage1_Jawa.questions = [question1_Quiz10_Level1_Stage1_Jawa]
        quiz10_level1_stage1_Jawa.answerChoices = []
        quiz10_level1_stage1_Jawa.time = 30
        
        let question1_Quiz11_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz11_Level1_Stage1_Jawa.id = 1
        question1_Quiz11_Level1_Stage1_Jawa.name = "Na"
        
        let quiz11_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz11_level1_stage1_Jawa.id = 11
        quiz11_level1_stage1_Jawa.title = "Panduan"
        quiz11_level1_stage1_Jawa.type = "Guide"
        quiz11_level1_stage1_Jawa.isCorrect = false
        quiz11_level1_stage1_Jawa.questions = [question1_Quiz11_Level1_Stage1_Jawa]
        quiz11_level1_stage1_Jawa.answerChoices = []
        quiz11_level1_stage1_Jawa.time = 0
        
        let question1_Quiz12_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz12_Level1_Stage1_Jawa.id = 1
        question1_Quiz12_Level1_Stage1_Jawa.name = "Na"
        
        let answerChoice1_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz12_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz12_Level1_Stage1_Jawa.name = "Head Na"
        answerChoice1_Quiz12_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice2_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz12_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz12_Level1_Stage1_Jawa.name = "Head Sa"
        answerChoice2_Quiz12_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice3_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz12_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz12_Level1_Stage1_Jawa.name = "Head Da"
        answerChoice3_Quiz12_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice4_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz12_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz12_Level1_Stage1_Jawa.name = "Head Ca"
        answerChoice4_Quiz12_Level1_Stage1_Jawa.type = "Head"
        
        let answerChoice5_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice5_Quiz12_Level1_Stage1_Jawa.id = 5
        answerChoice5_Quiz12_Level1_Stage1_Jawa.name = "Tail Da"
        answerChoice5_Quiz12_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice6_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice6_Quiz12_Level1_Stage1_Jawa.id = 6
        answerChoice6_Quiz12_Level1_Stage1_Jawa.name = "Tail Ca"
        answerChoice6_Quiz12_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice7_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice7_Quiz12_Level1_Stage1_Jawa.id = 7
        answerChoice7_Quiz12_Level1_Stage1_Jawa.name = "Tail Na"
        answerChoice7_Quiz12_Level1_Stage1_Jawa.type = "Tail"
        
        let answerChoice8_Quiz12_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice8_Quiz12_Level1_Stage1_Jawa.id = 8
        answerChoice8_Quiz12_Level1_Stage1_Jawa.name = "Tail Sa"
        answerChoice8_Quiz12_Level1_Stage1_Jawa.type = "Tail"
        
        let quiz12_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz12_level1_stage1_Jawa.id = 12
        quiz12_level1_stage1_Jawa.title = "Kuis 9"
        quiz12_level1_stage1_Jawa.type = "D"
        quiz12_level1_stage1_Jawa.isCorrect = false
        quiz12_level1_stage1_Jawa.questions = [question1_Quiz12_Level1_Stage1_Jawa]
        quiz12_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz12_Level1_Stage1_Jawa, answerChoice2_Quiz12_Level1_Stage1_Jawa, answerChoice3_Quiz12_Level1_Stage1_Jawa, answerChoice4_Quiz12_Level1_Stage1_Jawa, answerChoice5_Quiz12_Level1_Stage1_Jawa, answerChoice6_Quiz12_Level1_Stage1_Jawa, answerChoice7_Quiz12_Level1_Stage1_Jawa, answerChoice8_Quiz12_Level1_Stage1_Jawa]
        quiz12_level1_stage1_Jawa.time = 15
        
        let question1_Quiz13_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz13_Level1_Stage1_Jawa.id = 1
        question1_Quiz13_Level1_Stage1_Jawa.name = "Ha"
        
        let answerChoice1_Quiz13_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz13_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz13_Level1_Stage1_Jawa.name = "Ka"
        answerChoice1_Quiz13_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz13_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz13_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz13_Level1_Stage1_Jawa.name = "Ha"
        answerChoice2_Quiz13_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz13_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz13_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz13_Level1_Stage1_Jawa.name = "Da"
        answerChoice3_Quiz13_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz13_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz13_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz13_Level1_Stage1_Jawa.name = "Ba"
        answerChoice4_Quiz13_Level1_Stage1_Jawa.type = ""
        
        let quiz13_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz13_level1_stage1_Jawa.id = 13
        quiz13_level1_stage1_Jawa.title = "Kuis 10"
        quiz13_level1_stage1_Jawa.type = "A"
        quiz13_level1_stage1_Jawa.isCorrect = false
        quiz13_level1_stage1_Jawa.questions = [question1_Quiz13_Level1_Stage1_Jawa]
        quiz13_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz13_Level1_Stage1_Jawa, answerChoice2_Quiz13_Level1_Stage1_Jawa, answerChoice3_Quiz13_Level1_Stage1_Jawa, answerChoice4_Quiz13_Level1_Stage1_Jawa]
        quiz13_level1_stage1_Jawa.time = 10
        
        let question1_Quiz14_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz14_Level1_Stage1_Jawa.id = 1
        question1_Quiz14_Level1_Stage1_Jawa.name = "Na"
        
        let answerChoice1_Quiz14_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz14_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz14_Level1_Stage1_Jawa.name = "Da"
        answerChoice1_Quiz14_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz14_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz14_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz14_Level1_Stage1_Jawa.name = "Sa"
        answerChoice2_Quiz14_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz14_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz14_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz14_Level1_Stage1_Jawa.name = "Na"
        answerChoice3_Quiz14_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz14_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz14_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz14_Level1_Stage1_Jawa.name = "Ca"
        answerChoice4_Quiz14_Level1_Stage1_Jawa.type = ""
        
        let quiz14_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz14_level1_stage1_Jawa.id = 14
        quiz14_level1_stage1_Jawa.title = "Kuis 10"
        quiz14_level1_stage1_Jawa.type = "A"
        quiz14_level1_stage1_Jawa.isCorrect = false
        quiz14_level1_stage1_Jawa.questions = [question1_Quiz14_Level1_Stage1_Jawa]
        quiz14_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz14_Level1_Stage1_Jawa, answerChoice2_Quiz14_Level1_Stage1_Jawa, answerChoice3_Quiz14_Level1_Stage1_Jawa, answerChoice4_Quiz14_Level1_Stage1_Jawa]
        quiz14_level1_stage1_Jawa.time = 10
        
        let question1_Quiz15_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz15_Level1_Stage1_Jawa.id = 1
        question1_Quiz15_Level1_Stage1_Jawa.name = "Ha"
        
        let answerChoice1_Quiz15_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz15_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz15_Level1_Stage1_Jawa.name = "Ta"
        answerChoice1_Quiz15_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz15_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz15_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz15_Level1_Stage1_Jawa.name = "La"
        answerChoice2_Quiz15_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz15_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz15_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz15_Level1_Stage1_Jawa.name = "Pa"
        answerChoice3_Quiz15_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz15_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz15_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz15_Level1_Stage1_Jawa.name = "Ha"
        answerChoice4_Quiz15_Level1_Stage1_Jawa.type = ""
        
        let quiz15_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz15_level1_stage1_Jawa.id = 15
        quiz15_level1_stage1_Jawa.title = "Kuis 11"
        quiz15_level1_stage1_Jawa.type = "B"
        quiz15_level1_stage1_Jawa.isCorrect = false
        quiz15_level1_stage1_Jawa.questions = [question1_Quiz15_Level1_Stage1_Jawa]
        quiz15_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz15_Level1_Stage1_Jawa, answerChoice2_Quiz15_Level1_Stage1_Jawa, answerChoice3_Quiz15_Level1_Stage1_Jawa, answerChoice4_Quiz15_Level1_Stage1_Jawa]
        quiz15_level1_stage1_Jawa.time = 10
        
        let question1_Quiz16_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz16_Level1_Stage1_Jawa.id = 1
        question1_Quiz16_Level1_Stage1_Jawa.name = "Na"
        
        let question2_Quiz16_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question2_Quiz16_Level1_Stage1_Jawa.id = 2
        question2_Quiz16_Level1_Stage1_Jawa.name = "Ha"
        
        let quiz16_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz16_level1_stage1_Jawa.id = 16
        quiz16_level1_stage1_Jawa.title = "Kuis 12"
        quiz16_level1_stage1_Jawa.type = "I2"
        quiz16_level1_stage1_Jawa.isCorrect = false
        quiz16_level1_stage1_Jawa.questions = [question1_Quiz16_Level1_Stage1_Jawa, question2_Quiz16_Level1_Stage1_Jawa]
        quiz16_level1_stage1_Jawa.answerChoices = []
        quiz16_level1_stage1_Jawa.time = 30
        
        let question1_Quiz17_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz17_Level1_Stage1_Jawa.id = 1
        question1_Quiz17_Level1_Stage1_Jawa.name = "Wa"
        
        let question2_Quiz17_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question2_Quiz17_Level1_Stage1_Jawa.id = 2
        question2_Quiz17_Level1_Stage1_Jawa.name = "Na"
        
        let answerChoice1_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz17_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz17_Level1_Stage1_Jawa.name = "Wa"
        answerChoice1_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz17_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz17_Level1_Stage1_Jawa.name = "Ca"
        answerChoice2_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz17_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz17_Level1_Stage1_Jawa.name = "Na"
        answerChoice3_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz17_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz17_Level1_Stage1_Jawa.name = "Sa"
        answerChoice4_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice5_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice5_Quiz17_Level1_Stage1_Jawa.id = 5
        answerChoice5_Quiz17_Level1_Stage1_Jawa.name = "Dha"
        answerChoice5_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice6_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice6_Quiz17_Level1_Stage1_Jawa.id = 6
        answerChoice6_Quiz17_Level1_Stage1_Jawa.name = "Da"
        answerChoice6_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice7_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice7_Quiz17_Level1_Stage1_Jawa.id = 7
        answerChoice7_Quiz17_Level1_Stage1_Jawa.name = "Pa"
        answerChoice7_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let answerChoice8_Quiz17_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice8_Quiz17_Level1_Stage1_Jawa.id = 8
        answerChoice8_Quiz17_Level1_Stage1_Jawa.name = "Ha"
        answerChoice8_Quiz17_Level1_Stage1_Jawa.type = ""
        
        let quiz17_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz17_level1_stage1_Jawa.id = 17
        quiz17_level1_stage1_Jawa.title = "Kuis 13"
        quiz17_level1_stage1_Jawa.type = "E2"
        quiz17_level1_stage1_Jawa.isCorrect = false
        quiz17_level1_stage1_Jawa.questions = [question1_Quiz17_Level1_Stage1_Jawa, question2_Quiz17_Level1_Stage1_Jawa]
        quiz17_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz17_Level1_Stage1_Jawa, answerChoice2_Quiz17_Level1_Stage1_Jawa, answerChoice3_Quiz17_Level1_Stage1_Jawa, answerChoice4_Quiz17_Level1_Stage1_Jawa, answerChoice5_Quiz17_Level1_Stage1_Jawa, answerChoice6_Quiz17_Level1_Stage1_Jawa, answerChoice7_Quiz17_Level1_Stage1_Jawa, answerChoice8_Quiz17_Level1_Stage1_Jawa]
        quiz17_level1_stage1_Jawa.time = 30
        
        let question1_Quiz18_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz18_Level1_Stage1_Jawa.id = 1
        question1_Quiz18_Level1_Stage1_Jawa.name = "Wa"
        
        let question2_Quiz18_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question2_Quiz18_Level1_Stage1_Jawa.id = 2
        question2_Quiz18_Level1_Stage1_Jawa.name = "Ha"
        
        let question3_Quiz18_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question3_Quiz18_Level1_Stage1_Jawa.id = 3
        question3_Quiz18_Level1_Stage1_Jawa.name = "Na"
        
        let answerChoice1_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice1_Quiz18_Level1_Stage1_Jawa.id = 1
        answerChoice1_Quiz18_Level1_Stage1_Jawa.name = "Dha"
        answerChoice1_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice2_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice2_Quiz18_Level1_Stage1_Jawa.id = 2
        answerChoice2_Quiz18_Level1_Stage1_Jawa.name = "Pa"
        answerChoice2_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice3_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice3_Quiz18_Level1_Stage1_Jawa.id = 3
        answerChoice3_Quiz18_Level1_Stage1_Jawa.name = "Na"
        answerChoice3_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice4_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice4_Quiz18_Level1_Stage1_Jawa.id = 4
        answerChoice4_Quiz18_Level1_Stage1_Jawa.name = "Sa"
        answerChoice4_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice5_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice5_Quiz18_Level1_Stage1_Jawa.id = 5
        answerChoice5_Quiz18_Level1_Stage1_Jawa.name = "Wa"
        answerChoice5_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice6_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice6_Quiz18_Level1_Stage1_Jawa.id = 6
        answerChoice6_Quiz18_Level1_Stage1_Jawa.name = "Ha"
        answerChoice6_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice7_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice7_Quiz18_Level1_Stage1_Jawa.id = 7
        answerChoice7_Quiz18_Level1_Stage1_Jawa.name = "Ca"
        answerChoice7_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let answerChoice8_Quiz18_Level1_Stage1_Jawa = AnswerChoice(context: PersistenceService.context)
        answerChoice8_Quiz18_Level1_Stage1_Jawa.id = 8
        answerChoice8_Quiz18_Level1_Stage1_Jawa.name = "Ba"
        answerChoice8_Quiz18_Level1_Stage1_Jawa.type = ""
        
        let quiz18_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz18_level1_stage1_Jawa.id = 18
        quiz18_level1_stage1_Jawa.title = "Kuis 14"
        quiz18_level1_stage1_Jawa.type = "E3"
        quiz18_level1_stage1_Jawa.isCorrect = false
        quiz18_level1_stage1_Jawa.questions = [question1_Quiz18_Level1_Stage1_Jawa, question2_Quiz18_Level1_Stage1_Jawa, question3_Quiz18_Level1_Stage1_Jawa]
        quiz18_level1_stage1_Jawa.answerChoices = [answerChoice1_Quiz18_Level1_Stage1_Jawa, answerChoice2_Quiz18_Level1_Stage1_Jawa, answerChoice3_Quiz18_Level1_Stage1_Jawa, answerChoice4_Quiz18_Level1_Stage1_Jawa, answerChoice5_Quiz18_Level1_Stage1_Jawa, answerChoice6_Quiz18_Level1_Stage1_Jawa, answerChoice7_Quiz18_Level1_Stage1_Jawa, answerChoice8_Quiz18_Level1_Stage1_Jawa]
        quiz18_level1_stage1_Jawa.time = 30
        
        let question1_Quiz19_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz19_Level1_Stage1_Jawa.id = 1
        question1_Quiz19_Level1_Stage1_Jawa.name = "Wa"
        
        let question2_Quiz19_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question2_Quiz19_Level1_Stage1_Jawa.id = 2
        question2_Quiz19_Level1_Stage1_Jawa.name = "Ha"
        
        let question3_Quiz19_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question3_Quiz19_Level1_Stage1_Jawa.id = 3
        question3_Quiz19_Level1_Stage1_Jawa.name = "Na"
        
        let quiz19_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz19_level1_stage1_Jawa.id = 19
        quiz19_level1_stage1_Jawa.title = "Kuis 15"
        quiz19_level1_stage1_Jawa.type = "H"
        quiz19_level1_stage1_Jawa.isCorrect = false
        quiz19_level1_stage1_Jawa.questions = [question1_Quiz19_Level1_Stage1_Jawa, question2_Quiz19_Level1_Stage1_Jawa, question3_Quiz19_Level1_Stage1_Jawa]
        quiz19_level1_stage1_Jawa.answerChoices = []
        quiz19_level1_stage1_Jawa.time = 15
        
        let question1_Quiz20_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question1_Quiz20_Level1_Stage1_Jawa.id = 1
        question1_Quiz20_Level1_Stage1_Jawa.name = "Wa"
        
        let question2_Quiz20_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question2_Quiz20_Level1_Stage1_Jawa.id = 2
        question2_Quiz20_Level1_Stage1_Jawa.name = "Ha"
        
        let question3_Quiz20_Level1_Stage1_Jawa = Question(context: PersistenceService.context)
        question3_Quiz20_Level1_Stage1_Jawa.id = 3
        question3_Quiz20_Level1_Stage1_Jawa.name = "Na"
        
        let quiz20_level1_stage1_Jawa = Quiz(context: PersistenceService.context)
        quiz20_level1_stage1_Jawa.id = 20
        quiz20_level1_stage1_Jawa.title = "Kuis 16"
        quiz20_level1_stage1_Jawa.type = "I3"
        quiz20_level1_stage1_Jawa.isCorrect = false
        quiz20_level1_stage1_Jawa.questions = [question1_Quiz20_Level1_Stage1_Jawa, question2_Quiz20_Level1_Stage1_Jawa, question3_Quiz20_Level1_Stage1_Jawa]
        quiz20_level1_stage1_Jawa.answerChoices = []
        quiz20_level1_stage1_Jawa.time = 30
        
        // MARK: Level for Stage 1 Jawa
        let firstLevelStage1Jawa = Level(context: PersistenceService.context)
        firstLevelStage1Jawa.id = 1
        firstLevelStage1Jawa.name = "Level 1"
        firstLevelStage1Jawa.isLocked = false
        firstLevelStage1Jawa.isInitial = true
        firstLevelStage1Jawa.totalMedal = 0
        firstLevelStage1Jawa.quizes = [quiz1_level1_stage1_Jawa, quiz2_level1_stage1_Jawa, quiz3_level1_stage1_Jawa, quiz4_level1_stage1_Jawa, quiz5_level1_stage1_Jawa, quiz6_level1_stage1_Jawa, quiz7_level1_stage1_Jawa, quiz8_level1_stage1_Jawa, quiz9_level1_stage1_Jawa, quiz10_level1_stage1_Jawa, quiz11_level1_stage1_Jawa, quiz12_level1_stage1_Jawa, quiz13_level1_stage1_Jawa, quiz14_level1_stage1_Jawa, quiz15_level1_stage1_Jawa, quiz16_level1_stage1_Jawa, quiz17_level1_stage1_Jawa, quiz18_level1_stage1_Jawa, quiz19_level1_stage1_Jawa, quiz20_level1_stage1_Jawa]
        
        let secondLevelStage1Jawa = Level(context: PersistenceService.context)
        secondLevelStage1Jawa.id = 2
        secondLevelStage1Jawa.name = "Level 2"
        secondLevelStage1Jawa.isLocked = true
        secondLevelStage1Jawa.isInitial = true
        secondLevelStage1Jawa.totalMedal = 0
        secondLevelStage1Jawa.quizes = []
        
        let thirdLevelStage1Jawa = Level(context: PersistenceService.context)
        thirdLevelStage1Jawa.id = 3
        thirdLevelStage1Jawa.name = "Level 3"
        thirdLevelStage1Jawa.isLocked = true
        thirdLevelStage1Jawa.isInitial = true
        thirdLevelStage1Jawa.totalMedal = 0
        thirdLevelStage1Jawa.quizes = []
        
        let fourthLevelStage1Jawa = Level(context: PersistenceService.context)
        fourthLevelStage1Jawa.id = 4
        fourthLevelStage1Jawa.name = "Level 4"
        fourthLevelStage1Jawa.isLocked = true
        fourthLevelStage1Jawa.isInitial = true
        fourthLevelStage1Jawa.totalMedal = 0
        fourthLevelStage1Jawa.quizes = []
        
        let fifthLevelStage1Jawa = Level(context: PersistenceService.context)
        fifthLevelStage1Jawa.id = 5
        fifthLevelStage1Jawa.name = "Level 5"
        fifthLevelStage1Jawa.isLocked = true
        fifthLevelStage1Jawa.isInitial = true
        fifthLevelStage1Jawa.totalMedal = 0
        fifthLevelStage1Jawa.quizes = []
        
        let sixthLevelStage1Jawa = Level(context: PersistenceService.context)
        sixthLevelStage1Jawa.id = 6
        sixthLevelStage1Jawa.name = "Level 6"
        sixthLevelStage1Jawa.isLocked = true
        sixthLevelStage1Jawa.isInitial = true
        sixthLevelStage1Jawa.totalMedal = 0
        sixthLevelStage1Jawa.quizes = []
        
        let seventhLevelStage1Jawa = Level(context: PersistenceService.context)
        seventhLevelStage1Jawa.id = 7
        seventhLevelStage1Jawa.name = "Level 7"
        seventhLevelStage1Jawa.isLocked = true
        seventhLevelStage1Jawa.isInitial = true
        seventhLevelStage1Jawa.totalMedal = 0
        seventhLevelStage1Jawa.quizes = []
        
        let eightLevelStage1Jawa = Level(context: PersistenceService.context)
        eightLevelStage1Jawa.id = 8
        eightLevelStage1Jawa.name = "Level 8"
        eightLevelStage1Jawa.isLocked = true
        eightLevelStage1Jawa.isInitial = true
        eightLevelStage1Jawa.totalMedal = 0
        eightLevelStage1Jawa.quizes = []
        
        let ninthLevelStage1Jawa = Level(context: PersistenceService.context)
        ninthLevelStage1Jawa.id = 9
        ninthLevelStage1Jawa.name = "Level 9"
        ninthLevelStage1Jawa.isLocked = true
        ninthLevelStage1Jawa.isInitial = true
        ninthLevelStage1Jawa.totalMedal = 0
        ninthLevelStage1Jawa.quizes = []
        
        let tenthLevelStage1Jawa = Level(context: PersistenceService.context)
        tenthLevelStage1Jawa.id = 10
        tenthLevelStage1Jawa.name = "Level 10"
        tenthLevelStage1Jawa.isLocked = true
        tenthLevelStage1Jawa.isInitial = true
        tenthLevelStage1Jawa.totalMedal = 0
        tenthLevelStage1Jawa.quizes = []
        
        // MARK: Level for Stage 2 Jawa
        let firstLevelStage2Jawa = Level(context: PersistenceService.context)
        firstLevelStage2Jawa.id = 1
        firstLevelStage2Jawa.name = "Level 1"
        firstLevelStage2Jawa.isLocked = true
        firstLevelStage2Jawa.isInitial = true
        firstLevelStage2Jawa.totalMedal = 0
        firstLevelStage2Jawa.quizes = []
        
        // MARK: Level for Stage 3 Jawa
        let firstLevelStage3Jawa = Level(context: PersistenceService.context)
        firstLevelStage3Jawa.id = 1
        firstLevelStage3Jawa.name = "Level 1"
        firstLevelStage3Jawa.isLocked = true
        firstLevelStage3Jawa.isInitial = true
        firstLevelStage3Jawa.totalMedal = 0
        firstLevelStage3Jawa.quizes = []
        
        // MARK: Stage Jawa
        let firstStageJawa = Stage(context: PersistenceService.context)
        firstStageJawa.id = 1
        firstStageJawa.name = "Stage 1"
        firstStageJawa.currentMedal = 0
        firstStageJawa.totalMedal = 45
        firstStageJawa.isLocked = false
        firstStageJawa.levels = [firstLevelStage1Jawa, secondLevelStage1Jawa, thirdLevelStage1Jawa, fourthLevelStage1Jawa, fifthLevelStage1Jawa, sixthLevelStage1Jawa, seventhLevelStage1Jawa, eightLevelStage1Jawa, ninthLevelStage1Jawa, tenthLevelStage1Jawa]
        
        let secondStageJawa = Stage(context: PersistenceService.context)
        secondStageJawa.id = 2
        secondStageJawa.name = "Stage 2"
        secondStageJawa.currentMedal = 0
        secondStageJawa.totalMedal = 45
        secondStageJawa.isLocked = true
        secondStageJawa.levels = [firstLevelStage2Jawa]
        
        let thirdStageJawa = Stage(context: PersistenceService.context)
        thirdStageJawa.id = 3
        thirdStageJawa.name = "Stage 3"
        thirdStageJawa.currentMedal = 0
        thirdStageJawa.totalMedal = 45
        thirdStageJawa.isLocked = true
        thirdStageJawa.levels = [firstLevelStage3Jawa]
        
        let fourthStageJawa = Stage(context: PersistenceService.context)
        fourthStageJawa.id = 4
        fourthStageJawa.name = "Stage 4"
        fourthStageJawa.currentMedal = 0
        fourthStageJawa.totalMedal = 45
        fourthStageJawa.isLocked = true
        fourthStageJawa.levels = []
        
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
        
        // MARK: REGIONS
        let firstRegion = Region(context: PersistenceService.context)
        firstRegion.id = 1
        firstRegion.name = "Jawa"
        firstRegion.isLocked = false
        firstRegion.stages = [firstStageJawa, secondStageJawa, thirdStageJawa, fourthStageJawa]
        firstRegion.dictionaries = [carakan, sandhangan, pasangan]
        
        let secondRegion = Region(context: PersistenceService.context)
        secondRegion.id = 2
        secondRegion.name = "Sunda"
        secondRegion.isLocked = true
        secondRegion.stages = []
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
        
        
        // MARK: USER
        let user = User(context: PersistenceService.context)
        user.id = 1
        user.name = "Ganang Arief Pratama"
        user.regions = [firstRegion, secondRegion, thirdRegion, fourthRegion, fifthRegion, sixthRegion]
        
        PersistenceService.saveContext()
    }

}
