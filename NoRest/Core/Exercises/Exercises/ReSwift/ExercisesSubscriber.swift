//
//  ExercisesSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 27.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension ExercisesCollectionViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.exercisesState
            }
        }
    }
    
    func newState(state: ExercisesState) {
        if let type = state.type {
            injectExerciseType(type)
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
