//
//  InfoReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func infoReducer(action: Action, state: InfoState?) -> InfoState {
    
    var newState = state ?? InfoState(info: .none)
    
    if let infoAction = action as? InfoAction {
        newState.info = infoAction.info
    }
    return newState
}
