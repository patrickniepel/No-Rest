//
//  ExerciseSelectionController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

class ExerciseSelectionController {
    var selectedExercises: [Exercise] = []

    func toggleSelectedExercise(_ exercise: Exercise) {
        if !selectedExercises.contains(exercise) {
            selectedExercises.append(exercise)
        } else {
            selectedExercises.removeAll(where: { $0.id == exercise.id })
        }
    }

    func updateSelectedExercises() {
        selectedExercises = selectedExercises.filter { exercise in
            ExerciseObject.all().contains(where: { exercise.id == $0.id })
        }
    }
}
