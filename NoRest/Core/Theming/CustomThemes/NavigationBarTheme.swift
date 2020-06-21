//
//  NavigationBarTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct NavigationBarTheme: Theme {
    let backgroundColor: UIColor
    let titleColor: UIColor
    let tintColor: UIColor
    let titleFont: UIFont

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        titleColor = .red //palette.colors.dynamic.primaryText
        tintColor = palette.colors.static.interaction
        titleFont = palette.fonts.static.viewControllerTitle()
    }
}
