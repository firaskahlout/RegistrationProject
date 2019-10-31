//
//  UserDetailsPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol UserDetailsPresentation: BasePresentation {
    func reloadData()
}
protocol UserDetailsCellPresentation: class {
    var handler: (() -> Void)? { get set }
    func configure(with item: UserDetailsCellData, index: Int)

}
protocol UserDetailsPresenterInput: class {
    init(view: UserDetailsPresentation, userInformations: RegistrationForm)
    func viewDidLoad()
    func fillCell(cell: UserDetailsCellPresentation, itemIndex: Int)
    func showAlertMessage(string: String)
    var numberOfRowsInSection: Int { get }
}

final class UserDetailsPresenter {
    
    private weak var view: UserDetailsPresentation?
    private weak var cell: UserDetailsCellPresentation?
    private var items = [UserDetailsCellData]()
    private var userInformations: RegistrationForm!
    
    init(view: UserDetailsPresentation, userInformations: RegistrationForm) {
        self.view = view
        self.userInformations = userInformations
    }
    
}

// MARK: - UserDetailPresenterInput

extension UserDetailsPresenter: UserDetailsPresenterInput {
    
    func showAlertMessage(string: String) {
        view?.presentAlert(message: string)
    }
    
    func viewDidLoad() {
        setupData(userInformations: userInformations)
        
    }
    var numberOfRowsInSection: Int{
        return items.count
    }
    
    func fillCell(cell: UserDetailsCellPresentation, itemIndex: Int) {
        self.cell = cell
        cell.configure(with: items[itemIndex], index: itemIndex)
        cell.handler = { [weak self] in self?.showAlertMessage(string: "\(itemIndex)") }

    }
}

//MARK: - Actions

extension UserDetailsPresenter {
    
    private func setupData(userInformations: RegistrationForm) {
        
        items = userInformations.items.map { UserDetailsCellData(title: $0.type.title, value: $0.value)}
        view?.reloadData()
    }
     
}
