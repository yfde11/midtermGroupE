//
//  JournalTableViewCell.swift
//  midtermGroupE
//
//  Created by 孟軒蕭 on 07/04/2017.
//  Copyright © 2017 MichaelXiao. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var journalImage: UIImageView!
    @IBOutlet weak var journalTitle: UILabel!

    static let identifier = "JournalTableViewCell"
    static let height: CGFloat = 212.0
}
