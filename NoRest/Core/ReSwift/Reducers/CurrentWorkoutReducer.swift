//
//  CurrentWorkoutReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func currentWorkoutReducer(action: Action, state: CurrentWorkoutState?) -> CurrentWorkoutState {
    var newState = state ?? CurrentWorkoutState(myWorkout: nil)
    
    if let currentWorkoutAction = action as? CurrentWorkoutAction {
        newState.myWorkout = currentWorkoutAction.myWorkout
    }
    
    return newState
}
