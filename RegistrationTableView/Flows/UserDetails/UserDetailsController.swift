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
    @IBOutlet weak private var userName: UITextField!
    @IBOutlet weak private var email: UITextField!
    @IBOutlet weak private var birthDate: UITextField!
    @IBOutlet weak private var country: UITextField!
    @IBOutlet weak private var intrest: UITextField!
    @IBOutlet weak private var gender: UITextField!
    
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
