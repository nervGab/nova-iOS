//
//  SplashViewController.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import UIKit

protocol SplashViewProtocol {
	func reloadInformationInView()
}

class SplashViewController: BaseViewController<SplashPresenterProtocol>, ReuseIdentifierViewController {

	@IBOutlet weak var myTableViewTest: UITableView!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		self.presenter?.fetchDataFromPresent()
		self.setupTableView()
    }

	func setupTableView() {
		self.myTableViewTest.delegate = self
		self.myTableViewTest.dataSource = self
		self.myTableViewTest.register(UINib(nibName: GenericCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GenericCell.defaultReuseIdentifierView)
	}
	
}

extension SplashViewController: SplashViewProtocol {
	
	func reloadInformationInView() {
		DispatchQueue.main.async {
			self.myTableViewTest.reloadData()
		}
	}
	
}

extension SplashViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		self.presenter?.numberOfRowInSections() ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellTest = self.myTableViewTest.dequeueReusableCell(withIdentifier: GenericCell.defaultReuseIdentifierView, for: indexPath) as! GenericCell
		if let modelData = self.presenter?.informationForCell(indexPath: indexPath.row) {
			cellTest.configCell(data: modelData)
		}
		return cellTest
	}
	
}
