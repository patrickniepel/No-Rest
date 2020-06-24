//
//  ButtonTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct ButtonTheme: Theme {
    let titleColor: UIColor
    let backgroundColor: UIColor

    init(palette: Palette) {
        let titleColor = palette.colors.static.offWhite
        let backgroundColor = palette.colors.static.interaction
    }
}
