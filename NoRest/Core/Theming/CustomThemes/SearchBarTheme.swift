//
//  SearchBarTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct SearchBarTheme: Theme {
    let themeColor: UIColor
    let interactionColor: UIColor
    let textColor: UIColor

    let textFont: UIFont

    init(palette: Palette) {
        themeColor = palette.colors.dynamic.theme
        interactionColor = palette.colors.static.interaction
        textColor = palette.colors.dynamic.primaryText

        textFont = palette.fonts.static.regular()
    }
}
