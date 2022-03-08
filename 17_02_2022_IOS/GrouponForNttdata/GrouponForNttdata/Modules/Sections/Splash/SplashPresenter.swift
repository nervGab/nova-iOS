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
	func informationForCell(indexPath: Int) -> CardDataViewModel?
}

protocol SplashInteractorOutputProtocol {
	func getDataFromBusiness(data: [CardBusinessModel]?)
}

class SplashPresenter: BasePresenter<SplashViewProtocol, SplashRouterProtocol, SplashInteractorProtocol> {
	
	var arrayData: [CardBusinessModel] = []
}

extension SplashPresenter: SplashPresenterProtocol {
	func numberOfRowInSections() -> Int {
		arrayData.count
	}
	
	func informationForCell(indexPath: Int) -> CardDataViewModel? {
		arrayData[indexPath].data
	}
	
	func fetchDataFromPresent() {
		self.interactor?.fetchData()
	}
	
}

extension SplashPresenter: SplashInteractorOutputProtocol {
	
	func getDataFromBusiness(data: [CardBusinessModel]?) {
		if let dataDes = data {
			self.arrayData = dataDes
			self.vc?.reloadInformationInView()
		}
	}
	
}
