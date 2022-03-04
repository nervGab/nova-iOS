//
//  NewTaskCoordinator.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 4/3/22.
//

import Foundation
import UIKit


final class NewTaskCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> NewTaskViewController {
       let vc = NewTaskViewController()
//        vc.presenter = presenter(vc: vc)
        return vc
    }
    
//    static func presenter(vc: ContactsListViewController) -> ContactsListPresenterProtocol {
//        let presenter = ContactsListPresenter(vc: vc)
//        presenter.router = router(vc: vc)
//        return presenter
//    }
//
//    static func router(vc: ContactsListViewController) -> ContactsListRouterProtocol {
//        let router = ContactsListRouter(vc: vc)
//        return router
//    }
//
}
