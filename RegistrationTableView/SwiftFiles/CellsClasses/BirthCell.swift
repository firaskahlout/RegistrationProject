//
//  BirthCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class BirthCell: BaseCell {

//    @IBOutlet weak var birthTextField: UITextField!
    let intrests = ["swiming", "programming","sleeping"]
//    let picker = UIDatePicker()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        birthTextField.inputView = picker
//        picker.datePickerMode = .date
//        picker.minimumDate = minDate
//        picker.maximumDate = maxDate
        
//        //ToolBar
//           let toolbar = UIToolbar()
//           toolbar.sizeToFit()
//
//           //done button & cancel button
//        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePicker))
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//           toolbar.setItems([doneButton,spaceButton], animated: false)

//        birthTextField.inputAccessoryView = toolbar


           
    }
//    @objc
//    func doneDatePicker() {
//        let dateFormatter = DateFormatter()
//        // Now we specify the display format, e.g. "27-08-2015
//        dateFormatter.dateFormat = "MM,dd,YYYY"
//        // Now we get the date from the UIDatePicker and convert it to a string
//        let strDate = dateFormatter.string(from: picker.date)
//        // add toolbar to textField
//
//        print(strDate)
////        birthTextField.text = strDate
//        RegistrationData().birthDate = strDate
//        endEditing(true)
//    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    let registration: RegistrationTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegistrationTableViewController")
//
}

