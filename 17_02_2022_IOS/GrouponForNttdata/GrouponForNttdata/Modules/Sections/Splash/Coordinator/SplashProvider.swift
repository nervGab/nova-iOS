//
//  SplashProvider.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 24/2/22.
//

import Foundation

protocol SplashProviderProtocol {
	func fetchData(completion: @escaping (NttDataGrouponServerModel) -> (), failure: @escaping (NetworkError) -> ())
}

class SplashProvider {
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
}

extension SplashProvider: SplashProviderProtocol {
	
	func fetchData(completion: @escaping (NttDataGrouponServerModel) -> (), failure: @escaping (NetworkError) -> ()) {
		
		networkService.requestGeneric(requestDTO: SplashProviderRequestDTO.requestDataList(),
									  entityClass: NttDataGrouponServerModel.self) { [weak self] (result) in
			guard self != nil else { return }
			if let resultDes = result {
				completion(resultDes)
			}
		} failure: { [weak self] (error) in
			guard self != nil else { return }
			failure(error)
		}

	}
}

struct SplashProviderRequestDTO {
	
	static func requestDataList() ->  RequestDTO {
		RequestDTO(param: nil, method: .get, endpoint: URLEndpoint.endpointGrouponList)
	}
}
