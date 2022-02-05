//
//  ThirdViewController.swift
//  DayPicker
//
//  Created by Juan Manuel Pereira Sanchez on 4/2/22.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: - Variables
    var madridLocationsDataSource = ["La latina", "Salamanca", "Fuencarral", "Paracuellos del Jarama"]
    var postalCodeDataSource = ["28010", "28009", "28017", "28000"]
    var priorityDataSource = ["BAJA", "MEDIA", "ALTA", "MUY ALTA"]
    var profilePictureDataSource = ["felipe", "maria"]
    
    // MARK: - IBOutlets

    @IBOutlet weak var MadridLcation: UITextField!
    @IBOutlet weak var ZonePostalCode: UITextField!
    @IBOutlet weak var WorkPriority: UITextField!
    @IBOutlet weak var ProfilePictureImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
