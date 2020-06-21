//
//  LabelTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct LabelTheme: Theme {
    let textColor: UIColor

    init(palette: Palette) {
        textColor = palette.colors.dynamic.primaryText
    }
}

struct DarkLabelTheme: Theme {
    let textColor: UIColor

    init(palette: Palette) {
        textColor = palette.colors.static.offBlack
    }
}
