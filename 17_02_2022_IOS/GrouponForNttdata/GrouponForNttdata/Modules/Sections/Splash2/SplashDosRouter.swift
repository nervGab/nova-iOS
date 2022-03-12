//
//  SplashDosRouter.swift
//  GrouponForEveris
//
//  Created by Juan Manuel Pereira Sanchez 9/3/22.
//

import Foundation
import UIKit

protocol SplashDosRouterPresenterInterface: RouterPresenterInterface {
	func showHomeTabBar(data: [DataViewModel])
}

final class SplashDosRouter: RouterInterface {
    
    weak var presenter: SplashDosPresenterRouterInterface!
    weak var viewController: UIViewController?
    
}

extension SplashDosRouter: SplashDosRouterPresenterInterface {
	
	func showHomeTabBar(data: [DataViewModel]) {
		DispatchQueue.main.async {
			let vc = HomeTabBarCoordinator.homeTabBar(dto: HomeTabBarCoordinatorDTO(modelData: data))
			vc.modalTransitionStyle = .crossDissolve
			vc.modalPresentationStyle = .fullScreen
			self.viewController?.present(vc, animated: true, completion: nil)
		}
	}
    
}
