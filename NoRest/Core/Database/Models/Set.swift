//
//  Set.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Set: Object {
    enum Fields: String {
        case id
        case reps
        case weight
    }
    
    dynamic private(set) var id: String = ""
    dynamic private(set) var reps: Int = 0
    dynamic private(set) var weight: Double = 0
    
    override class func primaryKey() -> String? {
        return Fields.id.rawValue
    }
    
    convenience init(reps: Int, weight: Double) {
        self.init()

        self.id = "\(reps)_\(weight)"
        self.reps = reps
        self.weight = weight
    }
}
