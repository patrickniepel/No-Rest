//
//  ViewControllerExtension.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .myBlue
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.myBlue]
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)  
    }
    
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKB))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKB() {
        view.endEditing(true)
    }
}

extension UITableViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UITableViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIColor {
    static let myBlue = UIColor(red: 31/255, green: 134/255, blue: 248/255, alpha: 1)
}
