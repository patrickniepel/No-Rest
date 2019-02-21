//
//  WorkoutSettingSubsriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension WorkoutSettingViewController: StoreSubscriber {
    
    func newState(state: WorkoutSettingState) {
        setupWorkout(state.workout)
    }
}
