//
//  IconSelectionReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

func currentIconSelectionReducer(action: Action, state: CurrentIconSelectionState?) -> CurrentIconSelectionState {
    var newState = state ?? CurrentIconSelectionState()

    if let currentIconSelectionAction = action as? CurrentIconSelectionAction {
        newState.icon = currentIconSelectionAction.icon
    }
    return newState
}
