//
//  CurrentWorkoutCellReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func currentWorkoutCellReducer(action: Action, state: CurrentWorkoutCellState?) -> CurrentWorkoutCellState {
    var newState = state ?? CurrentWorkoutCellState(exercise: nil)
    
    if let updateAction = action as? UpdateCurrentWorkoutCellAction {
        newState.exercise = updateAction.exercise
    }
    
    return newState
}
