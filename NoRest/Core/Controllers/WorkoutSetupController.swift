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

    func toggleSelectedExercise(_ exercise: Exercise) {
        if !selectedExercises.contains(exercise) {
            selectedExercises.append(exercise)
        }
        else {
            selectedExercises.removeAll(where: { $0.id == exercise.id })
        }
    }
    
    func updateSelectedExercises() {
        selectedExercises = selectedExercises.filter{ exercise in
            ExerciseObject.all().contains(where: { exercise.id == $0.id })
        }
    }
}
