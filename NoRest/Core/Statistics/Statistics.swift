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
    
    func allExercises() -> [Exercise] {
        return workouts.map { $0.exercises }.flatMap { $0 }
    }
    
    func allWorkouts() -> [MyWorkout] {
        return workouts
    }
}
