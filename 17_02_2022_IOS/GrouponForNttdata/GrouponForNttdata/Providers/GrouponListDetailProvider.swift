//
//  GrouponListDetailProvider.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import Foundation

protocol GrouponListDetailProviderProtocol {
	
	func fetchData(completion: @escaping (NttDataGrouponServerModel) -> (), failure: @escaping (NetworkError) -> ())

}

class GrouponListDetailProvider {
	
	let networkService: NetworkServiceProtocol = NetworkService()
	
}

extension GrouponListDetailProvider: GrouponListDetailProviderProtocol {
	
	func fetchData(completion: @escaping (NttDataGrouponServerModel) -> (), failure: @escaping (NetworkError) -> ()) {
		networkService.requestGeneric(requestDTO: GrouponListDetailProviderRequestDTO.requestDataList(),
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

struct GrouponListDetailProviderRequestDTO {
	static func requestDataList() -> RequestDTO {
		RequestDTO(param: nil, method: .get, endpoint: URLEndpoint.endpointGrouponList)
	}
}
