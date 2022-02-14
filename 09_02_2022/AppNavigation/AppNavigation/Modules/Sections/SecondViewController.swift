//
//  SecondViewController.swift
//  AppNavigation
//
//  Created by Juan Manuel Pereira Sanchez on 13/2/22.
//

import UIKit

class SecondViewController: UIViewController {
    // MARK - Global variables
    var variables = GlobalUserData()
    var dogAgeInt: Int?
    // MARK - Outlets
    @IBOutlet weak var nameLBL: UILabel!
    @IBOutlet weak var surnameLBL: UILabel!
    @IBOutlet weak var dogAgeLBL: UILabel!
    
    @IBOutlet weak var dogAgeTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    
    

    
    // MARK: - Actions
    @IBAction func DogAgeTFAction(_ sender: Any) {
        dogAgeInt = Int(dogAgeTF.text ?? "")
        if let DogAgeDes = dogAgeInt {
            let realDogAge = DogAgeDes * 7
            self.dogAgeLBL.text = "the age of my dog is: \(realDogAge)"
        } else {
            present(displayAlertVC(title: "Error",
                                   message: "please. set your dog age"),
                    animated: true) {
                //we pop to the previous view, after alert completion, with navigationController
//                if let nav = self.navigationController {
//                    nav.popViewController(animated: true)
//                }
                self.popVC()
            }
        }
    }
    
    func popVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navController = UINavigationController(rootViewController: vc)
        navController.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI(){
        self.nameLBL.text = variables.nameData
        self.surnameLBL.text = variables.surnameData
        self.phoneTF.keyboardType = .numberPad
        self.dogAgeTF.keyboardType = .numberPad
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV3" {
            if !(self.dogAgeTF.text?.isEmpty ?? false) && !(self.phoneTF.text?.isEmpty ?? false) && !(self.addressTF.text?.isEmpty ?? false) {
                let vc3 = segue.destination as! ThirdViewController

                vc3.variables = variables
                vc3.variables.dogAgeData = self.dogAgeLBL.text
                vc3.variables.phoneData = self.phoneTF.text
                vc3.variables.addressData = self.addressTF.text

            } else {
                present(displayAlertVC(title: "Hey!",
                                       message: "you have to fill the form"),
                        animated: true,
                        completion: nil)
            }
        }
    }
}
