//
//  AppDelegate.swift
//  MVP
//
//  Created by Nikita Alpatiev on 1/23/23.
//

import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Constants.Colors.primary]
        UINavigationBar.appearance().tintColor = Constants.Colors.primary
        return true
    }
}

