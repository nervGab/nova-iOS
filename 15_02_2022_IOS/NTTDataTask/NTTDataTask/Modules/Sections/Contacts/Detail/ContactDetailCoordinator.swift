//
//  ContactDetailCoordinator.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import Foundation


final class ContactDetailCoordinator {
    static func view(dto: ContactDetailCoordinatorDTO? = nil) -> ContactDetailViewController {
        let vc = ContactDetailViewController()
        vc.presenter = presenter(vc: vc, dto: dto)
        return vc
    }
    static func presenter(vc: ContactDetailViewController, dto: ContactDetailCoordinatorDTO? = nil) -> ContactDetailPresenterProtocol {
        let presenter = ContactDetailPresenter(vc: vc)
        presenter.modelData = dto?.modelData
//        presenter.router = router(vc: vc)
        return presenter
    }

}


struct ContactDetailCoordinatorDTO {
    var modelData: ArrayContact?
}
