//
//  TimerReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func timerReducer(action: Action, state: TimerState?) -> TimerState {
    var newState = state ?? TimerState(seconds: 0)
    
    if let timerAction = action as? TimerAction {
        newState.seconds = timerAction.seconds
    }
    
    return newState
}
