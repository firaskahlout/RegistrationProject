//
//  Validator.swift
//  RegistrationTableView
//
//  Created by IFone on 10/13/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
}
