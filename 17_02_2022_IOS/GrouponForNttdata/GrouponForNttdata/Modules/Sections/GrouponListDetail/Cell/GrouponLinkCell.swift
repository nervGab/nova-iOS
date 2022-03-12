//
//  GrouponLinkCell.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import UIKit

protocol GrouponLinkCellDelegate: AnyObject {
	func sendModelData(_ cell: UITableViewCell, url: String)
}

protocol GrouponLinkCellProtocol {
	func configCell(model: CardViewModel)
}

class GrouponLinkCell: UITableViewCell, ReuseIdentifierView {

	//MARK: - Variables
	var dataUrl: String?
	weak var delegate: GrouponLinkCellDelegate!
	
	//MARK: - IBOutlet
	@IBOutlet weak var myLinkButton: UIButton!
	
	//MARK: - IBOutlet Actions
	@IBAction func showLinkGrouponAction(_ sender: Any) {
		if let dataUrlDes = self.dataUrl {
			self.delegate.sendModelData(self, url: dataUrlDes)
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension GrouponLinkCell: GrouponLinkCellProtocol {
	
	func configCell(model: CardViewModel) {
		self.dataUrl = model.dealUrl
		self.myLinkButton.setTitle(model.dealUrl ?? "", for: .normal)
	}
		
}
