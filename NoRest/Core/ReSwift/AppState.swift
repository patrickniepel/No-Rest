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
    let workoutState: WorkoutState
    let exerciseSelectionState: ExerciseSelectionState
    let popUpState: PopUpState
    let workoutSessionState: WorkoutSessionState
    let currentIconSelectionState: CurrentIconSelectionState
}

