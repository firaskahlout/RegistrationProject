//
//  Assembly.swift
//  RegistrationTableView
//
//  Created by IFone on 10/31/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

struct Assembly {
    static func searchView(country: Item) -> SearchViewController {
        let searchView = SearchViewController.instantiate(of: .commons)
        let selectedItem = ItemSelector(title: country.value, isSelected: true)
        let items = country.type.pickerData.map { ItemSelector(title: $0) }
        searchView.presenter = SearchPresenter(view: searchView, selectedItem: selectedItem, items: items)
        return searchView
    }
    
    static func detailsView(info form: RegistrationForm) -> UserDetailsController {
        let userDetails = UserDetailsController.instantiate(of: .userDetails)
        userDetails.presenter = UserDetailsPresenter(view: userDetails, userInformations: form)
        return userDetails
    }
    
}
