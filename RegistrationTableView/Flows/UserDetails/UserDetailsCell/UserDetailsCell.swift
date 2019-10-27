//
//  DisplayerCell.swift
//  RegistrationTableView
//
//  Created by IFone on 10/24/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class UserDetailsCell: UITableViewCell {

    //MARK: Propareties
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var value: UILabel!
    
    //MARK: Propareties
    var handler: (() -> Void)?
    private var index = -1
    
    
    override func awakeFromNib() {
//        presenter = UserDetailsPresenter(cell: self)
    }
    
    
    //MARK: Actions
    
    @IBAction private func SideButton(_ sender: Any) {
        print(index)
//        presenter.showAlertMessage(string: "the cell index is: \(index)")
        handler?()
    }
    
}

// MARK: - DisplayerPresentation

extension UserDetailsCell: UserDetailsCellPresentation {
    func configWithItem(item: DataDisplayer, index: Int) {
        title.text = item.title
        value.text = item.value
        self.index = index
    }
    
    
}
