//
//  AppCoordinator.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class AppCoordinator {
    var tabBarController: MainTabBarController?
    var addWorkoutNavigationController: UINavigationController?
    var exercisesNavigationController: UINavigationController?
    var statisticsNavigationController: UINavigationController?
    var settingsNavigationController: UINavigationController?
    
    var state: NavigationState?
    
    init() {
        setupInitialViewControllers()
        subscribe()
    }
    
    func setupInitialViewControllers() {
        let tabBarController = MainTabBarController()
        
        let addWorkout = ViewBuilder.buildAddWorkoutScreen()
        let addWorkoutNavigationController = buildNavigationController(for: addWorkout)
        self.addWorkoutNavigationController = addWorkoutNavigationController
        
        let exercises = ViewBuilder.buildExercisesScreen()
        let exercisesNavigationController = buildNavigationController(for: exercises)
        self.exercisesNavigationController = exercisesNavigationController
        
        let statistics = ViewBuilder.buildStatisticsScreen()
        let statisticsNavigationController = buildNavigationController(for: statistics)
        self.statisticsNavigationController = statisticsNavigationController
        
        let settings = ViewBuilder.buildSettingsScreen()
        let settingsNavigationController = buildNavigationController(for: settings)
        self.settingsNavigationController = settingsNavigationController
        
        self.tabBarController = tabBarController
        
        self.tabBarController?.viewControllers = [addWorkoutNavigationController, exercisesNavigationController, statisticsNavigationController, settingsNavigationController]
        self.tabBarController?.selectedIndex = TabBarDestination.addWorkout.rawValue
    }
    
    func build(screen: Screen, state: NavigationState? = nil) -> UIViewController {
        switch screen {
        case .exercisesForCategory:
            return ExercisesCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        case .licenses:
            return LicensesViewController()
        default:
            assertionFailure("Attempt to build invalid screen \(screen)")
            return UIViewController()
        }
    }
    
    private func buildNavigationController(for vc: UIViewController) -> UINavigationController {
        
        let navigationController = DefaultNavigationController(rootViewController: vc)
        navigationController.navigationItem.backBarButtonItem?.title = "Backö"
        navigationController.navigationBar.backItem?.title = "Backö"
        return navigationController
    }
    
    func provideInitialView() -> UIViewController {
        return tabBarController ?? UIViewController()
    }
    
    /**
     Instantiates a new view controller
     
     - parameter identifier: The storyboard view identifier to instantiate
     - parameter storyboard: The storyboard name containing the desired view-controller
     - returns: The instantiated view-controller
     */
    static func instantiateScreen(with title: String) -> UIViewController {
        switch title {
        case NRConstants.TabBarItemTitles.addWorkout:
            return MenuViewController()
        case NRConstants.TabBarItemTitles.exercises:
            return ExercisesCategoryCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
        case NRConstants.TabBarItemTitles.statistics:
            return MenuViewController()
        case NRConstants.TabBarItemTitles.settings:
            return SettingsTableViewController()
        default:
            return UIViewController()
        }
    }
}

