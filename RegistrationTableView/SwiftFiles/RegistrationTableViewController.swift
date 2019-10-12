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
    private var password = ""
    @IBAction func doneClicked(_ sender: Any) {
        for item in 0..<formItems.count {
            //print(item.value)
            let cell = registrationTable.cellForRow(at: IndexPath(row: item, section: 0)) as! BaseCell
            
            switch formItems[item].type {
            case .email:
                if isValidEmail(emailStr: formItems[item].value){
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
                print("1")
            case .password:
                if isValidPassword(password: formItems[item].value){
                    cell.titleLabel.textColor = .green
                    password = formItems[item].value
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
                print("2")
            case .confirmPass:
                if isValidConfirmPassword(confirmPassword: formItems[item].value){
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
                print("3")
            case .intrest: return
                print("4")
            default:
                if isValid(string: formItems[item].value) {
                    cell.titleLabel.textColor = .green
                }else {
                    cell.titleLabel.textColor = UIColor(red: 230/255, green: 125/255, blue: 115/255, alpha: 1)
                }
                print("5")
            }
            
            print(formItems[item].value)
        }
        
    }
    func isValidEmail(emailStr:String) -> Bool {

        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    func isValidPassword(password string: String) -> Bool {

        let emailRegEx = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: string)
    }
    func isValidConfirmPassword(confirmPassword string: String) -> Bool {
        if string == password , isValid(string: string) {
            return true
        }
        return false
    }
    func isValid(string: String) -> Bool {
        if string != "" {
            return true
        }
        return false
    }
    var formItems = [FormItem]()
    let cells: [FormCellType] = FormCellType.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registrationTable.delegate = self
        registrationTable.dataSource = self
        
        registrationTable.register(UINib(nibName: "TableViewCells", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        registrationTable.register(UINib(nibName: "GenderCell", bundle: nil), forCellReuseIdentifier: "GenderCell")
        
        for item in cells {
            formItems.append(FormItem(type: item))
        }
        
    }
    
}

extension RegistrationTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let obj = formItems[indexPath.row].type
        
        let cell = registrationTable.dequeueReusableCell(withIdentifier: obj.getIdentifier, for: indexPath) as! BaseCell
        cell.display(item: formItems[indexPath.row])
        
        return cell
    }
   
    
}


