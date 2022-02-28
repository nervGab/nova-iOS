//
//  ContactsListCoordinator.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import Foundation
import UIKit


final class ContactsListCoordinator {
    
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> ContactsListViewController {
       let vc = ContactsListViewController()
        vc.presenter = ContactsListPresenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: ContactsListViewController) -> ContactsListPresenterProtocol {
        let presenter = ContactsListPresenter(vc: vc)
        presenter.router = router(vc: vc)
        return presenter
    }
    
    static func router(vc: ContactsListViewController) -> ContactsListRouterProtocol {
        let router = ContactsListRouter(vc: vc)
        return router
    }
    
}
