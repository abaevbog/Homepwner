//
//  ItemsStore.swift
//  Homepwner
//
//  Created by Bogdan Abaev on 8/7/18.
//  Copyright © 2018 Bogdan_Abaev.inc. All rights reserved.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(name: "Something", serialNumber: "SomeNUmber", valueInDollars: 10000)
        allItems.append(newItem)
        return newItem
    }
    
    @discardableResult func createItemMine(myName: String, mySerialNumber: String, myValueInDollars: Int) -> Item {
        let newItem = Item(name: myName, serialNumber: mySerialNumber, valueInDollars: myValueInDollars)
        allItems.append(newItem)
        return newItem
    }
        
    init() {
        for _ in 0..<5 {
            createItem()
            }
        }
    func removeItem(_ item: Item) {
        if let index = allItems.index(of:item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex:Int, to toIndex:Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    
}
