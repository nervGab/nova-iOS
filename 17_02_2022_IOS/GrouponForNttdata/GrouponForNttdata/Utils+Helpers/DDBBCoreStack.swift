//
//  DDBBCoreStack.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import Foundation

class DDBBCoreStack {
	static let shared = DDBBCoreStack()
	private let defaults = UserDefaults.standard
	private let defaulKey = "lastRefresh"
	private let calendar = Calendar.current
	
	func loadDataIfNeeded(completionHandler: @escaping (Bool) -> ()) {
		if isRefreshingRequiered() {
			defaults.setValue(Date(), forKey: defaulKey)
			completionHandler(true)
		} else {
			completionHandler(false)
		}
	}
	
	private func isRefreshingRequiered() -> Bool {
		guard let lastRefreshing = defaults.object(forKey: defaulKey) as? Date else {
			return true
		}
		if let diff = calendar.dateComponents([.hour], from: lastRefreshing, to: Date()).hour, diff > 12 {
			return true
		} else {
			return false
		}
	}
	
}

extension DDBBCoreStack {
	
	func setCuponList(data: [DataViewModel]) {
		do {
			defaults.set(try? PropertyListEncoder().encode(data), forKey: DDBBCoreStack.Constants.cuponList)
		} catch let error {
			print(error.localizedDescription)
		}
	}
	
	func getCuponList() -> [DataViewModel]? {
		var myData: [DataViewModel] = []
		if let data = defaults.value(forKey: DDBBCoreStack.Constants.cuponList) as? Data {
			do {
				myData = try PropertyListDecoder().decode([DataViewModel].self, from: data)
			} catch let error {
				print(error.localizedDescription)
			}
		} else {
			return nil
		}
		return myData
	}
	
}

extension DDBBCoreStack {
	struct Constants {
		static let cuponList = "cuponList"
	}
}
