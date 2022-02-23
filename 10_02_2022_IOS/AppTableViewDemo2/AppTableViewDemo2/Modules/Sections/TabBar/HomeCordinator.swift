//
//  HomeCordinator.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation
import UIKit

final class HomeCoordinator {
    
    static func view() -> HomeViewController {
       let vc = HomeViewController()
        
        let vcCoor = CarsListCoordinator.navigation()
        let vcProfileCoor = ProfileCoordinator.navigation()
        
        vc.viewControllers = [vcCoor,vcProfileCoor]
        return vc
    }

   
}
