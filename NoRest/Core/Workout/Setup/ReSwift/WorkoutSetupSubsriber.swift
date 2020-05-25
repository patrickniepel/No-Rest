//
//  WorkoutSettingSubsriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension WorkoutSetupViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.workoutSetupState
            }
        }
    }
    
    func newState(state: WorkoutSetupState) {
        setupWorkout(state.workout)
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
