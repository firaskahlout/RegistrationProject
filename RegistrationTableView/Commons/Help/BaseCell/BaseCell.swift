//
//  BaseCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class BaseCell: UITableViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak private var textField: UITextField!
    @IBOutlet weak private var femaleRadio: UIView!
    @IBOutlet weak private var maleRadio: UIView!
    @IBOutlet weak private var maleRadioSuperView: UIView!
    @IBOutlet weak private var femaleRadioSuperView: UIView!
    
    //MARK: - Properties
    private var item: Item!
    private var type: RegistrationCell!
    private var picker = UIPickerView()
    private var datePicker = UIDatePicker()
    var countryFieldSelected: ((Bool) -> Void)?
    private var dataSource: PickerDataSource? {
        didSet {
            picker.dataSource = dataSource
            picker.delegate = dataSource
            picker.reloadAllComponents()
        }
    }
    
    //MARK: - ACTIONS
    @IBAction private func femaleClicked(_ sender: Any) {
        selectFemale()
    }
    
    @IBAction private func maleClicked(_ sender: Any) {
        selectMale()
    }
    
    //MARK: - Main Method
    func display(item: Item) {
        self.item = item
        type = item.type as? RegistrationCell
        
        if type == .gender {
            configGenderRadioButtons()
            configGenderCell(item)
        }else {
            setUpTextFieldCell(item)
        }

        if type == .country {
            textField.text =  item.value
        }else if type == .intrest {
            dataSource = PickerDataSource(items: type.pickerData)
            textField.inputView = picker
            toolBarDoneButton(for: textField)
        }else if type == .date {
            configDateField()
        }
    }
    
}

//MARK: - Configrations
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
    }
    
    fileprivate func configGenderCell(_ item: Item) {
        if item.value == "Male" {
            selectMale()
        }else{
            selectFemale()
        }
    }
    
    fileprivate func configDateField() {
           let minDate = Date(timeIntervalSince1970: 1)
           let maxDate = Date(timeIntervalSinceNow: 1)
           textField.inputView = datePicker
           datePicker.datePickerMode = .date
           datePicker.minimumDate = minDate
           datePicker.maximumDate = maxDate
           toolBarDoneButton(for: textField)
       }
    
    fileprivate func setUpTextFieldCell(_ item: Item) {
        titleLabel.text = type.title
        textField.placeholder = type.placeholder
        textField.keyboardType = type.keyboardType
        textField.isSecureTextEntry = type.secureEntry
        textField.inputView = nil
        textField.text = item.value
        textField.delegate = self
    }
    
}

//MARK: - Helpful Functions
extension BaseCell {
    
    fileprivate func selectFemale() {
        maleRadio.backgroundColor = nil
        femaleRadio.backgroundColor = .black
        item.value = "Female"
    }
    
    fileprivate func selectMale() {
        femaleRadio.backgroundColor = nil
        maleRadio.backgroundColor = .black
        item.value = "Male"
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
            dateFormatter.dateFormat = DateFormat.MMMddYYYY.rawValue
            let date = dateFormatter.string(from: datePicker.date)
            textField.text = date
        }else {
            textField.text = type.pickerData[picker.selectedRow(inComponent: 0)]
        }
        endEditing(true)
    }
}



//MARK: - UITextFieldDelegate
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
