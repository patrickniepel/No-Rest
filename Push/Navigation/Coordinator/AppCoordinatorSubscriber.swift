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
     Sets the displayed tab-page of the app (service, my-account, home, wishist, basket), builds the
     views and presents them on the target navigation-controller.
     
     - parameter state: The state containing required information to perform the view-configuration.
     */
    func newState(state: NavigationState) {
        // in this case the state is invalidated (e. g. user jumped back using the back button)
        guard let screen = state.screen else {
            self.state = state
            return
        }
        
        if screen == .menu {
            
        } else if screen == .remain {
            /* do nothing if screen-state should remain */
            
        } else {
           
            
        }
        self.state = state
    }
    
    /**
     Displays a view depending on its navigation action
     
     - parameter navigationController: The navigation-controller to present the view on.
     - parameter view: The view to present.
     - parameter action: The navigation-action, how the navigation-controller should deal with already presenting views.
     */
    private func handleAction(navigationController: UINavigationController?, view: UIViewController, action: NavigationAction) {
        
        if isScreenPresented(view: view, navigationController: navigationController) {
            return
        }
        
        for viewController in navigationController?.viewControllers ?? [] {
            if viewController === view {
                return
            }
        }
        
        switch action {
        case .popAndReplace:
            navigationController?.popToRootViewController(animated: false)
            navigationController?.pushViewController(view, animated: true)
            
        case .push:
            navigationController?.pushViewController(view, animated: true)
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
            menuNavigationController?.pushViewController(view, animated: true)
        }
    }
}

