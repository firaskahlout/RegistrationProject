//
//  FunctionsExtension.swift
//  RegistrationTableView
//
//  Created by IFone on 10/16/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension RegistrationViewController {
    
    func presentUserDetailsView() {
        let userDetails = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsController") as! UserDetailsController
        let data = RegistrationForm()
        data.configData(items: formItems)
        userDetails.userInformations = data
        present(userDetails, animated: true, completion: nil)
    }
    
}
