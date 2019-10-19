//
//  UIStoryboard.swift
//  RegistrationTableView
//
//  Created by IFone on 10/19/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension UIStoryboard {
static func load<T: UIViewController>() -> T {
let sceneId = className(some: T.self)
let storyboard = UIStoryboard(name: sceneId, bundle: .main)
guard let screen = storyboard.instantiateViewController(withIdentifier: sceneId) as? T else {
fatalError("No UIViewController with ID \(sceneId) was found")
        }
return screen
    }
}
