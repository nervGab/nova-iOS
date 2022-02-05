//
//  ThirdViewController.swift
//  DayPicker
//
//  Created by Juan Manuel Pereira Sanchez on 4/2/22.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK: - Variables
    var madridLocationDataSource = ["La latina", "Salamanca", "Fuencarral", "Paracuellos del Jarama"]
    var postalCodeDataSource = ["28010", "28009", "28017", "28000"]
    var priorityDataSource = ["BAJA", "MEDIA", "ALTA", "MUY ALTA"]
    var profilePictureDataSource = ["victor", "estefania"]
    
    // MARK: - IBOutlets

    @IBOutlet weak var MadridLocation: UITextField!
    @IBOutlet weak var ZonePostalCode: UITextField!
    @IBOutlet weak var WorkPriority: UITextField!
    @IBOutlet weak var ProfilePictureImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ProfilePictureImageView.image = UIImage(named: profilePictureDataSource[0])
        
        createPickerView(myTag: 0, myTextFieldCustom: MadridLocation, myArray: madridLocationDataSource)
        createPickerView(myTag: 1, myTextFieldCustom: ZonePostalCode, myArray: postalCodeDataSource)
        createPickerView(myTag: 2, myTextFieldCustom: WorkPriority, myArray: priorityDataSource)

        
    }

    private func createPickerView(myTag: Int, myTextFieldCustom: UITextField, myArray: [String]) {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = myTag
        myTextFieldCustom.inputView = pickerView
        myTextFieldCustom.text = myArray[0]
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ThirdViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return madridLocationDataSource.count
        case 1:
            return postalCodeDataSource.count
        default:
            return priorityDataSource.count
        }
    }
}

extension ThirdViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return madridLocationDataSource[row]
        case 1:
            return postalCodeDataSource[row]
        default:
            return priorityDataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            MadridLocation.text =  madridLocationDataSource[row]
        case 1:
            ZonePostalCode.text =  postalCodeDataSource[row]
        default:
            WorkPriority.text = priorityDataSource[row]
            self.ProfilePictureImageView.image = UIImage(named: profilePictureDataSource[Int(Double(row) * 0.5)])

        }
    }
}
