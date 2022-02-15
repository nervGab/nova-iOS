//
//  ThirdViewController.swift
//  AppNavigation
//
//  Created by Juan Manuel Pereira Sanchez on 13/2/22.
//

import UIKit

class ThirdViewController: UIViewController {
    // MARK - Global variables
    var variables = GlobalUserData()
    var cityLocationDataSource = ["Valencia", "Madrid", "barcelona", "Vigo"]
    var postalCodeDataSource = ["28010", "28009", "28017", "28000"]
    var geoLocationDataSource = ["140.4512/-34.2514", "98.3452/-53.2784", "432.5678/-34.3434", "140.4512/-34.2514"]
    // MARK - Oulets

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var surnameLBL: UILabel!
    @IBOutlet weak var phoneLBL: UILabel!
    @IBOutlet weak var addressLBL: UILabel!
    @IBOutlet weak var dogAgeLBL: UILabel!
    @IBOutlet weak var phoneTF: UITextField!//location
    @IBOutlet weak var postalCodeTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!//geolocation
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
        
    }
    
    private func setupUI(){
        self.nameLBL.text = variables.nameData
        self.surnameLBL.text = variables.surnameData
        self.phoneLBL.text = variables.phoneData
        self.addressLBL.text = variables.addressData
        self.dogAgeLBL.text = variables.dogAgeData

       self.phoneTF.inputView = createPickerView(textField: phoneTF, array: cityLocationDataSource, tag: 0, delegate: self, dataSourcePicker: self)
        self.postalCodeTF.inputView = createPickerView(textField: postalCodeTF, array: postalCodeDataSource, tag: 1, delegate: self, dataSourcePicker: self)
        self.cityTF.inputView = createPickerView(textField: cityTF, array: geoLocationDataSource, tag: 2, delegate: self, dataSourcePicker: self)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV4" {
            if !(self.phoneTF.text?.isEmpty ?? false) && !(self.postalCodeTF.text?.isEmpty ?? false) && !(self.cityTF.text?.isEmpty ?? false) {
                let vc4 = segue.destination as! ThirdViewController

                vc4.variables = variables
                vc4.variables.geoPositionData = self.phoneTF.text
                vc4.variables.postalCodeData = self.postalCodeTF.text
                vc4.variables.cityData = self.cityTF.text

            } else {
                present(displayAlertVC(title: "Hey!",
                                       message: "you have to fill the form"),
                        animated: true,
                        completion: nil)
            }
        }
    }

}

extension ThirdViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 0:
            return cityLocationDataSource[row]
        case 1:
            return postalCodeDataSource[row]
        default:
            return geoLocationDataSource[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            phoneTF.text =  cityLocationDataSource[row]
            self.view.endEditing(true)

        case 1:
            postalCodeTF.text =  postalCodeDataSource[row]
            self.view.endEditing(true)

        default:
            cityTF.text = geoLocationDataSource[row]
            self.view.endEditing(true)
        }
//        self.view.endEditing(true)
    }
}
extension ThirdViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return cityLocationDataSource.count
        case 1:
            return postalCodeDataSource.count
        default:
            return geoLocationDataSource.count
        }
    }
}
