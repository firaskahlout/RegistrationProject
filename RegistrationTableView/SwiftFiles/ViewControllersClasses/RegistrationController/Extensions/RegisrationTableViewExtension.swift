//
//  RegisrationTableViewExtension.swift
//  RegistrationTableView
//
//  Created by IFone on 10/12/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension RegistrationTableViewController {
    
    func configRegistrationTableView() {
        registrationTable.delegate = self
        registrationTable.dataSource = self
        registrationTable.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        registrationTable.register(UINib(nibName: "GenderCell", bundle: nil), forCellReuseIdentifier: "GenderCell")
    }

    func isValidConfirmPassword(confirmPassword string: String) -> Bool {
        if string == password , Validator().isValid(string: string) {
            return true
        }
        return false
    }

}

