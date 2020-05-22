//
//  HistoryDetailReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func historyDetailReducer(action: Action, state: HistoryDetailState?) -> HistoryDetailState {
    var newState = state ?? HistoryDetailState(workout: nil)
    
    if let historyDetailAction = action as? HistoryDetailAction {
        newState.workout = historyDetailAction.workout
    }
    
    return newState
}
