//
//  BaseCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    var item: FormItem!
    var type: FormCellType!
    var picker = UIPickerView()
    var datePicker = UIDatePicker()
    
    
    func display(title: String) {
        
        if type.cellType != CellType.select {
            titleLabel.text = type.getTitle
            textField.placeholder = type.placeholder
            textField.keyboardType = type.keyboardType
            textField.delegate = self
        }
        
        if type == FormCellType.country || type == FormCellType.intrest {
            picker.delegate = self
            picker.dataSource = self
            textField.inputView = picker
        }
        if type == FormCellType.date {
            let minDate = Date(timeIntervalSince1970: 12)
            let maxDate = Date(timeIntervalSinceNow: 12)
            
            textField.inputView = datePicker
            datePicker.datePickerMode = .date
            datePicker.minimumDate = minDate
            datePicker.maximumDate = maxDate
            
            //ToolBar
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            //done button & cancel button
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePicker))
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            toolbar.setItems([doneButton,spaceButton], animated: false)
            
            textField.inputAccessoryView = toolbar
            
        }
        
    }
    
    @objc func doneDatePicker() {
        let dateFormatter = DateFormatter()
        // Now we specify the display format, e.g. "27-08-2015
        dateFormatter.dateFormat = "MM,dd,YYYY"
        // Now we get the date from the UIDatePicker and convert it to a string
        let strDate = dateFormatter.string(from: datePicker.date)
        // add toolbar to textField
        
        print(strDate)
        textField.text = strDate
//        RegistrationData().birthDate = strDate
        endEditing(true)
    }
    
}

extension BaseCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        item.value = textField.text
        print(textField.text)
    }

}

extension BaseCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return type.pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return type.pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = type.pickerData[row]
        endEditing(true)
    }
    
}
