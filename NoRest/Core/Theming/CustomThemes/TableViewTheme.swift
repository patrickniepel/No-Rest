//
//  TableViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TableViewTheme: Theme {
    let backgroundColor: UIColor
    let separatorColor: UIColor
    let tintColor: UIColor
    let warningColor: UIColor

    let binIcon: UIImage

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        separatorColor = palette.colors.static.secondaryText
        tintColor = palette.colors.static.interaction
        warningColor = palette.colors.static.warning

        binIcon = palette.assets.basic.binIcon.dye(.white)
    }
}
