//
//  Dictionary.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Dictionary {
    
    /**
     Merges this dictionary instance with the specified dictionary
     - parameter dictionary: The dictionary to merge with
     - returns: The merged dictionary
     */
    @discardableResult
    mutating func merge(with dictionary: Dictionary) -> Dictionary {
        for (key, value) in dictionary {
            updateValue(value, forKey: key)
        }
        return self
    }
}
