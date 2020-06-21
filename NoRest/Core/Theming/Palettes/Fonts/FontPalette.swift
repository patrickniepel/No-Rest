//
//  FontPalette.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct DynamicFontPalette {
    let title1: UIFont
    let title2: UIFont
    let title3: UIFont
    let headline: UIFont
    let subheadline: UIFont
    let body: UIFont
    let footnote: UIFont
    let callout: UIFont
    let caption1: UIFont
    let caption2: UIFont
}

struct StaticFontPalette {
    // MARK: - Native element fonts
    func navigationBarTitle(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 18, weight: weight)
    }

    func tabBar(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 8, weight: weight)
    }

    // MARK: - Content fonts
    func headline(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 50, weight: weight)
    }

    func subheadline(with weight: UIFont.Weight = .bold) -> UIFont {
        return UIFont.systemFont(ofSize: 18, weight: weight)
    }

    func bigSection(with weight: UIFont.Weight = .bold) -> UIFont {
        return UIFont.systemFont(ofSize: 20, weight: weight)
    }

    func section(with weight: UIFont.Weight = .bold) -> UIFont {
        return UIFont.systemFont(ofSize: 10, weight: weight)
    }

    func cell(with weight: UIFont.Weight = .medium) -> UIFont {
        return UIFont.systemFont(ofSize: 16, weight: weight)
    }

    func text(with weight: UIFont.Weight = .medium) -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: weight)
    }

    func tag(with weight: UIFont.Weight = .bold) -> UIFont {
        return UIFont.systemFont(ofSize: 8, weight: weight)
    }

    func copyright(with weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: 10, weight: weight)
    }

    // MARK: - big progress fonts
    func bigProgressMain(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 65, weight: weight)
    }

    func bigProgressDecimal(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 25, weight: weight)
    }

    func bigProgressPercentage(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 35, weight: weight)
    }

    func bigProgressPlus(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 50, weight: weight)
    }

    // MARK: - small progress fonts
    func smallProgressMain(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 25, weight: weight)
    }

    func smallProgressDecimal(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 10, weight: weight)
    }

    func smallProgressPercentage(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 12, weight: weight)
    }

    func smallProgressPlus(with weight: UIFont.Weight = .semibold) -> UIFont {
        return UIFont.systemFont(ofSize: 14, weight: weight)
    }
}

struct FontPalette: PaletteProtocol {
    let dynamic: DynamicFontPalette
    let `static`: StaticFontPalette

    static let light: FontPalette = .init(
        dynamic: .init(
            title1: UIFont.preferredFont(forTextStyle: .title1),
            title2: UIFont.preferredFont(forTextStyle: .title2),
            title3: UIFont.preferredFont(forTextStyle: .title3),
            headline: UIFont.preferredFont(forTextStyle: .headline),
            subheadline: UIFont.preferredFont(forTextStyle: .subheadline),
            body: UIFont.preferredFont(forTextStyle: .body),
            footnote: UIFont.preferredFont(forTextStyle: .footnote),
            callout: UIFont.preferredFont(forTextStyle: .callout),
            caption1: UIFont.preferredFont(forTextStyle: .caption1),
            caption2: UIFont.preferredFont(forTextStyle: .caption2)
        ),
        static: .init()
    )

    static var dark: FontPalette {
        return FontPalette.light // same as `.light` for now.
    }

    static var debug: FontPalette {
        return FontPalette.light  // same as `.light` for now.
    }
}
