//
//  Helpers+Utils.swift
//  AppNavigation
//
//  Created by Juan Manuel Pereira Sanchez on 13/2/22.
//

import Foundation
import UIKit

func displayAlertVC(title: String, message: String) ->UIAlertController {
    let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    return alertVC
}

func createPickerView(textField: UITextField, array: [String], tag: Int, delegate: UIPickerViewDelegate, dataSourcePicker: UIPickerViewDataSource) -> UIPickerView {
    let pickerView = UIPickerView()
    pickerView.delegate = delegate
    pickerView.dataSource = dataSourcePicker
    pickerView.tag = tag
    textField.inputView = pickerView
    textField.text = array[0]
    return pickerView

}


struct GlobalUserData {
    var nameData: String?
    var surnameData: String?
    var phoneData: String?
    var addressData: String?
    var dogAgeData: String?
    var postalCodeData: String?
    var cityData: String?
    var geoPositionData: String?
}
