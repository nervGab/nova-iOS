//
//  GrouponListDetailCoordinator.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import Foundation
import UIKit

final class GrouponListDetailCoordinator: ModulesInterface {
	
	typealias View = GrouponListDetailViewController
	typealias Presenter = GrouponListDetailPresenter
	typealias Router = GrouponListDetailRouter
	typealias Interactor = GrouponListDetailInteractor
	
	func navigation() -> UINavigationController {
		UINavigationController(rootViewController: build())
	}
	
	func build(dto: GrouponListDetailCoordinatorDTO? = nil) -> UIViewController {
		let view = View()
		let interactor = Interactor()
		let presenter = Presenter()
		presenter.dataModel = dto?.dataModel
		let router = Router()
		self.coordinator(view: view,
						 presenter: presenter,
						 router: router,
						 interactor: interactor)
		router.viewController = view
		return view
	}
	
}

struct GrouponListDetailCoordinatorDTO {
	var dataModel: CardViewModel
}
