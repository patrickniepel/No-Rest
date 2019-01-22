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
     Builds the addWorkout-page with the appurtenant tab-bar item
     
     - returns: The instantiated view-controller.
     */
    static func buildAddWorkoutPage() -> UIViewController {
        let title = NSLocalizedString("TabBar.AddWorkout.Title", comment: "AddWorkout")
        let addWorkoutTabBarItem = UITabBarItem(title: title, image: buildImage(for: "AddWorkout_unfilled"), selectedImage: buildImage(for: "AddWorkout"))
        
        let addWorkoutView = AppCoordinator.instantiate(identifier: "AddWorkout", screen: .addWorkout)
        addWorkoutView.tabBarItem = addWorkoutTabBarItem
        return addWorkoutView
    }
    
    /**
     Builds the exercises-page with the appurtenant tab-bar item
     
     - returns: The instantiated view-controller.
     */
    static func buildExercisesPage() -> UIViewController {
        let title = NSLocalizedString("TabBar.Exercises.Title", comment: "Exercises")
        let exercisesTabBarItem = UITabBarItem(title: title, image: buildImage(for: "Exercises_unfilled"), selectedImage: buildImage(for: "Exercises"))
        let exercisesView = AppCoordinator.instantiate(identifier: "Exercises", screen: .exercises)
        exercisesView.tabBarItem = exercisesTabBarItem
        return exercisesView
    }
    
    /**
     Builds the statistics-page with the appurtenant tab-bar item
     
     - returns: The instantiated view-controller.
     */
    static func buildStatisticsPage() -> UIViewController {
        let title = NSLocalizedString("TabBar.Statistics.Title", comment: "Statistics")
        let statisticsTabBarItem = UITabBarItem(title: title, image: buildImage(for: "Statistics_unfilled"), selectedImage: buildImage(for: "Statistics"))
        
        let statisticsView = AppCoordinator.instantiate(identifier: "Statistics", screen: .statistics)
        statisticsView.tabBarItem = statisticsTabBarItem
        return statisticsView
    }
    
    /**
     Builds the settings-page with the appurtenant tab-bar item
     
     - returns: The instantiated view-controller.
     */
    static func buildSettingsPage() -> UIViewController {
        let title = NSLocalizedString("TabBar.Settings.Title", comment: "Settings")
        let settingsTabBarItem = UITabBarItem(title: title, image: buildImage(for: "Settings_unfilled"), selectedImage: buildImage(for: "Settings"))
        
        let settingsView = AppCoordinator.instantiate(identifier: "Settings", screen: .settings)
        settingsView.tabBarItem = settingsTabBarItem
        return settingsView
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


