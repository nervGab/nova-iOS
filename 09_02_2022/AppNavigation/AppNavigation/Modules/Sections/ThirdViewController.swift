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
    
    // MARK - Oulets

    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var surnameLBL: UILabel!
    @IBOutlet weak var phoneLBL: UILabel!
    @IBOutlet weak var addressLBL: UILabel!
    @IBOutlet weak var dogAgeLBL: UILabel!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    
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

        self.phoneTF.keyboardType = .numberPad
        self.postalCodeTF.keyboardType = .numberPad
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
