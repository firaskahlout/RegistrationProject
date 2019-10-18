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
    var isSelectedCountry: SearchCountryDelegate?
    var dataSource: ListDataSource? {
      didSet {
        tableView.dataSource = dataSource
        tableView.reloadData()
      }
    }
    
    var selectedIndex = 0
    var countries = ["Jordan", "Emarat", "America", "Mesh 3arf sho"]
    var filteredTableData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        filteredTableData = countries
        dataSource = ListDataSource(cells: filteredTableData)

        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        
    }
    
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.cellForRow(at: IndexPath(row: selectedIndex, section: 0))?.accessoryType = .none
        selectedIndex = indexPath.row
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        isSelectedCountry?.selectedCountry(string: filteredTableData[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredTableData = searchText.isEmpty ? countries: countries.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}
