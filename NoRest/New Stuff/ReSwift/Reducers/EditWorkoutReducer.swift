//
//  EditWorkoutReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func editWorkoutReducer(action: Action, state: EditWorkoutState?) -> EditWorkoutState {
    
    var newState = state ?? EditWorkoutState()
    
    if let editWorkoutAction = action as? EditWorkoutAction {
        newState.workout = editWorkoutAction.workout
    }
    
    return newState
}
