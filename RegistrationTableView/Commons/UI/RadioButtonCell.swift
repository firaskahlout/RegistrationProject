//
//  RadioButtonCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/20/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class RadioButtonCell: UITableViewCell, CellPresentable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak private var femaleRadio: UIView!
    @IBOutlet weak private var maleRadio: UIView!
    @IBOutlet weak private var maleRadioSuperView: UIView!
    @IBOutlet weak private var femaleRadioSuperView: UIView!
    
    
    //MARK: - Properties
    private var item: Item!
    private var type: RegistrationCell!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configGenderRadioButtons()
    }
    

    
    //MARK: - Main Method
    func display(item: Item) {
        self.item = item
        type = item.type as? RegistrationCell
        titleLabel.textColor = item.labelColor
        
        configGenderCell(item)
    }
    
    //MARK: - ACTIONS
    @IBAction private func femaleClicked(_ sender: Any) {
        selectFemale()
    }
    
    @IBAction private func maleClicked(_ sender: Any) {
        selectMale()
    }
    
    
    func selectFemale() {
        maleRadio.backgroundColor = nil
        femaleRadio.backgroundColor = .black
        item.value = "Female"
    }
    
    func selectMale() {
        femaleRadio.backgroundColor = nil
        maleRadio.backgroundColor = .black
        item.value = "Male"
    }
    
    func configGenderCell(_ item: Item) {
        if item.value == "Male" {
            selectMale()
        }else{
            selectFemale()
        }
    }
    
    func configGenderRadioButtons() {
        femaleRadioSuperView.layer.borderColor = UIColor.black.cgColor
        femaleRadioSuperView.layer.borderWidth = 1.3
        femaleRadioSuperView.layer.cornerRadius = femaleRadioSuperView.frame.width / 2
        maleRadioSuperView.layer.borderColor = UIColor.black.cgColor
        maleRadioSuperView.layer.borderWidth = 1.3
        maleRadioSuperView.layer.cornerRadius = maleRadioSuperView.frame.width / 2
        femaleRadio.layer.borderColor = UIColor.black.cgColor
        maleRadio.layer.cornerRadius = femaleRadio.frame.width / 2
        femaleRadio.layer.cornerRadius = femaleRadio.frame.width / 2
    }
}
