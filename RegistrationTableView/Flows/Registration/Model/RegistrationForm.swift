//
//  RegistrationData.swift
//  RegistrationTableView
//
//  Created by IFone on 10/8/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//


final class RegistrationForm {
    
//    let name = Item(type: RegistrationCell.name)
//    let email = Item(type: RegistrationCell.email, validationType: .email)
//    let password = Item(type: RegistrationCell.password, validationType: .password)
//    let confirmPassword = Item(type: RegistrationCell.confirmPass)
//    let gender = Item(type: RegistrationCell.gender)
//    let date = Item(type: RegistrationCell.date)
//    let country = Item(type: RegistrationCell.country)
//    let intrest = Item(type: RegistrationCell.intrest)
//    var formItems: [Item] { return [name, email, password, confirmPassword, gender, date, country, intrest] }
    
    // MARK: - Properties
    var name = ""
    var email = ""
    var password = ""
    var confirmPassword = ""
    var gender = ""
    var birthDate = ""
    var country = ""
    var intrest = ""

    func configData(items: [Item]) {
        for item in 0..<items.count {
            switch items[item].type {
            case RegistrationCell.name:
                name = items[item].value
            case RegistrationCell.email:
                email = items[item].value
            case RegistrationCell.password:
                password = items[item].value
            case RegistrationCell.confirmPass:
                confirmPassword = items[item].value
            case RegistrationCell.intrest:
                intrest = items[item].value
            case RegistrationCell.country:
                country = items[item].value
            case RegistrationCell.date:
                birthDate = items[item].value
            case RegistrationCell.gender:
                gender = items[item].value
            default:
                return
            }
        }
    }
    
}
