//
//  TableViewCellTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TableViewCellTheme: Theme {
    let backgroundColor: UIColor
    let textColor: UIColor

    let textFont: UIFont

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        textColor = palette.colors.dynamic.primaryText

        textFont = palette.fonts.static.regular()
    }
}
