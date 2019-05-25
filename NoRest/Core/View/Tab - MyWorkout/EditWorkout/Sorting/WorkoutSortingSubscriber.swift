//
//  WorkoutSortingSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension WorkoutSortingTableViewController: StoreSubscriber {
    
    func newState(state: WorkoutSortingState) {
        setupExerciseSorting(for: state.workout)
    }
}
