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
    
    weak var delegate: SearchCountryDelegate?
    private var dataSource: ListDataSource? {
      didSet {
        tableView.dataSource = dataSource
        tableView.reloadData()
      }
    }
    
    var presenter: SearchPresenter!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegates()
        
        setupTableDataSource()
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
        dataSource = ListDataSource(cells: presenter.getFilteredData())
    }
    
    
}

//MARK: - TableViewDelegate

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let string = presenter.getFilteredData(at: indexPath.row).title
        delegate?.setSelectedCountry(string: string)
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.setFilteredData(entry: searchText.isEmpty ? presenter.getCountry(): presenter.getCountry().filter {
            $0.title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        dataSource = ListDataSource(cells: presenter.getFilteredData())
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SearchViewController: SearchPresentation {}
