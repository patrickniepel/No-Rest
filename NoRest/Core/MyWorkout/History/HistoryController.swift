//
//  HistoryController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class HistoryController {
    
    var workoutsByID: [[MyWorkout]] = []
    
    init() {
        determineDifferentWorkouts()
    }
    
    private func determineDifferentWorkouts() {
        let historyWorkouts = UserData.sharedInstance.workoutHistory.allWorkouts()
        let workoutDictonary = Dictionary(grouping: historyWorkouts, by: { $0.id })
        workoutsByID = Array(workoutDictonary.values)
        workoutsByID.sort { (lhs, rhs) -> Bool in
            lhs.first?.name ?? "" < rhs.first?.name ?? ""
        }
    }
    
    func workoutName(for index: Int) -> String? {
        return workoutsByID[index].first?.name
    }
}
