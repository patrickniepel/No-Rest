//
//  Set.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct Set: Codable {
    var reps: Int
    var weight: Double
    
    mutating func convertValue(with factor: Double) {
        weight *= factor
    }
}
