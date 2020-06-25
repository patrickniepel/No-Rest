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
    let offWhiteColor: UIColor
    let interactionColor: UIColor

    let textFont: UIFont

    let disclosureIndicatorIcon: UIImage

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
        textColor = palette.colors.dynamic.primaryText
        offWhiteColor = palette.colors.static.offWhite
        interactionColor = palette.colors.static.interaction

        textFont = palette.fonts.static.regular()

        disclosureIndicatorIcon = palette.assets.basic.disclosureIcon.dye(palette.colors.static.secondaryText)
    }
}
