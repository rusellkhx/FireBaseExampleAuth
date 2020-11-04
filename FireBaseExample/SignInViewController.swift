//
//  SignInViewController.swift
//  FireBaseExample
//
//  Created by Rusell on 03.11.2020.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        
    }
    
    func checkValid() -> String? {
        if firstName.text == "" ||
            lastName.text == "" ||
            email.text == "" ||
            password.text == "" ||
            firstName.text == nil ||
            lastName.text == nil ||
            email.text == nil ||
            password.text == nil {
            
            return "Please add all fields"
        }
        return nil
    }
    
    
    @IBAction func registrationTapped(_ sender: Any) {
        let error = checkValid()
        if error != nil {
            errorLabel.isHidden = false
            errorLabel.text = error
        } else {
            Auth.auth().createUser(withEmail: email.text!,
                                   password: password.text!) {
                (result, error2) in
                if error2 != nil {
                    self.errorLabel.text = "\(String(describing: error2?.localizedDescription))"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": self.firstName.text!,
                                                              "lastname": self.lastName.text!,
                                                              "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            print("Error savong user in DB!")
                        }
                    }
                    
                }
                
            }
        }
    }
}
