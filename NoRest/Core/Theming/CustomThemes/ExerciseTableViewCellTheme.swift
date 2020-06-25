//
//  ExerciseTableViewCellTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct ExerciseTableViewCellTheme: Theme {
    let timerIcon: UIImage
    let notesIcon: UIImage

    init(palette: Palette) {
        timerIcon = palette.assets.basic.timerIcon.dye(palette.colors.dynamic.theme)
        notesIcon = palette.assets.basic.notesIcon.dye(palette.colors.dynamic.theme)
    }
}
