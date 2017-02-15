//
//  AppDelegate.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/4/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let rootVC = GitHubRepositoryTableViewControllerBuilder.build()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.navigationBar.backgroundColor = UIColor(hex: 0xF6F6F6)
        navigationVC.navigationBar.isTranslucent = false

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationVC
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }
}
