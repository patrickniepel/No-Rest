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
    
    mutating func allExercises() -> [Exercise] {
        var exercises: [Exercise] = []
        
        for workout in workouts {
            exercises += workout.exercises
        }
        
        return exercises
    }
}
