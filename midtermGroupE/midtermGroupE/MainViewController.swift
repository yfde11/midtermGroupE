//
//  MainViewController.swift
//  midtermGroupE
//
//  Created by 湯芯瑜 on 2017/4/6.
//  Copyright © 2017年 MichaelXiao. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    
    var journals: [Journal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        JournalManager.shared.saveCoreData(title: "333", content: "333", order: 2, picture: NSData())
        
        getCoreData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                    let order = result.value(forKey: Constants.CoreDataKey.order) as? Int,
                    let picture = result.value(forKey: Constants.CoreDataKey.picture) as? NSData {
                    
                    let coreDataJournal = Journal(title: title, content: content, order: order, picture: picture)
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

