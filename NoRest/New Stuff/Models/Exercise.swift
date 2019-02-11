//
//  Exercise.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

struct Exercise: Codable, Equatable, Comparable {
    
    let id: Int
    var name: String
    lazy var restTimer: Int = 0 // - Seconds
    lazy var timer: Int = 0 // Cardio timer - Minutes
    var notes: String
    
    let category: Category
    var type: ExerciseType
    var sets: [Set]?
    
    init(name: String, category: Category, restTimer: Int = 90, notes: String = "No Entries Yet", type: ExerciseType = .weightLifting) {
        id = PersistencyController.currentExerciseID()
        self.name = name
        self.notes = notes
        self.category = category
        self.type = type
        self.sets = []
        self.restTimer = restTimer
    }
    
    init(name: String, category: Category, timer: Int, notes: String = "No Entries Yet", type: ExerciseType = .cardio) {
        id = PersistencyController.currentExerciseID()
        self.name = name
        self.notes = notes
        self.category = category
        self.type = type
        self.timer = timer
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name < rhs.name
    }
}

enum ExerciseType: String, Codable {
    case weightLifting = "Weight Lifting"
    case cardio = "Cardio"
}
