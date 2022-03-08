//
//  SplashCoordinator.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation

class SplashCoordinator {
	
	static func navigation() -> BaseNavigation {
		BaseNavigation(rootViewController: view())
	}
	static func view() -> SplashViewController {
		let vc = SplashViewController(nibName: SplashViewController.defaultReuseIdentifierViewController,
									  bundle: nil)
		vc.presenter = presenter(vc: vc)
		return vc
	}
	static func presenter(vc: SplashViewController) -> SplashPresenterProtocol {
		let presenter = SplashPresenter(vc: vc)
		presenter.router = router()
		presenter.interactor = interactor(vc: vc)
		return presenter
	}
	static func interactorOutput(vc: SplashViewController) -> SplashInteractorOutputProtocol {
		let presenter = SplashPresenter(vc: vc)
		return presenter
	}
	static func interactor(vc: SplashViewController) -> SplashInteractorProtocol {
		let interactor = SplashInteractor()
		interactor.presenter = interactorOutput(vc: vc)
		return interactor
	}
	static func router() -> SplashRouterProtocol {
		SplashRouter()
	}
	
}
