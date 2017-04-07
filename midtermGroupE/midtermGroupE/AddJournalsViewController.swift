//
//  AddJournalsViewController.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit

class AddJournalsViewController: UIViewController {

    @IBOutlet weak var journalImagePicker: UIImageView!
    @IBOutlet weak var journalTitle: UITextField!
    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func saveToCoreData(_ sender: Any) {
        print("SAVE!!")
    }
}
