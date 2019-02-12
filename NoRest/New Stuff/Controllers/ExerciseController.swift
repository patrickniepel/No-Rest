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
        UpdateController.deleteExercise(exercise)
    }
    
    func updateExercise() {
        UpdateController.updateExercise(exercise)
    }
    
    func addExercise() {
        UpdateController.addExercise(exercise)
    }
    
    func timerAsString() -> String {
        if exercise.type == .weightLifting {
            return String.seconds(value: exercise.timer)
        } else {
            return String.minutes(value: exercise.timer)
        }
    }
}
