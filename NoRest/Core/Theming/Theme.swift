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
    let viewControllerTheme: ViewControllerTheme
    let tabBarTheme: TabBarTheme
    let navigationBarTheme: NavigationBarTheme
    let tableViewTheme: TableViewTheme
    let tableViewCellTheme: TableViewCellTheme
    let collectionViewTheme: CollectionViewTheme
    let collectionViewCellTheme: CollectionViewCellTheme
    let searchBarTheme: SearchBarTheme
    let pageControlTheme: PageControlTheme

    init(palette: Palette) {
        self.viewControllerTheme = .init(palette: palette)
        self.tabBarTheme = .init(palette: palette)
        self.navigationBarTheme = .init(palette: palette)
        self.tableViewTheme = .init(palette: palette)
        self.tableViewCellTheme = .init(palette: palette)
        self.collectionViewTheme = .init(palette: palette)
        self.collectionViewCellTheme = .init(palette: palette)
        self.searchBarTheme = .init(palette: palette)
        self.pageControlTheme = .init(palette: palette)
    }
}

struct CustomTheme: Theme {
    let workoutTableViewCellTheme: WorkoutTableViewCellTheme

    init(palette: Palette) {
        self.workoutTableViewCellTheme = WorkoutTableViewCellTheme()
    }
}
