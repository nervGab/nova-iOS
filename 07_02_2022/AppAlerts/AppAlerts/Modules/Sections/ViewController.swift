//
//  ViewController.swift
//  AppAlerts
//
//  Created by Juan Manuel Pereira Sanchez on 7/2/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Local variables
    var LoginTextField: UITextField?
    var passwordTextField: UITextField?
    
    // MARK: - IBOutlets
    @IBOutlet weak var uiAlertControllerSimple: UIButton!

    
    // MARK: - IBActions
    @IBAction func alertVC(_ sender: AnyObject) {
        switch sender.tag {
        case 0:
//            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "default presentation alert controller", preferredStyle: .alert)
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            let aceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
//            alertVC.addAction(cancelAction)
//            alertVC.addAction(aceptAction)
            
            self.present(self.myAlertVC(title: "Alert Controller Standard", message: "message"),
                         animated: true,
                         completion: nil)
        case 1:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "this alert controller  have a textfield", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let aceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                if !(self.LoginTextField?.text?.isEmpty ?? false){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
                    self.present(vc, animated: true)
                }
                
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(aceptAction)
            alertVC.addTextField { (textResult) in
                self.LoginTextField = textResult
                self.LoginTextField?.placeholder = "Username"
            }
            
            self.present(alertVC, animated: true, completion: nil)
            
        case 2:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "alert controller login form", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let aceptAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
                if !(self.LoginTextField?.text?.isEmpty ?? false) && !(self.passwordTextField?.text?.isEmpty ?? false){
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
                
            })
            alertVC.addAction(cancelAction)
            alertVC.addAction(aceptAction)
            
            alertVC.addTextField { (textResult) in
                self.LoginTextField = textResult
                self.LoginTextField?.placeholder = "Username"
            }
            alertVC.addTextField { (textResult) in
                self.passwordTextField = textResult
                self.passwordTextField?.placeholder = "Password"
                self.passwordTextField?.isSecureTextEntry = true
            }
            
            self.present(alertVC, animated: true, completion: nil)
        case 3:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "multipleBTN alert controller", preferredStyle: .alert)
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let aceptAction = UIAlertAction(title: "Accept", style: .default, handler: nil)
            alertVC.addAction(UIAlertAction(title: "third BTN", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "fourth BTN", style: .default, handler: { _ in
                self.choosePhotoLibrary()
                
            }))
            self.present(alertVC, animated: true, completion: nil)

        default:
            let alertVC = UIAlertController(title: "Alert Controller Standard", message: "ActionSheet standard", preferredStyle: .actionSheet)
            
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let aceptAction = UIAlertAction(title: "Accept", style: .default, handler: nil)
            alertVC.addAction(UIAlertAction(title: "third BTN", style: .destructive, handler: nil))
            alertVC.addAction(UIAlertAction(title: "fourth BTN", style: .default, handler: { _ in
                self.choosePhotoLibrary()
                
            }))
            self.present(alertVC, animated: true, completion: nil)

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizationButton()
        // Do any additional setup after loading the view.
    }

    //MARK: - PrivateMethods
    
    private func customizationButton() {
        uiAlertControllerSimple.layer.cornerRadius = 24
    }
    
    private func myAlertVC(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: "Alert Controller Standard", message: "ActionSheet standard", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let aceptAction = UIAlertAction(title: "Accept", style: .default, handler: nil)
        alertVC.addAction(cancelAction)
        alertVC.addAction(aceptAction)
        return alertVC
    }

}
// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func choosePhotoLibrary(){
        let imagePC = UIImagePickerController()
//        imagePC.sourceType = .camera
        imagePC.sourceType = .photoLibrary
        imagePC.delegate = self
        imagePC.allowsEditing = true
        present(imagePC, animated: true, completion: nil)
    }
}
