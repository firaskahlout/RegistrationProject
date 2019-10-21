//
//  CountryCellForm.swift
//  RegistrationTableView
//
//  Created by IFone on 10/19/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

class ItemSelector: NSObject {
    
    // MARK: - Properties
    var country: String
    var isChecked: Bool
    
    // MARK: - Initalizer
    init(country: String, isChecked: Bool = false) {
        self.country = country
        self.isChecked = isChecked
    }
}
