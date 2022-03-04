//
//  ContactDetailPresenter.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 1/3/22.
//

import Foundation
protocol ContactDetailPresenterProtocol {
    func getDataModel()
    func numberOfRow() -> Int
    func infoData() -> ArrayContact?
}
final class ContactDetailPresenter {
    var modelData: ArrayContact?
    let vc: ContactDetailViewController?
//    var router: ContactsListRouterProtocol?
    
    init(vc: ContactDetailViewController) {
        self.vc = vc
    }
}

extension ContactDetailPresenter: ContactDetailPresenterProtocol {
    func getDataModel() {
        self.vc?.reloadDataModel()
    }
    func numberOfRow() -> Int {
        return 1
    }
    func infoData() -> ArrayContact? {
        return modelData
    }
    
}
