//
//  ContactsListViewController.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import UIKit
protocol ContactsListViewControllerProtocol {
    func reloadDataInView()
}
class ContactsListViewController: UIViewController {

    var presenter: ContactsListPresenterProtocol?
    
    @IBOutlet weak var contactsListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoadInPresenter()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
    }
    private func setupTableView() {
        self.contactsListTableView.delegate = self
        self.contactsListTableView.dataSource = self
        self.contactsListTableView.register(UINib(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsTableViewCell")
    }

}

extension ContactsListViewController: ContactsListViewControllerProtocol {
    func reloadDataInView() {
        self.contactsListTableView.reloadData()

    }
    
    
}


extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowInSection() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = self.contactsListTableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell", for: indexPath) as! ContactsTableViewCell
        if let modelData = self.presenter?.infoCell(indexPath: indexPath.row){
            contactCell.configCell(data: modelData)
        }
        return contactCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let modelData = self.presenter?.infoCell(indexPath: indexPath.row){
            self.presenter?.showContactDetail(dto: modelData)
                    
        }
    }
}

