//
//  ContactsListRouter.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import Foundation

protocol ContactsListRouterProtocol {
    func showDetail(dto: ArrayContact)
}
final class ContactsListRouter {
    let vc: ContactsListViewController?
    
    init(vc: ContactsListViewController) {
        self.vc = vc
    }
}
extension ContactsListRouter: ContactsListRouterProtocol {
    func showDetail(dto: ArrayContact) {
        // DispatchQueue.main.async asegura que se ejecuta en el hilo principal 
        DispatchQueue.main.async {
            self.vc?.navigationController?.pushViewController(ContactDetailCoordinator.view(dto: ContactDetailCoordinatorDTO(modelData: dto)), animated: true)
        }
    }
    


    
    
}
