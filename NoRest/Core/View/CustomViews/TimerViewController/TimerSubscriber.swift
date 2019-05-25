//
//  TimerSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension TimerViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.timerState
            }
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
    
    func newState(state: TimerState) {
        seconds = state.seconds
        setup()
    }
}
