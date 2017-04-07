//
//  EditJournalViewController.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit
import Fusuma

class EditJournalViewController: UIViewController, FusumaDelegate {

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
        let imageData = NSData(data: UIImageJPEGRepresentation(editImage.image!, 1.0)!)

        JournalManager.shared.saveCoreData(title: editTitle.text!, content: editContent.text!, time: receivedJournals[0].time, picture: imageData)

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "root")
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func selectImage(_ sender: Any) {
        let fusuma = FusumaViewController()
        fusuma.delegate = self
        fusuma.cropHeightRatio = 0.6
        self.present(fusuma, animated: true, completion: nil)
    }

    // Return the image but called after is dismissed.
    func fusumaDismissedWithImage(image: UIImage) {

        print("Called just after FusumaViewController is dismissed.")
    }

    func fusumaVideoCompleted(withFileURL fileURL: URL) {

        print("Called just after a video has been selected.")
    }

    func fusumaCameraRollUnauthorized() {

        print("Camera roll unauthorized")

        let alert = UIAlertController(title: "Access Requested", message: "Saving image needs to access your photo album", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { (_) -> Void in

            if let url = URL(string:UIApplicationOpenSettingsURLString) {
                UIApplication.shared.openURL(url)
            }

        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) -> Void in

        }))

        self.present(alert, animated: true, completion: nil)
    }
    public func fusumaImageSelected(_ image: UIImage, source: FusumaMode) {
        switch source {
        case .camera:
            print("Image captured from Camera")
        case .library:
            print("Image selected from Camera Roll")
        default:
            print("Image selected")
        }

        editImage.image = image
    }

    func fusumaClosed() {
        print("Called when the FusumaViewController disappeared")
    }

    func fusumaWillClosed() {
        print("Called when the close button is pressed")
    }

}
