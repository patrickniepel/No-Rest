//
//  CurrentWorkoutCollectionViewCellStoreSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 26.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension CurrentWorkoutCollectionViewCell: StoreSubscriber {
    func subscribe() {}

    func newState(state: CurrentWorkoutCellState) {
        //Back from NotesPopUp
//        if let exercise = state.exercise {
//            self.exercise = exercise
//        }
    }

    func unsubscribe() {
        store.unsubscribe(self)
    }
}
