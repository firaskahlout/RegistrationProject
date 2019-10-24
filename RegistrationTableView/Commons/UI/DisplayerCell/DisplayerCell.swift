//
//  DisplayerCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/24/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

class DisplayerCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var value: UILabel!
    
    @IBAction func SideButton(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
