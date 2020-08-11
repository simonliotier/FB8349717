//
//  AppDelegate.swift
//  SplitTab
//
//  Created by Simon Liotier on 11/08/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let splitViewController = UISplitViewController(style: .doubleColumn)
        splitViewController.preferredDisplayMode = .oneBesideSecondary

        let primaryViewController = UIViewController()
        primaryViewController.view.backgroundColor = .yellow

        let secondaryViewController = UIViewController()
        secondaryViewController.view.backgroundColor = .red

        splitViewController.setViewController(primaryViewController, for: .primary)
        splitViewController.setViewController(secondaryViewController, for: .secondary)

        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([splitViewController], animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

        print(tabBarController.traitCollection.horizontalSizeClass.rawValue)    // `2` (`.regular`)
        print(splitViewController.traitCollection.horizontalSizeClass.rawValue) // `1` (`.compact`)

        return true
    }
}
