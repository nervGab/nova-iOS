//
//  ProfilePresenter.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol {
    func viewDidLoad()
    func getDataCellForRowPost () -> Int
//    func numberOfRowCell () -> Int
    //    func getInformationCellForRow(indexPath: Int) -> carModel
}

final class ProfilePresenter {
//    var arrayCars: [carModel] = []
    let vc: ProfileViewController?
    
    var profileModel: ProfileModel? = ProfileModel()
    var postsArrayModel: [PostModel] = []
    init(vc: ProfileViewController) {
        self.vc = vc
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    func viewDidLoad() {
        self.getProfileData()
        self.getArrayData()
        self.vc?.reloadData()
    }
    
    func getProfileData() {
        profileModel = ProfileModel(ImageProfile: UIImage(named: "thor"),
                                    ProfileTwitter: "@twiterThunderThor",
                                    name: "thor odinson", job: "Avenger",
                                    city: "New York",
                                    followers: 200)
        
    }
    
    func getArrayData() {
        postsArrayModel.removeAll()
        postsArrayModel = [PostModel(profile: ProfileModel(ImageProfile: UIImage(named: "ww"),
                                                           ProfileTwitter: "@twiterWonderW",
                                                           name: "wonder woman", job: "justice legue",
                                                           city: "gotham",
                                                           followers: 300),
                                     postTitle: "Lorem ipsum dolor sit amet.",
                                     postMessage: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras nisl nunc, finibus ac nisi non, volutpat suscipit turpis. Curabitur varius tortor sit amet lorem lacinia sagittis. Integer eu lacus tristique mi cursus imperdiet. Sed congue nunc vehicula commodo tincidunt. Morbi non est lacus.",
                                     postFont: "comic sans",
                                     likesQty: 100,
                                     commentsQty: 25,
                                     postTime: Date())]
       
    }
    
    func getDataCellForRowPost() -> Int {
        return postsArrayModel.count
    }
    
}
