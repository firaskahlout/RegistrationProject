//
//  AppDelegate.swift
//  RegistrationTableView
//
//  Created by IFone on 10/7/19.
//  Copyright © 2019 Firas Alkahlout. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        IQKeyboardManager.shared.enable = true
//        IQKeyboardManager.shared.enableDebugging = true
//        IQKeyboardManager.shared.enableAutoToolbar = true
//        IQKeyboardManager.s

      return true
    }
    
}
