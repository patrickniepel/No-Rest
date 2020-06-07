//
//  WorkoutState.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

struct WorkoutState: StateType, Equatable {
    var workout: Workout?
    var exercises: [Exercise]?
}
