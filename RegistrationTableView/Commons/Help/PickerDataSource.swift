//
//  PickerDataSource.swift
//  RegistrationTableView
//
//  Created by IFone on 10/17/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class PickerDataSource: NSObject {
    
    // MARK: - Properties
    let items: [String]
    
    // MARK: - Initalizer
    init(items: [String]) {
        self.items = items
    }
    
}

//MARK: - PickerViewDataSource
extension PickerDataSource: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }
    
}

//MARK: - PickerViewDelegate
extension PickerDataSource:  UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }
    
}
