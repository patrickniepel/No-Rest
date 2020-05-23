//
//  WorkoutsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct WorkoutsController {
    func workoutCount() -> Int {
        return Workout.all().count
    }
    
    func allWorkouts() -> [Workout] {
        return Workout.all()
    }
    
    func dateAsString(for date: Date?) -> String {
        if let date = date {
            return Date.withFormat(date: date, format: NRConstants.Date.defaultFormat)
        }
        return NRConstants.Date.workoutNotStarted
    }
    
    func loadWorkout(with id: Int?) -> Workout? {
        return nil
    }
}
