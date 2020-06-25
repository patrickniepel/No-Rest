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
    let buttonTheme: ButtonTheme
    let pickerViewTheme: PickerViewTheme
    let textViewTheme: TextViewTheme
    let textFieldTheme: TextFieldTheme
    let tableViewSectionHeaderViewTheme: TableViewSectionHeaderViewTheme

    init(palette: Palette) {
        viewControllerTheme = .init(palette: palette)
        tabBarTheme = .init(palette: palette)
        navigationBarTheme = .init(palette: palette)
        tableViewTheme = .init(palette: palette)
        tableViewCellTheme = .init(palette: palette)
        collectionViewTheme = .init(palette: palette)
        collectionViewCellTheme = .init(palette: palette)
        searchBarTheme = .init(palette: palette)
        pageControlTheme = .init(palette: palette)
        buttonTheme = .init(palette: palette)
        pickerViewTheme = .init(palette: palette)
        textViewTheme = .init(palette: palette)
        textFieldTheme = .init(palette: palette)
        tableViewSectionHeaderViewTheme = .init(palette: palette)
    }
}

struct CustomTheme: Theme {
    let workoutTableViewCellTheme: WorkoutTableViewCellTheme
    let exerciseTableViewCellTheme: ExerciseTableViewCellTheme
    let timerViewTheme: TimerViewTheme
    let tagViewTheme: TagViewTheme
    let emptyViewTheme: EmptyViewTheme
    let settingsViewTheme: SettingsViewTheme
    let infoViewTheme: InfoViewTheme
    let exerciseImageViewTheme: ExerciseImageViewTheme
    let workoutSessionViewTheme: WorkoutSessionViewTheme
    let workoutTheme: WorkoutTheme
    let editExerciseTheme: EditExerciseTheme

    init(palette: Palette) {
        workoutTableViewCellTheme = .init(palette: palette)
        exerciseTableViewCellTheme = .init(palette: palette)
        timerViewTheme = .init(palette: palette)
        tagViewTheme = .init(palette: palette)
        emptyViewTheme = .init(palette: palette)
        settingsViewTheme = .init(palette: palette)
        infoViewTheme = .init(palette: palette)
        exerciseImageViewTheme = .init(palette: palette)
        workoutSessionViewTheme = .init(palette: palette)
        workoutTheme = .init(palette: palette)
        editExerciseTheme = .init(palette: palette)
    }
}
