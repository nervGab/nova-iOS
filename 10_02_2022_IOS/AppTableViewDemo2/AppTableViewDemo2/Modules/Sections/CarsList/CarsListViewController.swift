//
//  CarsListViewController.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 14/2/22.
//

import UIKit

protocol CarsListViewProtocol {
    func reloadData()
}

class CarsListViewController: UIViewController {
    
    // MARK: - ID
    var presenter: CarsListPresenterProtocol?
    // MARK: - Outlets
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Car List"
        self.presenter?.setArrayData()
        setupTableView()

    }

    private func setupTableView() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: "CarsTableViewCell", bundle: nil), forCellReuseIdentifier: "CarsTableViewCell")
    }

}

extension CarsListViewController: CarsListViewProtocol {
    func reloadData() {
        self.myTableView.reloadData()
    }
}

extension CarsListViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowCell() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let carCell = self.myTableView.dequeueReusableCell(withIdentifier: "CarsTableViewCell", for: indexPath) as! CarsTableViewCell
        if let modelData = self.presenter?.getInformationCellForRow(indexPath: indexPath.row) {
            carCell.configCell(model: modelData)
        }
        return carCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}

extension CarsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
