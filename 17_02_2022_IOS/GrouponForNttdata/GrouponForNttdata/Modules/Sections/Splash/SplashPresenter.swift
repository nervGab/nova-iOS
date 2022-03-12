//
//  SplashPresenter.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation

protocol SplashPresenterProtocol {
	func fetchDataFromPresent()
	func numberOfRowInSections() -> Int
	func informationForCell(indexPath: Int) -> CardViewModel?
}

protocol SplashInteractorOutputProtocol {
	func getDataFromBusiness(data: [CardViewModel]?)
}

class SplashPresenter: BasePresenter<SplashViewProtocol, SplashRouterProtocol, SplashInteractorProtocol> {
	
	var arrayData: [CardViewModel] = []
}

extension SplashPresenter: SplashPresenterProtocol {
	func numberOfRowInSections() -> Int {
		arrayData.count
	}
	
	func informationForCell(indexPath: Int) -> CardViewModel? {
		arrayData[indexPath]
	}
	
	func fetchDataFromPresent() {
		self.interactor?.fetchData()
	}
	
}

extension SplashPresenter: SplashInteractorOutputProtocol {
	
	func getDataFromBusiness(data: [CardViewModel]?) {
		if let dataDes = data {
			self.arrayData = dataDes
			self.vc?.reloadInformationInView()
		}
	}
	
}
