//
//  SearchPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation


protocol SearchPresentation: class {
   
}

protocol SearchPresenterInput {
   
   
    
}


class SearchPresenter {
    
    private weak var view: SearchPresentation?
    
     init(view: SearchPresentation) {
         self.view = view
     }
    
    
}
