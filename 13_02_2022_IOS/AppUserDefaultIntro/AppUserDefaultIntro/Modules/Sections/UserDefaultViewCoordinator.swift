//
//  UserDefaultViewCoordinator.swift
//  AppUserDefaultIntro
//
//  Created by Juan Manuel Pereira Sanchez on 25/2/22.
//

import Foundation
import UIKit

final class UserDefaultViewCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> UserDefaultViewController {
        UserDefaultViewController()
    }
}
