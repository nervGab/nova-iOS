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
        //2
        let newTaskVC = NewTaskCoordinator.navigation()
        let CustomButton2 = UITabBarItem(title: "New Task",
                                         image:  UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal),
                                         selectedImage:  UIImage(named: "TRIFECA_1M")?.withRenderingMode(.alwaysOriginal))
        newTaskVC.tabBarItem = CustomButton2
        // 2
        let TaskListVC = TaskListViewController()
        let customButton3 = UITabBarItem(title: "Task List",
                                        image: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "TRIFECA_2M")?.withRenderingMode(.alwaysOriginal))
        TaskListVC.tabBarItem = customButton3
        
        tbVC.viewControllers = [listVC, newTaskVC, TaskListVC]
        
        return tbVC
    }
}
