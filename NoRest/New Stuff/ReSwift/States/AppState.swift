//
//  File.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct AppState: StateType, Equatable {
    let navigationState: NavigationState
    let exercisesState: ExercisesState
    let settingsState: SettingsState
    let editExerciseState: EditExerciseState
    let infoState: InfoState
    let myWorkoutState: MyWorkoutState
    let workoutSettingState: WorkoutSettingState
}

