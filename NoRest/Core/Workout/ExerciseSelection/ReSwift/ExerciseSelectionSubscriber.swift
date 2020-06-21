//
//  ExerciseSelectionSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

extension ExerciseSelectionView: StoreSubscriber {
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.exerciseSelectionState
            }
        }
    }

    func newState(state: ExerciseSelectionState) {
        preSelectExercises(state.selectedExercises)
    }

    func unsubscribe() {
        store.unsubscribe(self)
    }
}
