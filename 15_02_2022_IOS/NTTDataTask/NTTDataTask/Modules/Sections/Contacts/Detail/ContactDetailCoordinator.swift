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
        vc.modelData = dto?.modelData
        return vc
    }
}

struct ContactDetailCoordinatorDTO {
    var modelData: ArrayContact?
}
