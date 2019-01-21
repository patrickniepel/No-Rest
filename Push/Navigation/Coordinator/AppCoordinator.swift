//
//  AppCoordinator.swift
//  Push
//
//  Created by Patrick Niepel on 21.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class AppCoordinator {
    var menuNavigationController: UINavigationController?
    
    var state: NavigationState?
    
    init() {
        setupInitialViewControllers()
        subscribe()
    }
    
    func setupInitialViewControllers() {        
        let menu = ViewBuilder.buildMenuPage()
        let menuNavigationController = buildNavigationController(for: menu)
        self.menuNavigationController = menuNavigationController
    }
    
    func build(screen: Screen, state: NavigationState? = nil) -> UIViewController {
        switch screen {
        case .menu:
            print()
//            return UIStoryboard(name: BAStoryboard.product.rawValue, bundle: nil).instantiateViewController(withIdentifier: MBAViewController.storyboardID)
        default:
            assertionFailure("Attempt to build invalid screen \(screen)")
            return UIViewController()
        }
        
        //wieder weg
        return UIViewController()
    }
    
    private func buildNavigationController(for view: UIViewController) -> UINavigationController {
        
        let navigationController = DefaultNavigationController(rootViewController: view)
        navigationController.navigationItem.backBarButtonItem?.title = ""
        navigationController.navigationBar.backItem?.title = ""
        return navigationController
    }
    
    func provideInitialView() -> UIViewController {
        //return slidingViewController!
        return UIViewController()
    }
    
    /**
     Instantiates a new view controller
     
     - parameter identifier: The storyboard view identifier to instantiate
     - parameter storyboard: The storyboard name containing the desired view-controller
     - returns: The instantiated view-controller
     */
//    static func instantiate(identifier: String, storyboard: UIStoryboard) -> UIViewController {
//        let storyboard = UIStoryboard(name: , bundle: nil)
//        return storyboard.instantiateViewController(withIdentifier: identifier)
//    }
}

