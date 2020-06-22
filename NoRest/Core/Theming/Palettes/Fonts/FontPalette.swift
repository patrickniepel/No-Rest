//
//  FontPalette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct StaticFontPalette {
    enum Weight {
        case regular
        case bold

        var fontName: String {
            switch self {
            case .regular:
                return "CaviarDreams"

            case .bold:
                return "CaviarDreams-Bold"
            }
        }
    }

    func viewControllerTitle(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 30) ?? .systemFont(ofSize: 30, weight: .bold)
    }

    func veryLarge(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 30) ?? .systemFont(ofSize: 30, weight: .bold)
    }

    func large(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 24) ?? .systemFont(ofSize: 24, weight: .bold)
    }

    func medium(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 20) ?? .systemFont(ofSize: 20, weight: .bold)
    }

    func regular(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 18) ?? .systemFont(ofSize: 18, weight: .bold)
    }

    func small(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 14) ?? .systemFont(ofSize: 14, weight: .bold)
    }

    func verySmall(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 12) ?? .systemFont(ofSize: 12, weight: .bold)
    }

    func tiny(with weight: Weight = .bold) -> UIFont {
        UIFont(name: weight.fontName, size: 10) ?? .systemFont(ofSize: 10, weight: .bold)
    }
}

struct FontPalette: PaletteProtocol {
    let `static`: StaticFontPalette

    static let light: FontPalette = .init(
        static: .init()
    )

    static var dark: FontPalette = .light
}
