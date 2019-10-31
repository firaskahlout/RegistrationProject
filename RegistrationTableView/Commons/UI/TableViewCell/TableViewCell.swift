//
//  TableViewCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/31/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {


}
extension TableViewCell: CellPresentable {
    
    func display(item: CellModel) {
        if let item = item as? ItemSelector {
            
            self.textLabel?.text = item.title
            if item.isSelected {
                self.accessoryType = .checkmark
            }else {
                self.accessoryType = .none
            }
            
            
        }
    }
    
}
