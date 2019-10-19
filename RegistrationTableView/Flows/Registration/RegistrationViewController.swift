//
//  ViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let regForm = RegistrationForm()
    var formItems = [Item]()
    
    var dataSource: ListDataSource? {
        didSet {
            tableView.dataSource = dataSource
            tableView.reloadData()
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formItems = regForm.formItems
        configureTableView()
        configureDataSource()
    }
    
}

// MARK: - Configurations

private extension RegistrationViewController {
    
    func configureTableView() {
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib(nibName: "RadioButtonCell", bundle: nil), forCellReuseIdentifier: "RadioButtonCell")
    }
    
    func configureDataSource() {
        dataSource = ListDataSource(items: formItems )
        dataSource?.presentSearchCountryView = { [weak self] in self?.displaySearch($0) }
    }
}

// MARK: - Actions

private extension RegistrationViewController {
    
    func displaySearch(_ isSelected: Bool) {
        guard isSelected else { return }
        let main = UIStoryboard(name: "SearchViewController", bundle: nil)
        let searchView = main.instantiateViewController(identifier: "SearchViewController") as? SearchViewController
        let country = regForm.country
        searchView?.selectedCountry = country.value
        searchView?.setCountries(countries: country.type.pickerData)
        searchView?.delegate = self
        present(searchView!, animated: true, completion: nil)
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        var success = true
        
        for index in 0..<formItems.count-1 {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as! BaseCell
            let item = formItems[index]
            let value = item.value
    
            if value.isValid(item.validationType) {
                if item == regForm.confirmPassword {
                    if value.isLike(string: regForm.password.value) , value.isValid(.password) {
                        cell.titleLabel.textColor = .green
                    }else{
                        cell.titleLabel.textColor = .lightRed
                        success = false
                    }
                    continue
                }
                cell.titleLabel.textColor = .green
            } else {
                cell.titleLabel.textColor = .lightRed
                success = false
            }
        }
        
        if success {
            presentUserDetailsView()
        }
        
    }
    
    func presentUserDetailsView() {
        let userDetails = UIStoryboard(name: "UserDetailsController", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsController") as! UserDetailsController
        userDetails.userInformations = regForm
        present(userDetails, animated: true, completion: nil)
    }
    
}

// MARK: - SearchCountryDelegate

extension RegistrationViewController: SearchCountryDelegate {
    
    func selectedCountry(string: String) {
        regForm.country.value = string
        tableView.reloadData()
    }
}
