//
//  File.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct AppState: StateType, Equatable {
    let navigationState: NavigationState
    let editExerciseState: EditExerciseState
    let infoState: InfoState
    let workoutSetupState: WorkoutSetupState
    let workoutSortingState: WorkoutSortingState
    let popUpState: PopUpState
    let currentWorkoutState: CurrentWorkoutState
    let currentWorkoutCellState: CurrentWorkoutCellState
    let historyDetailState: HistoryDetailState
    let currentIconSelectionState: CurrentIconSelectionState
}

