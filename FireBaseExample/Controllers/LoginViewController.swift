//
//  LoginViewController.swift
//  FireBaseExample
//
//  Created by Rusell on 03.11.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func autorizationTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!,
                           password: passwordTextField.text!) { (result, error) in
            if error != nil {
               self.showAlert(with: "YOU ARE NOT LOGGED IN, PLEASE TRY AGAIN!", and: "")
            } else {
               self.showAlert(with: "YOU LOGIN SUCCESSFULLY!", and: "")
            }
        }
    }
}
