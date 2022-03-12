//
//  GrouponListDetailRouter.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import Foundation
import UIKit

protocol GrouponListDetailRouterPresenterInterface: RouterPresenterInterface {
	func showWebView(url: String)
}

final class GrouponListDetailRouter: RouterInterface {
	
	weak var presenter: GrouponListDetailPresenterRouterInterface!
	weak var viewController: UIViewController?
}

extension GrouponListDetailRouter: GrouponListDetailRouterPresenterInterface {
	
	func showWebView(url: String) {
		DispatchQueue.main.async {
			let viewController = GenericWebViewCoordinator.build(dto: GenericWebViewCoordinatorDTO(url: url))
			//self.viewController?.navigationController?.pushViewController(viewController, animated: true)
			self.viewController?.present(viewController, animated: true, completion: nil)
		}
	}
	
}
