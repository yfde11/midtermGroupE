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

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getCoreData() {
        if Reachability.isConnectedToNetwork() != true {

            guard let app = UIApplication.shared.delegate as? AppDelegate else {
                return
            }

            let managedContext = app.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.CoreDataKey.entityName)

            do {
                let result = try managedContext.fetch(fetchRequest)
                var coreDataJournals = [Journal]()

                for info in (result as? [NSManagedObject])! {

                    guard let title = info.value(forKey: Constants.CoreDataKey.title) as? String,
                        let content = info.value(forKey: Constants.CoreDataKey.content) as? String,
                        let order = info.value(forKey: Constants.CoreDataKey.order) as? Int,
                        let picture = info.value(forKey: Constants.CoreDataKey.picture) as? NSData else {

                            return
                    }

                    let coreDataJournal = Journal(title: title, content: content, order: order, picture: picture)
                    coreDataJournals.append(coreDataJournal)
                }

                journals = coreDataJournals

            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
        }
    }

}
