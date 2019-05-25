//
//  UserData.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class UserData: Codable {
    
    static var sharedInstance = UserData()
    
    var isTimerSoundActivated: Bool = false
    var unit: Unit = .kg
    var myWorkouts: [MyWorkout] = []
    var workoutHistory: WorkoutHistory = WorkoutHistory()
    var statistics: Statistics = Statistics()
    var exercises: [Exercise] = [] 
    
    private init(){}
}

