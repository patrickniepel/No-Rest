//
//  WorkoutSortingReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func workoutSortingReducer(action: Action, state: WorkoutSortingState?) -> WorkoutSortingState {
    
    var newState = state ?? WorkoutSortingState()
    
    if let workoutSortingAction = action as? WorkoutSortingAction {
        newState.workout = workoutSortingAction.workout
    }
    
    return newState
}
