//
//  GrouponDetailCell.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import UIKit

protocol GrouponDetailCellProtocol {
	func configCell(model: CardViewModel)
}

class GrouponDetailCell: UITableViewCell, ReuseIdentifierView {

	//MARK: - IBOutlet
	@IBOutlet weak var myDescriptionLabel: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension GrouponDetailCell: GrouponDetailCellProtocol{
	
	func configCell(model: CardViewModel) {
		self.myDescriptionLabel.text = model.finePrint
	}
	
}
