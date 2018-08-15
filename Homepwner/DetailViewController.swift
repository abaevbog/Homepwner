//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Bogdan Abaev on 8/10/18.
//  Copyright © 2018 Bogdan_Abaev.inc. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
    }
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateField: UILabel!
    
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
        

        nameField.text = item.name
        serialField.text = item.serialNumber
        valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
        dateField.text = dateFormatter.string(from: item.dateCreated)
    }
        
        
        override func viewWillDisappear(_ animated:Bool) {
            super.viewWillDisappear(animated)
            
            view.endEditing(true)
            item.name = nameField.text ?? ""
            item.serialNumber = serialField.text
            
            if let valueText = valueField.text,
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
    
    
}
