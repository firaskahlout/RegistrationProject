//
//  String.swift
//  RegistrationTableView
//
//  Created by IFone on 10/16/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

extension String {
    
    func isValid(_ pattern: RegEx) -> Bool {
        if pattern == .none {
            return !self.isEmpty
        }
        return NSPredicate(format:"SELF MATCHES %@", pattern.rawValue).evaluate(with: self)
    }
    
    func isLike(string: String) -> Bool {
        return self == string
    }
}

