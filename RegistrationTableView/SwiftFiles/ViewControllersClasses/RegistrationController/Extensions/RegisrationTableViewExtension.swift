//
//  RegisrationTableViewExtension.swift
//  RegistrationTableView
//
//  Created by IFone on 10/12/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension RegistrationViewController {
    
    func configRegistrationTableView() {
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib(nibName: "GenderCell", bundle: nil), forCellReuseIdentifier: "GenderCell")
    }
    
    func isValidConfirmPassword(confirmPassword string: String) -> Bool {
        if string == password , !string.isEmpty {
            return true
        }
        return false
    }
    
    func presentUserDetailsView() {
        let userDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsController") as! UserDetailsController
        let data = RegistrationData()
        data.configData(items: formItems)
        userDetails.userInformations = data
        present(userDetails, animated: true, completion: nil)
    }
    
}

