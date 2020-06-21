//
//  AppDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Gestalt
import ReSwift
import UIKit

var store = Store<AppState>(reducer: appReducer, state: nil, middleware: [])

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var coordinator: AppCoordinator?
    var disposables: [Disposable]?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Database.setup()

        setupTheming()

        setupCoordinator()

        checkForFistAppStart()
        return true
    }

    private func setupCoordinator() {
        let coordinator = AppCoordinator()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator.provideInitialView()
        window?.makeKeyAndVisible()

        self.coordinator = coordinator
    }

    private func setupTheming() {
        ThemeManager.default.updateTheme()
        ThemeManager.default.animationDuration = 0.2

        disposables = [
            //            UISegmentedControl.observe(theme: \ApplicationTheme.native.segmentedControl) { $0.appearance() },
            //            UISwitch.observe(theme: \ApplicationTheme.native.switch) { $0.appearance() },
        ]
    }

    private func checkForFistAppStart() {
        if UserDefaultsController.isFirstAppInstall {
            DefaultExercise.createDefaultExercises()
            UserDefaultsController.isFirstAppInstall = true
        }
    }
}
