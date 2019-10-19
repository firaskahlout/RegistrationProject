//
//  ListDataSource.swift
//  RegistrationTableView
//
//  Created by IFone on 10/14/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//
import UIKit

class ListDataSource: NSObject {
    
    typealias CountryHandler = (Bool) -> Void
    var presentSearchCountryView: CountryHandler?
    
    let items: [Item]?
    let cells: [CountryCellForm]?
    
    init(items: [Item]) {
        self.items = items
        self.cells = nil
    }
    
    init(cells: [CountryCellForm]) {
        self.cells = cells
        self.items = nil
    }
    
    func product(at indexPath: IndexPath) -> Item {
        return self.items![indexPath.row]
    }
}

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
            cell.textLabel?.text = cells[indexPath.row].country
            if cells[indexPath.row].isChecked {
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
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! BaseCell
            cell.countryFieldSelected = { isSelected in
                self.presentSearchCountryView?(isSelected)
            }
            cell.display(item: item)
            return cell
        }
        
        return UITableViewCell()
    }
    
}
