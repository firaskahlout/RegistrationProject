//
//  PickerCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class IntrestCell: BaseCell {

//   @IBOutlet weak var intrestTextField: UITextField!
    let intrests = ["swiming", "programming","sleeping"]
//    let picker = UIPickerView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        picker.delegate = self
//        picker.dataSource = self
//        intrestTextField.inputView = picker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    
}

//
//extension IntrestCell: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return intrests.count
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return intrests[row]
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
////        intrestTextField.text = intrests[row]
//        RegistrationData().intrest = intrests[row]
//        self.endEditing(true)
//    }
//    
//}
