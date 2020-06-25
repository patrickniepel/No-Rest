//
//  WorkoutTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct WorkoutTheme: Theme {
    let accentuationColor: UIColor
    let textColor: UIColor
    let interactionColor: UIColor

    let textFontVerySmall: UIFont
    let textFontMedium: UIFont

    init(palette: Palette) {
        accentuationColor = palette.colors.static.accentuation
        textColor = palette.colors.dynamic.primaryText
        interactionColor = palette.colors.static.interaction

        textFontVerySmall = palette.fonts.static.verySmall()
        textFontMedium = palette.fonts.static.medium()
    }
}
