//
//  AppDelegate.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 14/2/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let appCoordinator: AppCoordinatorProtocol = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window {
            appCoordinator.showInitialVC(window: windowDes)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle


}

