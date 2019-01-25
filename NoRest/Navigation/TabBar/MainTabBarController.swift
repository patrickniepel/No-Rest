//
//  MainTabBarController.swift
//  Push
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        
        delegate = self
        super.viewDidLoad()
    }
    
    /**
     Sent to the delegate when the user selects a tab bar item.
     Updates the ReSwift NavigationState with the current tabBarIndex.
     
     - parameter tabBar: The tab bar that is being customized.
     - parameter item: The tab bar item that was selected.
     */
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = tabBar.items?.index(of: item) ?? 0
        
        let destination = RouteDestination.destinationFrom(index: index)
        
        let updateTabBarPositionAction = UpdateTabBarPositionAction(destination: destination)
        store.dispatch(updateTabBarPositionAction)
        
        let invalidateRoutingAction = InvalidateRoutingAction()
        store.dispatch(invalidateRoutingAction)
    }
    
    /**
     Determines the active tab bar item and allows returning back to anywhere for every screen
     
     - parameter tabBarController: The tab bar controller containing viewController.
     - parameter viewController: The view controller belonging to the tab that was tapped by the user.
     - returns: true if the view controller’s tab should be selected or false if the current tab should remain active.
     */
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let topViewController = viewController.navigationController,
            tabBarController.selectedViewController == topViewController {
            return false
        }
        return true
    }
}

