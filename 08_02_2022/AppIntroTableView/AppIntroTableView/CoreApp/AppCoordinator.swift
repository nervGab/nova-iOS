//
//  AppCoordinator.swift
//  AppIntroTableView
//
//  Created by Juan Manuel Pereira Sanchez on 11/2/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
   func showInitialVC(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    private var initialViewController = UIViewController()
    
    internal func showInitialVC(window: UIWindow) {
        self.customUI()
        initialViewController = HomeCoordinator.view()

//        initialViewController = CarsListCoordinator.navigation()
//        initialViewController = TableMonthViewController()

        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
    }
    
    private func customUI() {
        let navBar = UINavigationBar.appearance()
        let tabBar = UITabBar.appearance()
        
        navBar.barTintColor = .systemIndigo
        tabBar.barTintColor = .systemIndigo
        tabBar.tintColor = .white
        navBar.barStyle = .default
        
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
}
