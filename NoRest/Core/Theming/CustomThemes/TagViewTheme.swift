//
//  TagViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TagViewTheme: Theme {
    let textColor: UIColor
    let accentuationColor: UIColor

    let textFont: UIFont

    init(palette: Palette) {
        textColor = palette.colors.dynamic.theme
        accentuationColor = palette.colors.static.accentuation

        textFont = palette.fonts.static.verySmall()
    }
}
