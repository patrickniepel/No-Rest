//
//  SettingsController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import AVKit
import StoreKit
import SCLAlertView

struct SettingsController {
    
    static var isTimerSoundActivated: Bool {
        return UserData.sharedInstance.isTimerSoundActivated
    }
    
    static var currentUnit: Unit {
        return UserData.sharedInstance.unit
    }
    
    static var currentUnitAsIndex: Int {
        return Unit.allCases.firstIndex(of: SettingsController.currentUnit) ?? 0
    }
    
    static func timerSoundStateChanged(to state: Bool) {
        UserData.sharedInstance.isTimerSoundActivated = state
        PersistencyController.storeUserData()
    }
    
    static func unitChanged(to index: Int) {
        let newUnit = Unit.allCases[index]
        UserData.sharedInstance.unit = newUnit
        convertWeight(to: newUnit)
        PersistencyController.storeUserData()
    }
    
    private static func convertWeight(to unit: Unit) {
        if unit == .kg {
            
        } else {
            
        }
    }
    
    static func resetData(_ dataReset: DataReset) {
        if dataReset == .none {
            return
        }
        else if dataReset == .workoutHistory {
            UserData.sharedInstance.workoutHistory.resetWorkoutHistory()
            
        } else if dataReset == .statistics {
            UserData.sharedInstance.statistics.resetStatistics()
        }
        
        PersistencyController.storeUserData()
    }
    
    static func showRating() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
}
