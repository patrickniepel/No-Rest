//
//  UIView+Extension.swift
//
//  Created by Patrick Niepel on 1/13/19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension UIView {
    func setupDefaultBackgroundColor() {
        self.backgroundColor = .mainColor
    }
    
    func applyShadow() {
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
}
