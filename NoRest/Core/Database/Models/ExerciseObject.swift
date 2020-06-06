//
//  ExerciseObject.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class ExerciseObject: Object, Comparable {
    
    enum Fields: String {
        case id
        case _type
        case timer
        case notes
        case _icon
        case _sets
    }
    
    override class func primaryKey() -> String? {
        return Fields.id.rawValue
    }
    
    dynamic var id: Int = 0
    dynamic var name: String = ""
    
    dynamic private(set) var _type: String?
    var type: ExerciseType? {
        get {
            guard let type = _type else { return nil }
            return ExerciseType(rawValue: type)
        }
        
        set {
            _type = newValue?.rawValue
        }
    }

    dynamic var timer: Int = 0
    dynamic var notes: String = ""
    
    dynamic private(set) var _icon: Data?
    var icon: UIImage? {
        get {
            guard let iconData = _icon else { return nil }
            return UIImage(data: iconData)
        }
        
        set {
            _icon = newValue?.pngData()
        }
    }
    
    dynamic private(set) var _sets: List<Set> = .init()
    var sets: [Set] {
        get {
            _sets.map { $0 }
        }
        
        set {
            _sets.wipeAll()
            _sets.append(objectsIn: newValue)
        }
    }
    
    convenience init(from exercise: Exercise) {
        self.init()
        
        self.id = exercise.id
        self.name = exercise.name
        self.type = exercise.type
        self.timer = exercise.timer
        self.notes = exercise.notes
        self.icon = exercise.icon
        self.sets = exercise.sets
    }
    
    func update(with exercise: Exercise) {
        Database.update {
            self.name = exercise.name
            self.type = exercise.type
            self.timer = exercise.timer
            self.notes = exercise.notes
            self.icon = exercise.icon
            self.sets = exercise.sets
        }
    }
    
    static func < (lhs: ExerciseObject, rhs: ExerciseObject) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func all() -> [ExerciseObject] {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        let exercises = Array(realm.objects(ExerciseObject.self)).sorted()
        return exercises
    }
    
    static func exercises(for type: ExerciseType) -> [ExerciseObject] {
        guard let realm = Database.getRealm() else {
            fatalError()
        }
        
        let exercises = Array(realm.objects(ExerciseObject.self).filter(NSPredicate(format: "%K = %@", Fields._type.rawValue, type.rawValue))).sorted()
        return exercises
    }
    
    static func get(id: Int) -> ExerciseObject? {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return realm.objects(ExerciseObject.self).filter("\(Fields.id.rawValue) = \(id)").first
    }
    
    static func add(exercise: Exercise) {
        // Check if exercise already exists
        let exerciseObject: ExerciseObject
        if let object = ExerciseObject.get(id: exercise.id) {
            object.update(with: exercise)
            exerciseObject = object
        } else {
            exerciseObject = ExerciseObject(from: exercise)
        }
        Database.add(object: exerciseObject, update: true)
    }
    
    static func delete(with id: Int) {
        if let exercise = get(id: id) {
            Database.delete(object: exercise)
        }
    }
}
