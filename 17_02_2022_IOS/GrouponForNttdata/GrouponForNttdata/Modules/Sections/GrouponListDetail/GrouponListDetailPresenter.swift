//
//  GrouponListDetailPresenter.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import Foundation

protocol GrouponListDetailPresenterRouterInterface: PresenterRouterInterface {
	
}

protocol GrouponListDetailPresenterInteractorInterface: PresenterInteractorInterface {
	
}

protocol GrouponListDetailPresenterViewInterface: PresenterViewInterface {
	func updateView()
	func objectForIndexPath() -> CardViewModel?
	func showWebViewIntroGroupon(data: String)
}

final class GrouponListDetailPresenter: PresenterInterface {
	
	var router: GrouponListDetailRouterPresenterInterface!
	var interactor: GrouponListDetailInteractorPresenterInterface!
	weak var view: GrouponListDetailViewPresenterInterface!
	
	var dataModel: CardViewModel?
	
}

extension GrouponListDetailPresenter: GrouponListDetailPresenterRouterInterface {
	
}

extension GrouponListDetailPresenter: GrouponListDetailPresenterInteractorInterface {
	
}

extension GrouponListDetailPresenter: GrouponListDetailPresenterViewInterface {
	
	func showWebViewIntroGroupon(data: String) {
		self.router.showWebView(url: data)
	}
	
	func objectForIndexPath() -> CardViewModel? {
		self.dataModel
	}
	
	func updateView() {
		self.view.reloadInformationInView()
	}
	
}
