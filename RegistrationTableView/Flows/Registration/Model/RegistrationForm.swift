//
//  RegistrationData.swift
//  RegistrationTableView
//
//  Created by IFone on 10/8/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//


final class RegistrationForm {
    
    // MARK: - Properties
    
    let name = Item(type: RegistrationCell.name)
    let email = Item(type: RegistrationCell.email, validationType: .email)
    let password = Item(type: RegistrationCell.password, validationType: .password)
    let confirmPassword = Item(type: RegistrationCell.confirmPass, validationType: .confirmPassword)
    let gender = Item(type: RegistrationCell.gender)
    let date = Item(type: RegistrationCell.date)
    let country = Item(type: RegistrationCell.country)
    let intrest = Item(type: RegistrationCell.intrest)
    
    var items: [Item] {
        return [name, email, password, confirmPassword, gender, date, country, intrest]
    }
    
    func validateItems() -> Bool {
        return true
    }
}
