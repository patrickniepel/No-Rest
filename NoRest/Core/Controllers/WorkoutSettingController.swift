//
//  WorkoutSettingController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class WorkoutSettingController {
    
    var selectedExercises: [Exercise] = []
    
    func countOfCategories() -> Int {
        return Category.allMuscleCategories.count
    }
    
    func countOfExercises(for categoryIndex: Int) -> Int {
        return Category.allMuscleCategories[safe: categoryIndex]?.exercises.count ?? 0
    }
    
    func exercise(for categoryIndex: Int, for exerciseIndex: Int) -> Exercise? {
        return Category.allMuscleCategories[safe: categoryIndex]?.exercises[safe: exerciseIndex]
    }
    
    func category(for categoryIndex: Int) -> Category? {
        return Category.allMuscleCategories[safe: categoryIndex]
    }
    
    func toggleSelectedExercise(section: Int, row: Int) {
        guard let exercise = self.exercise(for: section, for: row) else { return }
        
        if !selectedExercises.contains(exercise) {
            selectedExercises.append(exercise)
        }
        else {
            selectedExercises.removeAll(where: { $0.id == exercise.id })
        }
    }
}
