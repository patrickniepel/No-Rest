//
//  NavigationReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func navigationReducer(action: Action, state: NavigationState?) -> NavigationState {
    var newState = state ?? NavigationState(activeTabBar: .workouts, screen: .initial, action: .popToRoot, userAction: false, mainStack: [])

    if action as? InvalidateRoutingAction != nil {
        newState.screen = nil
        newState.action = .push
        newState.mainStack = []
        return newState
    }

    if let tabBarAction = action as? UpdateTabBarPositionAction {
        newState.userAction = true

        let target = RouteDestination.determine(destination: tabBarAction.destination)
        newState.activeTabBar = target
        newState.screen = .remain
    } else {
        newState.userAction = false
    }

    /*
     This is a temporary workaround to use navigation state-restoration (e. g. push-notifications).
     In this case the coordinator will only use the `mainStack` and ignores the screens attribute.
     */
    if let stackedRouteAction = action as? StackedRouteAction {
        newState.mainStack = stackedRouteAction.screens
        newState.screen = .initial
        return newState
    }

    if let routeAction = action as? RouteAction {
        newState.mainStack = []
        newState.screen = routeAction.screen
        newState.action = routeAction.navigationAction

        let target = RouteDestination.determine(destination: routeAction.destination)
        newState.activeTabBar = target
        return newState
    }

    return newState
}
