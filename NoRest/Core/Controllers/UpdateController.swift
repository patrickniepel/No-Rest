//
//  UpdateController.swift
//  NoRest
//
//  Created by Patrick Niepel on 12.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct UpdateController {
    
    static func addWorkoutToHistory(_ workout: MyWorkout) {
        //To history and statistics
        UserData.sharedInstance.workoutHistory.addWorkoutToHistory(workout)
        UserData.sharedInstance.statistics.addWorkoutToStatistics(workout)
        PersistencyController.storeUserData()
    }
    
    static func updateWorkout(_ workout: MyWorkout) {
        //only in workouts
        UserData.sharedInstance.myWorkouts.removeAll(where: { $0.id == workout.id })
        UserData.sharedInstance.myWorkouts.append(workout)
        PersistencyController.storeUserData()
    }
    
    static func deleteWorkout(_ workout: MyWorkout) {
        //delete only in workouts
        UserData.sharedInstance.myWorkouts.removeAll(where: { $0.id == workout.id })
        PersistencyController.storeUserData()
    }

    static func updateExercise(_ exercise: Exercise) {
        //exercises
        UserData.sharedInstance.exercises.removeAll(where: { $0.id == exercise.id })
        UserData.sharedInstance.exercises.append(exercise)
        
        //Workouts
        let workouts = UserData.sharedInstance.myWorkouts
        var updatedWorkouts: [MyWorkout] = []
        for var workout in workouts {
            if let index = workout.exercises.firstIndex(where: { $0.id == exercise.id }) {
                workout.exercises[index] = exercise
            }
            updatedWorkouts.append(workout)
        }
        UserData.sharedInstance.myWorkouts = updatedWorkouts
        PersistencyController.storeUserData()
    }
    
    static func deleteExercise(_ exercise: Exercise) {
        //exercises
        UserData.sharedInstance.exercises.removeAll(where: { $0.id == exercise.id })
        
        //Workouts
        let workouts = UserData.sharedInstance.myWorkouts
        var updatedWorkouts: [MyWorkout] = []
        for var workout in workouts {
            if let index = workout.exercises.firstIndex(where: { $0.id == exercise.id }) {
                workout.exercises.remove(at: index)
            }
            updatedWorkouts.append(workout)
        }
        UserData.sharedInstance.myWorkouts = updatedWorkouts
        PersistencyController.storeUserData()
    }
    
    
}
