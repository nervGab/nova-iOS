//
//  AppCoordinator.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation
import UIKit

protocol AppCoordinatorProtocol {
	func showInitialApp(window: UIWindow)
}

final class AppCoordinator: AppCoordinatorProtocol {

	private var initialVC = UIViewController()
	internal func showInitialApp(window: UIWindow) {
		initialVC = SplashCoordinator.navigation()
		window.rootViewController = initialVC
		window.makeKeyAndVisible()
	}
	
	static let defaultHttpHeader: [String: String] = {
		return ["Authorization": URLEndpoint.bearedHeroku]
	}()
}


