//
//  RouteDestination.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

enum RouteDestination {
    case workouts
    case exercises
    case statistics
    case settings
    
    static func destination(for index: Int) -> RouteDestination {
        switch index {
        case 0:
            return .workouts
        case 1:
            return .exercises
        case 3:
            return .statistics
        case 4:
            return .settings
        default:
            return .workouts
        }
    }
    
    static func determine(destination: RouteDestination) -> TabBarDestination {
        
        switch destination {
        case .workouts:
            return TabBarDestination.workouts
        case .exercises:
            return TabBarDestination.exercises
        case .statistics:
            return TabBarDestination.statistics
        case .settings:
            return TabBarDestination.settings
        }
    }
}
