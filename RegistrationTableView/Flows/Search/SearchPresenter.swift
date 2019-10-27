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

protocol SearchPresenterInput: class {
    init(view: SearchPresentation, countries: Item)
    func setFilteredData(entry: [ItemSelector])
    func getFilteredData(at index: Int) -> ItemSelector
    func getFilteredData() -> [ItemSelector]
    func getCountry(at index: Int) -> ItemSelector
    func getCountry() -> [ItemSelector]
}


class SearchPresenter {
    
    private var selectedCountry = ""
    private var countries = [ItemSelector]()
    private var filteredData: [ItemSelector]!
    private weak var view: SearchPresentation?
    
    
    
    required init(view: SearchPresentation, countries: Item) {
        self.view = view
        self.setCountries(countries: countries.type.pickerData)
        setupData(countries)
        
     }
    
    
    
    
}

//MARK: - Configrations
private extension SearchPresenter {
    
    func setupData(_ countries: Item) {
        selectedCountry = countries.value
        setupSelectedCountry()
        filteredData = self.countries
    }
    func setCountries(countries: [String]) {
        for item in countries {
            self.countries.append(ItemSelector(title: item))
        }
    }
}

//MARK: - SearchPresenterInput

extension SearchPresenter: SearchPresenterInput {
    func getCountry(at index: Int) -> ItemSelector {
        return countries[index]
    }
    
    func getCountry() -> [ItemSelector] {
        return countries
    }
    
    
    func setFilteredData(entry: [ItemSelector]) {
        filteredData = entry
    }
    func getFilteredData(at index: Int) -> ItemSelector {
        return filteredData[index]
    }
    func getFilteredData() -> [ItemSelector] {
        return filteredData
    }
    
    private func setupSelectedCountry() {
        for index in 0..<countries.count {
            if countries[index].title == selectedCountry {
                countries[index].isSelected = true
                let x = countries[index]
                countries[index] = countries[0]
                countries[0] = x
                break
            }
        }
    }
}
