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
    @IBOutlet private weak var tableView: UITableView! {
        didSet { tableView.tableFooterView = UIView(frame: .zero) }
    }
    
    //MARK: - properties
    
    private var dataSource: ListDataSource? {
      didSet {
        tableView.dataSource = dataSource
        tableView.reloadData()
      }
    }
    
    var presenter: SearchPresenterInput!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        setupDelegates()
        
    }
    
}

//MARK: - Configerations

private extension SearchViewController {
    
    func setupDelegates() {
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
    }
    
}

//MARK: - TableViewDelegate

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelectRowAt(index: indexPath.row)
    }
}

//MARK: - SearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.filterData(string: searchText)
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SearchViewController: SearchPresentation {
    func dismiss() {
        dismiss(animated: true)
    }
    
    func setupTableDataSource(data: [ItemSelector]) {
        dataSource = ListDataSource(cells: data)
    }
}
