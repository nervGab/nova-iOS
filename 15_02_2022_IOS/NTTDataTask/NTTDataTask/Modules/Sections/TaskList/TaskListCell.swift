//
//  TaskListCell.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 4/3/22.
//

import UIKit

class TaskListCell: UITableViewCell {
    
    @IBOutlet weak var myNombreLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
