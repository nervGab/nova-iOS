//
//  TableMonthViewController.swift
//  AppIntroTableView
//
//  Created by Juan Manuel Pereira Sanchez on 12/2/22.
//

import UIKit

class TableMonthViewController: UIViewController {
    // MARK: - Variables
    let arrayMonths = ["January","February"," March", "April", "May"]
    
    // MARK: - Outlets
    @IBOutlet weak var myTableViewMonths: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }

    private func setupTableView() {
        self.myTableViewMonths.delegate = self
        self.myTableViewMonths.dataSource = self
        self.myTableViewMonths.register(UINib(nibName: "MonthsTableViewCell", bundle: nil), forCellReuseIdentifier: "MonthsTableViewCell")
    }

}

extension TableMonthViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailCoordinator.view(dto: DetailCoordinatorDTO(nameMonth: self.arrayMonths[indexPath.row]))
        let modelData = self.arrayMonths[indexPath.row]
        let dto = DetailCoordinatorDTO(nameMonth: modelData)
        let vc = DetailCoordinator.view(dto: dto)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TableMonthViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.arrayMonths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMonths = self.myTableViewMonths.dequeueReusableCell(withIdentifier: "MonthsTableViewCell", for: indexPath) as! MonthsTableViewCell
        cellMonths.setupCell(name: self.arrayMonths[indexPath.row])
        return cellMonths
    }
}
