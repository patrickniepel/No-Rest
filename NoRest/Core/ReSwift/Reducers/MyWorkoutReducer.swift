//
//  MyWorkoutReducer.swift
//  NoRest
//
//  Created by Patrick Niepel on 16.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

func myWorkoutReducer(action: Action, state: MyWorkoutState?) -> MyWorkoutState {
    return state ?? MyWorkoutState()
}
