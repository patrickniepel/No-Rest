//
//  MyWorkoutController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutController: NSObject {
    
    var userData = UserData.sharedInstance
    
    func loadWorkouts() -> [MyWorkout] {
        
        return userData.myWorkouts
    }
    
    func saveWorkouts(workouts: [MyWorkout]) {
        userData.myWorkouts = workouts
    }
}
