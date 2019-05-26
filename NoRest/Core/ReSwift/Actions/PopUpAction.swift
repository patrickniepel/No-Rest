//
//  PopUpAction.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct PopUpAction: Action {
    let type: PopUpType
    let exercise: Exercise?
    
    init(type: PopUpType, exercise: Exercise?) {
        self.type = type
        self.exercise = exercise
    }
}

enum PopUpType {
    case timer
    case notes
    case unitialized
}
