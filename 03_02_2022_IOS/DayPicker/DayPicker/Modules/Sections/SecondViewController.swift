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
    @IBOutlet weak var titleCheeseLBL: UILabel!
    @IBOutlet weak var detailCheeseTextView: UITextView!
    @IBOutlet weak var chesseImageView: UIImageView!
    @IBOutlet weak var selectionCheesePickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selectionCheesePickerView.delegate = self
        self.selectionCheesePickerView.dataSource = self
        
        self.title = pickerCheeseArrayData[0]
        self.titleCheeseLBL.text = pickerCheeseArrayData[0]
        self.chesseImageView.image = UIImage(named: pickerCheeseArrayData[0])
        self.detailCheeseTextView.text = "plastic or stretched-curd cheese; the curd is mixed with heated whey and stretched and kneaded until it attains a smooth, pliable consistency. ... It is then molded into spheres or ovals and stored in water to keep it moist."
    }

}


// MARK: - Picker Extensions

extension SecondViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerCheeseArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.title = pickerCheeseArrayData[row]
        self.titleCheeseLBL.text = pickerCheeseArrayData[row]
        self.chesseImageView.image = UIImage(named: pickerCheeseArrayData[row])
        switch row {
        case 0:
            self.detailCheeseTextView.text = "pliable consistency. ... It is then molded into spheres or ovals and stored in water to keep it moist."
        case 1:
            self.detailCheeseTextView.text = "the curd is mixed with heated whey and stretched and kneaded until it attains a smooth, pliable consistency."
        case 2:
            self.detailCheeseTextView.text = "the curd is mixed with heated whey and stretched and kneaded until it attains a smooth."
        case 3:
            self.detailCheeseTextView.text = "the curd is mixed with heated whey and stretched and kneaded."
        case 4:
            self.detailCheeseTextView.text = "the curd is mixed with heated"
        default:
            self.detailCheeseTextView.text = "the curd is "
        }
    }
}

extension SecondViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerCheeseArrayData.count
    }
}
