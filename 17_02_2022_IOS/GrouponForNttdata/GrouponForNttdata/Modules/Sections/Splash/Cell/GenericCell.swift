//
//  GenericCell.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 3/3/22.
//

import UIKit

protocol GenericCellPRotocol {
	func configCell(data: DataViewModel)
}

class GenericCell: UITableViewCell, ReuseIdentifierView {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension GenericCell: GenericCellPRotocol {
	
	func configCell(data: DataViewModel) {
		
	}
	
}
