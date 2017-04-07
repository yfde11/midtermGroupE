//
//  EditJournalViewController.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit

class EditJournalViewController: UIViewController {
    
    var receivedJournals: [Journal] = []
    
    @IBOutlet weak var editImage: UIImageView!

    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        editImage.image = UIImage(data: receivedJournals[0].picture as Data)
        editTitle.text = receivedJournals[0].title
        editContent.text = receivedJournals[0].content
    }
    @IBAction func finishEdit(_ sender: Any) {
        print("Edit success")
        JournalManager.shared.saveCoreData(title: editTitle.text!, content: editContent.text!, time: receivedJournals[0].time, picture: receivedJournals[0].picture)
    }
}
