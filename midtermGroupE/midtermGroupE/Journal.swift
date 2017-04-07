//
//  Journal.swift
//  midtermGroupE
//
//  Created by 湯芯瑜 on 2017/4/7.
//  Copyright © 2017年 MichaelXiao. All rights reserved.
//

import Foundation

class Journal {
    
    let title: String
    
    let content: String
    
    let time: Date
    
    let picture: NSData
    
    init(title: String, content: String, time: Date, picture: NSData) {
        
        self.title = title
        self.content = content
        self.time = time
        self.picture = picture
    }
    
}
