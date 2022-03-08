//
//  Utils.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation
import UIKit

public protocol ReuseIdentifierView: AnyObject {
	static var defaultReuseIdentifierView: String { get }
}

public extension ReuseIdentifierView where Self: UIView {
	
	static var defaultReuseIdentifierView: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
}

public protocol ReuseIdentifierViewController: AnyObject {
	static var defaultReuseIdentifierViewController: String { get }
}

public extension ReuseIdentifierViewController where Self: UIViewController {
	
	static var defaultReuseIdentifierViewController: String {
		return NSStringFromClass(self).components(separatedBy: ".").last!
	}
}

enum HTTPMethods: String {
	case get = "GET"
	case post = "POST"
}

struct RequestDTO {
	
	var param: [String: AnyObject]?
	var arrayParams: [[String: AnyObject]]?
	var method: HTTPMethods
	var endpoint: String
	
	init(param: [String: AnyObject]?, method: HTTPMethods, endpoint: String) {
		self.param = param
		self.method = method
		self.endpoint = endpoint
	}
	
	init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String) {
		self.arrayParams = arrayParams
		self.method = method
		self.endpoint = endpoint
	}
}

struct URLEndpoint {
	
	static let baseURl = "https://cupon-for-ever.herokuapp.com/"
	static let endpointGrouponList = "grouponList"
	static let endpointGrouponLegales = "grouponLegales"
	static let bearedHeroku = "Bearer 123456789"
	
	
}
