//
//  Workout.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Workout: Object, Comparable {
    private enum Fields: String {
        case id
        case createdAt
        case mostRecent
        case name
        case _exercises
    }
    
    override class func primaryKey() -> String? {
        return Fields.id.rawValue
    }
    
    dynamic private(set) var id: Int = 0
    
    dynamic private(set) var createdAt: Date?
    dynamic var mostRecent: Date?
    dynamic var name: String = ""
    
    dynamic private(set) var _exercises: List<Exercise> = .init()
    var exercises: [Exercise] {
        get {
            _exercises.map { $0 }
        }
        
        set {
            _exercises.wipeAll()
            _exercises.append(objectsIn: newValue)
        }
    }
    
    convenience init(name: String, exercises: [Exercise] = []) {
        self.init()
        
        self.id = UserDefaultsController.currentWorkoutId
        self.name = name
        self.exercises = exercises
        
        self.createdAt = Date()
    }
    
    static func all() -> [Workout]{
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return Array(realm.objects(Workout.self)).sorted()
    }
    
    static func get(id: Int) -> Workout? {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return realm.objects(Workout.self).filter("\(Fields.id.rawValue) = \(id)").first
    }

    static func add(workout: Workout) {
        Database.add(object: workout, update: true)
        UserDefaultsController.increaseWorkoutId()
    }

    static func delete(with id: Int) {
        if let workout = get(id: id) {
            Database.delete(object: workout)
        }
    }
    
    static func < (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.name < rhs.name
    }
}
