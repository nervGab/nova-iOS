//
//  ProfileViewController.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import UIKit

protocol ProfileViewControllerProtocol {
    
}

class ProfileViewController: UIViewController {
    // MARK: - ID
    var presenter: ProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}

extension ProfileViewController: ProfileViewControllerProtocol {
    
}
