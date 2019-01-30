//
//  Statistics.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct Statistics: Codable {
    
    private var workouts: [MyWorkout]
    
    init() {
        workouts = []
    }
    
    mutating func addWorkoutToStatistics(_ workout: MyWorkout) {
        workouts.append(workout)
    }
    
    mutating func resetStatistics() {
        workouts = []
    }
}
