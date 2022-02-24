//
//  PostTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 24/2/22.
//

import UIKit
protocol PostTableViewCellProtocol {
    func configCell(model: PostModel)
}

class PostTableViewCell: UITableViewCell {
    //MARK: - outlets
    @IBOutlet weak var myMessageLBL: UILabel!
    @IBOutlet weak var myImageViewPost: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension PostTableViewCell: PostTableViewCellProtocol {
    func configCell(model: PostModel) {
        self.myMessageLBL.text = model.postMessage
        self.myImageViewPost.image = model.ImagePost

    }
    
    
}
