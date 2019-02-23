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
        return Category.allCategories.count
    }
    
    func countOfExercises(for categoryIndex: Int) -> Int {
        return Category.allCategories[categoryIndex].exercises.count
    }
    
    func exercise(for categoryIndex: Int, for exerciseIndex: Int) -> Exercise {
        return Category.allCategories[categoryIndex].exercises[exerciseIndex]
    }
    
    func category(for categoryIndex: Int) -> Category {
        return Category.allCategories[categoryIndex]
    }
    
    func toggleSelectedExercise(section: Int, row: Int) {
        let exercise = self.exercise(for: section, for: row)
        
        if !selectedExercises.contains(exercise) {
            selectedExercises.append(exercise)
        }
        else {
            selectedExercises.removeAll(where: { $0.id == exercise.id })
        }
    }
}
