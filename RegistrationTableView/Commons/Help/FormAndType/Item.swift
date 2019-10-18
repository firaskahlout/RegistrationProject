//
//  FormItem.swift
//  RegistrationTableView
//
//  Created by IFone on 10/10/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

protocol FormCellProvider {
    
    var title: String { get }
    
    var identifier: String { get }
    
    var secureEntry: Bool { get }
    
    var placeholder: String { get }
    
    var pickerData: [String] { get }
    
    var keyboardType: UIKeyboardType { get }
    
    var cellType: FormCellType { get }

}

class Item {
    
    var value: String
    let type: FormCellProvider
    
    init(type: FormCellProvider, value: String = "") {
        self.type = type
        self.value = value
    }
}
