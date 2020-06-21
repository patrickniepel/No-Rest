//
//  WorkoutController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

class WorkoutController {
    var exercises: [Exercise] = []

    func moveExercise(from source: Int, to destination: Int) {
        let movedExercise = exercises[source]
        exercises.remove(at: source)
        exercises.insert(movedExercise, at: destination)
    }

    func updateExercises() -> [Exercise] {
        exercises = exercises.filter { exercise in
            ExerciseObject.all().contains(where: { exercise.id == $0.id })
        }
        return exercises
    }
}
