//
//  ThemeManager+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

public extension ThemeManager {
    func updateTheme() {
        ThemeManager.default.theme = determineTheme()
    }

    @available(iOS 13.0, *)
    var convertedApplicationTheme: UIUserInterfaceStyle {
        if let userSelectedTheme = ThemeModeSetting(rawValue: UserDefaultsController.themeMode ?? "") {
            switch userSelectedTheme {
            case .automatic:
                return .light

            case .light:
                return .light

            case .dark:
                return .dark
            }
        } else {
            return UITraitCollection.current.userInterfaceStyle
        }
    }

    @available(iOS 13.0, *)
    var currentStyle: UIUserInterfaceStyle {
        if let userSelectedTheme = ThemeModeSetting(rawValue: UserDefaultsController.themeMode ?? "") {
           switch userSelectedTheme {
           case .automatic:
               return UITraitCollection.current.userInterfaceStyle

           case .light:
               return .light

           case .dark:
               return .dark
           }
       }

        return .light
    }

    private func determineTheme() -> ApplicationTheme {
        if let userSelectedTheme = ThemeModeSetting(rawValue: UserDefaultsController.themeMode ?? "") {
            switch userSelectedTheme {
            case .automatic:
                return determineSystemStyle()

            case .light:
                return .light

            case .dark:
                return .dark
            }
        } else {
            return determineSystemStyle()
        }
    }

    private func determineSystemStyle() -> ApplicationTheme {
        if #available(iOS 13.0, *) {
            switch UITraitCollection.current.userInterfaceStyle {
            case .light, .unspecified:
                return .default

            case .dark:
                return .dark

            @unknown default:
                fatalError("Undefined user interface style")
            }
        } else {
            return .default
        }
    }
}
