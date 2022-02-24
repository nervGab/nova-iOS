//
//  ProfileTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import UIKit

protocol ProfileTableViewCellProtocol {
    func configCell(model: ProfileModel)
}

class ProfileTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var myImageViewPofile: UIImageView!
    @IBOutlet weak var myTwitrerLBL: UILabel!
    @IBOutlet weak var myNameLBL: UILabel!
    @IBOutlet weak var myJobLBL: UILabel!
    @IBOutlet weak var myCityLBL: UILabel!
    @IBOutlet weak var myFollowersLBL: UILabel!

    
    // MARK: - Actions
    
    @IBAction func sendMail(_ sender: Any) {
    }
    
    @IBAction func shareInfo(_ sender: Any) {
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProfileTableViewCell: ProfileTableViewCellProtocol {
    func configCell(model: ProfileModel) {
        self.myImageViewPofile.image = model.ImageProfile
    }
    
    
}
