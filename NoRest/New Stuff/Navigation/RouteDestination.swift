//
//  RouteDestination.swift
//  Push
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

enum RouteDestination {
    case myWorkout
    case exercises
    case statistics
    case settings
    
    static func destinationFrom(index: Int) -> RouteDestination {
        switch index {
        case 0:
            return .myWorkout
        case 1:
            return .exercises
        case 3:
            return .statistics
        case 4:
            return .settings
        default:
            return .myWorkout
        }
    }
    
    static func determine(destination: RouteDestination) -> TabBarDestination {
        
        switch destination {
        case .myWorkout:
            return TabBarDestination.myWorkout
        case .exercises:
            return TabBarDestination.exercises
        case .statistics:
            return TabBarDestination.statistics
        case .settings:
            return TabBarDestination.settings
        }
    }
}
