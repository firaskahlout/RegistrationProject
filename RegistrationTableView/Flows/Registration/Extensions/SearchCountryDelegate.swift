//
//  SearchCountryDelegate.swift
//  RegistrationTableView
//
//  Created by IFone on 10/16/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

extension RegistrationViewController: SearchCountryDelegate {
    
    func selectedCountry(string: String) {
        country.value = string
        tableView.reloadData()
    }
}
