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
    
    let name = Item(type: RegistrationCell.name)
    let email = Item(type: RegistrationCell.email, validationType: .email)
    let password = Item(type: RegistrationCell.password, validationType: .password)
    let confirmPassword = Item(type: RegistrationCell.confirmPass)
    let gender = Item(type: RegistrationCell.gender)
    let date = Item(type: RegistrationCell.date)
    let country = Item(type: RegistrationCell.country)
    let intrest = Item(type: RegistrationCell.intrest)
    var formItems: [Item] { return [name, email, password, confirmPassword, gender, date, country, intrest] }
    
    var dataSource: ListDataSource? {
      didSet {
        tableView.dataSource = dataSource
        tableView.reloadData()
      }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
//        let all = RegistrationCell.allCases + RegistrationCell.allCases
//        dataSource = ListDataSource(items: all.map { Item(type: $0)} )
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
        searchView?.selectedCountry = country.value
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
                    if item == confirmPassword {
                        if value.isLike(string: password.value) , value.isValid(.password) {
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
}

extension RegistrationViewController {
    
    func presentUserDetailsView() {
        let userDetails = UIStoryboard(name: "UserDetailsController", bundle: nil).instantiateViewController(withIdentifier: "UserDetailsController") as! UserDetailsController
        let data = RegistrationForm()
        data.configData(items: formItems)
        userDetails.userInformations = data
        present(userDetails, animated: true, completion: nil)
    }
    
}


extension RegistrationViewController: SearchCountryDelegate {
    
    func selectedCountry(string: String) {
        country.value = string
        tableView.reloadData()
    }
}
