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
        let CustomButton = UITabBarItem(title: "Mis Contactos",
                                        image: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "TRIFECA_0M")?.withRenderingMode(.alwaysOriginal))
        listVC.tabBarItem = CustomButton
        //NewTaskCoordinator
        let newTaskVC = NewTaskCoordinator.navigation()
        let CustomButton2 = UITabBarItem(title: "Task List",
                                         image:  UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal),
                                         selectedImage:  UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal))
        newTaskVC.tabBarItem = CustomButton2
        
        tbVC.viewControllers = [listVC, newTaskVC]
        
        return tbVC
    }
}
