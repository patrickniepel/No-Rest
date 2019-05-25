//
//  UserDefaults.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UserDefaults {
    
    /**
     Stores a value in UserDefaults for the specified key
     - parameter value: The value to store
     - parameter key: The string identifer of the value to be stored
     */
    static func saveValue<T>(_ value: T, key: String) {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /**
     Deletes a value in UserDefaults for the specified key
     - parameter key: The string identifier of the value to be deleted
     */
    static func deleteValue(for key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    /**
     Loads a value from UserDefaults for the specified key
     - parameter key: The string identifier of the value to be loaded
     - returns: The desired value
     */
    static func loadValue(for key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}

/** Cookie Handling */
public extension UserDefaults {
    
    /**
     Stores a cookie in UserDefaults for the specified key
     - parameter cookie: The cookie to store
     - parameter key: The string identifier of the cookie to be stored
     */
    static func saveCookie(cookie: HTTPCookie, key: String) {
        saveValue(cookie.properties, key: key)
    }
    
    /**
     Deletes a cookie in UserDefaults for the specified key
     - parameter key: The string identifier of the cookie to be deleted
     */
    static func deleteCookie(for key: String) {
        deleteValue(for: key)
    }
    
    /**
     Loads a cookie from UserDefaults for the specified key
     - parameter key: The string identifier of the cookie to be loaded
     - returns: The desired cookie
     */
    static func loadCookie(for key: String) -> HTTPCookie? {
        guard
            let defaultsValue = loadValue(for: key) as? [HTTPCookiePropertyKey: AnyObject],
            let cookie = HTTPCookie(properties: defaultsValue) else {
                return nil
        }
        return cookie
    }
    
    /**
     Loads a cookie's string value from UserDefaults for the specified key
     - parameter key: The string identifier of the cookie
     - returns: The string value of the desired cookie
     */
    static func loadCookieStringValue(for key: String) -> String? {
        guard let cookie = loadCookie(for: key) else {
            return nil
        }
        return cookie.value
    }
}

