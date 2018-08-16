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
    let itemArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    @discardableResult func createItem() -> Item {
        let newItem = Item(name: "Something", serialNumber: "SomeNUmber", valueInDollars: 10000)
        allItems.append(newItem)
        return newItem
    }
        
    init() {
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems
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
    
    func saveChanges() -> Bool {
        print("Saving items tp: \(itemArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allItems, toFile: itemArchiveURL.path)
    }
    

    
}



