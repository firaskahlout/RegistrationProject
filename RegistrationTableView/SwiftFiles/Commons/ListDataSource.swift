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
    
    let products: [Item]?
    var presentSearchCountryView: CountryHandler?
    
    init(products: [Item] = []) {
        self.products = products
    }
    
    func product(at indexPath: IndexPath) -> Item {
        return self.products![indexPath.row]
    }
}

extension ListDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = products![indexPath.row]
        let type = products![indexPath.row].type
        let cell = tableView.dequeueReusableCell(withIdentifier: type.identifier, for: indexPath) as! BaseCell
        cell.countryFieldSelected = { isSelected in
            self.presentSearchCountryView?(isSelected)
        }
        cell.display(item: item)
        return cell
    }
    
}
