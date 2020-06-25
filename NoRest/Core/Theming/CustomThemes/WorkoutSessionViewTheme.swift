//
//  WorkoutSessionViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct WorkoutSessionViewTheme: Theme {
    let interactionColor: UIColor

    let notesIcon: UIImage
    let timerIcon: UIImage

    init(palette: Palette) {
        interactionColor = palette.colors.static.interaction

        let offWhiteColor = palette.colors.static.offWhite
        notesIcon = palette.assets.basic.notesIcon.dye(offWhiteColor)
        timerIcon = palette.assets.basic.timerIcon.dye(offWhiteColor)
    }
}
