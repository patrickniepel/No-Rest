//
//  CurrentWorkoutStoreSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension CurrentWorkoutViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.currentWorkoutState
            }
        }
    }
    
    func newState(state: CurrentWorkoutState) {
        workout = state.workout
        setup()
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
