//
//  HistoryController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class HistoryController {
    
    var workoutsByID : [Int: [MyWorkout]] = [:]
    
    init() {
        determineDifferentWorkouts()
    }
    
    private func determineDifferentWorkouts() {
        let historyWorkouts = UserData.sharedInstance.workoutHistory.allWorkouts()
        workoutsByID = Dictionary(grouping: historyWorkouts, by: { $0.id })
    }
}
