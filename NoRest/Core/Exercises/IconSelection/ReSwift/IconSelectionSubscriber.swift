//
//  IconSelectionSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 24.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import ReSwift

extension IconSelectionView: StoreSubscriber {
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.currentIconSelectionState
            }
        }
    }

    func newState(state: CurrentIconSelectionState) {
        currentSelectionIcon = state.icon
    }

    func unsubscribe() {
        store.unsubscribe(self)
    }
}
