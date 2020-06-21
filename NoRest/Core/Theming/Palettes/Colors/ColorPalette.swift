//
//  ColorPalette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct StaticPalette {
    let accentuation: UIColor
    let interaction: UIColor
    let offBlack: UIColor
    let offWhite: UIColor
    let secondaryText: UIColor
    let warning: UIColor
    let success: UIColor
}

struct DynamicPalette {
    let theme: UIColor
    let primaryText: UIColor
    let pulsating: UIColor
}

struct ColorPalette: PaletteProtocol {
    let `static`: StaticPalette
    let dynamic: DynamicPalette

    static let light: ColorPalette = .init(
        static: .init(
            accentuation: UIColor.rgb(red: 0, green: 253, blue: 255, alpha: 1), // #00FDFF
            interaction: UIColor.rgb(red: 255, green: 128, blue: 0, alpha: 1), // #FF8000
            offBlack: UIColor.rgb(red: 51, green: 55, blue: 69, alpha: 1), // #333745
            offWhite: UIColor.rgb(red: 252, green: 251, blue: 248, alpha: 1), // #FCFBF8
            secondaryText: UIColor.rgb(red: 200, green: 200, blue: 200, alpha: 1),
            warning: UIColor.rgb(red: 254, green: 95, blue: 85, alpha: 1), // #FE5F55
            success: UIColor.rgb(red: 199, green: 239, blue: 207, alpha: 1) // #C7EFCF
        ),
        dynamic: .init(
            theme: UIColor.rgb(red: 252, green: 251, blue: 248, alpha: 1), // #FCFBF8
            primaryText: UIColor.rgb(red: 51, green: 55, blue: 69, alpha: 1), // #333745
            pulsating: UIColor.rgb(red: 275, green: 108, blue: 31, alpha: 1)
        )
    )

    static let dark: ColorPalette = .init(
        static: .init(
            accentuation: UIColor.rgb(red: 0, green: 253, blue: 255, alpha: 1), // #00FDFF
            interaction: UIColor.rgb(red: 255, green: 128, blue: 0, alpha: 1), // #FF8000
            offBlack: UIColor.rgb(red: 51, green: 55, blue: 69, alpha: 1), // #333745
            offWhite: UIColor.rgb(red: 252, green: 251, blue: 248, alpha: 1), // #FCFBF8
            secondaryText: UIColor.rgb(red: 200, green: 200, blue: 200, alpha: 1),
            warning: UIColor.rgb(red: 254, green: 95, blue: 85, alpha: 1), // #FE5F55
            success: UIColor.rgb(red: 199, green: 239, blue: 207, alpha: 1) // #C7EFCF
        ),
        dynamic: .init(
            theme: UIColor.rgb(red: 51, green: 55, blue: 69, alpha: 1), // #333745
            primaryText: UIColor.rgb(red: 252, green: 251, blue: 248, alpha: 1), // #FCFBF8
            pulsating: UIColor.rgb(red: 275, green: 108, blue: 31, alpha: 1)
        )
    )
}
