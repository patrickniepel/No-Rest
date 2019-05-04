//
//  UserDefaults.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    static func saveValue<T>(_ value: T, key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func deleteValue(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    static func loadValue(for key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}

/** Cookie Handling */
public extension UserDefaults {
    
    static func saveCookie(cookie: HTTPCookie, key: String) {
        saveValue(cookie.properties, key: key)
    }
    
    static func deleteCookie(for key: String) {
        deleteValue(for: key)
    }
    
    static func loadCookie(for key: String) -> HTTPCookie? {
        guard
            let defaultsValue = loadValue(for: key) as? [HTTPCookiePropertyKey: AnyObject],
            let cookie = HTTPCookie(properties: defaultsValue) else {
                return nil
        }
        return cookie
    }
    
    static func loadCookieStringValue(for key: String) -> String? {
        guard let cookie = loadCookie(for: key) else {
            return nil
        }
        return cookie.value
    }
}

