//
//  RouteAction.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct RouteAction: Action {
    var screen: Screen
    var navigationAction: NavigationAction
    
    
    /**
     Instantiates a new RouteAction.
     
     - parameter screen: The screen you want to show.
     - parameter destination: The desired Tab-Bar destination the router is going to jump to.
     */
    init(screen: Screen) {
        self.screen = screen
        navigationAction = .push
    }
    
    init(screen: Screen, action: NavigationAction) {
        self.screen = screen
        navigationAction = action
    }
}

enum NavigationAction {
    case push
    case popAndReplace
}

enum Screen {
    case menu
    case remain
    case invalid
}

