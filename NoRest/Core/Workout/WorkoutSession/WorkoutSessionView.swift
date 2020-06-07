//
//  WorkoutSessionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSessionView: UIView {
    private let workout: Workout
    
    init(workout: Workout) {
        self.workout = workout
        super.init(frame: CGRect())
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
    }
}
