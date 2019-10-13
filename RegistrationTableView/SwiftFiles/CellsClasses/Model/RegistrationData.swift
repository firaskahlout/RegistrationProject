//
//  RegistrationData.swift
//  RegistrationTableView
//
//  Created by IFone on 10/8/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//


final class RegistrationData {
    
    // MARK: - VARIABLES
    var name = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    var gender = ""
    var birthDate = ""
    var country = ""
    var intrest = ""
    
    func configData(items: [FormItem]) {
        for item in 0..<items.count {
            switch items[item].type {
            case .name:
                name = items[item].value
            case .email:
                email = items[item].value
            case .password:
                password = items[item].value
            case .confirmPass:
                confirmPassword = items[item].value
            case .intrest:
                intrest = items[item].value
            case .country:
                country = items[item].value
            case .date:
                birthDate = items[item].value
            case .gender:
                gender = items[item].value
            }
        }
    }
    
}
