//
//  ExerciseController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct ExerciseController {
    
    func updateNotes(_ exercise: Exercise) {
        UpdateController.updateExercise(id: exercise.id, notes: exercise.notes)
    }
    
    func deleteExercise(_ exercise: Exercise) {
        UpdateController.deleteExercise(exercise)
    }
    
    func saveExercise(_ exercise: Exercise) {
        UpdateController.updateExercise(exercise)
    }
    
    func exercisesCount(for category: Category?) -> Int {
        return UserData.sharedInstance.exercises.filter { $0.category == category }.count
    }
    
    func exercises(for category: Category?) -> [Exercise] {
        guard let category = category else { return [] }
        let exercises = UserData.sharedInstance.exercises.filter { $0.category == category }.sorted()
        return exercises
    }
    
    func allExercises() -> [Exercise] {
        return UserData.sharedInstance.exercises.sorted()
    }
}
