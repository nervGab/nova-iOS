//
//  ProfileViewController.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import UIKit

protocol ProfileViewControllerProtocol {
    func reloadData()
}

class ProfileViewController: UIViewController {
    // MARK: - ID
    var presenter: ProfilePresenterProtocol?

    // MARK: - Outlets
    @IBOutlet weak var myTableViewProfile: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        setupTableView()
        self.presenter?.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupTableView(){
        self.myTableViewProfile.delegate = self
        self.myTableViewProfile.dataSource = self
        //registrar celda
        self.myTableViewProfile.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
        self.myTableViewProfile.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")

    }

}

extension ProfileViewController: ProfileViewControllerProtocol {
    internal func reloadData() {
        self.myTableViewProfile.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return presenter?.getDataCellForRowPost() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cellProfile = myTableViewProfile.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
            if let modelData = self.presenter?.getProfileInfoCell(){
                cellProfile.configCell(model: modelData)
            }
            return cellProfile
        default:
            let cellPost = myTableViewProfile.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            if let modelData = self.presenter?.getInfoForRowCell(indexPath: indexPath.row){
                cellPost.configCell(model: modelData)
            }
            return cellPost
        }
        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 215
        default:
            return UITableView.automaticDimension
        }
    }
    
    
}
