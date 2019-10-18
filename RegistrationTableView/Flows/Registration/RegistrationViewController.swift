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
    var formItems: [Item] { return [name] }
    var password = ""
    
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
        let all = RegistrationCell.allCases + RegistrationCell.allCases
        dataSource = ListDataSource(items: all.map { Item(type: $0)} )
        dataSource?.presentSearchCountryView = { [weak self] in self?.displaySearch($0) }
    }
}

// MARK: - Actions

private extension RegistrationViewController {
    func displaySearch(_ isSelected: Bool) {
        guard isSelected else { return }
        let main = UIStoryboard(name: "Main", bundle: nil)
        let searchView = main.instantiateViewController(identifier: "SearchViewController") as? SearchViewController
        searchView?.isSelectedCountry = self
        present(searchView!, animated: true, completion: nil)
    }
    
    @IBAction func doneClicked(_ sender: Any) {
        
//        for item in formItems {
//            if isValid(item.validationType) {
//                //gg
//            } else {
//                ////
//            }
//        }
        /*
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
        */
         
     }
}
