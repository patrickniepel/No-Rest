//
//  PopUpSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension PopUpViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.popUpState
            }
        }
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
    
    func newState(state: PopUpState) {
        type = state.type
        exercise = state.exercise
        if state.type == .unitialized {
            return
        }
        else if state.type == .timer {
            setupTimer()
        }
        else if state.type == .notes {
            setupNotes()
        }
    }
}
