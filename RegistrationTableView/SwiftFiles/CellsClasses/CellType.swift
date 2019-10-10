//
//  CellsType.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation
import UIKit
enum CellType{
    
    case Name
    case Email
    case Password
    case ConfirmPassword
    case Country
    case Date
    case Intrest
    case Done
    
    func getClass() -> UITableViewCell.Type{
        switch self {
        case .Name:
            return TextFieldCell.self
        case .Email:
            return TextFieldCell.self
        case .Password:
            return TextFieldCell.self
        case .ConfirmPassword:
            return TextFieldCell.self
        case .Country:
            return CountryCell.self
        case .Date:
            return BirthCell.self
        case .Intrest:
            return IntrestCell.self
        case .Done:
            return DoneCell.self
            
        }
    }
    
    func getIdentifier() -> String{
        switch self {
        case .Name:
            return "TextFieldCell"
        case .Email:
            return "TextFieldCell"
        case .Password:
            return "TextFieldCell"
        case .ConfirmPassword:
            return "TextFieldCell"
        case .Country:
            return "CountryCell"
        case .Date:
            return "BirthCell"
        case .Intrest:
            return "IntrestCell"
        case .Done:
            return "DoneCell"
            
        }
    }
    
}

