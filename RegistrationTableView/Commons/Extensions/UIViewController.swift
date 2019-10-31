//
//  ViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/18/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension UIViewController: StoryboardIdentifiable { }

extension StoryboardIdentifiable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    static func instantiate(of storyboard: Storyboard) ->  Self {
        return UIStoryboard(storyboard: storyboard).instantiateViewController()
    }
}

fileprivate extension UIStoryboard {
    convenience init(storyboard: Storyboard) {
        self.init(name: storyboard.rawValue, bundle: nil)
    }
    
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        return viewController
    }
}
