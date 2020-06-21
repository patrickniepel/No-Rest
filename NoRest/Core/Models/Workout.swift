//
//  Workout.swift
//  NoRest
//
//  Created by Patrick Niepel on 05.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

struct Workout: Equatable {
    let id: Int
    let createdAt: Date?
    var mostRecent: Date?
    var name: String
    var exercises: [Exercise]

    init(id: Int, createdAt: Date, name: String, exercises: [Exercise] = []) {
        self.id = id
        self.createdAt = createdAt
        self.name = name
        self.exercises = exercises
    }

    init(from workoutObject: WorkoutObject) {
        self.id = workoutObject.id
        self.createdAt = workoutObject.createdAt
        self.mostRecent = workoutObject.mostRecent
        self.name = workoutObject.name
        self.exercises = workoutObject.exercises.map { Exercise(from: $0) }
    }

    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.id == rhs.id
    }
}
