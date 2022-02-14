//
//  CarsListViewController.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 14/2/22.
//

import UIKit

class CarsListViewController: UIViewController {
    
    // MARK: - ID
    var presenter: CarsListPresenterProtocol?
    // MARK: - Outlets
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
    }

}

extension CarsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1
    }
}

extension CarsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
