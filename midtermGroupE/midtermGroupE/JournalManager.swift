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
    
    func saveCoreData(title: String, content: String, order: Int, picture: NSData) {
        
        if let app = UIApplication.shared.delegate as? AppDelegate {
            
            let context = app.persistentContainer.viewContext
            
            //            let request = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.CoreDataKey.entityName)
            //            request.predicate = NSPredicate(format: "order == %@", order)
            
            do {
                //                guard let results = try context.fetch(request) as? [JournalInfo] else {
                //                    return
                //                }
                //
                //                if results.count > 0 {
                //                    results[0].title = title
                //                    results[0].content = content
                //                    results[0].order = Int64(order)
                //                    results[0].picture = picture
                //
                //                } else {
                
                let entity = NSEntityDescription.insertNewObject(forEntityName: Constants.CoreDataKey.entityName, into: context)
                
                entity.setValue(title, forKey: Constants.CoreDataKey.title)
                entity.setValue(content, forKey: Constants.CoreDataKey.content)
                entity.setValue(order, forKey: Constants.CoreDataKey.order)
                entity.setValue(picture, forKey: Constants.CoreDataKey.picture)
                //                }
                
                app.saveContext()
                print("SAVED")
                
            } catch {
                
                print(error)
                
            }
        }
        print(NSPersistentContainer.defaultDirectoryURL())
    }
    
}
