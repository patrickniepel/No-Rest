//
//  ViewControllerExtension.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKB))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKB() {
        view.endEditing(true)
    }
}

extension UIColor {
    static let myBlue = UIColor(red: 31/255, green: 134/255, blue: 248/255, alpha: 1)
}
