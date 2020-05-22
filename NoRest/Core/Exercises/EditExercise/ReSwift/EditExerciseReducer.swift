//
//  EditExerciseReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func editExerciseReducer(action: Action, state: EditExerciseState?) -> EditExerciseState {
    
    var newState = state ?? EditExerciseState()
    
    if let editExerciseAction = action as? EditExerciseAction {
        newState.exercise = editExerciseAction.exercise
        newState.type = editExerciseAction.type
    }
    
    return newState
}
