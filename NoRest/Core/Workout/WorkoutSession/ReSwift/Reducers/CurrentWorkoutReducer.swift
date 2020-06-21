//
//  CurrentWorkoutReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func currentWorkoutReducer(action: Action, state: CurrentWorkoutState?) -> CurrentWorkoutState {
    var newState = state ?? CurrentWorkoutState(workout: nil)

    if let currentWorkoutAction = action as? CurrentWorkoutAction {
        newState.workout = currentWorkoutAction.workout
    }
    return newState
}
