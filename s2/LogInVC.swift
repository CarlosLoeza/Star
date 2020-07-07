//
//  LogInVC.swift
//  s2
//
//  Created by Carlos Loeza on 6/11/20.
//  Copyright © 2020 Carlos Loeza. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Allows use to close the keyboard once a user clicks outside of the keyboard
        self.hideKeyboardWhenTappedAround()
        
        if #available(iOS 13.0, *) {
            emailTextField.textColor = .black // System Color
            passwordTextField.textColor = .black
        } else {
            // Fallback on earlier versions
            emailTextField.textColor = .black
            passwordTextField.textColor = .black
        }
    }
    
}

// This extension allows us to close the keyboard in multiple viewcontrollers by calling it
// using: self.hideKeyboardWhenTappedAround() in viewDidLoad()
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
