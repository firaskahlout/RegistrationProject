//
//  UserDetailsPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol UserDetailsPresentation: class {
   
}

protocol UserDetailsPresenterInput {
   
   
    
}

final class UserDetailsPresenter {
    
    private weak var view: UserDetailsPresentation?
   
    init(view: UserDetailsPresentation) {
        self.view = view
    }
   
    
}

extension UserDetailsPresenter: UserDetailsPresenterInput {
    
    
    
}
