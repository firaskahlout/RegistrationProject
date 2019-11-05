//
//  SearchPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol SearchPresentation: class {
    func setupTableDataSource(data: [ItemSelector])
    func dismiss()
}

protocol SearchPresenterInput: class {
    var delegate: SearchCountryDelegate? { get set }
    init(view: SearchPresentation, selectedItem: ItemSelector, items: [ItemSelector])
    func viewDidLoad()
    func filterData(string: String)
    func didSelectRowAt(index: Int)
}


class SearchPresenter {
    
    //MARK: - properties
    private var selectedItem: ItemSelector
    private var items = [ItemSelector]()
    private var filteredData = [ItemSelector]()
    private weak var view: SearchPresentation?
    weak var delegate: SearchCountryDelegate?
    
    //MARK: - Initalizer
    required init(view: SearchPresentation, selectedItem: ItemSelector, items: [ItemSelector]) {
        self.view = view
        self.selectedItem = selectedItem
        self.items = items
     }
}

//MARK: - Configrations
private extension SearchPresenter {
    
    func setupData() {
        setupSelectedCountry()
        filteredData = items
    }
    
    func setupSelectedCountry() {
        guard let index = items.firstIndex(where: { $0.title == selectedItem.title }) else { return }
        items[index].isSelected = true
        items.swapAt(index, 0)
    }
}

//MARK: - SearchPresenterInput

extension SearchPresenter: SearchPresenterInput {
    func didSelectRowAt(index: Int) {
        let string = filteredData[index].title
        delegate?.setSelectedCountry(string: string)
        view?.dismiss()
    }
    
    func viewDidLoad() {
        setupData()
        view?.setupTableDataSource(data: filteredData)
    }
    
    func filterData(string: String) {
        filteredData = string.isEmpty ? items: items.filter {
            $0.title.range(of: string, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        view?.setupTableDataSource(data: filteredData)
    }
    
}
