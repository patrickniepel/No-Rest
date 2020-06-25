//
//  ExerciseImageViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct ExerciseImageViewTheme: Theme {
    let backgroundColor: UIColor

    init(palette: Palette) {
        backgroundColor = palette.colors.static.offWhite
    }
}
