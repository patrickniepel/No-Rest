//
//  ExerciseController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct ExerciseController {
    
    func exercisesCount(for type: ExerciseType) -> Int {
        return Array(Exercise.all()).filter { $0.type == type }.count
    }
    
    func exercises(for type: ExerciseType?) -> [Exercise] {
        guard let type = type else { return [] }
        return Array(Exercise.all()).filter { $0.type == type }
    }
    
    func allExercises() -> [Exercise] {
        return Array(Exercise.all())
    }
}
