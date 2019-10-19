//
//  FormItem.swift
//  RegistrationTableView
//
//  Created by IFone on 10/10/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    // MARK: - Properties
    var value: String
    let type: FormCellProvider
    let validationType: RegEx
    
    // MARK: - Initalizer
    init(type: FormCellProvider, value: String = "", validationType: RegEx = .none) {
        self.type = type
        self.value = value
        self.validationType = validationType
    }
}
