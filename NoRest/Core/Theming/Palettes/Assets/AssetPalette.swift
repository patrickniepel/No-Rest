//
//  AssetPalette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

struct AssetPalette: PaletteProtocol {
    let basic: BasicAssetPalette
    let onboarding: OnboardingAssetPalette

    static let light: AssetPalette = .init(
        basic: .light,
        onboarding: .light
    )

    static let dark: AssetPalette = .init(
        basic: .dark,
        onboarding: .dark
    )
}

struct BasicAssetPalette: PaletteProtocol {
    static var light: BasicAssetPalette = .init()
    static var dark: BasicAssetPalette = .init()
}

struct OnboardingAssetPalette: PaletteProtocol {
    static var light: OnboardingAssetPalette = .init()
    static var dark: OnboardingAssetPalette = .init()
}
