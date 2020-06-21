//
//  NRConstants.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

struct NRConstants {
    struct DataIdentifiers {
        static let currentWorkoutID = "CurrentWorkoutID"
        static let currentExerciseID = "CurrentExerciseID"
    }

    struct Date {
        static let defaultTemplate = "EyMMMMd"
    }

    static var copyright: String {
        let name = "© 2020 Patrick Niepel"
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return name
        }
        return "\(name) - v\(appVersion)"
    }

    static let mail = "patrickniepel@web.de"

    struct Animations {
        static let pulsatingAnimationKey = "pulsatingAnimationKey"
        static let transformScaleKeyPath = "transform.scale"
    }

    static let themeModeKey = "themeModeKey"
}
