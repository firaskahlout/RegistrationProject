//
//  SearchViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/15/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

protocol SearchCountryDelegate {
    func selectedCountry(string: String)
}

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    typealias SenectedCountry = (String) -> Void
    var delegate: SearchCountryDelegate?
    var dataSource: ListDataSource? {
      didSet {
        tableView.dataSource = dataSource
        tableView.reloadData()
      }
    }
    
    struct countryCell {
        var country: String
        var isSelected: Bool
    }
    
    
    var selectedCountry = ""
    var countries = [CountryCellForm(country: "Jordan"), CountryCellForm(country: "Emarat"),  CountryCellForm(country: "America"),  CountryCellForm(country: "Mesh 3arf sho")]
    var filteredTableData: [CountryCellForm]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        for index in 0..<countries.count {
            if countries[index].country == selectedCountry {
                countries[index].isChecked = true
                let x = countries[index]
                countries[index] = countries[0]
                countries[0] = x
                break
            }
        }
        
        filteredTableData = countries
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedCountry(string: filteredTableData[indexPath.row].country)
        dismiss(animated: true, completion: nil)
    }
}

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
