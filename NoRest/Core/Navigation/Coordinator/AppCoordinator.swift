//
//  AppCoordinator.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class AppCoordinator {
    var appNavigationController: NRNavigationController?
    var tabBarController: NRTabBarController?
    var myWorkoutNavigationController: NRNavigationController?
    var exercisesNavigationController: NRNavigationController?
    var statisticsNavigationController: NRNavigationController?
    var settingsNavigationController: NRNavigationController?

    var state: NavigationState?

    init() {
        setupInitialViewControllers()
        subscribe()
    }

    func setupInitialViewControllers() {
        let tabBarController = NRTabBarController()

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

    //swiftlint:disable cyclomatic_complexity
    func build(screen: Screen, state: NavigationState? = nil) -> UIViewController {
        switch screen {
        case .exercises:
            return ExercisesViewController()

        case .info:
            return InfoViewController()

        case .editExercise:
            return EditExerciseViewController()

        case .workout:
            return WorkoutViewController()

        case .exerciseSelection:
            return ExerciseSelectionViewController()

        case .workouts:
            return WorkoutsViewController()

        case .popUp:
            return PopUpViewController()

        case .iconSelection:
            return IconSelectionViewController()

        case .workoutSession:
            return WorkoutSessionViewController()

        case .tutorial:
            return TutorialViewController()

        case .vc(let vc):
            return vc

        default:
            assertionFailure("Attempt to build invalid screen \(screen)")
            return UIViewController()
        }
    }

    //swiftlint:disable force_unwrapping
    func provideInitialView() -> UIViewController {
        appNavigationController = NRNavigationController()

        if UserDefaultsController.didFinishTutorial {
            appNavigationController?.setNavigationBarHidden(true, animated: false)
            appNavigationController?.setViewControllers([tabBarController!], animated: false)
        } else {
            appNavigationController?.setViewControllers([TutorialViewController(showSkipButton: true)], animated: false)
        }

        return appNavigationController!
    }

    private func buildNavigationController(for vc: UIViewController) -> NRNavigationController {
        return NRNavigationController(rootViewController: vc)
    }

    static func instantiateScreen(in tab: RouteDestination) -> UIViewController {
        switch tab {
        case .workouts:
            return WorkoutsViewController()

        case .exercises:
            return ExercisesViewController()

        case .statistics:
            return StatisticsViewController()

        case .settings:
            return SettingsViewController()
        }
    }
}
