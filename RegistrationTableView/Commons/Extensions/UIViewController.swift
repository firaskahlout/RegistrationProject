//
//  ViewController.swift
//  RegistrationTableView
//
//  Created by IFone on 10/18/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit

extension UIViewController {
/**
     Loads the initial UIViewController in the storyboard. This class function works if the
     UIViewController class name, and the Storyboard file name are the same
     */
static func loadFirstViewController(from bundle: Bundle = .main) -> UIViewController {
let identifier = className(some: self)
let storyboard = UIStoryboard(name: identifier, bundle: bundle)
guard let screen = storyboard.instantiateInitialViewController() else {
fatalError("Initial UIViewController with identifier '\(identifier)' was not found")
        }
return screen
    }
/**
     Loads the initial UIViewController in the storyboard. This method works if the
     UIViewController class name, and the Storyboard file name are the same
     */
func loadFirstViewController(from bundle: Bundle = .main) -> UIViewController {
let identifier = className(some: self)
let storyboard = UIStoryboard(name: identifier, bundle: bundle)
guard let screen = storyboard.instantiateInitialViewController() else {
fatalError("Initial UIViewController with identifier '\(identifier)' was not found")
        }
return screen
    }
}

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
private func className(some: Any) -> String {
return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
}
