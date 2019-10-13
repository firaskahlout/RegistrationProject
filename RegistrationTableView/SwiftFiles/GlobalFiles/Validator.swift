//
//  Validator.swift
//  RegistrationTableView
//
//  Created by IFone on 10/13/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

struct Validator {
    
    func isValidEmail(email string:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: string)
    }
    
    func isValidPassword(password string: String) -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
        let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: string)
    }

    func isValid(string: String) -> Bool {
        if string != "" {
            return true
        }
        return false
    }
}
