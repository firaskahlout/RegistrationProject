//
//  UserDetailsPresenter.swift
//  RegistrationTableView
//
//  Created by IFone on 10/22/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import Foundation

protocol UserDetailsPresentation: class {
    func reloadData()
    func showAlertMessage(string: String)
}
protocol UserDetailsCellPresentation: class {
    func configWithItem(item: DataDisplayer, index: Int)
    var handler: (() -> Void)? { get set }
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
    private var items = [DataDisplayer]()
    private var userInformations: RegistrationForm!
    
    init(view: UserDetailsPresentation, userInformations: RegistrationForm) {
        self.view = view
        self.userInformations = userInformations
    }
    
}

// MARK: - UserDetailPresenterInput

extension UserDetailsPresenter: UserDetailsPresenterInput {
    
    func showAlertMessage(string: String) {
        view?.showAlertMessage(string: string)
    }
    
    func viewDidLoad() {
        setupData(userInformations: userInformations)
        
    }
    var numberOfRowsInSection: Int{
        return items.count
    }
    
    func fillCell(cell: UserDetailsCellPresentation, itemIndex: Int) {
        self.cell = cell
        cell.configWithItem(item: items[itemIndex], index: itemIndex)
        cell.handler = { [weak self] in self?.showAlertMessage(string: "\(itemIndex)") }

    }
}

//MARK: - Actions

extension UserDetailsPresenter {
    
    private func setupData(userInformations: RegistrationForm) {
        
        items = userInformations.items.map { DataDisplayer(title: $0.type.title, value: $0.value)}
        view?.reloadData()
    }
     
}
