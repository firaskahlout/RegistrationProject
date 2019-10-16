//
//  UserDetailsController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/13/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

final class UserDetailsController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var userName: UITextField!
    @IBOutlet weak private var email: UITextField!
    @IBOutlet weak private var birthDate: UITextField!
    @IBOutlet weak private var country: UITextField!
    @IBOutlet weak private var intrest: UITextField!
    @IBOutlet weak private var gender: UITextField!
    
    //MARK: - Properties
    var userInformations: RegistrationData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        userName.text = userInformations.name
        email.text = userInformations.email
        birthDate.text = userInformations.birthDate
        country.text = userInformations.country
        intrest.text = userInformations.intrest
        gender.text = userInformations.gender
        
    }

    
}
