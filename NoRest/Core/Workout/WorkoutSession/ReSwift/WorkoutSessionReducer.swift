//
//  WorkoutSessionReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

func workoutSessionReducer(action: Action, state: WorkoutSessionState?) -> WorkoutSessionState {
    var newState = state ?? WorkoutSessionState()
    
    if let workoutSessionAction = action as? WorkoutSessionAction {
        newState.workout = workoutSessionAction.workout
    }
    
    return newState
}
