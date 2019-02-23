//
//  ExerciseController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct ExerciseController {
    
    func deleteExercise(_ exercise: Exercise) {
        UpdateController.deleteExercise(exercise)
    }
    
    func saveExercise(_ exercise: Exercise) {
        UpdateController.updateExercise(exercise)
    }
    
    func timerAsString(for exercise: Exercise) -> String {
        if exercise.type == .weightLifting {
            return String.seconds(value: exercise.timer)
        }
        return String.minutes(value: exercise.timer)
    }
    
    func exercisesCount(for category: Category?) -> Int {
        return UserData.sharedInstance.exercises.map { $0.category == category }.count
    }
    
    func exercises(for category: Category?) -> [Exercise] {
        guard let category = category else { return [] }
        let exercises = UserData.sharedInstance.exercises.filter { $0.category == category }.sorted()
        return exercises
    }
}
