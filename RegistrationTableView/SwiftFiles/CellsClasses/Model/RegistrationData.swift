//
//  RegistrationData.swift
//  RegistrationTableView
//
//  Created by IFone on 10/8/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//


final class RegistrationData {
    
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
            case FormCellType.name:
                name = items[item].value
            case FormCellType.email:
                email = items[item].value
            case FormCellType.password:
                password = items[item].value
            case FormCellType.confirmPass:
                confirmPassword = items[item].value
            case FormCellType.intrest:
                intrest = items[item].value
            case FormCellType.country:
                country = items[item].value
            case FormCellType.date:
                birthDate = items[item].value
            case FormCellType.gender:
                gender = items[item].value
            default:
                return
            }
        }
    }
    
}
