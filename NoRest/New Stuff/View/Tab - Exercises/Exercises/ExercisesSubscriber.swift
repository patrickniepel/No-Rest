//
//  ExercisesSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 27.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension ExercisesCollectionViewController: StoreSubscriber {
    
    func newState(state: ExercisesState) {
        injectCategory(state.category)
    }
}
