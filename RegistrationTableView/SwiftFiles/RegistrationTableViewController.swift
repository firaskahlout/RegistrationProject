//
//  ViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UIViewController {
    
    @IBOutlet weak var registrationTable: UITableView!
    
    @IBOutlet weak var dataPickerView: UIPickerView!
    
    var formItems = [FormItem]()
    let cells: [FormCellType] = FormCellType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registrationTable.delegate = self
        registrationTable.dataSource = self
        
        registrationTable.register(UINib(nibName: "TableViewCells", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        registrationTable.register(UINib(nibName: "GenderCell", bundle: nil), forCellReuseIdentifier: "GenderCell")
        registrationTable.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
        registrationTable.register(UINib(nibName: "BirthCell", bundle: nil), forCellReuseIdentifier: "BirthCell")
        registrationTable.register(UINib(nibName: "IntrestCell", bundle: nil), forCellReuseIdentifier: "IntrestCell")
        registrationTable.register(UINib(nibName: "DoneCell", bundle: nil), forCellReuseIdentifier: "DoneCell")
        
        for item in cells {
            formItems.append(FormItem(value: "", type: item))
        }
        
    }
    
}

extension RegistrationTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let c = cells[indexPath.row]
        
        let cell = registrationTable.dequeueReusableCell(withIdentifier: c.getIdentifier, for: indexPath) as! BaseCell
        cell.type = c
        cell.item = formItems[indexPath.row]
        cell.display(title: c.getTitle)
        
        return cell
    }
   
    
}


