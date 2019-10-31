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
    
    func configureDataSource() {
        dataSource = ListDataSource(items: presenter.form.items)
        presenter.DataSourceHandler()
        
    }
}

// MARK: - Actions

private extension RegistrationViewController {
    
    @IBAction func doneClicked(_ sender: Any) {
        presenter.validateData()
    }
    

}

extension RegistrationViewController: RegistrationPresentation {
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func displaySearch() {
        let searchView = Assembly.searchView(country: presenter.form.country)
        searchView.delegate = presenter
        let nav = UINavigationController()
//        nav.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        nav.navigationBar.shadowImage = UIImage()
        nav.addChild(searchView)
        present(nav, animated: true, completion: nil)
    }
    
    func presentUserDetailsView() {
        let userDetails = Assembly.detailsView(info: presenter.form)
        present(userDetails, animated: true, completion: nil)
    }
    
}
