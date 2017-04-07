//
//  EditJournalViewController.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit

class EditJournalViewController: UIViewController {
    @IBOutlet weak var editImage: UIImageView!

    @IBOutlet weak var editTitle: UITextField!
    @IBOutlet weak var editContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func finishEdit(_ sender: Any) {
        print("Edit success")
    }
}
