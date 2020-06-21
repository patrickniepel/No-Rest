//
//  Palette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

protocol PaletteProtocol {
    static var light: Self { get }
    static var dark: Self { get }
}

struct Palette: PaletteProtocol {
    let colors: ColorPalette
    let fonts: FontPalette
    let assets: AssetPalette

    static let light: Palette = .init(
        colors: .light,
        fonts: .light,
        assets: .light
    )

    static let dark: Palette = .init(
        colors: .dark,
        fonts: .dark,
        assets: .dark
    )
}
