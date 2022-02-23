//
//  CarsTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Juan Manuel Pereira Sanchez on 23/2/22.
//

import UIKit

protocol CarsTableViewCellProtocol {
    func configCell(model: carModel)
}

class CarsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var myImageViewCars: UIImageView!
    @IBOutlet weak var myBrandLBL: UILabel!
    @IBOutlet weak var myColorLBL: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CarsTableViewCell: CarsTableViewCellProtocol {
    internal func configCell(model: carModel) {
        myBrandLBL.text = model.name
        myColorLBL.text = model.color
        myImageViewCars.image = model.image
    }
}
