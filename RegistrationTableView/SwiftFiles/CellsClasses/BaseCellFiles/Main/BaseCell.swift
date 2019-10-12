//
//  BaseCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/9/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class BaseCell: UITableViewCell {
    
    //MARK: - OUTLETS
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var femaleRadio: UIView!
    @IBOutlet weak var maleRadio: UIView!
    @IBOutlet weak var maleRadioSuperView: UIView!
    @IBOutlet weak var femaleRadioSuperView: UIView!
    
    //MARK: - VARIABLES
    var item: FormItem!
    var type: FormCellType!
    var picker = UIPickerView()
    var datePicker = UIDatePicker()
    
    //MARK: - ACTIONS
    @IBAction private func femaleClicked(_ sender: Any) {
        maleRadio.backgroundColor = nil
        femaleRadio.backgroundColor = .black
        item.value = "Female"
    }
    
    @IBAction private func maleClicked(_ sender: Any) {
        femaleRadio.backgroundColor = nil
        maleRadio.backgroundColor = .black
        item.value = "Male"
    }
    
    
    
    
    
    
    
}

