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
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        item.value = textField.text!
        titleLabel.textColor = .darkGray
    }
}
