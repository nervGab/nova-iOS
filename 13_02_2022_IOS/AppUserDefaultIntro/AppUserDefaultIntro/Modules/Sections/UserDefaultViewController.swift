//
//  UserDefaultViewController.swift
//  AppUserDefaultIntro
//
//  Created by Juan Manuel Pereira Sanchez on 25/2/22.
//

import UIKit

class UserDefaultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var myImageProfile: UIImageView!
    @IBOutlet weak var myNameTF: UITextField!
    @IBOutlet weak var mySurnameTF: UITextField!
    @IBOutlet weak var myAddressTF: UITextField!
    @IBOutlet weak var myPhoneTF: UITextField!
    @IBOutlet weak var myLastUpdateLBL: UILabel!
    var thereIsPhoto = false
    // MARK: - Actions
    @IBAction func saveDataAction(_ sender: Any) {
        if !(myNameTF.text?.isEmpty ?? false) &&
        !(mySurnameTF.text?.isEmpty ?? false) &&
        !(myAddressTF.text?.isEmpty ?? false) &&
        !(myPhoneTF.text?.isEmpty ?? false) &&
        thereIsPhoto {
            
            Utils.UserDefaultDDBB.prefs.set(self.myNameTF.text, forKey: Utils.Constants.name)
            Utils.UserDefaultDDBB.prefs.set(self.mySurnameTF.text, forKey: Utils.Constants.surname)
            Utils.UserDefaultDDBB.prefs.set(self.myAddressTF.text, forKey: Utils.Constants.address)
            Utils.UserDefaultDDBB.prefs.set(self.myPhoneTF.text, forKey: Utils.Constants.phone)

            let lastUpdate = Date()
            Utils.UserDefaultDDBB.prefs.set(lastUpdate, forKey: Utils.Constants.lastUpdate)
            
            let imageData = self.myImageProfile.image?.jpegData(compressionQuality: 0.5)
            Utils.UserDefaultDDBB.prefs.set(imageData, forKey: Utils.Constants.ProfileImage)
            
            present(Utils.showAlertView(title: "Data Saved successfully!", message: "", callBack: {
                self.myNameTF.text = ""
                self.mySurnameTF.text = ""
                self.myAddressTF.text = ""
                self.myPhoneTF.text = ""
                self.myLastUpdateLBL.text = ""
                self.myImageProfile.image = UIImage(named: "placeholder")
            }), animated: true, completion: nil)
            
        } else {
            present(Utils.showAlertView(title: "Please", message: "Complete de form", callBack: {
                //
            }), animated: true, completion: nil)
      }
    }
    
    @IBAction func recoveryDataAction(_ sender: Any) {
        if let imageData = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constants.ProfileImage) as? Data {
            self.myImageProfile.image = UIImage(data: imageData)
        }
        
        Utils.UserDefaultDDBB.dateFormatter.dateStyle = .medium
        
        if let lastUpdate = Utils.UserDefaultDDBB.prefs.object(forKey: Utils.Constants.lastUpdate) as? Date {
            self.myLastUpdateLBL.text = "Last Update: \(Utils.UserDefaultDDBB.dateFormatter.string(from: lastUpdate as Date))"
        } else {
            self.myLastUpdateLBL.text = "Update not done"
        }
        
        if let nameData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constants.name) {
            self.myNameTF.text = nameData
        }
        if let surnameData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constants.surname) {
            self.mySurnameTF.text = surnameData
        }
        if let addressData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constants.address) {
            self.myAddressTF.text = addressData
        }
        if let phoneData = Utils.UserDefaultDDBB.prefs.string(forKey: Utils.Constants.phone) {
            self.myPhoneTF.text = phoneData
        }
        
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myImageProfile.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showActionGesture))
        self.myImageProfile.addGestureRecognizer(tapGR)
    }
    // MARK: - Private methods
    
    @objc
    func showActionGesture() {
        showPickerPhoto()
    }
}

//snniped de camara (basic)
extension UserDefaultViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showPickerPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu(){
        
        let actionSheet = UIAlertController(title: "Select the option", message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { _ in
            self.takePhotoWithCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "choose photo from library", style: .default, handler: { _ in
            self.choosePhotoFromLibrary()
        }))
        present(actionSheet, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    // TODO: check this
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickerImage = info[.originalImage] as? UIImage {
//            self.myImageProfile.ContentMode = .scaleAspectFill
            self.myImageProfile.image = pickerImage
            self.thereIsPhoto = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel (_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


class Utils {
    
    struct UserDefaultDDBB {
        static let prefs = UserDefaults.standard
        static let dateFormatter = DateFormatter()
    }
                 
    struct Constants {
        // MARK: - Constants
        static let name = "NAME"
        static let surname = "SURNAME"
        static let address = "ADDRESS"
        static let phone = "PHONE"
        static let lastUpdate = "LAST_UPDATE"
        static let ProfileImage = "PROFILE_IMAGE"
    }
    
    static func showAlertView(title:String, message: String, callBack: @escaping () -> ()) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            callBack()
        }))
        return alertVC
    }
}
