//
//  CollectionViewTheme.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

struct CollectionViewTheme: Theme {
    let backgroundColor: UIColor

    init(palette: Palette) {
        backgroundColor = palette.colors.dynamic.theme
    }
}
