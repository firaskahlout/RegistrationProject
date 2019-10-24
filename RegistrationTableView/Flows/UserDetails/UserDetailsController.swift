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
    var userInformations: RegistrationForm?
    var presenter: UserDetailsPresenter!
    var items = [DataDisplayer]()
    
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = UserDetailsPresenter(view: self)
        configureUserInfo()
        configTableView()
        
        
    }
    
}

// MARK: - Configurations

private extension UserDetailsController {
    
    func configTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DisplayerCell.self)
    }
    
    func configureUserInfo() {
       guard let item = userInformations?.items else {return}
       for index in 0..<item.count {
           items.append(DataDisplayer(title: item[index].type.title, value: item[index].value))
       }
    }
}


extension UserDetailsController: UserDetailsPresentation {
    
    
}

extension UserDetailsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DisplayerCell = tableView.dequeue(cellClass: DisplayerCell.self, forIndexPath: indexPath)
        cell.title.text = items[indexPath.row].title
        cell.value.text = items[indexPath.row].value
        return cell
    }
    
    
    
    
    
    
    
}
