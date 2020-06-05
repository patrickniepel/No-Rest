//
//  UIView+Extension.swift
//
//  Created by Patrick Niepel on 1/13/19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension UIView {
    func applyShadow(color: UIColor = UIColor.rgb(red: 10, green: 10, blue: 10, alpha: 1)) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }
}
