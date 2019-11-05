//
//  RegistrationPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol RegistrationPresentation: class {
    func displaySearch(country: Item)
    func presentUserDetailsView(form: RegistrationForm)
    func configureDataSource(items: [Item])
    func reloadData()
}

protocol RegistrationPresenterInput {
    func viewDidLoad()
}

final class RegistrationPresenter {
    
    //MARK: - properties
    private weak var view: RegistrationPresentation?
    private let form = RegistrationForm()
    
    //MARK: - Initalizer
    init(view: RegistrationPresentation) {
        self.view = view
    }
   
}

// MARK: - RegistrationPresenterInput

extension RegistrationPresenter: RegistrationPresenterInput {
    
    func viewDidLoad() {
        setupDataSourceHandler()
        view?.configureDataSource(items: form.items)
    }
    
    func validateData() {
        view?.reloadData()
        guard form.validateItems() else { return }
        view?.presentUserDetailsView(form: form)
    }
}

// MARK: - Configurations

private extension RegistrationPresenter {
    func setupDataSourceHandler() {
        form.country.handler = { [weak self] in
            guard let self = self else { return }
            self.view?.displaySearch(country: self.form.country)
        }
        
    }
}

// MARK: - SearchCountryDelegate

extension RegistrationPresenter: SearchCountryDelegate {
    
    func setSelectedCountry(string: String) {
        form.country.value = string
        view?.reloadData()
    }
    
}
