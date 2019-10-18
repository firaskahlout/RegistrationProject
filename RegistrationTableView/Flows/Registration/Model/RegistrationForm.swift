//
//  RegistrationData.swift
//  RegistrationTableView
//
//  Created by IFone on 10/8/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//


final class RegistrationForm {
    
    let nameItem1 = Item(type: RegistrationCell.name)
    let nameItem2 = Item(type: RegistrationCell.name)
    let nameItem3 = Item(type: RegistrationCell.name)
    let nameItem4 = Item(type: RegistrationCell.name)
    
    var formItems: [Item] {
        [nameItem1, nameItem2, nameItem3, nameItem4]
    }
    
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
