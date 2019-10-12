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

    func isValidEmail(emailStr:String) -> Bool {
         let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
         let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
         return emailPred.evaluate(with: emailStr)
     }
     
     func isValidPassword(password string: String) -> Bool {
         let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
         let passwordPred = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
         return passwordPred.evaluate(with: string)
     }
     
     func isValidConfirmPassword(confirmPassword string: String) -> Bool {
         if string == password , isValid(string: string) {
             return true
         }
         return false
     }

     func isValid(string: String) -> Bool {
         if string != "" {
             return true
         }
         return false
     }

}

