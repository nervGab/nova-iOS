//
//  ViewController.swift
//  AppHelloWorld
//
//  Created by Juan Manuel Pereira Sanchez on 2/2/22.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IBOutlet

    @IBOutlet weak var firstLBLTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var helloWorldLBL: UILabel!
    @IBOutlet weak var byeWorldLBL: UILabel!
    // MARK: - IBActions
    @IBAction func changeNameAction(_ sender: Any) {
        helloWorldLBL.text = "hello NOVA iOS emeal NTTDATA"
        byeWorldLBL.text = "bye bye NTTDATA!"
    }
    // MARK: - life VC
    override func viewDidLoad() {
        super.viewDidLoad()

        print("hello NOVA")
        firstLBLTrailingConstraint.constant = 50
    }

    
}

// MARK: - Extension VC
