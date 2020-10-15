//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Invalid Email/Password Combination", message: "Please try again", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))

        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                print(e.localizedDescription)
                
                self?.present(alert, animated: true, completion: nil)
            } else {
                self?.performSegue(withIdentifier: K.loginSegue, sender: self)
            }
            }
        }
    }
    
}
