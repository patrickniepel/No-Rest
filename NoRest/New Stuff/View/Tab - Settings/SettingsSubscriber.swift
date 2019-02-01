//
//  SettingsSubscriber.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

extension SettingsTableViewController: StoreSubscriber {
    
    func newState(state: SettingsState) {
        let dataReset = state.dataReset
        if dataReset != .none {
            showAlertForDataReset(dataReset)
        }
    }
}
