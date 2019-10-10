//
//  GenderCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class GenderCell: BaseCell {

    
    @IBOutlet weak var femaleRadio: UIView!
    
    @IBOutlet weak var maleRadio: UIView!
    
    @IBOutlet weak var femaleRadioSuperView: UIView!
    
    @IBOutlet weak var maleRadioSuperView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        femaleRadioSuperView.layer.borderColor = UIColor.black.cgColor
        femaleRadioSuperView.layer.borderWidth = 1
        femaleRadioSuperView.layer.cornerRadius = femaleRadioSuperView.frame.width / 2
        maleRadioSuperView.layer.borderColor = UIColor.black.cgColor
        maleRadioSuperView.layer.borderWidth = 1
        maleRadioSuperView.layer.cornerRadius = femaleRadioSuperView.frame.width / 2
        
        //femaleRadio.layer.borderColor = UIColor.black.cgColor
        maleRadio.layer.cornerRadius = femaleRadio.frame.width / 2
        //femaleRadio.layer.borderColor = UIColor.black.cgColor
        femaleRadio.layer.cornerRadius = femaleRadio.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func femaleClicked(_ sender: Any) {
        maleRadio.backgroundColor = nil
        femaleRadio.backgroundColor = UIColor.black
        
    }
    
    @IBAction func maleClicked(_ sender: Any) {
        femaleRadio.backgroundColor = nil
        maleRadio.backgroundColor = UIColor.black
    }
    

}
