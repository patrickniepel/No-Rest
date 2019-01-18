//
//  SettingsController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import AVKit

class SettingsController: NSObject {
    
    var userData = UserData.sharedInstance
    var audioPlayer : AVAudioPlayer? = nil
    
    func loadUnit() -> String {
        return userData.unit
    }
    
    func saveUnit(unit: String) {
        userData.unit = unit
    }
    
    func resetStatistics() {
        userData.statistics.statisticsData.removeAll()
    }
    
    func resetHistory() {
        userData.workoutHistory.workouts.removeAll()
    }
    
    /** Resets all set entries */
    func resetSets() {
        for workout in userData.myWorkouts {
            for exercise in workout.exercises {
                exercise.sets.removeAll()
            }
        }
    }
    
    func loadTimerSound() -> Bool {
        return UserDefaults.standard.bool(forKey: "timerSound")
    }
    
    func saveTimerSound(active: Bool) {
        UserDefaults.standard.set(active, forKey: "timerSound")
    }
    
    func playTimerSoundIfActivated() {
        
        if loadTimerSound() {
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "timerSound", ofType: "wav")!))
            }
            catch {
            }
            
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        }
    }
}
