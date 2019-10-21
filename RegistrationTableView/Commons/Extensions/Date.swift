//
//  Date.swift
//  RegistrationTableView
//
//  Created by IFone on 10/21/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

extension Date {
    func string(_ format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
