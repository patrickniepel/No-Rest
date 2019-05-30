//
//  WorkoutSortingSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension WorkoutSortingTableViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.workoutSortingState
            }
        }
    }
    
    func newState(state: WorkoutSortingState) {
        setupExerciseSorting(for: state.workout)
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
