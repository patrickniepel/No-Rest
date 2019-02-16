//
//  ViewBuilder.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

struct ViewBuilder {
    
    /**
     Builds the myWorkout-screen with the appurtenant tabBar item
     - returns: The instantiated view-controller.
     */
    static func buildMyWorkoutScreen() -> UIViewController {
        let title = NRConstants.TabBarItemTitles.myWorkout
        let myWorkoutTabBarItem = UITabBarItem(title: title, image: buildImage(for: "MyWorkout_inactive"), selectedImage: buildImage(for: "MyWorkout_active"))
        
        return triggerInstantiation(with: title, for: myWorkoutTabBarItem)
    }
    
    /**
     Builds the exercises-screen with the appurtenant tabBar item
     - returns: The instantiated view-controller.
     */
    static func buildExercisesScreen() -> UIViewController {
        let title = NRConstants.TabBarItemTitles.exercises
        let exercisesTabBarItem = UITabBarItem(title: title, image: buildImage(for: "Exercises_inactive"), selectedImage: buildImage(for: "Exercises_active"))
        
        return triggerInstantiation(with: title, for: exercisesTabBarItem)
    }
    
    /**
     Builds the statistics-screen with the appurtenant tabBar item
     - returns: The instantiated view-controller.
     */
    static func buildStatisticsScreen() -> UIViewController {
        let title = NRConstants.TabBarItemTitles.statistics
        let statisticsTabBarItem = UITabBarItem(title: title, image: buildImage(for: "Statistics_inactive"), selectedImage: buildImage(for: "Statistics_active"))
        
        return triggerInstantiation(with: title, for: statisticsTabBarItem)
    }
    
    /**
     Builds the settings-screen with the appurtenant tabBar item
     - returns: The instantiated view-controller.
     */
    static func buildSettingsScreen() -> UIViewController {
        let title = NRConstants.TabBarItemTitles.settings
        let settingsTabBarItem = UITabBarItem(title: title, image: buildImage(for: "Settings_inactive"), selectedImage: buildImage(for: "Settings_active"))
        
        return triggerInstantiation(with: title, for: settingsTabBarItem)
    }
    
    /**
     Instantiates the given screen with its tabBar item
     - parameter title: The Title of the tabBar item
     - parameter tabBarItem: The tabBarItem object that belongs to the given screen
     - returns: The instantiated view-controller.
     */
    private static func triggerInstantiation(with title: String, for tabBarItem: UITabBarItem) -> UIViewController {
        let viewController = AppCoordinator.instantiateScreen(with: title)
        viewController.tabBarItem = tabBarItem
        return viewController
    }
    
    /**
     Builds an UIImage by its asset-identifier
     - parameter name: The image-name to instantiate.
     - returns: The instantiated image.
     */
    static func buildImage(for name: String) -> UIImage? {
        let image = UIImage(named: name)
        return image?.withRenderingMode(.alwaysOriginal)
    }
}


