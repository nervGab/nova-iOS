//
//  SplashInteractor.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation

protocol SplashInteractorProtocol {
	func fetchData()
}

class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol> {
	
	let provider: SplashProviderProtocol = SplashProvider()
	
	private func transformaData(data: [Card]) -> [CardBusinessModel] {
		var arrayData: [CardBusinessModel] = []
		for index in 0..<data.count {
			let obj = CardBusinessModel(data: CardDataViewModel(isAutoRefundEnabled: data[index].data?.isAutoRefundEnabled ?? false))
			arrayData.append(obj)
		}
		return arrayData
	}
}

extension SplashInteractor: SplashInteractorProtocol {
	
	func fetchData() {
		provider.fetchData { [weak self] (result) in
			guard self != nil else { return }
			self?.presenter?.getDataFromBusiness(data: self?.transformaData(data: result.cards ?? []))
		} failure: { (error) in
			//
		}

	}
}
