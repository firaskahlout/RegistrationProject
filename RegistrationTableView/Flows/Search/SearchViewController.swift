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
    var selectedIndex = 0
    var countries = [CountryCellForm(country: "Jordan"), CountryCellForm(country: "Emarat"),  CountryCellForm(country: "America"),  CountryCellForm(country: "Mesh 3arf sho")]
    var filteredTableData: [CountryCellForm]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
        for item in countries {
            if item.country == selectedCountry {
                item.isChecked = true
                break
            }
        }
        
        filteredTableData = countries
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: IndexPath(row: selectedIndex, section: 0))?.accessoryType = .none
        selectedIndex = indexPath.row
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        delegate?.selectedCountry(string: filteredTableData[indexPath.row].country)
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredTableData = searchText.isEmpty ? countries: countries.filter { (item: String) -> Bool in
//            // If dataItem matches the searchText, return true to include it
//            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
//        }
//        dataSource = ListDataSource(cells: filteredTableData)
//    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}
