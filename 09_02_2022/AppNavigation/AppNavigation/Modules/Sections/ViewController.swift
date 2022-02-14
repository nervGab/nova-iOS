//
//  ViewController.swift
//  AppNavigation
//
//  Created by Juan Manuel Pereira Sanchez on 13/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK - Outlets
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueV2" {
            if !(self.nameTF.text?.isEmpty ?? false) && !(self.surnameTF.text?.isEmpty ?? false) {
                let vc2 = segue.destination as! SecondViewController
                vc2.variables.nameData = self.nameTF.text
                vc2.variables.surnameData = self.surnameTF.text
            } else {
                present(displayAlertVC(title: "Hey!",
                                       message: "you have to fill the form"),
                        animated: true,
                        completion: nil)
            }
        }
    }
    
    @IBAction func closeVCs(segue: UIStoryboardSegue){
        print("")
    }
}

