//
//  TextFieldCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/20/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {
    
    
    //MARK: - OUTLETS
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    
    
    //MARK: - Properties
    private var item: Item!
    private var type: RegistrationCell!
    private var picker = UIPickerView()
    private var datePicker = UIDatePicker()

    private var dataSource: PickerDataSource? {
        didSet {
            picker.dataSource = dataSource
            picker.delegate = dataSource
            picker.reloadAllComponents()
        }
    }
    
    //MARK: - Main Method
    
    func configDateField() {
        let minDate = Date(timeIntervalSince1970: 1)
        let maxDate = Date(timeIntervalSinceNow: 1)
        textField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate
    }
    
    func setUpTextFieldCell(_ item: Item) {
        titleLabel.text = type.title
        textField.placeholder = type.placeholder
        textField.keyboardType = type.keyboardType
        textField.isSecureTextEntry = type.secureEntry
        textField.inputView = nil
        textField.text = item.value
        textField.delegate = self
    }
}


extension TextFieldCell: CellPresentable {
    func display(item: Item) {
        self.item = item
        type = item.type as? RegistrationCell
        titleLabel.textColor = item.labelColor
        
        setUpTextFieldCell(item)
        
        if type == .country {
            textField.text = item.value
        }else if type == .intrest {
            dataSource = PickerDataSource(items: type.pickerData)
            textField.inputView = picker
        }else if type == .date {
            configDateField()
        }
    }
}

//MARK: - UITextFieldDelegate
extension TextFieldCell: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if type == .country {
            item.handler?()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        item.value = text
        titleLabel.textColor = .darkGray
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if type == RegistrationCell.date {
            textField.text = datePicker.date.string(.MMMddYYYY)
        } else if type == RegistrationCell.intrest {
            textField.text = type.pickerData[picker.selectedRow(inComponent: 0)]
        }
    }
    
}


extension Date {
    func string(_ format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
