//
//  TableViewSectionHeaderViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TableViewSectionHeaderViewTheme: Theme {
    let textColor: UIColor
    let backgroundColor: UIColor

    let textFont: UIFont

    init(palette: Palette) {
        textColor = palette.colors.dynamic.theme
        backgroundColor = palette.colors.static.accentuation

        textFont = palette.fonts.static.large()
    }
}
