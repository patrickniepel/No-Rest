//
//  NRTabBarController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Gestalt
import UIKit

class NRTabBarController: UITabBarController, Themeable {
    typealias Theme = TabBarTheme

    override func viewDidLoad() {
        super.viewDidLoad()
        self.observe(theme: \ApplicationTheme.native.tabBarTheme)
        delegate = self
    }

    func apply(theme: Theme) {
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()

            appearance.backgroundColor = theme.backgroundColor
            appearance.stackedLayoutAppearance.normal.iconColor = theme.unselectedItemColor
            appearance.stackedLayoutAppearance.selected.iconColor = theme.selectedItemColor
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.selectedItemColor]
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: theme.unselectedItemColor]

            tabBar.standardAppearance = appearance

            tabBar.setNeedsLayout()
        } else {
            tabBar.barTintColor = theme.backgroundColor
            tabBar.tintColor = theme.selectedItemColor
            tabBar.unselectedItemTintColor = theme.unselectedItemColor
        }
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if #available(iOS 13.0, *) {
            ThemeManager.default.theme = newCollection.userInterfaceStyle == .dark ? ApplicationTheme.dark : ApplicationTheme.light
        }
        super.willTransition(to: newCollection, with: coordinator) // You must call super somewhere. See docs.
    }
}

extension NRTabBarController: UITabBarControllerDelegate {
    /**
     Sent to the delegate when the user selects a tab bar item.
     Updates the ReSwift NavigationState with the current tabBarIndex.

     - parameter tabBar: The tab bar that is being customized.
     - parameter item: The tab bar item that was selected.
     */
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = tabBar.items?.firstIndex(of: item) ?? 0

        let destination = RouteDestination.destination(for: index)

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

        // Disable tabs while PopUpViewController is being presented
        if let navigationController = tabBarController.selectedViewController as? UINavigationController,
            navigationController.presentedViewController as? PopUpViewController != nil {
            return false
        }

        //Check if currently selected navigation controller is the navigation controller to be selected -> tab does not change
        //        navigationController == tabBarController.selectedViewController,

        return true
    }
}
