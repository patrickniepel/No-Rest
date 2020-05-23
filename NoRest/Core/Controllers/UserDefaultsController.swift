//
//  UserDefaultsController.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct UserDefaultsController: Codable {
    
    private static let firstAppInstallKey = "firstAppInstallKey"
    static var isFirstAppInstall: Bool {
        get { !UserDefaults.standard.bool(forKey: firstAppInstallKey) }
        set { UserDefaults.standard.set(!newValue, forKey: firstAppInstallKey) }
    }
    
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
}
