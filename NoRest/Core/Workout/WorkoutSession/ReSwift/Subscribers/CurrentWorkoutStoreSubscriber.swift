//
//  CurrentWorkoutStoreSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension CurrentWorkoutViewController: StoreSubscriber {
    func subscribe() {}

    func newState(state: CurrentWorkoutState) {
//        workout = state.workout
//        setup()
    }

    func unsubscribe() {
        store.unsubscribe(self)
    }
}
