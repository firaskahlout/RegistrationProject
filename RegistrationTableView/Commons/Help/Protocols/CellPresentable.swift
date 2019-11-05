//
//  CellProvider.swift
//  RegistrationTableView
//
//  Created by IFone on 10/20/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

protocol CellPresentable: UITableViewCell {
    func display(item: CellModel)
}
