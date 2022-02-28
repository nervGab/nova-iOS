//
//  ContactsTableViewCell.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 28/2/22.
//

import UIKit
protocol ContactsCellProtocol {
    func configCell(data: ArrayContact)
}
class ContactsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myNameLBL: UILabel!
    @IBOutlet weak var mySurnameLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.myProfileImage.layer.cornerRadius = self.myProfileImage.frame.width * 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContactsTableViewCell: ContactsCellProtocol {
    internal func configCell(data: ArrayContact) {
        self.myProfileImage.image = UIImage(named: data.imageProfile ?? "placeholder")
        self.myNameLBL.text = data.firstName
        self.mySurnameLBL.text = data.lastName
    }
}
