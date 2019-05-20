//
//  DefaultNavigationController.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift
import UIKit

class DefaultNavigationController: UINavigationController, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        interactivePopGestureRecognizer?.delegate = self
        delegate = self
    }
    
    /**
     Enables swipe-back gesture for all sub-ViewControllers.
     
     - parameter gestureRecognizer: An instance of a subclass of the abstract base class UIGestureRecognizer. This gesture-recognizer object is about to begin processing touches to determine if its gesture is occurring.
     - returns: true (the default) to tell the gesture recognizer to proceed with interpreting touches, false to prevent it from attempting to recognize its gesture
     */
    func gestureRecognizerShouldBegin(_: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

