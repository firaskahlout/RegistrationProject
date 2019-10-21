//
//  UserDetailsController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/13/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class UserDetailsController: UIViewController {

    // MARK: Outlets
    @IBOutlet private weak var userName: UITextField!
    @IBOutlet private weak var email: UITextField!
    @IBOutlet private weak var birthDate: UITextField!
    @IBOutlet private weak var country: UITextField!
    @IBOutlet private weak var intrest: UITextField!
    @IBOutlet private weak var gender: UITextField!
    
    //MARK: Properties
    var userInformations: RegistrationForm?
    
    //MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUserInfo()
    }
}

// MARK: - Configurations

private extension UserDetailsController {
    
    func configureUserInfo() {
        userName.text = userInformations?.name.value
        email.text = userInformations?.email.value
        birthDate.text = userInformations?.date.value
        country.text = userInformations?.country.value
        intrest.text = userInformations?.intrest.value
        gender.text = userInformations?.gender.value
    }
}
