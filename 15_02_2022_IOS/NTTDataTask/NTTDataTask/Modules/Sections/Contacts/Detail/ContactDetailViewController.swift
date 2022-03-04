//
//  ContactDetailViewController.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import UIKit

protocol ContactDetailViewControllerProtocol {
    func reloadDataModel()
}

class ContactDetailViewController: UIViewController {

    var presenter: ContactDetailPresenterProtocol?

    @IBOutlet weak var ContactDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getDataModel()
        self.setupTableView()
        // Do any additional setup after loading the view.
    }
    private func setupTableView() {
        self.ContactDetailTableView.delegate = self
        self.ContactDetailTableView.dataSource = self
        self.ContactDetailTableView.register(UINib(nibName: "DetailProfileCell", bundle: nil), forCellReuseIdentifier: "DetailProfileCell")
    }


}
extension ContactDetailViewController: ContactDetailViewControllerProtocol {
    func reloadDataModel() {
        self.ContactDetailTableView.reloadData()
    }
    
    
}
extension ContactDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = self.ContactDetailTableView.dequeueReusableCell(withIdentifier: "DetailProfileCell", for: indexPath) as! DetailProfileCell
        if let modelData = self.presenter?.infoData(){
            contactCell.configCell(model: modelData)
        }
        return contactCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let modelData = self.presenter?.infoCell(indexPath: indexPath.row){
//            self.presenter?.showContactDetail(dto: modelData)
//
//        }
//    }
}
