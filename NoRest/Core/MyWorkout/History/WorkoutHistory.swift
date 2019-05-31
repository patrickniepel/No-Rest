//
//  WorkoutHistory.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct WorkoutHistory: Codable {
    
    private var workouts: [MyWorkout]
    
    init() {
        workouts = []
    }
    
    mutating func addWorkoutToHistory(_ workout: MyWorkout) {
        //Update date before adding
        workout.date = Date()
        workouts.append(workout)
    }
    
    mutating func resetWorkoutHistory() {
        workouts = []
    }
    
    func allExercises() -> [Exercise] {
        return workouts.map { $0.exercises }.flatMap { $0 }
    }
    
    func allWorkouts() -> [MyWorkout] {
        return workouts
    }
}
