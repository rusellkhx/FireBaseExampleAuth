//
//  SignInViewController.swift
//  FireBaseExample
//
//  Created by Rusell on 03.11.2020.
//

import UIKit
import Firebase
import FirebaseAuth

enum AuthResult {
    case success
    case failure(Error)
}

class SignInViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func register(email: String?, password: String?, completion: @escaping (AuthResult) -> Void) {
        
        guard CheckUser.isFilled(firstname: firstNameTextField.text,
                                  lastName: lastNameTextField.text,
                                  email: emailTextField.text,
                                  password: passwordTextField.text) else {
                                    completion(.failure(AuthError.notFilled))
                                    return
        }
        guard let email = email, let password = password else {
            completion(.failure(AuthError.unknownError))
            return
        }
        
        guard CheckUser.isSimpleEmail(email) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let _ = result else {
                completion(.failure(error!))
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users").addDocument(data: [
                "firstname": self.firstNameTextField.text!,
                "lastname": self.lastNameTextField.text!,
                "uid": result!.user.uid
            ]) { (error) in
                if error != nil {
                    completion(.failure(AuthError.serverError))
                }
                completion(.success)
            }
        }
    }
    
    @IBAction func registrationTapped(_ sender: Any) {
        register(email: emailTextField.text, password: passwordTextField.text) { (result) in
            switch result {
            case .success:
                self.showAlert(with: "YOU ARE SUCCESSFULLY REGISTERED!", and: "")
                
            case .failure(let error):
                self.showAlert(with: "SORRY SOMETHING WRONG!", and: error.localizedDescription)
            }
        }
    }
    
    
}
