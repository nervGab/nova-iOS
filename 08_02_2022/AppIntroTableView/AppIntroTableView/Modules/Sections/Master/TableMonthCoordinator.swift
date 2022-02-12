//
//  TableMonthCoordinator.swift
//  AppIntroTableView
//
//  Created by Juan Manuel Pereira Sanchez on 12/2/22.
//

import Foundation
import UIKit

final class TableMonthCoordinator {
    static func navigation() -> UINavigationController {
        UINavigationController(rootViewController: view())
    }
    
    static func view() -> TableMonthViewController {
        TableMonthViewController()
    }
}
