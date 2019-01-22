//
//  RouteDestination.swift
//  Push
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

enum RouteDestination {
    case addWorkout
    case exercises
    case statistics
    case settings
    
    static func destinationFrom(index: Int) -> RouteDestination {
        switch index {
        case 0:
            return .addWorkout
        case 1:
            return .exercises
        case 3:
            return .statistics
        case 4:
            return .settings
        default:
            return .addWorkout
        }
    }
    
    static func determine(destination: RouteDestination) -> TabBarDestination {
        
        switch destination {
        case .addWorkout:
            return TabBarDestination.addWorkout
        case .exercises:
            return TabBarDestination.exercises
        case .statistics:
            return TabBarDestination.statistics
        case .settings:
            return TabBarDestination.settings
        }
    }
}
