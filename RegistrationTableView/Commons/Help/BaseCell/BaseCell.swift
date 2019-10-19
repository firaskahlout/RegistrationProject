//
//  BaseCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var femaleRadio: UIView!
    @IBOutlet weak var maleRadio: UIView!
    @IBOutlet weak var maleRadioSuperView: UIView!
    @IBOutlet weak var femaleRadioSuperView: UIView!
    
    //MARK: - Properties
    var item: Item!
    var type: RegistrationCell!
    var picker = UIPickerView()
    var datePicker = UIDatePicker()
    var countryFieldSelected: ((Bool) -> Void)?
    var dataSource: PickerDataSource? {
      didSet {
        picker.dataSource = dataSource
        picker.reloadAllComponents()
      }
    }
    
    //MARK: - ACTIONS
    @IBAction private func femaleClicked(_ sender: Any) {
        maleRadio.backgroundColor = nil
        femaleRadio.backgroundColor = .black
        item.value = "Female"
    }
    
    @IBAction private func maleClicked(_ sender: Any) {
        femaleRadio.backgroundColor = nil
        maleRadio.backgroundColor = .black
        item.value = "Male"
    }
    
    
}

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
//        femaleRadio.backgroundColor = .black
    }
    
    func display(item: Item) {
        self.item = item
        if let t = item.type as? RegistrationCell {
            
            type = t
            
            if type == .gender {
                configGenderRadioButtons()
                if item.value == "Male" {
                    maleRadio.backgroundColor = .black
                    femaleRadio.backgroundColor = nil
                }else{
                    maleRadio.backgroundColor = nil
                    femaleRadio.backgroundColor = .black
                    item.value = "Female"
                }
                
            }else {
                titleLabel.text = type.title
                textField.placeholder = type.placeholder
                textField.keyboardType = type.keyboardType
                textField.isSecureTextEntry = type.secureEntry
                textField.inputView = nil
                textField.text = item.value
                textField.delegate = self
            }
            
            if type == .country {
                textField.text =  item.value
            }
            
            if type == .intrest {
               
                dataSource = PickerDataSource(items: type.pickerData)
                textField.inputView = picker
//                toolBarDoneButton(for: textField)
            }else if type == .date {
                let minDate = Date(timeIntervalSince1970: 1)
                let maxDate = Date(timeIntervalSinceNow: 1)
                textField.inputView = datePicker
                datePicker.datePickerMode = .date
                datePicker.minimumDate = minDate
                datePicker.maximumDate = maxDate
//                toolBarDoneButton(for: textField)
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
        if type == RegistrationCell.date {
            let dateFormatter = DateFormatter()
            // Now we specify the display format, e.g. "27-08-2015
            dateFormatter.dateFormat = DateFormat.MMMddYYYY.rawValue
            // Now we get the date from the UIDatePicker and convert it to a string
            let date = dateFormatter.string(from: datePicker.date)
            textField.text = date
        }else {
            textField.text = type.pickerData[picker.selectedRow(inComponent: 0)]
        }
        endEditing(true)
    }
    
}


extension BaseCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if type == .country {
            countryFieldSelected!(true)
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        item.value = text
        titleLabel.textColor = .darkGray
    }
    
}
