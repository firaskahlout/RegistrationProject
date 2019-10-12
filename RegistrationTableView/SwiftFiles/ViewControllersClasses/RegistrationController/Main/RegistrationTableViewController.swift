//
//  ViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class RegistrationTableViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var registrationTable: UITableView!
    
    // MARK: - Variables
    var formItems = [FormItem]()
    let items: [FormCellType] = FormCellType.allCases
    var password = ""
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configRegistrationTableView()
        for item in items {
            formItems.append(FormItem(type: item))
        }
    }
    
    // MARK: - Actions
    @IBAction func doneClicked(_ sender: Any) {
        for item in 0..<formItems.count {
            let cell = registrationTable.cellForRow(at: IndexPath(row: item, section: 0)) as! BaseCell
            
            switch formItems[item].type {
            case .email:
                if isValidEmail(emailStr: formItems[item].value){
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
            case .password:
                if isValidPassword(password: formItems[item].value){
                    cell.titleLabel.textColor = .green
                    password = formItems[item].value
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
            case .confirmPass:
                if isValidConfirmPassword(confirmPassword: formItems[item].value){
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
            case .intrest: return
            default:
                if isValid(string: formItems[item].value) {
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
            }
            print(formItems[item].value)
        }
        
    }
    
}
