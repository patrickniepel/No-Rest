//
//  ExerciseSelectionReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

func exerciseSelectionReducer(action: Action, state: ExerciseSelectionState?) -> ExerciseSelectionState {
    
    var newState = state ?? ExerciseSelectionState()
    
    if let exerciseSelectionAction = action as? ExerciseSelectionAction {
        newState.selectedExercises = exerciseSelectionAction.selectedExercises
    }
    
    return newState
}
