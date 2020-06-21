//
//  ThemeModeSetting.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

enum ThemeModeSetting: String {
    case light
    case dark
    case automatic

    var themeName: String {
        switch self {
        case .light:
            return "settings.theme.light".localized

        case .dark:
            return "settings.theme.dark".localized

        case .automatic:
            return "settings.theme.automatic".localized
        }
    }

    static func from(raw: String?) -> ThemeModeSetting {
        var defaultValue: ThemeModeSetting = .light

        if #available(iOS 13, *) {
            defaultValue = .automatic
        }

        if let raw = raw {
            return ThemeModeSetting(rawValue: raw) ?? defaultValue
        }

        return defaultValue
    }
}
