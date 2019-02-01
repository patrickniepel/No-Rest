//
//  SettingsReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func settingsReducer(action: Action, state: SettingsState?) -> SettingsState {
    
    var newState = state ?? SettingsState(dataReset: .none)
    
    if let resetDataAction = action as? ResetDataAction {
        newState.dataReset = resetDataAction.dataReset
    }
    
    if let _ = action as? InvalidateResetDataAction {
        newState.dataReset = .none
    }
    
    return newState
}
