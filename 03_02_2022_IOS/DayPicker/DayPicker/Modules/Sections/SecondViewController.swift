//
//  SecondViewController.swift
//  DayPicker
//
//  Created by Juan Manuel Pereira Sanchez on 4/2/22.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Local Variables
    var pickerCheeseArrayData = ["mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleChesseLBL: UILabel!
    @IBOutlet weak var detailChesseTexView: UITextView!
    @IBOutlet weak var chesseImageView: UIImageView!
    @IBOutlet weak var selectionChessePickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
