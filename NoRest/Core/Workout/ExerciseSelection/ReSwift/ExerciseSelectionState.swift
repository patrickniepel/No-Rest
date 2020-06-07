//
//  ExerciseSelectionState.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

struct ExerciseSelectionState: StateType, Equatable {
    var selectedExercises: [Exercise]?
}
