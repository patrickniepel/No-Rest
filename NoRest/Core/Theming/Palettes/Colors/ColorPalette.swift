//
//  ColorPalette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct StaticPalette {
    let brand: UIColor // tiger orange

    let blue: UIColor
    let red: UIColor
    let yellow: UIColor
    let green: UIColor
    let purple: UIColor

    let lightBlue: UIColor
    let lightPurple: UIColor
    let dirtyYellow: UIColor
}

struct DynamicPalette {
    let element: UIColor
    let background: UIColor

    let title: UIColor
    let primary: UIColor
    let secondary: UIColor
    let section: UIColor

    let elementShadow: UIColor
    let barShadow: UIColor
}

struct ColorPalette: PaletteProtocol {
    let `static`: StaticPalette
    let dynamic: DynamicPalette

    static let light: ColorPalette = .init(
        static: .init(
            brand: UIColor.rgb(red: 253, green: 106, blue: 2, alpha: 1), // #FD6A02 | tiger orange

            blue: UIColor.rgb(red: 15, green: 107, blue: 252, alpha: 1), // #0F6BFC
            red: UIColor.rgb(red: 226, green: 144, blue: 175, alpha: 1), // #FE290A
            yellow: UIColor.rgb(red: 254, green: 173, blue: 10, alpha: 1), // #FEAD0A
            green: UIColor.rgb(red: 19, green: 176, blue: 102, alpha: 1), // #13B066
            purple: UIColor.rgb(red: 178, green: 15, blue: 252, alpha: 1), // #B20FFC

            lightBlue: UIColor.rgb(red: 91, green: 153, blue: 253, alpha: 1), // #5B99FD
            lightPurple: UIColor.rgb(red: 202, green: 91, blue: 253, alpha: 1), // #CA5BFD
            dirtyYellow: UIColor.rgb(red: 204, green: 181, blue: 29, alpha: 1) // #CCB51D
        ),
        dynamic: .init(
            element: UIColor.rgb(red: 255, green: 255, blue: 255, alpha: 1), // #FFFFFF
            background: UIColor.rgb(red: 252, green: 251, blue: 248, alpha: 1), // #FCFBF8

            title: UIColor.rgb(red: 63, green: 82, blue: 96, alpha: 1), // #3F5260
            primary: UIColor.rgb(red: 98, green: 114, blue: 127, alpha: 1), // #62727F
            secondary: UIColor.rgb(red: 146, green: 157, blue: 166, alpha: 1), // #929DA6
            section: UIColor.rgb(red: 151, green: 150, blue: 148, alpha: 1), // #979694

            elementShadow: UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.25), // #000000
            barShadow: UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.1) // #000000
        )
    )

    static let dark: ColorPalette = .init(
        static: .init(
            brand: UIColor.rgb(red: 253, green: 106, blue: 2, alpha: 1), // #FD6A02 | tiger orange

            blue: UIColor.rgb(red: 15, green: 107, blue: 252, alpha: 1), // #0F6BFC
            red: UIColor.rgb(red: 226, green: 144, blue: 175, alpha: 1), // #FE290A
            yellow: UIColor.rgb(red: 254, green: 173, blue: 10, alpha: 1), // #FEAD0A
            green: UIColor.rgb(red: 19, green: 176, blue: 102, alpha: 1), // #13B066
            purple: UIColor.rgb(red: 178, green: 15, blue: 252, alpha: 1), // #B20FFC

            lightBlue: UIColor.rgb(red: 91, green: 153, blue: 253, alpha: 1), // #5B99FD
            lightPurple: UIColor.rgb(red: 202, green: 91, blue: 253, alpha: 1), // #CA5BFD
            dirtyYellow: UIColor.rgb(red: 204, green: 181, blue: 29, alpha: 1) // #CCB51D
        ),
        dynamic: .init(
            element: UIColor.rgb(red: 57, green: 58, blue: 68, alpha: 1), // #393A44
            background: UIColor.rgb(red: 41, green: 42, blue: 50, alpha: 1), // #292A32

            title: UIColor.white,
            primary: UIColor.rgb(red: 226, green: 227, blue: 240, alpha: 1), // #E2E3F0
            secondary:  UIColor.rgb(red: 187, green: 187, blue: 199, alpha: 1), // #B9BBC7
            section: UIColor.rgb(red: 169, green: 170, blue: 172, alpha: 1), // #A9AAAC

            elementShadow: UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.5), // #000000
            barShadow: UIColor.rgb(red: 0, green: 0, blue: 0, alpha: 0.25) // #000000
        )
    )
}
