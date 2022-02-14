//
//  FourthViewController.swift
//  AppNavigation
//
//  Created by Juan Manuel Pereira Sanchez on 13/2/22.
//

import UIKit
import MessageUI

class FourthViewController: UIViewController {
    // MARK - Global variables
    var variables = GlobalUserData()
    
    @IBAction func sendEmailAction(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            present(configMailCompose(), animated: true, completion: nil)
        } else {
            present(displayAlertVC(title: "Error", message: "you can't send the mail"), animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func configMailCompose() -> MFMailComposeViewController {
        let mailComp = MFMailComposeViewController()
        mailComp.mailComposeDelegate = self
        mailComp.setToRecipients([""])//permite que el usuario escriba la dirección de correo
        mailComp.setSubject("")
        let emailBody = "this is my personal info \n\n name: \(variables.nameData) \n surname: \(variables.surnameData) \n phone: \(variables.phoneData) \n address: \(variables.addressData) \n dog's name: \(variables.dogAgeData) \n postal code: \(variables.postalCodeData) \n city: \(variables.cityData) \n geographicalPosition: \(variables.geoPositionData) \n\n  Kind regards \n JuanMa Pereira"
        
        mailComp.setMessageBody(emailBody, isHTML: false)
        return mailComp
    }
}

extension FourthViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
