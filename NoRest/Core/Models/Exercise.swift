//
//  Exercise.swift
//  NoRest
//
//  Created by Patrick Niepel on 05.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

struct Exercise: Equatable {
    let id: Int
    var name: String
    var type: ExerciseType?
    var timer: Int
    var notes: String
    var icon: UIImage?
    var sets: [Set]

    var descriptiveRestTimer: String {
        guard let type = self.type else { return "\(timer)" }
        return type == .cardio ? "\(timer / 60) min" : "\(timer) s"
    }

    init(id: Int, name: String, type: ExerciseType, timer: Int, notes: String = "", icon: UIImage?, sets: [Set] = []) {
        self.id = id
        self.name = name
        self.type = type
        self.timer = timer
        self.notes = notes
        self.icon = icon
        self.sets = sets
    }

    init(from exerciseObject: ExerciseObject) {
        self.id = exerciseObject.id
        self.name = exerciseObject.name.localized
        self.type = exerciseObject.type
        self.timer = exerciseObject.timer
        self.notes = exerciseObject.notes
        self.icon = exerciseObject.icon
        self.sets = exerciseObject.sets
    }

    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.id == rhs.id
    }
}
