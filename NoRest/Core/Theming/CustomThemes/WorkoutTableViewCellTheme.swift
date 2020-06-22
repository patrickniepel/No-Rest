//
//  WorkoutTableViewCellTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct WorkoutTableViewCellTheme: Theme {
    let textColor: UIColor
    let buttonColor: UIColor

    let textFont: UIFont

    let calendarIcon: UIImage
    let exercisesIcon: UIImage
    let startIcon: UIImage

    init(palette: Palette) {
        textColor = palette.colors.dynamic.primaryText
        buttonColor = palette.colors.static.interaction

        textFont = palette.fonts.static.large()

        calendarIcon = palette.assets.basic.calendarIcon
        exercisesIcon = palette.assets.basic.exercisesIcon
        startIcon = palette.assets.basic.startIcon.dye(.white)
    }
}
