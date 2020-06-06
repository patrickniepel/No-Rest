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
        workouts = WorkoutObject.all().map { Workout(from: $0) }
    }
    
    func numberOfRows() -> Int {
        return workouts.count
    }
    
    func workout(for row: Int) -> Workout? {
        return workouts[row]
    }
    
    func generateNewWorkout() -> Workout {
        let name = "workout.new".localized
        let id = UserDefaultsController.currentWorkoutId
        UserDefaultsController.increaseWorkoutId()
        return Workout(id: id, createdAt: Date(), name: name)
    }
    
    func deleteWorkout(in row: Int) {
        let workoutToDelete = workouts[row]
        WorkoutObject.delete(with: workoutToDelete.id)
    }
    
    static func addWorkout(_ workout: Workout) {
        WorkoutObject.add(workout: workout)
    }
}
