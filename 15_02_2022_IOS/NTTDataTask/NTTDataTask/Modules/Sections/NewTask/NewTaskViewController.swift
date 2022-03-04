//
//  NewTaskViewController.swift
//  NTTDataTask
//
//  Created by Juan Manuel Pereira Sanchez on 4/3/22.
//

import UIKit

class NewTaskViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayPrioridad = ["ALTA", "MEDIA - ALTA", "MEDIA", "BAJA", "SIN PRIORIDAD"]
    let TEXT_FIELD_LIMIT = 140
    var nombreCategoria = "Sin Categoría"
    var fotoSeleccionada = false
    
    //MARK: - IBOUTLET
    @IBOutlet weak var myNuevaTareaTF: UITextField!
    @IBOutlet weak var myPrioridadNuevaTareaTF: UITextField!
    @IBOutlet weak var myFechaNuevaTarea: UITextField!
    @IBOutlet weak var myPresentaNuevaCategoriaLBL: UILabel!
    @IBOutlet weak var myCategoriaButton: UIButton!
    @IBOutlet weak var mySalvarTareaButton: UIButton!
    @IBOutlet weak var myImagenNuevaTareaIV: UIImageView!
    @IBOutlet weak var myContadorCaracteres: UILabel!
    @IBOutlet weak var descripcionTarea: UITextField!
    
    @IBAction func SaveTaskUD(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    private func setupViews(){
        //1
        self.myCategoriaButton.layer.cornerRadius = 10
        self.mySalvarTareaButton.layer.cornerRadius = 10
        //2
        self.myImagenNuevaTareaIV.layer.cornerRadius = 10
        self.myImagenNuevaTareaIV.layer.borderWidth = 1
        self.myImagenNuevaTareaIV.layer.borderColor = UIColor.purple.cgColor
        self.myImagenNuevaTareaIV.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(showPickerImage))
        self.myImagenNuevaTareaIV.addGestureRecognizer(tapGR)


    }
    @objc
    func showPickerImage() {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            showPhotoMenu()
        }else{
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu(){
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Tomar Foto", style: .default) { Void  in
            self.takePhotowithCamera()
        }
        let chooseFromLibraryAction = UIAlertAction(title: "Escoge de la Librería", style: .default) { Void  in
            self.choosePhotoFromLibrary()
        }
        alertVC.addAction(cancelAction)
        alertVC.addAction(takePhotoAction)
        alertVC.addAction(chooseFromLibraryAction)
        present(alertVC, animated: true, completion: nil)
    }
    
    func takePhotowithCamera(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }

}
//MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate


//MARK: - UIPickerViewDataSource, UIPickerViewDelegate


//MARK: - CategoriaViewControllerDelegate
