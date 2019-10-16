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
    
    var formItems = [Item]()
    let items: [FormCellProvider] = FormCellType.allCases
    var password = ""
    
    var dataSource: ListDataSource? {
      didSet {
        self.tableView.dataSource = dataSource
        self.tableView.reloadData()
      }
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRegistrationTableView()
        for item in items {
            formItems.append(Item(type: item))
        }
        
        dataSource = ListDataSource(products: formItems)
        dataSource?.presentSearchCountryView = { [weak self] isSelected in
            guard isSelected else { return }
            let searchView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchViewController") as? SearchViewController
            searchView?.isSelectedCountry = self
            self?.present(searchView!, animated: true, completion: nil)
        }
    }

    // MARK: - Actions
    @IBAction func doneClicked(_ sender: Any) {
        var success = true
        for index in 0..<formItems.count {
            let indexPath = IndexPath(row: index, section: 0)
            let cell = tableView.cellForRow(at: indexPath) as! BaseCell
            let item = formItems[index]
            
            switch item.type {
            case FormCellType.email:
                if item.value.isValid(.email) {
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = .lightRed
                    success = false
                }
            case FormCellType.password:
                if item.value.isValid(.password) {
                    cell.titleLabel.textColor = .green
                    password = item.value
                }else {
                    cell.titleLabel.textColor = .lightRed
                    success = false
                }
            case FormCellType.confirmPass:
                if isValidConfirmPassword(confirmPassword: item.value){
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = .lightRed
                    success = false
                }
            case FormCellType.intrest: break
            default:
                if !item.value.isEmpty {
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = .lightRed
                    success = false
                }
            }
        }
        
        if success {
            presentUserDetailsView()
        }
        
    }
}

extension RegistrationViewController: SearchCountryDelegate {
    func selectedCountry(string: String) {
        let country = formItems[6]
        country.value = string
        tableView.reloadData()
    }
}
