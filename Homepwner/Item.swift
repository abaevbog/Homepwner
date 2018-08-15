//
//  Item.swift
//  Homepwner
//
//  Created by Bogdan Abaev on 8/7/18.
//  Copyright © 2018 Bogdan_Abaev.inc. All rights reserved.
//

import UIKit

    public class Item: NSObject {
        var name: String?
        var valueInDollars: Int?
        var serialNumber: String?
        let dateCreated: Date
        
        init(name:String?, serialNumber:String?,valueInDollars: Int?) {
            if let nameReal = name,
                let numberReal = serialNumber,
                let valueReal = valueInDollars {
            self.name = nameReal
            self.valueInDollars = valueReal
            self.serialNumber = numberReal
            } else {
               self.name = nil
                self.valueInDollars = nil
                self.serialNumber = nil
                
            }
            self.dateCreated = Date()
            
            super.init()
            
        }
    }

