//
//  File.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

struct CellDescriptor {
    let cellClass: UITableViewCell.Type
    let reuseIdentifier: String
    let configure: (UITableViewCell) -> ()

    init<T: UITableViewCell>(configure: @escaping (T) -> ()) {
        self.cellClass = T.self
        self.reuseIdentifier = String(describing: T.self)
        self.configure = { cell in
            configure(cell as! T)
        }
    }
}
