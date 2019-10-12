//
//  TableViewExtension.swift
//  RegistrationTableView
//
//  Created by IFone on 10/12/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension RegistrationTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = formItems[indexPath.row].type
        
        let cell = registrationTable.dequeueReusableCell(withIdentifier: obj.getIdentifier, for: indexPath) as! BaseCell
        cell.display(item: formItems[indexPath.row])
        
        return cell
    }
    
}
