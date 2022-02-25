//
//  UserDefaultViewController.swift
//  AppUserDefaultIntro
//
//  Created by Juan Manuel Pereira Sanchez on 25/2/22.
//

import UIKit

class UserDefaultViewController: UIViewController {

    // MARK: - Constants
    static let name = "NAME"
    static let surname = "SURNAME"
    static let address = "ADDRESS"
    static let phone = "PHONE"
    static let lastUpdate = "LAST_UPDATE"
    static let ProfileImage = "PROFILE_IMAGE"
    
    let prefs = UserDefaults.standard
    let dateFormater = DateFormatter()
    
    // MARK: - Outlets
    
    // MARK: - Actions
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Private methods
}
