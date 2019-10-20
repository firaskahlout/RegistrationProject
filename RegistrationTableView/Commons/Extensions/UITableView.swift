//
//  TableView.swift
//  RegistrationTableView
//
//  Created by IFone on 10/14/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_ cell: T.Type) {
        let nib = UINib(nibName: cell.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    

    func dequeue<T: UITableViewCell>(cellClass: T.Type, forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
                fatalError(
                    "Error: cell with id: \(cellClass.reuseIdentifier) for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }
}

extension UITableViewCell {
    
    static var reuseIdentifier: String {
        return "\(self)"
    }
    
}
