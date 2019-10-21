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
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
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
    private var countries = [ItemSelector]()
    private var filteredTableData: [ItemSelector]!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        setupSelectedCountry()
        setupTableDataSource()
    }
    
}

//MARK: - ACTIONS
extension SearchViewController {
  
    func setCountries(countries: [String]) {
        for item in countries {
            self.countries.append(ItemSelector(title: item))
        }
    }
  
}

//MARK: - Configerations

private extension SearchViewController {
    
    func setupDelegates() {
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
    }
    
    func setupTableDataSource() {
        filteredTableData = countries
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
    func setupSelectedCountry() {
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

//MARK: - TableViewDelegate

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let string = filteredTableData[indexPath.row].title
        delegate?.selectedCountry(string: string)
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredTableData = searchText.isEmpty ? countries: countries.filter {
            $0.title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        dataSource = ListDataSource(cells: filteredTableData)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}
