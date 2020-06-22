//
//  PageControlTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct PageControlTheme: Theme {
    let backgroundColor: UIColor
    let accentuationColor: UIColor
    let textColor: UIColor

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        accentuationColor = palette.colors.static.accentuation
        textColor = palette.colors.dynamic.primaryText
    }
}
