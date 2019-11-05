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
        presenter.viewDidLoad()
        IQKeyboardManager.shared.enable = true 
    }
}

// MARK: - Configurations

private extension RegistrationViewController {
    
    func configureTableView() {
        tableView.register(TextFieldCell.self)
        tableView.register(RadioButtonCell.self)
    }
    
}

// MARK: - Actions

private extension RegistrationViewController {
    
    @IBAction func doneClicked(_ sender: Any) {
        presenter.validateData()
    }

}

//MARK: - RegistrationPresentation

extension RegistrationViewController: RegistrationPresentation {
    
    func configureDataSource(items: [Item]) {
        dataSource = ListDataSource(items: items)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func displaySearch(country: Item) {
        let searchView = Assembly.searchView(country: country)
        searchView.presenter.delegate = presenter
        let nav = UINavigationController(rootViewController: searchView)
        present(nav, animated: true, completion: nil)
    }
    
    func presentUserDetailsView(form: RegistrationForm) {
        let userDetails = Assembly.detailsView(info: form)
        present(userDetails, animated: true, completion: nil)
    }
    
}
