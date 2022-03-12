//
//  HomeTabBarCoordinator.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 3/3/22.
//

import Foundation
import UIKit

final class HomeTabBarCoordinator {
	
	static func homeTabBar(dto: HomeTabBarCoordinatorDTO? = nil) -> HomeTabBarViewController {
		let homeTabBarVc = HomeTabBarViewController(nibName: HomeTabBarViewController.defaultReuseIdentifierViewController, bundle: nil)
		
		let listVc = GrouponListCoordinator().navigation(dto: GrouponListCoordinatorDTO(modalData: dto?.modelData))
		let customButton = UITabBarItem(title: "Groupon NttData",
										image: UIImage(systemName: "house"),
										selectedImage: UIImage(systemName: "house"))
		listVc.tabBarItem = customButton
		
		
		homeTabBarVc.viewControllers = [listVc]
		
		return homeTabBarVc
	}
	
}

struct HomeTabBarCoordinatorDTO {
	var modelData: [DataViewModel]?
}
