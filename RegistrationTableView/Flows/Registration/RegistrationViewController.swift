//
//  ViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

final class RegistrationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Properties
    var presenter: RegistrationPresenter!

    private var dataSource: ListDataSource? {
        didSet {
            tableView.dataSource = dataSource
            tableView.reloadData()
        }
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = RegistrationPresenter(view: self)
        configureTableView()
        configureDataSource()
        IQKeyboardManager.shared.enable = true 
    }
}

// MARK: - Configurations

private extension RegistrationViewController {
    
    func configureTableView() {
        tableView.register(TextFieldCell.self)
        tableView.register(RadioButtonCell.self)
    }
    
    func configureDataSource() {////////////////
        dataSource = ListDataSource(items: presenter.form.items)
        presenter.form.country.handler = { [weak self] in self?.displaySearch() }
    }
    
}

// MARK: - Actions

private extension RegistrationViewController {
    
    func displaySearch() {/////////////
        let searchView = SearchViewController.instantiate(of: .commons)
        let country = presenter.form.country
        searchView.selectedCountry = country.value
        searchView.setCountries(countries: country.type.pickerData)
        searchView.delegate = self
        present(searchView, animated: true, completion: nil)
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        tableView.reloadData()
        guard presenter.form.validateItems() else { return }
        presentUserDetailsView()
    }
    
    func presentUserDetailsView() {
        let userDetails = UserDetailsController.instantiate(of: .userDetails)
        userDetails.userInformations = presenter.form
        present(userDetails, animated: true, completion: nil)
    }

}

// MARK: - SearchCountryDelegate

extension RegistrationViewController: SearchCountryDelegate {
    
    func setSelectedCountry(string: String) {
        presenter.form.country.value = string
        tableView.reloadData()
    }
    
}


extension RegistrationViewController: RegistrationPresentation {
    
    func reloadTableViewData() {
        tableView.reloadData()
    }
    
    
    
    
}
