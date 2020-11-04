//
//  Extensions.swift
//  FireBaseExample
//
//  Created by Rusell on 04.11.2020.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
