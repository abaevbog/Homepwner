//
//  Item.swift
//  Homepwner
//
//  Created by Bogdan Abaev on 8/7/18.
//  Copyright © 2018 Bogdan_Abaev.inc. All rights reserved.
//

import UIKit

class Item: NSObject {
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    
    init(name:String, serialNumber:String?,valueInDollars: Int) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        
        super.init()
        
    }
}

