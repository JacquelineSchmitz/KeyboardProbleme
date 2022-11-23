//
//  ViewController.swift
//  KeyboardProbleme
//
//  Created by Jacqueline Schmitz on 23.11.22.
//

import UIKit

class KeyboardViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    
    
    @IBOutlet weak var erstesTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var zweitesTextField: UITextField!
    @IBOutlet weak var drittesTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        erstesTextField.delegate = self
        textView.delegate = self
        zweitesTextField.delegate = self
        drittesTextField.delegate = self
        textView.inputAccessoryView = createToolbar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        self.dismissKeyboard()
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if self.view.frame.origin.y == 0 && (drittesTextField.isFirstResponder) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notificayion: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
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
    
    @objc func donePressed() {
        textView.endEditing(true)
    }
    
    @objc func trashPressed() {
        textView.endEditing(true)
    }
    
        func createToolbar() -> UIToolbar{
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
            let trashButton = UIBarButtonItem(barButtonSystemItem: .trash, target: nil, action: #selector(trashPressed))
            
            toolbar.setItems([doneButton, trashButton], animated: true)
            return toolbar
            
            
            
            //            toolbar.setItems([trashButton], animated: true)
            
        }
        
        
    }

