//
//  SearchViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/15/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var tableView: UITableView!
    
    //MARK: - properties
    typealias SenectedCountry = (String) -> Void
    var delegate: SearchCountryDelegate?
    private var dataSource: ListDataSource? {
      didSet {
        tableView.dataSource = dataSource
        tableView.reloadData()
      }
    }
    var selectedCountry = ""
    private var countries = [CountryCellForm]()
    private var filteredTableData: [CountryCellForm]!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        setupSelectedCountry()
        
        filteredTableData = countries
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
}

//MARK: - Configerations

extension SearchViewController {
    
    fileprivate func setupSelectedCountry() {
        for index in 0..<countries.count {
            if countries[index].country == selectedCountry {
                countries[index].isChecked = true
                let x = countries[index]
                countries[index] = countries[0]
                countries[0] = x
                break
            }
        }
    }
    
}

extension SearchViewController {
  
    func setCountries(countries: [String]) {
        for item in countries {
            self.countries.append(CountryCellForm(country: item))
        }
    }
  
}

//MARK: - TableViewDelegate

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedCountry(string: filteredTableData[indexPath.row].country)
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredTableData = searchText.isEmpty ? countries: countries.filter { (item: CountryCellForm) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.country.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}
