//
//  UpdateController.swift
//  NoRest
//
//  Created by Patrick Niepel on 12.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct UpdateController {
    
    static func finishWorkout(_ workout: MyWorkout) {
        //update myWorkouts, add to history, calculate for statistics
        UpdateController.updateWorkout(workout)
        UserData.sharedInstance.workoutHistory.addWorkoutToHistory(workout)
        PersistencyController.storeUserData()
    }
    
    static func addWorkout(_ workout: MyWorkout) {
        // add to history and workouts / statistics
        UserData.sharedInstance.myWorkouts.append(workout)
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
    
    static func addExercise(_ exercise: Exercise) {
        UserData.sharedInstance.exercises.append(exercise)
        PersistencyController.storeUserData()
    }
    
    static func updateExercise(_ exercise: Exercise) {
        //update in exercises and workouts
        UserData.sharedInstance.exercises.removeAll(where: { $0.id == exercise.id })
        UserData.sharedInstance.exercises.append(exercise)
        
        //TODO: - update workouts that contain exercise
        UserData.sharedInstance.myWorkouts.forEach { $0.exercises.removeAll(where: { $0.id == exercise.id })}
        PersistencyController.storeUserData()
    }
    
    static func deleteExercise(_ exercise: Exercise) {
        //exercises and workouts
        UserData.sharedInstance.exercises.removeAll(where: { $0.id == exercise.id })
        UserData.sharedInstance.myWorkouts.forEach { $0.exercises.removeAll(where: { $0.id == exercise.id })}
        PersistencyController.storeUserData()
    }
    
    
}
