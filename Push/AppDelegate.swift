//
//  AppDelegate.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import ReSwift

var store = Store<AppState>(reducer: appReducer, state: nil, middleware: [])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let userData =  DataObjectPersistency().loadDataObject() {
            UserData.sharedInstance = userData
        }
        
        if UserData.sharedInstance.exercises.isEmpty {
            UserData.sharedInstance.exercises = DefaultExercises().exercises
        }
        
        //setupCoordinator()
        return true
    }
    
    private func setupCoordinator() {
        let coordinator = AppCoordinator()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.provideInitialView()
        window?.makeKeyAndVisible()
        
        self.coordinator = coordinator
    }

}

