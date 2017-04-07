//
//  JournalManager.swift
//  midtermGroupE
//
//  Created by 湯芯瑜 on 2017/4/7.
//  Copyright © 2017年 MichaelXiao. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class JournalManager {
    
    static let shared = JournalManager() //Singleton
    var journals: [Journal] = []

    func saveCoreData(title: String, content: String, time: Date, picture: NSData) {
        
        if let app = UIApplication.shared.delegate as? AppDelegate {
            
            let context = app.persistentContainer.viewContext
            
            //            let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.CoreDataKey.entityName)
            //            request.predicate = NSPredicate(format: "order == %@", order)
            
//            do {
                //                guard let results = try context.fetch(request) as? [JournalInfo] else {
                //                    return
                //                }
                //
                //                if results.count > 0 {
                //                    results[0].title = title
                //                    results[0].content = content
                //                    results[0].time = time
                //                    results[0].picture = picture
                //
                //                } else {
                
                let entity = NSEntityDescription.insertNewObject(forEntityName: Constants.CoreDataKey.entityName, into: context)
                
                entity.setValue(title, forKey: Constants.CoreDataKey.title)
                entity.setValue(content, forKey: Constants.CoreDataKey.content)
                entity.setValue(time, forKey: Constants.CoreDataKey.time)
                entity.setValue(picture, forKey: Constants.CoreDataKey.picture)
                //                }
                
                app.saveContext()
                print("SAVED")
                
//            } catch {
//                
//                print(error)
//                
//            }
        }
        print(NSPersistentContainer.defaultDirectoryURL())
    }
    
    func getCoreData() {
        
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.CoreDataKey.entityName)
        
        do {
            let results = try context.fetch(fetchRequest)
            var coreDataJournals = [Journal]()
            
            for result in (results as? [NSManagedObject])! {
                
                if let title = result.value(forKey: Constants.CoreDataKey.title) as? String,
                    let content = result.value(forKey: Constants.CoreDataKey.content) as? String,
                    let time = result.value(forKey: Constants.CoreDataKey.time) as? Date,
                    let picture = result.value(forKey: Constants.CoreDataKey.picture) as? NSData {
                    
                    let coreDataJournal = Journal(title: title, content: content, time: time, picture: picture)
                    coreDataJournals.append(coreDataJournal)
                    print(coreDataJournal.title)
                }
                
            }
            
            journals = coreDataJournals
            print(coreDataJournals.count)
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }

}
