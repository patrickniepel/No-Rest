//
//  Theme.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation
import Gestalt

struct ApplicationTheme: Theme {
    let native: NativeTheme
    let custom: CustomTheme

    static var `default`: ApplicationTheme {
        return .light
    }

    static let light: ApplicationTheme = .init(palette: .light)
    static let dark: ApplicationTheme = .init(palette: .dark)

    init(palette: Palette) {
        self.native = .init(palette: palette)
        self.custom = .init(palette: palette)
    }
}

struct NativeTheme: Theme {
//    let viewControllerTheme: ViewControllerTheme
//    let viewTheme: ViewTheme
//    let tabBarControllerTheme: TabBarControllerTheme
//    let navigationBarTheme: NavigationBarTheme

    init(palette: Palette) {
//        self.viewControllerTheme = .init(palette: palette)
//        self.viewTheme = .init(palette: palette)
//        self.tabBarControllerTheme = .init(palette: palette)
//        self.navigationBarTheme = .init(palette: palette)
    }
}

struct CustomTheme: Theme {
    init(palette: Palette) { }
}
