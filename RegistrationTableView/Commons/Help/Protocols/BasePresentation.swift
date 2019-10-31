//
//  BaseProtocol.swift
//  RegistrationTableView
//
//  Created by IFone on 10/27/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

protocol BasePresentation: class {
    func presentAlert(message: String, completion : @escaping () -> Void?)
    func presentAlert(message: String)
}

extension BasePresentation where Self: UIViewController {
    func presentAlert(message: String, completion : @escaping () -> Void?) {
        let alert = UIAlertController(title: "MobileNOC", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (clicked) in
            completion()
        }))
        present(alert, animated: true)
    }
    
    func presentAlert(message: String) {
        presentAlert(message: message) {
            
        }
    }
}
