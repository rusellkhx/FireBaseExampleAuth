//
//  Utilits.swift
//  FireBaseExample
//
//  Created by Rusell on 04.11.2020.
//

import  UIKit

class CheckUser {
    
    static func isFilled(firstname: String?,
                         lastName: String?,
                         email: String?,
                         password: String?) -> Bool {
        
        guard !(firstname ?? "").isEmpty,
              !(lastName ?? "").isEmpty,
              !(email ?? "").isEmpty,
              !(password ?? "").isEmpty
        else {
            return false
        }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
