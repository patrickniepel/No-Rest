//
//  PickerViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct PickerViewTheme: Theme {
    let backgroundColor: UIColor
    let tintColor: UIColor

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        tintColor = palette.colors.dynamic.primaryText
    }
}
