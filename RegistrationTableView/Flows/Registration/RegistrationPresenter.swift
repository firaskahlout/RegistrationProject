//
//  RegistrationPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol RegistrationPresentation: class {
    func displaySearch()
    func presentUserDetailsView()
    func reloadData()
}

protocol RegistrationPresenterInput {
   
    func DataSourceHandler()
   
    
}

final class RegistrationPresenter {
    
    private weak var view: RegistrationPresentation?
    let form = RegistrationForm()
    
    init(view: RegistrationPresentation) {
        self.view = view
    }
   
    
}

extension RegistrationPresenter: RegistrationPresenterInput {
    func DataSourceHandler() {
        form.country.handler = { [weak self] in self!.view?.displaySearch() }
        
    }
    func validateData() {
        view?.reloadData()
        guard form.validateItems() else { return }
        view?.presentUserDetailsView()
    }
    
}


// MARK: - SearchCountryDelegate

extension RegistrationPresenter: SearchCountryDelegate {
    
    func setSelectedCountry(string: String) {
        form.country.value = string
        view?.reloadData()
    }
    
}
