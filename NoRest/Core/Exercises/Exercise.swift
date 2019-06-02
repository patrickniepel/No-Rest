//
//  Exercise.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

struct Exercise: Codable, Equatable, Comparable, Hashable {
    
    let id: Int
    let category: Category
    
    var timer: NRTimer
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
        
        let timerValue = type == .weightLifting ? 90 : 10
        timer = NRTimer(timeValue: timerValue, type: type)
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

struct NRTimer: Codable {
    private(set) var seconds: Int = 0
    
    var displayValue: String {
        get {
            return self.type == .cardio ? "\(self.seconds / 60) min" : "\(seconds) s"
        }
    }
    
    var valueForType: Int {
        get {
            return self.type == .cardio ? seconds / 60 : seconds
        }
    }
    
    private let type: ExerciseType
    
    init(timeValue: Int, type: ExerciseType) {
        self.type = type
        calculateSeconds(value: timeValue)
    }
    
    mutating func calculateSeconds(value: Int) {
        seconds = type == .cardio ? value * 60 : value
    }
}

enum ExerciseType: String, Codable {
    case weightLifting = "Weight Lifting"
    case cardio = "Cardio"
    
    static var allCases: [ExerciseType] = [.weightLifting, .cardio]
}
