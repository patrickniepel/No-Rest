//
//  NavigationReducer.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func navigationReducer(action: Action, state: NavigationState?) -> NavigationState {
    
    var newState = state ?? NavigationState(screen: .menu, action: .popAndReplace, mainStack: [])
    
    if let _ = action as? InvalidateRoutingAction {
        newState.screen = nil
        newState.action = .push
        newState.mainStack = []
        return newState
    }
    
    guard let routeAction = action as? RouteAction else {
        return newState
    }
    
    newState.mainStack = []
    newState.screen = routeAction.screen
    newState.action = routeAction.navigationAction
    
    return newState
}

