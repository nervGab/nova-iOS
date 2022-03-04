//
//  DetailProfileCell.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 1/3/22.
//

import UIKit
protocol DetailProfileCellProtocol {
    func configCell(model: ArrayContact)
}
class DetailProfileCell: UITableViewCell {
//MARK: - outlets
    @IBOutlet weak var myProfileImage: UIImageView!
    @IBOutlet weak var myNameLBL: UILabel!
    @IBOutlet weak var mySurnameLBL: UILabel!
    @IBOutlet weak var myEmailLBL: UILabel!
    @IBOutlet weak var myLinkedIn: UILabel!
    @IBOutlet weak var myDescriptionLBL: UILabel!
    @IBOutlet weak var myExperienceLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func setupView(){
        self.myProfileImage.layer.cornerRadius = self.myProfileImage.frame.width * 0.5
        self.myProfileImage.layer.borderWidth = 1
        self.myProfileImage.layer.borderColor = UIColor.green.cgColor
    }
    
}
extension DetailProfileCell: DetailProfileCellProtocol{
    func configCell(model: ArrayContact) {
        self.myProfileImage.image = UIImage(named: model.imageProfile ?? "placeholder")
        self.myNameLBL.text = model.firstName
        self.mySurnameLBL.text = model.lastName
        self.myEmailLBL.text = model.email
        self.myLinkedIn.text = model.cuentaLinkedin
        self.myDescriptionLBL.text = model.descriptionCV
        self.myExperienceLBL.text = model.experienciaCV
    }
}
