//
//  ViewControllerTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct ViewControllerTheme: Theme {
    let backgroundColor: UIColor
    let titleFont: UIFont
    let titleColor: UIColor

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        titleFont = palette.fonts.static.viewControllerTitle()
        titleColor = palette.colors.dynamic.primaryText
    }
}
