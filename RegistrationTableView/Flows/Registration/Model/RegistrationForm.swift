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
    let intrest = Item(type: RegistrationCell.intrest, isRequired: false)
    
    var items: [Item] {
        return [name, email, password, confirmPassword, gender, date, country, intrest]
    }
    
    //MARK: Actions
    
    func validateItems() -> Bool {
        var isSuccess = true
        
        for item in items {
            if !item.isRequired { continue }
            let isValid = item.value.isValid(item.validationType)
            if isValid {
                item.labelColor = .green
            }else{
                item.labelColor = .lightRed
                isSuccess = isValid
            }
        }
        if confirmPassword.value != password.value {
            confirmPassword.labelColor = .lightRed
            isSuccess = false
        }
        return isSuccess
    }
}
