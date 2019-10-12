//
//  FormItem.swift
//  RegistrationTableView
//
//  Created by IFone on 10/10/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

class FormItem {
    
    var value = ""
    let type: FormCellType
    
    init(value: String, type: FormCellType) {
        self.type = type
        self.value = value
    }
}
