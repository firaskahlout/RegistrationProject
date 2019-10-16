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
    
    var selectedIndex = 0
    var items = CountryCell.name.pickerData
    var filteredTableData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        filteredTableData = items
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredTableData.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = filteredTableData[indexPath.row]
        
        return cell
    }
    
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
        filteredTableData = searchText.isEmpty ? items : items.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}
