//
//  ReusableView.swift
//  RegistrationTableView
//
//  Created by IFone on 10/19/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

public protocol ReusableView: class {
    /// Get identifier from class
    static var defaultReuseIdentifier: String { get }
}
