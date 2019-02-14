//
//  ExercisesReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 27.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func exercisesReducer(action: Action, state: ExercisesState?) -> ExercisesState {
    
    var newState = state ?? ExercisesState(category: .chest)
    
    if let selectedCategoryAction = action as? SelectedCategoryAction {
        newState.category = selectedCategoryAction.category
    }
    
    if let _ = action as? ReloadExercisesAction {
        newState.category = nil
    }
    
    return newState
}
