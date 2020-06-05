//
//  WorkoutsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class WorkoutsController {
    private var workouts: [Workout] = []
    
    init() {
        updateWorkouts()
    }
    
    func updateWorkouts() {
        workouts = Workout.all()
    }
    
    func numberOfRows() -> Int {
        return workouts.count
    }
    
    func workout(for row: Int) -> Workout? {
        return workouts[row]
    }
    
    func generateNewWorkout() -> Workout {
        let count = Workout.all().count + 1
        let name = "workout.new".localized + " \(count)"
        return Workout(name: name)
    }
    
    func deleteWorkout(in row: Int) {
        let workoutToDelete = workouts[row]
        Workout.delete(with: workoutToDelete.id)
    }
    
    static func addWorkout(_ workout: Workout) {
        Workout.add(workout: workout)
    }
}
