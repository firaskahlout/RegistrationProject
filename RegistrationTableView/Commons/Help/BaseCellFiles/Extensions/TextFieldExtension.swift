//
//  TextFieldExtension.swift
//  RegistrationTableView
//
//  Created by IFone on 10/12/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit
// MARK: - TextField Extension
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
