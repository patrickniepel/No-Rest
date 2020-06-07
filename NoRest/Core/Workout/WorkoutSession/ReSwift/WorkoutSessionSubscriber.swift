//
//  WorkoutSessionSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

extension WorkoutSessionViewController: StoreSubscriber {
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.workoutSessionState
            }
        }
    }
    
    func newState(state: WorkoutSessionState) {
        if let workout = state.workout {
            setupWorkoutSession(workout)
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
