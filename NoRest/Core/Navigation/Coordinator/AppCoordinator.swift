//
//  AppCoordinator.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class AppCoordinator {
    var tabBarController: MainTabBarController?
    var myWorkoutNavigationController: UINavigationController?
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
        
        let myWorkout = ViewBuilder.buildMyWorkoutScreen()
        let myWorkoutNavigationController = buildNavigationController(for: myWorkout)
        self.myWorkoutNavigationController = myWorkoutNavigationController
        
        
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
        
        self.tabBarController?.viewControllers = [myWorkoutNavigationController, exercisesNavigationController, statisticsNavigationController, settingsNavigationController]
        self.tabBarController?.selectedIndex = TabBarDestination.workouts.rawValue
    }
    
    func build(screen: Screen, state: NavigationState? = nil) -> UIViewController {
        switch screen {
        case .exercises:
            return ExercisesViewController()
        case .info:
            return InfoViewController()
        case .editExercise:
            return EditExerciseViewController()
        case .workoutSetup:
            return WorkoutSetupViewController()
        case .workoutSorting:
            return WorkoutSortingViewController()
        case .workouts:
            return WorkoutsViewController()
        case .popUp:
            return PopUpViewController()
        case .iconSelection:
            return IconSelectionViewController()
        case .currentWorkout:
            return CurrentWorkoutViewController()
        case .vc(let vc):
            return vc
        default:
            assertionFailure("Attempt to build invalid screen \(screen)")
            return UIViewController()
        }
    }
    
    func provideInitialView() -> UIViewController {
        return tabBarController ?? UIViewController()
    }
    
    private func buildNavigationController(for vc: UIViewController) -> UINavigationController {
        return NRNavigationController(rootViewController: vc)
    }
    
    /**
     Instantiates a new view controller
     
     - parameter identifier: The storyboard view identifier to instantiate
     - parameter storyboard: The storyboard name containing the desired view-controller
     - returns: The instantiated view-controller
     */
    static func instantiateScreen(with title: String) -> UIViewController {
        switch title {
        case NRConstants.TabBarItemTitles.workouts:
            return WorkoutsViewController()
        case NRConstants.TabBarItemTitles.exercises:
            return ExercisesViewController()
        case NRConstants.TabBarItemTitles.statistics:
            return StatisticsViewController()
        case NRConstants.TabBarItemTitles.settings:
            return SettingsViewController()
        default:
            return UIViewController()
        }
    }
}

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
}

