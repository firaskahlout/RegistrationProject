//
//  CountryCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class CountryCell: BaseCell {

   let countries = ["Jordan","Amarica","Mozambeq","Russia","Mesh 3arf sho"]
    
//    let picker = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        picker.delegate = self
//        picker.dataSource = self
//        countryTextField.inputView = picker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

//
//extension CountryCell: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return countries.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return countries[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
////        countryTextField.text = countries[row]
//        RegistrationData().country = countries[row]
//        self.endEditing(true)
//    }
//
//}
