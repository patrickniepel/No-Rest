//
//  SettingsController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import AVKit

struct SettingsController {
    
    static var isTimerSoundActivated: Bool {
        return UserData.sharedInstance.isTimerSoundActivated
    }
    
    static var currentUnit: Unit {
        return UserData.sharedInstance.unit
    }
    
    static func timerSoundStateChanged(to state: Bool) {
        UserData.sharedInstance.isTimerSoundActivated = state
        PersistencyController.storeUserData()
    }
    
    static func unitChanged(to newUnit: Unit) {
        UserData.sharedInstance.unit = newUnit
        convertWeight(to: newUnit)
        PersistencyController.storeUserData()
    }
    
    private static func convertWeight(to unit: Unit) {
        if unit == .kg {
            
        } else {
            
        }
    }
    
    static func restWorkoutHistory() {
        UserData.sharedInstance.workoutHistory.resetWorkoutHistory()
        PersistencyController.storeUserData()
    }
    
    static func resetStatistics() {
        UserData.sharedInstance.statistics.resetStatistics()
        PersistencyController.storeUserData()
    }
}
