//
//  ContactsListViewController.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import UIKit

class ContactsListViewController: UIViewController {

    var arrayContacts: [ArrayContact] = []
    @IBOutlet weak var contactsListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupTableView()
        // Do any additional setup after loading the view.
    }

    private func setupTableView() {
        self.contactsListTableView.delegate = self
        self.contactsListTableView.dataSource = self
    }

}

extension ContactsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayContacts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
