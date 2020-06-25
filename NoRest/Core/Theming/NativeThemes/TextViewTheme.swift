//
//  TextViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TextViewTheme: Theme {
    let backgroundColor: UIColor
    let themeColor: UIColor

    let textFont: UIFont

    init(palette: Palette) {
        backgroundColor = palette.colors.static.offWhite
        themeColor = palette.colors.dynamic.theme

        textFont = palette.fonts.static.small()
    }
}
