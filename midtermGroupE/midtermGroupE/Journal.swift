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

    let order: Int

    let picture: NSData

    init(title: String, content: String, order: Int, picture: NSData) {

        self.title = title
        self.content = content
        self.order = order
        self.picture = picture
    }

}
