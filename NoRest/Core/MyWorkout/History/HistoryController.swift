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
    
    func determineDifferentWorkouts() {
        let historyWorkouts = UserData.sharedInstance.workoutHistory.allWorkouts()
        let workoutDictonary = Dictionary(grouping: historyWorkouts, by: { $0.id })
        workoutsByID = Array(workoutDictonary.values)
        workoutsByID.sort { (lhs, rhs) -> Bool in
            lhs.first?.name ?? "" < rhs.first?.name ?? ""
        }
    }
    
    func workoutHistoryHeader(for index: Int) -> String? {
        let title = workoutsByID[safe: index]?.first?.name ?? ""
        if let count = workoutsByID[safe: index]?.count {
            return "\(String(describing: title)) (x\(count))"
        }
        return title
    }
    
    func isHistoryAvailable() -> Bool {
        return workoutsByID.count != 0
    }
}
