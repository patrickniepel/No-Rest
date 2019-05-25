//
//  InfoAction.swift
//  NoRest
//
//  Created by Patrick Niepel on 14.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

struct InfoAction: Action {
    let info: Info
}

enum Info: String {
    case licenses = "Licenses"
    case disclaimer = "Disclaimer"
    case none = "Error"
}
