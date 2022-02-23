//
//  CarsListPresenter.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 14/2/22.
//

import Foundation
import UIKit

protocol CarsListPresenterProtocol {
    func setArrayData()
    func numberOfRowCell () -> Int
    func getInformationCellForRow(indexPath: Int) -> carModel
}

final class CarsListPresenter {
    var arrayCars: [carModel] = []
    let vc: CarsListViewController?
    init(vc: CarsListViewController) {
        self.vc = vc
    }
}

extension CarsListPresenter: CarsListPresenterProtocol {
    func setArrayData() {
        // cars array
        self.arrayCars.removeAll()
//        #if DEV
//        #elseif PRE
//        #else
//        #endif
        
        self.arrayCars = [carModel(name: "Audi", color: "Red", image: UIImage(named: "audi")),
                          carModel(name: "Ferrari", color: "Blue", image: UIImage(named: "audi")),
                          carModel(name: "Tesla", color: "Red", image: UIImage(named: "audi")),
                          carModel(name: "Audi", color: "Red", image: UIImage(named: "audi")),
                          carModel(name: "Ferrari", color: "Blue", image: UIImage(named: "audi")),
                          carModel(name: "Tesla", color: "Red", image: UIImage(named: "audi")),
                          carModel(name: "Audi", color: "Red", image: UIImage(named: "audi")),
                          carModel(name: "Ferrari", color: "Blue", image: UIImage(named: "audi")),
                          carModel(name: "Tesla", color: "Red", image: UIImage(named: "audi"))]
        self.vc?.reloadData()
    }
    
    func numberOfRowCell() -> Int {
        return self.arrayCars.count
        
    }
    
    func getInformationCellForRow(indexPath: Int) -> carModel {
        return self.arrayCars[indexPath]
    }
}
