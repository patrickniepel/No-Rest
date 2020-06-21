//
//  TabBarTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct TabBarTheme: Theme {
    let backgroundColor: UIColor
    let selectedItemColor: UIColor
    let unselectedItemColor: UIColor

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        selectedItemColor = palette.colors.static.interaction
        unselectedItemColor = palette.colors.dynamic.primaryText
    }
}
