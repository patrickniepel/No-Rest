//
//  ExerciseController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct ExerciseController {
    
    let exercise: Exercise
    
    init(exercise: Exercise) {
        self.exercise = exercise
    }
    
    func deleteExercise() {
        let index = UserData.sharedInstance.exercises.firstIndex { $0.id == exercise.id }
        
        if let index = index {
            UserData.sharedInstance.exercises.remove(at: index)
            PersistencyController.storeUserData()
        }
    }
    
    func updateExercise() {
        let index = UserData.sharedInstance.exercises.firstIndex { $0.id == exercise.id }
        
        if let index = index {
            UserData.sharedInstance.exercises.remove(at: index)
            UserData.sharedInstance.exercises.append(exercise)
            PersistencyController.storeUserData()
        }
    }
    
    func addExercise() {
        UserData.sharedInstance.exercises.append(exercise)
        PersistencyController.storeUserData()
    }
}
