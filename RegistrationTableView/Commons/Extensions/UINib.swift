//
//  UINib.swift
//  RegistrationTableView
//
//  Created by IFone on 10/28/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension UINib {
    
    static func load(nibName: Nib) -> UIView{
        return UINib(nibName: Nib.headerUserDetailsTable.rawValue, bundle: nil).instantiate(withOwner: nil, options: nil).first as! UIView
    }
    
}
