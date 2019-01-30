//
//  Exercise.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation

struct Exercise: Codable {
    
    private let id: Int
    var name: String
    var restTimer: Int
    var notes: String
    
    let category: Category
    var sets: [Set]
    
    init(name: String, category: Category, restTimer: Int = 90, notes: String = "No Entries Yet", sets: [Set] = []) {
        id = PersistencyController.currentExerciseID()
        self.name = name
        self.restTimer = restTimer
        self.notes = notes
        self.category = category
        self.sets = sets
    }
}
