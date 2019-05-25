//
//  MyWorkout.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

class MyWorkout: Codable, Equatable, Comparable {
    
    let id: Int
    var date: Date?
    var name: String
    var exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        id = PersistencyController.currentWorkoutID()
        self.name = name
        self.exercises = exercises
    }
    
    static func == (lhs: MyWorkout, rhs: MyWorkout) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: MyWorkout, rhs: MyWorkout) -> Bool {
        return lhs.name < rhs.name
    }
}
