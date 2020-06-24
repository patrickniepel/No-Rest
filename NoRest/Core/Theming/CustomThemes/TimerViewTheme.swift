//
//  TimerViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TimerViewTheme: Theme {
    let themeColor: UIColor
    let textColor: UIColor
    let accentuationColor: UIColor
    let pulsatingColor: UIColor

    let timerFont: UIFont

    init(palette: Palette) {
        themeColor = palette.colors.dynamic.theme
        textColor = palette.colors.dynamic.primaryText
        accentuationColor = palette.colors.static.accentuation
        pulsatingColor = palette.colors.static.interaction

        timerFont = palette.fonts.static.timer()
    }
}
