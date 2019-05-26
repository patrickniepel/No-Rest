//
//  PopUpReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func popUpReducer(action: Action, state: PopUpState?) -> PopUpState {
    var newState = state ?? PopUpState()
    
    if let popUpAction = action as? PopUpAction {
        newState.type = popUpAction.type
        newState.exercise = popUpAction.exercise
    }
    
    return newState
}
