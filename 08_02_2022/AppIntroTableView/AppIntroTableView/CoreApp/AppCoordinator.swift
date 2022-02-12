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
        initialViewController = TableMonthCoordinator.navigation()
//        initialViewController = TableMonthViewController()

        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
    }
}
