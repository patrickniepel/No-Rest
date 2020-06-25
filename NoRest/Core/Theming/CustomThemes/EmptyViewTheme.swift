//
//  EmptyViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct EmptyViewTheme: Theme {
    let textColor: UIColor

    let textFont: UIFont

    let arrowIcon: UIImage

    init(palette: Palette) {
        textColor = palette.colors.dynamic.primaryText

        textFont = palette.fonts.static.veryLarge()

        arrowIcon = palette.assets.basic.arrowIcon.dye(textColor)
    }
}
