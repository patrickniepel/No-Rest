//
//  WorkoutSetupController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class WorkoutSetupController {
    
    var selectedExercises: [Exercise] = []
    
    func countOfExerciseTypes() -> Int {
        return ExerciseType.allCases.count
    }
    
    func countOfExercises(for categoryIndex: Int) -> Int {
        return 10
    }
    
    func exercise(for categoryIndex: Int, for exerciseIndex: Int) -> Exercise? {
        return nil
    }
    
    func category(for categoryIndex: Int) -> ExerciseType? {
        return .chest
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
