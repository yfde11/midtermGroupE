//
//  AddJournalsViewController.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit
import Fusuma

class AddJournalsViewController: UIViewController, FusumaDelegate {

    @IBOutlet weak var journalImagePicker: UIImageView!
    @IBOutlet weak var journalTitle: UITextField!
    @IBOutlet weak var content: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func saveToCoreData(_ sender: Any) {

        let imageData = NSData(data: UIImageJPEGRepresentation(journalImagePicker.image!, 1.0)!)

        JournalManager.shared.saveCoreData(title: journalTitle.text!, content: content.text!, time: Date(), picture: imageData)

    }
    @IBAction func selectImage(_ sender: Any) {
        let fusuma = FusumaViewController()
        fusuma.delegate = self
        fusuma.cropHeightRatio = 0.6
        self.present(fusuma, animated: true, completion: nil)
    }

    // Return the image which is selected from camera roll or is taken via the camera.
    func fusumaImageSelected(image: UIImage) {

        print("Image selected")
    }

    // Return the image but called after is dismissed.
    func fusumaDismissedWithImage(image: UIImage) {

        print("Called just after FusumaViewController is dismissed.")
    }

    func fusumaVideoCompleted(withFileURL fileURL: URL) {

        print("Called just after a video has been selected.")
    }

    // When camera roll is not authorized, this method is called.
    func fusumaCameraRollUnauthorized() {

        print("Camera roll unauthorized")
    }
    
    func fusumaClosed() {
        print("Called when the FusumaViewController disappeared")
    }
    
    func fusumaWillClosed() {
        print("Called when the close button is pressed")
    }

}
