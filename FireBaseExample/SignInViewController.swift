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
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        error.isHidden = true
        
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
        if checkValid() != nil {
            error.isHidden = false
            error.text = checkValid()
        } else {
            Auth.auth().createUser(withEmail: email.text!,
                                   password: password.text!) {
                (result, error) in
                if error != nil {
                    self.error.text = "\(String(describing: error?.localizedDescription))"
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname": self.firstName.text!,
                                                              "lastname": self.lastName.text!,
                                                              "uid": result!.user.uid
                    ]) { (error) in
                        if error != nil {
                            fatalError("Error savong user in DB!")
                        }
                    }
                }
                
            }
        }
    }
}
