//
//  EditExerciseSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension EditExerciseViewController: StoreSubscriber {
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.editExerciseState
            }
        }
    }
    
    func newState(state: EditExerciseState) {
        if let exercise = state.exercise {
            setupExercise(exercise)
        }
        
        if let icon = state.icon {
            selectIcon(icon)
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
