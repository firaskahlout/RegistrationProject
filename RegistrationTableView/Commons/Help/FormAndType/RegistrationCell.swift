//
//  FormCellType.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

enum RegistrationCell: String, CaseIterable, FormCellProvider {
    
    case name
    case email
    case password
    case confirmPass = "Confirm Password"
    case gender
    case date
    case country
    case intrest = "*Intrest"
    
    var title: String{
        return rawValue.capitalized
    }
    
    var cellForm: AnyClass{
        switch self {
        case .gender: return RadioButtonCell.self
        default: return TextFieldCell.self
        }
    }
    
    var identifier: String{
        switch self {
        case .gender: return "RadioButtonCell"
        default: return "TextFieldCell"
        }
    }
    
    var secureEntry: Bool{
        switch self {
        case .password, .confirmPass: return true
        default: return false
        }
    }
    
    var placeholder: String{
        switch self {
        case .name: return "Enter your name"
        case .email: return "Enter your email address"
        case .date, .country: return "Select"
        case .intrest: return "Select (optional)"
        case .password: return "Enter Password"
        case .confirmPass: return "Confirm Password "
        default: return ""
        }
    }
    
    var pickerData: [String]{
        switch self {
        case .country: return ["Jordan","Amarica","Mozambeq","Russia","Mesh 3arf sho"]
        case .intrest: return ["swiming", "programming","sleeping"]
        default: return []
        }
    }
    
    var keyboardType: UIKeyboardType{
        switch self {
        case .email: return .emailAddress
        default: return .default
        }
    }
    
    var cellType: FormCellType{
        switch self {
        case .country, .date, .intrest: return .dropdown
        case .gender: return .select
        default: return .input
        }
    } 
}
