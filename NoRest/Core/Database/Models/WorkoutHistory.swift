//
//  WorkoutHistory.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class WorkoutHistory: Object {
    private enum Fields: String {
        case id
        case _workouts
    }
    
    override class func primaryKey() -> String? {
        return Fields.id.rawValue
    }
    
    dynamic private(set) var id: String = "workoutHistory"
    
    dynamic private(set) var _workouts: List<Workout> = .init()
    var workouts: [Workout] {
        get {
            _workouts.map { $0 }
        }
        
        set {
            _workouts.wipeAll()
            _workouts.append(objectsIn: newValue)
        }
    }
    
    static func get() -> WorkoutHistory? {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return realm.objects(WorkoutHistory.self).first
    }

    static func add() {
        Database.add(object: WorkoutHistory(), update: true)
    }

    static func delete() {
        if let workoutHistory = get() {
            Database.delete(object: workoutHistory)
        }
    }
}
