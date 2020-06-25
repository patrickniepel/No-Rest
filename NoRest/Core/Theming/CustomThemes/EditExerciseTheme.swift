//
//  EditExerciseTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct EditExerciseTheme: Theme {
    let backgroundColor: UIColor
    let accentuationColor: UIColor
    let textColor: UIColor

    let textFont: UIFont

    let selectionIcon: UIImage

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        accentuationColor = palette.colors.static.accentuation
        textColor = palette.colors.dynamic.primaryText

        textFont = palette.fonts.static.verySmall()

        selectionIcon = palette.assets.basic.selectionIcon
    }
}
