//
//  WorkoutReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

func workoutReducer(action: Action, state: WorkoutState?) -> WorkoutState {
    var newState = state ?? WorkoutState()

    if let workoutAction = action as? WorkoutAction {
        newState.workout = workoutAction.workout
        newState.exercises = nil
    }

    if let workoutExercisesAction = action as? WorkoutExercisesAction {
        newState.workout = nil
        newState.exercises = workoutExercisesAction.exercises
    }
    return newState
}
