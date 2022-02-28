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
       ContactsListViewController()
    }
}
