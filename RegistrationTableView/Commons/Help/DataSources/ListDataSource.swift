//
//  ListDataSource.swift
//  RegistrationTableView
//
//  Created by IFone on 10/14/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//
import UIKit

final class ListDataSource: NSObject {
    
    // MARK: - Properties
    private let items: [Item]?
    private let cells: [ItemSelector]?
    
    // MARK: - Initalizers
    init(items: [Item]) {
        self.items = items
        self.cells = nil
    }
    
    init(cells: [ItemSelector]) {
        self.cells = cells
        self.items = nil
    }
    
}

// MARK: - TableViewDataSource
extension ListDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cells = cells {
            return cells.count
        }
        if let items = items {
            return items.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cells = cells {
            let cell = UITableViewCell()
            cell.textLabel?.text = cells[indexPath.row].title
            if cells[indexPath.row].isSelected {
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
            return cell
        }
        if let items = items {
            let item = items[indexPath.row]
            let type = item.type
            let identifier = type.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CellPresentable
            cell.display(item: item)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
