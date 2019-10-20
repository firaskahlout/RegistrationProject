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
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    private let form = RegistrationForm()

    
    var dataSource: ListDataSource? {
        didSet {
            tableView.dataSource = dataSource
            tableView.reloadData()
        }
    }
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    func configureDataSource() {
        dataSource = ListDataSource(items: form.items)
        form.country.handler = { [weak self] in self?.displaySearch() }
    }
}

// MARK: - Actions

private extension RegistrationViewController {
    
    func displaySearch() {
        let searchView = SearchViewController.instantiate(of: .commons)
        let country = form.country
        searchView.selectedCountry = country.value
        searchView.setCountries(countries: country.type.pickerData)
        searchView.delegate = self
        present(searchView, animated: true, completion: nil)
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        tableView.reloadData()
        guard form.validateItems() else { return }
        presentUserDetailsView()
    }
    
    func presentUserDetailsView() {
        let userDetails = UserDetailsController.instantiate(of: .userDetails)
        userDetails.userInformations = form
        present(userDetails, animated: true, completion: nil)
    }

}

// MARK: - SearchCountryDelegate

extension RegistrationViewController: SearchCountryDelegate {
    
    func selectedCountry(string: String) {
        form.country.value = string
        tableView.reloadData()
    }
}
