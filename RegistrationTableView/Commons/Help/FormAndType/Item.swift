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
    var labelColor: UIColor
    
    var handler: (() -> Void)?
    
    // MARK: - Initalizer
    init(type: FormCellProvider, value: String = "", validationType: RegEx = .none, labelColor: UIColor = .gray) {
        self.type = type
        self.value = value
        self.validationType = validationType
        self.labelColor = labelColor
    }
}
