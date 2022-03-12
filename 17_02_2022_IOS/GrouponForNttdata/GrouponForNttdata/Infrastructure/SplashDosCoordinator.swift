//
//  SplashDosCoordinator.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 3/3/22.
//

import Foundation
import UIKit

final class SplashDosCoordinator: ModulesInterface {
	
	typealias View = SplashDosViewController
	typealias Presenter = SplashDosPresenter
	typealias Router = SplashDosRouter
	typealias Interactor = SplashDosInteractor
	
	func navigation() -> UINavigationController {
		UINavigationController(rootViewController: build())
	}
	
	func build() -> UIViewController {
		let view = View()
		let interactor = Interactor()
		let presenter = Presenter()
		let router = Router()
		self.coordinator(view: view, presenter: presenter, router: router, interactor: interactor)
		router.viewController = view
		return view
	}
	
}
