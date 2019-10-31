//
//  UserDetailsController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/13/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class UserDetailsController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!{
        didSet{ tableView.tableFooterView = UIView(frame: .zero) }
    }
    
    //MARK: Properties
    var presenter: UserDetailsPresenterInput!
    
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        presenter.viewDidLoad()
    }
    
}

// MARK: - Configurations

private extension UserDetailsController {
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserDetailsCell.self)
        let view = UINib().getNib(nibName: .headerUserDetailsTable)
        tableView.tableHeaderView = view
    }
    
}

//MARK: - UserDetailsPresentation

extension UserDetailsController: UserDetailsPresentation {
    
    func reloadData() {
        tableView.reloadData()
    }
}

//MARK: - UITableView

extension UserDetailsController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserDetailsCell = tableView.dequeue(cellClass: UserDetailsCell.self, forIndexPath: indexPath)
        presenter.fillCell(cell: cell, itemIndex: indexPath.row)
        return cell
    }
    
    
}
