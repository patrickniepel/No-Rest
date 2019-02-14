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
        
        if let category = state.category {
            injectCategory(category)
        } else {
            collectionView.reloadData()
        }
    }
}
