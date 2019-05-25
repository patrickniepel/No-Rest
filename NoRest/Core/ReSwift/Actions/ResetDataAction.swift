//
//  DeleteDataAction.swift
//  NoRest
//
//  Created by Patrick Niepel on 01.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct ResetDataAction: Action {
    let dataReset: DataReset
}

struct InvalidateResetDataAction: Action {}
