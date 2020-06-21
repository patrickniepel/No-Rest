//
//  WorkoutSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

extension WorkoutViewController: StoreSubscriber {
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.workoutState
            }
        }
    }

    func newState(state: WorkoutState) {
        if let workout = state.workout {
            setupWorkout(workout)
        } else if let exercises = state.exercises {
            addExercises(exercises)
        }
    }

    func unsubscribe() {
        store.unsubscribe(self)
    }
}
