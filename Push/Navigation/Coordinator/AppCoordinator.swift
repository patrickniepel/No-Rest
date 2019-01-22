//
//  AppCoordinator.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class AppCoordinator {
    var tabBarController: UITabBarController?
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
        
        let addWorkout = ViewBuilder.buildAddWorkoutPage()
        let addWorkoutNavigationController = buildNavigationController(for: addWorkout)
        self.addWorkoutNavigationController = addWorkoutNavigationController
        
        let exercises = ViewBuilder.buildExercisesPage()
        let exercisesNavigationController = buildNavigationController(for: exercises)
        self.exercisesNavigationController = exercisesNavigationController
        
        let statistics = ViewBuilder.buildStatisticsPage()
        let statisticsNavigationController = buildNavigationController(for: statistics)
        self.statisticsNavigationController = statisticsNavigationController
        
        let settings = ViewBuilder.buildSettingsPage()
        let settingsNavigationController = buildNavigationController(for: settings)
        self.settingsNavigationController = settingsNavigationController
        
        self.tabBarController = tabBarController
        
        self.tabBarController?.viewControllers = [addWorkoutNavigationController, exercisesNavigationController, statisticsNavigationController, settingsNavigationController]
        self.tabBarController?.selectedIndex = TabBarDestination.addWorkout.rawValue
    }
    
    func build(screen: Screen, state: NavigationState? = nil) -> UIViewController {
        switch screen {
        case .serp:
            return UIStoryboard(name: "BAStoryboard.product.rawValue", bundle: nil).instantiateViewController(withIdentifier: "")
        case .productDetail:
            return UIStoryboard(name: "BAStoryboard.product.rawValue", bundle: nil).instantiateViewController(withIdentifier: "")
        default:
            assertionFailure("Attempt to build invalid screen \(screen)")
            return UIViewController()
        }
    }
    
    private func buildNavigationController(for view: UIViewController) -> UINavigationController {
        
        let navigationController = DefaultNavigationController(rootViewController: view)
        navigationController.navigationItem.backBarButtonItem?.title = ""
        navigationController.navigationBar.backItem?.title = ""
        return navigationController
    }
    
    func provideInitialView() -> UIViewController {
        return UIViewController()
    }
    
    /**
     Instantiates a new view controller
     
     - parameter identifier: The storyboard view identifier to instantiate
     - parameter storyboard: The storyboard name containing the desired view-controller
     - returns: The instantiated view-controller
     */
        static func instantiate(identifier: String, screen: RouteDestination) -> UIViewController {
//            let storyboard = UIStoryboard(name: , bundle: nil)
//            return storyboard.instantiateViewController(withIdentifier: identifier)
            return UIViewController()
        }
}

