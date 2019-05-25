//
//  UIViewController.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    /**
     Adds a tap gesture recognizer to this view controller instance.
     Dimisses an eventually opened keyboard when invoked
     */
    func hideKeyboardWhenTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKB))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    /** Selector function to dimiss the keyboard */
    @objc func dismissKB() {
        view.endEditing(true)
    }
    
    /**
     Presents a system alert in this view controller
     - parameter title: The title of the alert
     - parameter message: The message of the alert. Empty by default
     */
    func showAlert(with title: String, message: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    /**
     Presents a system alert in this view controller.
     Make sure that the count of buttonTitles, buttonStyles and buttonHandlers is equal
     - parameter title: The title of the alert
     - parameter message: The message of the alert. Empty by default
     - parameter buttonTitles: The titles of the desired buttons in the alert window
     - parameter buttonStyles: The styles of the desired buttons in the alert window
     - parameter buttonHandlers: The handlers of the desired buttons in the alert window
     */
    func showAlert(
        with title: String,
        message: String = "",
        buttonTitles: [String],
        buttonStyles: [UIAlertAction.Style],
        buttonHandlers: [((UIAlertAction) -> Void)?]) {
        
        guard buttonTitles.count == buttonStyles.count && buttonStyles.count == buttonHandlers.count else {
            fatalError("Count of buttonTitles, buttonStyles and buttonHandlers must be equal")
        }
        
        if buttonTitles.isEmpty {
            showAlert(with: title, message: message)
        } else {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            for (index, value) in buttonTitles.enumerated() {
                let action = UIAlertAction(title: value, style: buttonStyles[index], handler: buttonHandlers[index])
                alert.addAction(action)
            }
            present(alert, animated: true)
        }
    }
}
