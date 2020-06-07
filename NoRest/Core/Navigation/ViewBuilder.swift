//
//  ViewBuilder.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

struct ViewBuilder {
    static func buildMyWorkoutScreen() -> UIViewController {
        let title = "workouts.title".localized
        let myWorkoutTabBarItem = UITabBarItem(title: title, image: NRStyle.workoutsIcon, selectedImage: nil)
        
        return triggerInstantiation(for: .workouts, for: myWorkoutTabBarItem)
    }

    static func buildExercisesScreen() -> UIViewController {
        let title = "exercises.title".localized
        let exercisesTabBarItem = UITabBarItem(title: title, image: NRStyle.exercisesIcon, selectedImage: nil)
        
        return triggerInstantiation(for: .exercises, for: exercisesTabBarItem)
    }

    static func buildStatisticsScreen() -> UIViewController {
        let title = "statistics.title".localized
        let statisticsTabBarItem = UITabBarItem(title: title, image: NRStyle.statisticsIcon, selectedImage: nil)
        
        return triggerInstantiation(for: .statistics, for: statisticsTabBarItem)
    }
    
    static func buildSettingsScreen() -> UIViewController {
        let title = "settings.title".localized
        let settingsTabBarItem = UITabBarItem(title: title, image: NRStyle.settingsIcon, selectedImage: nil)
        
        return triggerInstantiation(for: .settings, for: settingsTabBarItem)
    }
    
    /**
     Instantiates the given screen with its tabBar item
     - parameter title: The Title of the tabBar item
     - parameter tabBarItem: The tabBarItem object that belongs to the given screen
     - returns: The instantiated view-controller.
     */
    private static func triggerInstantiation(for tab: RouteDestination, for tabBarItem: UITabBarItem) -> UIViewController {
        let viewController = AppCoordinator.instantiateScreen(in: tab)
        viewController.tabBarItem = tabBarItem
        return viewController
    }
}


