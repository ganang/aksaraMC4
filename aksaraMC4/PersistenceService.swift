//
//  PersistentService.swift
//  aksaraMC4
//
//  Created by Ganang Arief Pratama on 07/10/20.
//  Copyright © 2020 aksara.id. All rights reserved.
//

import UIKit
import CoreData

class PersistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }
    
    static var persistenceContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "aksaraMC4")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static func saveContext() {
        let context = persistenceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
