//
//  RouteAction.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct RouteAction: Action {
    var destination: RouteDestination
    var screen: Screen
    var navigationAction: NavigationAction
    
    /**
     Instantiates a new RouteAction.
     Displays the inital screen of the tab-bar.
     
     - parameter destination: The desired Tab-Bar destination the router is going to jump to.
     */
    init(destination: RouteDestination) {
        self.destination = destination
        screen = .remain
        navigationAction = .push
    }
    
    /**
     Instantiates a new RouteAction.
     
     - parameter screen: The screen you want to show.
     - parameter destination: The desired Tab-Bar destination the router is going to jump to.
     */
    init(screen: Screen, in destination: RouteDestination) {
        self.destination = destination
        self.screen = screen
        navigationAction = .push
    }
    
    init(screen: Screen, in destination: RouteDestination, action: NavigationAction) {
        self.destination = destination
        self.screen = screen
        navigationAction = action
    }
}

/**
 Use this action when trying to restore the view-state (e. g. push notifications).
 Note: This just works on the "products" tab and won't change the tab-bar destination.
 */
struct StackedRouteAction: Action {
    var screens: [Screen]
}

enum NavigationAction {
    case push
    case popToRoot
    case present
    case modally
}

enum Screen {
    case remain
    case initial
    case myWorkout
    case workoutSetting
    case workoutSorting
    case statistics
    case settings
    case exercisesForCategory
    case editExercise
    case info
    case history
    case historyDetail
    case popUp
    case currentWorkout
}


