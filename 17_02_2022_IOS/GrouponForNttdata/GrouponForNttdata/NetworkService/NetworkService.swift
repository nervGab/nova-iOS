//
//  NetworkService.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation

protocol NetworkServiceProtocol {
	func requestGeneric<M: Decodable>(requestDTO: RequestDTO,
									  entityClass: M.Type,
									  completionHandler: @escaping (M?) -> (),
									  failure: @escaping (NetworkError) -> ())
}

class NetworkService: NetworkServiceProtocol {
	
	func requestGeneric<M>(requestDTO: RequestDTO,
						   entityClass: M.Type,
						   completionHandler: @escaping (M?) -> (),
						   failure: @escaping (NetworkError) -> ()) where M : Decodable {
		
		let sessionConfig = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
		
		let baseUrl = URLEndpoint.baseURl
		let endpoint = "\(baseUrl)\(requestDTO.endpoint)"
		let urlEndpoint = URL(string: endpoint)!
		
		var urlRequest = URLRequest(url: urlEndpoint)
		let headers = AppCoordinator.defaultHttpHeader
		headers.forEach { (key, value) in
			urlRequest.setValue(value, forHTTPHeaderField: key)
		}
		
		session.dataTask(with: urlRequest) { [weak self] (data, response, error) in
			guard self != nil else { return }
			
			if let errorDes = error {
				failure(NetworkError(error: errorDes))
				return
			}
			
			guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
				failure(NetworkError(status: .badServerResponse))
				return
			}
			
			guard let dataDes = data else {
				failure(NetworkError(status: .noContent))
				return
			}
			
			do {
				let jsonData = try JSONDecoder().decode(entityClass.self, from: dataDes)
				completionHandler(jsonData)
			} catch {
				failure(NetworkError(status: .resourceUnavailable))
			}
			
		}
		.resume()
		session.finishTasksAndInvalidate()
		
	}
	
	
}

