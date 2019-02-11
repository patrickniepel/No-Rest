//
//  AppCoordinatorSubscriber.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension AppCoordinator: StoreSubscriber {
    /**
     Subscribe to the ReSwift Store
     */
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.navigationState
            }
        }
    }
    
    /**
     Sets the displayed tab-screen of the app (addWorkout, exercises, statistics, settings), builds the
     views and presents them on the target navigation-controller.
     
     - parameter state: The state containing required information to perform the view-configuration.
     */
    func newState(state: NavigationState) {
        // in this case the state is invalidated (e. g. user jumped back using the back button)
        guard let screen = state.screen else {
            log.perform("Invalidated UI State")
            self.state = state
            return
        }
        
        // a user action (e. g. user switches the tab-bar position) occured.
        // this just tells reSwift that the current state changed so no further actions are required.
        if state.userAction {
            self.state = state
            return
        }
        
        // The `screen` value will be completely ignored since the mainStack will be used to build the views.
        if state.activeTabBar == .addWorkout && state.mainStack.count > 0 {
            present(viewStack: state.mainStack)
            return
        }
        
        if screen == .initial {
            let navigationController = determineNavigationController(destination: state.activeTabBar)
            navigationController?.popToRootViewController(animated: true)
            changeTabBarPosition(state: state)
        } else if screen == .remain {
            /* do nothing if screen-state should remain */
            changeTabBarPosition(state: state)
        } else {
            showView(screen, state)
            changeTabBarPosition(state: state)
        }
        self.state = state
    }
    
    /**
     Displays a view depending on its navigation action
     
     - parameter navigationController: The navigation-controller to present the view on.
     - parameter view: The view to present.
     - parameter action: The navigation-action, how the navigation-controller should deal with already presenting views.
     */
    private func handleAction(navigationController: UINavigationController?, vc: UIViewController, action: NavigationAction) {
        
        if isScreenPresented(view: vc, navigationController: navigationController) {
            log.event("\(type(of: vc)) is already presented.")
            return
        }
        
        for viewController in navigationController?.viewControllers ?? [] {
            if viewController === vc {
                log.error("Can't push viewController \(viewController.debugDescription) because it is already pushed.")
                return
            }
        }
        
        switch action {
        case .popAndReplace:
            navigationController?.popToRootViewController(animated: false)
            navigationController?.pushViewController(vc, animated: true)
            
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        
        case .present:
            navigationController?.present(vc, animated: true, completion: nil)
        }
        
        let invalidateRoutingAction = InvalidateRoutingAction()
        store.dispatch(invalidateRoutingAction)
    }
    
    /**
     Determines the navigationController by its Tab Bar Destination.
     
     - parameter destination: The desired tab-bar destination.
     - returns: the matching navigation-controller
     */
    private func determineNavigationController(destination: TabBarDestination) -> UINavigationController? {
        switch destination {
        case .addWorkout:
            return addWorkoutNavigationController
        case .exercises:
            return exercisesNavigationController
        case .statistics:
            return statisticsNavigationController
        case .settings:
            return settingsNavigationController
        }
    }
    
    /**
     Checks if the state according the tabBar has been changed.
     Jumps to the desired tabBar position if needed.
     
     - parameter state: The new state to update.
     */
    private func changeTabBarPosition(state: NavigationState) {
        var update = false
        if let oldState = self.state {
            update = oldState.activeTabBar.rawValue != state.activeTabBar.rawValue
        } else {
            // if there wasn't a state set before, update the position to make sure
            // the right tabBarPosition is set
            update = true
        }
        
        if update {
            tabBarController?.selectedIndex = state.activeTabBar.rawValue
        }
    }
    
    /**
     Builds the view depending on the `screen` and pushes it on the desired navigation-controller depending
     on the tab-bar position.
     
     - parameter screen: The screen-target to build the view from.
     - parameter state: The state containing the target tab-bar destination.
     */
    fileprivate func showView(_ screen: Screen, _ state: NavigationState) {
        let viewController = build(screen: screen, state: state)
        
        switch state.activeTabBar {
        case .addWorkout:
            handleAction(navigationController: addWorkoutNavigationController, vc: viewController, action: state.action)
        case .exercises:
            handleAction(navigationController: exercisesNavigationController, vc: viewController, action: state.action)
        case .statistics:
            handleAction(navigationController: statisticsNavigationController, vc: viewController, action: state.action)
        case .settings:
            handleAction(navigationController: settingsNavigationController, vc: viewController, action: state.action)
        }
    }
    
    /**
     Checks if a ViewController is already presented.
     
     - parameter view: The viewController attempted to present.
     - parameter navigationController: The navigationController to check for the current presented screen.
     - returns: True if target-screen is already presenting. False otherwise.
     */
    fileprivate func isScreenPresented(view: UIViewController, navigationController: UINavigationController?) -> Bool {
        
        guard let topViewController = navigationController?.topViewController else {
            return false
        }
        return type(of: topViewController) == type(of: view)
    }
    
    /**
     Builds the view-stack and presents them on the `homeNavigationController`.
     
     - parameter state: The viewStack containing all views to present on top of each other.
     */
    fileprivate func present(viewStack: [Screen]) {
        for screen in viewStack {
            let view = build(screen: screen)
            addWorkoutNavigationController?.pushViewController(view, animated: true)
        }
    }
}


