//
//  ViewController.swift
//  DayPicker
//
//  Created by Juan Manuel Pereira Sanchez on 3/2/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var myDateLBL: UILabel!
    @IBOutlet weak var myDateTextfield: UITextField!
    
    @IBAction func showPickerTextFieldACTION(myTextField: UITextField){
        let pickerDateView = UIDatePicker()
        pickerDateView.datePickerMode = .dateAndTime
        pickerDateView.preferredDatePickerStyle = .wheels
        myTextField.inputView = pickerDateView
        pickerDateView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @objc
    func datePickerValueChanged(_ myCustomDatePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.myDateLBL.text = dateFormatter.string(from: myCustomDatePicker.date)
    }

}

