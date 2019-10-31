//
//  RadioButtonCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/20/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class RadioButtonCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var femaleRadio: UIView!
    @IBOutlet private weak var maleRadio: UIView!
    @IBOutlet private weak var maleRadioSuperView: UIView!
    @IBOutlet private weak var femaleRadioSuperView: UIView!
    
    
    //MARK: Properties
    private var item: Item!
    
    //MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configGenderRadioButtons()
    }
    
    //MARK: ACTIONS
    @IBAction private func femaleClicked(_ sender: Any) {
        selectFemale()
    }
    
    @IBAction private func maleClicked(_ sender: Any) {
        selectMale()
    }
    
    
    
}

//MARK: - CellPresentable
extension RadioButtonCell: CellPresentable {
    
    func display(item: CellModel) {
        if let item = item as? Item {
            self.item = item
            
            titleLabel.textColor = item.labelColor
            configGenderCell(item)
        }
        
    }
    
}


//MARK: - Configerations
private extension RadioButtonCell {
    
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

//MARK: - Actions
private extension RadioButtonCell {
    
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
    
}
