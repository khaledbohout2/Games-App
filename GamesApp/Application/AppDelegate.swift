//
//  AppDelegate.swift
//  GamesApp
//
//  Created by Khaled Bohout on 27/02/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setAppearance()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = BaseRouter.startHome()
        window?.makeKeyAndVisible()

        return true
    }
}

