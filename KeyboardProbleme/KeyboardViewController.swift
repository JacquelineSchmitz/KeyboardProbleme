//
//  ViewController.swift
//  KeyboardProbleme
//
//  Created by Jacqueline Schmitz on 23.11.22.
//

import UIKit

class KeyboardViewController: UIViewController, UITextFieldDelegate {
    

    
    @IBOutlet weak var erstesTextField: UITextField!
    @IBOutlet weak var zweitesTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        erstesTextField.delegate = self
        zweitesTextField.delegate = self
        self.dismissKeyboard()
       
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    @objc func dismissKeyboardTouchOutside(){
        view.endEditing(true)
    }
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
}

