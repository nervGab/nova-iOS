//
//  ProfileModel.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 24/2/22.
//

import Foundation
import UIKit

struct ProfileModel {
    var ImageProfile: UIImage?
    var ProfileTwitter: String?
    var name: String?
    var job: String?
    var city: String?
    var followers: Int?
}

struct PostModel {
    var profile: ProfileModel?
    var postTitle: String?
    var postMessage: String?
    var postFont: String?
    var likesQty: Int?
    var commentsQty: Int?
    var postTime: Date?
}
