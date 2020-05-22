//
//  WorkoutSetupReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func workoutSetupReducer(action: Action, state: WorkoutSetupState?) -> WorkoutSetupState {
    
    var newState = state ?? WorkoutSetupState()
    
    if let workoutSettingAction = action as? WorkoutSetupAction {
        newState.workout = workoutSettingAction.workout
    }
    
    return newState
}
