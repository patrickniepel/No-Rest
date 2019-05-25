//
//  Exercise.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

class Exercise: Codable, Equatable, Comparable, Hashable {
    
    let id: Int
    let category: Category
    
    private var restTimer: Int = 0 // - Seconds
    private var cardiotimer: Int = 0 // Cardio timer - Minutes
    var timer: Int {
        set(newValue) {
            if self.type == .weightLifting {
                restTimer = newValue
            } else {
                cardiotimer = newValue
            }
        }
        get {
            return self.type == .weightLifting ? restTimer : cardiotimer
        }
    }
    var name: String
    var notes: String
    var type: ExerciseType
    var sets: [Set]
    
    init(name: String, category: Category) {
        id = PersistencyController.currentExerciseID()
        self.name = name
        self.category = category
        notes = NRConstants.Editing.noNotes
        sets = []
        type = category.exercisesType
        timer = type == .weightLifting ? 90 : 10
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name < rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum ExerciseType: String, Codable {
    case weightLifting = "Weight Lifting"
    case cardio = "Cardio"
    
    static var allCases: [ExerciseType] = [.weightLifting, .cardio]
}
