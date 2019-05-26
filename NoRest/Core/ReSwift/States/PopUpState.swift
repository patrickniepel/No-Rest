//
//  PopUpState.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct PopUpState: StateType, Equatable {

    var type: PopUpType
    var exercise: Exercise?
    
    init() {
        type = .unitialized
        exercise = nil
    }
    
    init(type: PopUpType, exercise: Exercise?) {
        self.type = type
        self.exercise = exercise
    }
}
