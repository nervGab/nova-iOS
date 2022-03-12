//
//  GrouponCell.swift
//  GrouponForNttdata
//
//  Created by Juan Manuel Pereira Sanchez on 8/3/22.
//

import UIKit
import Kingfisher

protocol GrouponCellProtocol {
	func configCell(data: CardViewModel)
}

class GrouponCell: UITableViewCell, ReuseIdentifierView {

	// MARK: - IBOutlet
	@IBOutlet weak var myImageGrouponView: UIImageView!
	@IBOutlet weak var myTitleLabel: UILabel!
	@IBOutlet weak var myTendenciaLabel: UILabel!
	@IBOutlet weak var myDescriptionLabel: UILabel!
	@IBOutlet weak var myPriceLabel: UILabel!
	@IBOutlet weak var myPromotionLabel: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension GrouponCell: GrouponCellProtocol {
	func configCell(data: CardViewModel) {
		let url = URL(string: data.largeImageUrl ?? "")
		self.myImageGrouponView.layer.cornerRadius = 20
		self.myImageGrouponView.layer.borderColor = UIColor.gray.cgColor
		self.myImageGrouponView.layer.borderWidth = 1
		self.myImageGrouponView.kf.setImage(with: url,
											placeholder: UIImage(named: "placeHolder"),
											options: [
												.scaleFactor(UIScreen.main.scale),
												.transition(.fade(1)),
												.cacheOriginalImage
											],
											completionHandler: nil)
		self.myTendenciaLabel.text = "Tendencias"
		if !(data.tags?.isEmpty ?? false) {
			self.myTitleLabel.text = data.tags?[0].name ?? ""
		}
		self.myDescriptionLabel.text = data.descriptor
		self.myPriceLabel.text = "Desde \(data.priceSummary?.value?.formattedAmount ?? "")"
		self.myPromotionLabel.text = data.highlightsHtml
	}
	
}
