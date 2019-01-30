//
//  MyWorkout.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

class MyWorkout: Codable, Equatable {
    
    private let id: Int
    var date: Date
    var name: String
    var exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        id = PersistencyController.currentWorkoutID()
        date = Date()
        self.name = name
        self.exercises = exercises
    }
    
    static func == (lhs: MyWorkout, rhs: MyWorkout) -> Bool {
        return lhs.id == rhs.id
    }
}
