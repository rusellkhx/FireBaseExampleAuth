//
//  AuthViewController.swift
//  FireBaseExample
//
//  Created by Rusell on 03.11.2020.
//

import UIKit

class AuthViewController: UIViewController {
    
    override func viewDidLoad() {
      super.viewDidLoad()
      configureNavigationBar()
    }

    @IBAction func registrationTapped(_ sender: Any) {
    }
    
    @IBAction func autorizationTapped(_ sender: Any) {
    }
    
    private func configureNavigationBar() {
      navigationItem.title = "Firebase Auth"
    }
}
