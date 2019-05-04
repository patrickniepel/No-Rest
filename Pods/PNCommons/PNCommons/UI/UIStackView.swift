//
//  UIStackView.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UIStackView {
    
    /**
     Adds one or more views as arranged subviews to this instance
     - parameter views: The views to add
     */
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
