//
//  CurrentWorkoutCollectionViewCellStoreSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension CurrentWorkoutCollectionViewCell: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.currentWorkoutCellState
            }
        }
    }
    
    func newState(state: CurrentWorkoutCellState) {
        
        //Back from NotesPopUp
        if let exercise = state.exercise {
            self.exercise = exercise
            ExerciseController().saveExercise(exercise)
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
