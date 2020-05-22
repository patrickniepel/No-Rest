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

enum DataReset: Int {
    case workoutHistory = 0
    case statistics = 1
    case onboarding = 2
    case none = -1
}

struct SettingsController {
    
    static var isTimerSoundActivated: Bool {
        return UserDefaultsController.isTimerSoundEnabled
    }
    
    static var currentUnit: Unit {
        return UserDefaultsController.unit
    }
    
    static var currentUnitAsIndex: Int {
        return Unit.allCases.firstIndex(of: SettingsController.currentUnit) ?? 0
    }
    
    static func timerSoundStateChanged(to state: Bool) {
        UserDefaultsController.isTimerSoundEnabled = state
    }
    
    static func unitChanged(to index: Int) {
        let newUnit = Unit.allCases[index]
        UserDefaultsController.unit = newUnit
    }
    
    static func resetData(_ dataReset: DataReset) {
        
    }
    
    static func showRating() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
}
