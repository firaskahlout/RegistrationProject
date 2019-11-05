//
//  DisplayerCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/24/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class UserDetailsCell: UITableViewCell {

    //MARK: Outlets
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var value: UILabel!
    
    //MARK: Propareties
    var handler: (() -> Void)?
    private var index = -1
    
    //MARK: Actions
    
    @IBAction private func SideButton(_ sender: Any) {
        print(index)
        handler?()
    }
    
}

// MARK: - DisplayerPresentation

extension UserDetailsCell: UserDetailsCellPresentation {
    func configure(with item: UserDetailsCellData, index: Int) {
        title.text = item.title
        value.text = item.value
        self.index = index
    }
    
    
}
