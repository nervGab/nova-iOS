//
//  CarsListCoordinator.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 14/2/22.
//

import Foundation
import UIKit

final class CarsListCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> CarsListViewController {
       let vc = CarsListViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: CarsListViewController) -> CarsListPresenterProtocol {
        let presenter = CarsListPresenter(vc: vc)
        return presenter
    }
}
