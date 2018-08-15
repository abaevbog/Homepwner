//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Bogdan Abaev on 8/10/18.
//  Copyright © 2018 Bogdan_Abaev.inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBOutlet var nameField: UITextField?
    @IBOutlet var serialField: UITextField?
    @IBOutlet var valueField: UITextField?
    @IBOutlet var dateField: UILabel!
    
    var itemStore: ItemStore!
    var item: Item! {
        didSet {
            navigationItem.title = item.name
        }
    }

    
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    } ()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        nameField?.text = item.name
        print("breaks?")
        serialField?.text = item.serialNumber
        if let bucks = item.valueInDollars{
        valueField?.text = numberFormatter.string(from: NSNumber(value: bucks))
        } else {
          valueField?.text = nil
        }
        dateField.text = dateFormatter.string(from: item.dateCreated)
        
        if item.name == nil {
//            let a:Int? = Int((valueField?.text)!)
            let saveButton = UIBarButtonItem(
                title: "Save",
                style: .plain,
                target: self,
                action: #selector(buttonTapped(sender:))
                )
            navigationItem.rightBarButtonItem = saveButton
        }
    }
    
    @objc func buttonTapped (sender:UIBarButtonItem) {
        print("Tapped!")
        let name = (nameField?.text)!
        let number = (serialField?.text)!
        let price = (valueField?.text)!
        let price_int: Int? = Int(price)
//        let item = itemStore.createItem()
        let b = itemStore.createItemMine(myName: name, mySerialNumber: number, myValueInDollars: price_int!)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ItemsViewController") as! ItemsViewController
        newViewController.itemStore = itemStore
            self.present(newViewController, animated: true, completion: nil)
    }
        override func viewWillDisappear(_ animated:Bool) {
            super.viewWillDisappear(animated)
            
            view.endEditing(true)
            item.name = nameField?.text ?? ""
            item.serialNumber = serialField?.text
            
            if let valueText = valueField?.text,
                let value = numberFormatter.number(from: valueText) {
                item.valueInDollars = value.intValue
            } else {
                item.valueInDollars = 0
                
            }
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        print(item)
        if item.name == nil {
            print("Name's a nil!")
        }
            let saveButton = UIBarButtonItem()
            saveButton.title = "Save"
            navigationItem.rightBarButtonItem = saveButton
    
        

    
    }*/
}




