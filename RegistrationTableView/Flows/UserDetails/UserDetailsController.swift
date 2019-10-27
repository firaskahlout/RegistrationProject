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
    @IBOutlet private weak var tableView: UITableView!
   
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
        let view = UINib(nibName: "HeaderUserDetailsTable", bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
        tableView.tableHeaderView = view
    }
    
}

//MARK: - UserDetailsPresentation

extension UserDetailsController: UserDetailsPresentation {
    func showAlertMessage(string: String) {
        let alert = UIAlertController(title: "Alert", message: string, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Click", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
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
