//
//  NavigationState.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct NavigationState: StateType, Equatable {
    var activeTabBar: TabBarDestination
    var screen: Screen?
    var action: NavigationAction
    var userAction: Bool
    var mainStack: [Screen]
}
