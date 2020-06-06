//
//  WorkoutSortingController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

class WorkoutSortingController {
    var exercisesToSort: [Exercise] = []
    
    func moveExercise(from source: Int, to destination: Int) {
        let movedExercise = exercisesToSort[source]
        exercisesToSort.remove(at: source)
        exercisesToSort.insert(movedExercise, at: destination)
    }
    
    func updateExercises() -> [Exercise] {
        exercisesToSort = exercisesToSort.filter{ exercise in
            ExerciseObject.all().contains(where: { exercise.id == $0.id })
        }
        return exercisesToSort
    }
}
