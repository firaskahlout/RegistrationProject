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
    var title: String
    var isSelected: Bool
    
    // MARK: - Initalizer
    init(title: String, isSelected: Bool = false) {
        self.title = title
        self.isSelected = isSelected
    }
}
