//
//  InfoSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension InfoViewController: StoreSubscriber {
    
    func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.infoState
            }
        }
    }
    
    func newState(state: InfoState) {
        setupInfo(info: state.info)
    }
    
    func unsubscribe() {
        store.unsubscribe(self)
    }
}
