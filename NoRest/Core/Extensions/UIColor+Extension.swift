//
//  UIColor+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension UIColor {
    static let textColor: UIColor = rgb(red: 250, green: 250, blue: 250, alpha: 1)
    static let secondaryTextColor: UIColor = rgb(red: 200, green: 200, blue: 200, alpha: 1)
    static let backgroundColorMain = rgb(red: 230, green: 52, blue: 98, alpha: 1)
    static let backgroundColorUIControl = rgb(red: 51, green: 55, blue: 69, alpha: 1)
    static let shadowColor = backgroundColorUIControl
    static let uiControl = textColor
    static let deleteColor = rgb(red: 204, green: 0, blue: 0, alpha: 1)
    static let successColor = rgb(red: 0, green: 153, blue: 0, alpha: 1)
    static let dark = rgb(red: 21, green: 2, blue: 33, alpha: 1)
    static let pulsatingColor = rgb(red: 275, green: 108, blue: 31, alpha: 1)
}
