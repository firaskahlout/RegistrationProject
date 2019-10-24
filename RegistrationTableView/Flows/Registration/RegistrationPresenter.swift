//
//  RegistrationPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol RegistrationPresentation: class {
    
    func reloadTableViewData()
}

protocol RegistrationPresenterInput {
   
   
    
}

final class RegistrationPresenter {
    
    private weak var view: RegistrationPresentation?
    let form = RegistrationForm()
    
    init(view: RegistrationPresentation) {
        self.view = view
    }
   
    
}

extension RegistrationPresenter: RegistrationPresenterInput {
    
    
    
}
