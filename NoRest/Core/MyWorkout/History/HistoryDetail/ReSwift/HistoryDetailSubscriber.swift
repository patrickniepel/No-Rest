//
//  HistoryDetailSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.06.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension HistoryDetailViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.historyDetailState
            }
        }
    }
    
    func newState(state: HistoryDetailState) {
        self.myWorkout = state.myWorkout
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
