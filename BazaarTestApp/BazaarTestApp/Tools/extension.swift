//
//  extension.swift
//  BazaarTestApp
//
//  Created by Tara Tandel on 4/23/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    /// This function is is hidding keyboard when tapped around ot
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /// end the editing of the source view 
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
