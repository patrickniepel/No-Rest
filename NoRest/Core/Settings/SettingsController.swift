//
//  SettingsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import AVKit
import StoreKit
import SCLAlertView

class SettingsController {    
    enum SettingsItemsType {
        case unit
        case timer
        case reset(String, ResetType)
        case action(String, () -> Void)
    }
    
    enum ResetType {
        case history
        case onboarding
    }
    
    static var isTimerSoundActivated: Bool {
        return UserDefaultsController.isTimerSoundEnabled
    }
    
    static var currentUnit: Unit {
        return UserDefaultsController.unit
    }
    
    static var currentUnitAsIndex: Int {
        return Unit.allCases.firstIndex(of: currentUnit) ?? 0
    }
    
    var settingsItems: [SettingsItemsType] = []
    
    init() {
        self.settingsItems = [
            .unit,
            .timer,
            .reset("settings.resetHistory".localized, .history),
            .reset("settings.resetOnboarding".localized, .onboarding),
            .action("settings.showRating".localized, { self.showRating() }),
            .action("settings.licenses".localized, { self.showViewController(.licenses) }),
            .action("settings.disclaimer".localized, { self.showViewController(.disclaimer) }),
        ]
    }
    
    func timerSoundStateChanged(to state: Bool) {
        UserDefaultsController.isTimerSoundEnabled = state
    }
    
    func unitChanged(to index: Int) {
        let newUnit = Unit.allCases[index]
        UserDefaultsController.unit = newUnit
    }
    
    func reset(_ resetType: ResetType) {
        switch resetType {
        case .history:
            WorkoutHistory.resetHistory()
            
        case .onboarding:
            UserDefaultsController.resetOnboarding()
        }
    }
    
    func showRating() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
    
    func showViewController(_ info: Info) {
        let infoAction = InfoAction(info: info)
        store.dispatch(infoAction)
        
        let routeAction = RouteAction(screen: .info, in: .settings, action: .present)
        store.dispatch(routeAction)
    }
}
