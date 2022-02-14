//
//  CarsListPresenter.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 14/2/22.
//

import Foundation

protocol CarsListPresenterProtocol {
    func numberOfRowCell () -> Int
}

final class CarsListPresenter {
    
    // cars array
}

extension CarsListPresenter: CarsListPresenterProtocol {
    func numberOfRowCell() -> Int {
        return 6
    }
    
    
}
