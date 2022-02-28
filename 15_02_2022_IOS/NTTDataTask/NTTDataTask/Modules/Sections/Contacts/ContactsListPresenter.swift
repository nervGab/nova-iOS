//
//  ContactsListPresenter.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import Foundation

protocol ContactsListPresenterProtocol {
    func viewDidLoadInPresenter()
    func numberOfRowInSection() -> Int
    func infoCell(indexPath: Int) -> ArrayContact
    func showContactDetail(dto: ArrayContact)
}

final class ContactsListPresenter {
    
    // MARK: - Variables
    var arrayContacts: [ArrayContact] = []
    let vc: ContactsListViewController?
    var router: ContactsListRouterProtocol?
    
    init(vc: ContactsListViewController) {
        self.vc = vc
    }
}

extension ContactsListPresenter: ContactsListPresenterProtocol {
    func showContactDetail(dto: ArrayContact) {
        self.router?.showDetail(dto: dto)
    }
    
    func infoCell(indexPath: Int) -> ArrayContact {
        return arrayContacts[indexPath]
    }
    
    func viewDidLoadInPresenter() {
        if let model = ContactosModel.stubbedContacts {
            self.arrayContacts = model
            self.vc?.reloadDataInView()
        }
    }
    
    func numberOfRowInSection() -> Int {
        self.arrayContacts.count
    }
}
 
