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
	
	private func transformaDataViewModel(data: [Card], completion: @escaping ([DataViewModel]) -> ()) {
		var arrayData: [DataViewModel] = []
		for index in 0..<data.count {
			if let modelData = data[index].data {
				let obj = DataViewModel(pCardType: .deal, pData: self.transformDataToCardViewModel(data: modelData))
				arrayData.append(obj)
			}
		}
		completion(arrayData)
	}
	
	private func transformDataToCardViewModel(data: CardData) -> CardViewModel {
		let modelData = CardViewModel(pDescriptor: data.descriptor ?? "",
									  pType: data.type ?? "",
									  pFinePrint: data.finePrint ?? "",
									  pAnnouncementTitle: data.announcementTitle ?? "",
									  pImages: self.transformDataToImageViewModel(data: data.images ?? []),
									  pEndAt: data.endAt ?? "",
									  pTags: self.transformeDataToTagViewModel(data: data.tags ?? []),
									  pDealUrl: data.dealUrl ?? "",
									  pGrid4ImageUrl: data.grid4ImageUrl ?? "",
									  pSideBarImageUrl: data.sidebarImageUrl ?? "",
									  pHighlightsHtml: data.highlightsHtml ?? "",
									  pPitchHtml: data.pitchHtml ?? "",
									  pPriceSummary: self.transformeDataToPriceViewModel(data: data.priceSummary) ?? PriceSummaryViewModel(pValue: PriceViewModel(pFormattedAmount: "")),
									  pLargeImageUrl: data.largeImageUrl ?? "",
									  pBadge: self.transformeDataToBadgeViewModel(data: data.badges ?? []) ,
									  pDivision: self.transformeDataToDivisionViewModel(data: data.division))
		return modelData
	}
	
	private func transformDataToImageViewModel(data: [Image]) -> [ImageViewModel] {
		var arrayImage: [ImageViewModel] = []
		for item in 0..<data.count {
			let model = ImageViewModel(pUrl: data[item].url ?? "")
			arrayImage.append(model)
		}
		return arrayImage
	}
	
	private func transformeDataToTagViewModel(data: [Tag]) -> [TagViewModel] {
		var arrayTags: [TagViewModel] = []
		for item in 0..<data.count {
			let model = TagViewModel(pName: data[item].name ?? "")
			arrayTags.append(model)
		}
		return arrayTags
	}
	
	private func transformeDataToPriceViewModel(data: PriceSummary?) -> PriceSummaryViewModel? {
		if let dataDes = data {
			let model = PriceViewModel(pFormattedAmount: dataDes.price?.formattedAmount ?? "")
			let priceModel = PriceSummaryViewModel(pValue: model)
			return priceModel
		}
		return nil
	}
	
	private func transformeDataToBadgeViewModel(data: [Badge]) -> [BadgeViewModel] {
		var arrayBadge: [BadgeViewModel] = []
		for item in 0..<data.count {
			let model = BadgeViewModel(pText: data[item].text ?? "", pIconImageUrl: data[item].iconImageUrl ?? "")
				arrayBadge.append(model)
		}
		return arrayBadge
	}
	
	private func transformeDataToDivisionViewModel(data: Division?) -> DivisionViewModel {
		DivisionViewModel(pLng: data?.lng ?? 0.0, pName: data?.name ?? "", pLat: data?.lat ?? 0.0)
	}
	
}

extension SplashInteractor: SplashInteractorProtocol {
	
	func fetchData() {
		provider.fetchData { [weak self] (result) in
			guard self != nil else { return }
//			self?.presenter?.getDataFromBusiness(data: self?.transformaDataViewModel(data: result.cards, completion: { (resultDataViewModel) in
//
//			}))
		} failure: { (error) in
			//
		}

	}
}
