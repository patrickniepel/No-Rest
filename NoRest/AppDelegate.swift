//
//  AppDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import ReSwift

var store = Store<AppState>(reducer: appReducer, state: nil, middleware: [loggingMiddleware])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        PersistencyController.loadUserData()
        
        setupCoordinator()
        return true
    }
    
    private func setupCoordinator() {
        let coordinator = AppCoordinator()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.provideInitialView()
        window?.makeKeyAndVisible()
        
        self.coordinator = coordinator
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        PersistencyController.storeUserData()
    }
}

