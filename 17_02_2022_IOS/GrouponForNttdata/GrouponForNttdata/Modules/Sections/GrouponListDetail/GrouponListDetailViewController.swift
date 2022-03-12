//
//  GrouponListDetailViewController.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import UIKit

protocol GrouponListDetailViewPresenterInterface: ViewPresenterInterface {
	func reloadInformationInView()
}

class GrouponListDetailViewController: UIViewController, ViewInterface {

	//MARK: - IBOutlet
	@IBOutlet weak var myGrouponDetailTableView: UITableView!
	
	var presenter: GrouponListDetailPresenterViewInterface!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.presenter.updateView()
		self.setupTableView()
    }
	
	func setupTableView() {
		self.myGrouponDetailTableView.delegate = self
		self.myGrouponDetailTableView.dataSource = self
		self.myGrouponDetailTableView.register(UINib(nibName: GrouponCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GrouponCell.defaultReuseIdentifierView)
		self.myGrouponDetailTableView.register(UINib(nibName: GrouponDetailCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GrouponDetailCell.defaultReuseIdentifierView)
		self.myGrouponDetailTableView.register(UINib(nibName: GrouponMapCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GrouponMapCell.defaultReuseIdentifierView)
		self.myGrouponDetailTableView.register(UINib(nibName: GrouponLinkCell.defaultReuseIdentifierView, bundle: nil), forCellReuseIdentifier: GrouponLinkCell.defaultReuseIdentifierView)
	}

}

extension GrouponListDetailViewController: GrouponListDetailViewPresenterInterface {
	
	func reloadInformationInView() {
		self.myGrouponDetailTableView.reloadData()
	}
	
}

extension GrouponListDetailViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		4
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let model = self.presenter.objectForIndexPath() {
			switch indexPath.row {
			case 0:
				let cellCupon = self.myGrouponDetailTableView.dequeueReusableCell(withIdentifier: GrouponCell.defaultReuseIdentifierView, for: indexPath) as! GrouponCell
				cellCupon.configCell(data: model)
				return cellCupon
			case 1:
				let cellDescription = self.myGrouponDetailTableView.dequeueReusableCell(withIdentifier: GrouponDetailCell.defaultReuseIdentifierView, for: indexPath) as! GrouponDetailCell
				cellDescription.configCell(model: model)
				return cellDescription
			case 2:
				let cellMap = self.myGrouponDetailTableView.dequeueReusableCell(withIdentifier: GrouponMapCell.defaultReuseIdentifierView, for: indexPath) as! GrouponMapCell
				cellMap.configCell(model: model)
				return cellMap
			default:
				let cellLink = self.myGrouponDetailTableView.dequeueReusableCell(withIdentifier: GrouponLinkCell.defaultReuseIdentifierView, for: indexPath) as! GrouponLinkCell
				cellLink.delegate = self
				cellLink.configCell(model: model)
				return cellLink
			}
		}
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.row {
		case 0:
			return UITableView.automaticDimension
		case 1:
			return UITableView.automaticDimension
		case 2:
			return 390
		default:
			return UITableView.automaticDimension
		}
	}
	
}

extension GrouponListDetailViewController: GrouponLinkCellDelegate {
	
	func sendModelData(_ cell: UITableViewCell, url: String) {
		self.presenter.showWebViewIntroGroupon(data: url)
	}
	
}
