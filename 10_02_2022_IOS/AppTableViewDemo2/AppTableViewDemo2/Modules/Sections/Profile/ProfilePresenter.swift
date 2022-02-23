//
//  ProfilePresenter.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol {
    func setArrayData()
    func numberOfRowCell () -> Int
//    func getInformationCellForRow(indexPath: Int) -> carModel
}

final class ProfilePresenter {
//    var arrayCars: [carModel] = []
    let vc: ProfileViewController?
    init(vc: ProfileViewController) {
        self.vc = vc
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    func setArrayData() {
        
    }
    
    func numberOfRowCell() -> Int {
        return 0
    }
    
    
}
