//
//  BaseCellExtension.swift
//  RegistrationTableView
//
//  Created by IFone on 10/12/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit
// MARK: - BaseCell Extension
extension BaseCell {
    
    private func configGenderRadioButtons() {
        femaleRadioSuperView.layer.borderColor = UIColor.black.cgColor
        femaleRadioSuperView.layer.borderWidth = 1.3
        femaleRadioSuperView.layer.cornerRadius = femaleRadioSuperView.frame.width / 2
        maleRadioSuperView.layer.borderColor = UIColor.black.cgColor
        maleRadioSuperView.layer.borderWidth = 1.3
        maleRadioSuperView.layer.cornerRadius = maleRadioSuperView.frame.width / 2
        femaleRadio.layer.borderColor = UIColor.black.cgColor
        maleRadio.layer.cornerRadius = femaleRadio.frame.width / 2
        femaleRadio.layer.cornerRadius = femaleRadio.frame.width / 2
        femaleRadio.backgroundColor = .black
    }
    
    func display(item: Item) {
        self.item = item
        if let t = item.type as? FormCellType {
            
            type = t
            
            if type == .gender {
                configGenderRadioButtons()
                item.value = "Female"
            }else if type.cellType != .select {
                titleLabel.text = type.title
                textField.placeholder = type.placeholder
                textField.keyboardType = type.keyboardType
                textField.isSecureTextEntry = type.secureEntry
                textField.delegate = self
            }
            
            if type == .intrest {
                picker.delegate = self
                picker.dataSource = self
                textField.inputView = picker
                toolBarDoneButton(for: textField)
            }else if type == .date {
                let minDate = Date(timeIntervalSince1970: 1)
                let maxDate = Date(timeIntervalSinceNow: 1)
                textField.inputView = datePicker
                datePicker.datePickerMode = .date
                datePicker.minimumDate = minDate
                datePicker.maximumDate = maxDate
                toolBarDoneButton(for: textField)
            }
        }
        
    }
    
    private func toolBarDoneButton(for textField: UITextField) {
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneDatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolbar.setItems([doneButton,spaceButton], animated: false)
        textField.inputAccessoryView = toolbar
    }
    
    @objc private func doneDatePicker() {
        if type == FormCellType.date {
            let dateFormatter = DateFormatter()
            // Now we specify the display format, e.g. "27-08-2015
            dateFormatter.dateFormat = "MMM dd , YYYY"
            // Now we get the date from the UIDatePicker and convert it to a string
            let date = dateFormatter.string(from: datePicker.date)
            textField.text = date
        }else {
            textField.text = type.pickerData[picker.selectedRow(inComponent: 0)]
        }
        endEditing(true)
    }
    
}
