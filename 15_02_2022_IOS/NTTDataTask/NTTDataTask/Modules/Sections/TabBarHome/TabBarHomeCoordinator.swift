//
//  TabBarHomeCoordinator.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import Foundation
import UIKit


final class TabBarHomeCoordinator {
    static func view() -> TabBarHomeViewController {
        let tbVC = TabBarHomeViewController()
        let listVC = ContactsListCoordinator.navigation()
        let CustomButton = UITabBarItem(title: "Mis Contactos", image: UIImage(named: "TRIFECA_0M"), selectedImage: UIImage(named: "TRIFECA_0M"))
        listVC.tabBarItem = CustomButton 
        tbVC.viewControllers = [listVC]
        
        return tbVC
    }
}
