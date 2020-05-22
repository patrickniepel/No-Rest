//
//  UserDefaultsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct UserDefaultsController: Codable {
    
    private static let timerSoundKey = "timerSoundKey"
    static var isTimerSoundEnabled: Bool {
        get { UserDefaults.standard.bool(forKey: timerSoundKey) }
        set { UserDefaults.standard.set(newValue, forKey: timerSoundKey) }
    }
    
    private static let unitKey = "unitKey"
    static var unit: Unit {
        get {
            guard let unitString = UserDefaults.standard.string(forKey: unitKey) else { return .kg }
            return Unit(rawValue: unitString) ?? .kg
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: unitKey)
        }
    }
    
    enum Onboarding: String {
        case startWorkout
        case exercises
        case history
    }
    
    static func storeOnboarding(type: Onboarding) {
        UserDefaults.standard.set(true, forKey: type.rawValue)
    }
    
    static func didShowOnboarding(type: Onboarding) -> Bool {
        return UserDefaults.standard.bool(forKey: type.rawValue)
    }
    
    static func resetOnboarding() {
        [Onboarding.startWorkout.rawValue, Onboarding.exercises.rawValue, Onboarding.history.rawValue].forEach {
            UserDefaults.standard.set(false, forKey: $0)
        }
    }
}
