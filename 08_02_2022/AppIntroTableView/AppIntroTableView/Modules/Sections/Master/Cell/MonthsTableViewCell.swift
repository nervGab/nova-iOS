//
//  MonthsTableViewCell.swift
//  AppIntroTableView
//
//  Created by Juan Manuel Pereira Sanchez on 12/2/22.
//

import UIKit

protocol MonthsTableViewCellProtocol {
    func setupCell(name: String)
}

class MonthsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var nameMonthsLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}

extension MonthsTableViewCell: MonthsTableViewCellProtocol {
    internal func setupCell(name: String) {
        self.nameMonthsLBL.text = name
    }
}
