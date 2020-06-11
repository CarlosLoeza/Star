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
