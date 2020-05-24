//
//  Exercise.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class Exercise: Object, Comparable {
    
    enum Fields: String {
        case id
        case _type
        case timer
        case notes
        case _image
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
    
    dynamic private(set) var _image: Data?
    var image: UIImage? {
        get {
            guard let imageData = _image else { return nil }
            return UIImage(data: imageData)
        }
        
        set {
            _image = newValue?.pngData()
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
    
    var descriptiveRestTimer: String {
        guard let type = self.type else { return "\(timer)" }
        return type == .cardio ? "\(timer / 60) min" : "\(timer) s"
    }
    
    convenience init(name: String, type: ExerciseType, timer: Int, notes: String = "", image: UIImage? = nil, sets: [Set] = []) {
        self.init()
        
        self.name = name
        self.type = type
        self.timer = timer
        self.notes = notes
        self.image = image
        self.sets = sets
        
        self.id = UserDefaultsController.currentExerciseId
    }
    
    static func < (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name < rhs.name
    }
    
    static func all() -> [Exercise] {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        let exercises = Array(realm.objects(Exercise.self)).sorted()
        return exercises
    }
    
    static func asDictionary() -> [String: [Exercise]] {
        var dictionary: [String: [Exercise]] = [:]
        
        ExerciseType.allCases.forEach {
            dictionary[$0.rawValue] = Array(exercises(for: $0).sorted())
        }
        
        return dictionary
    }
    
    static func exercises(for type: ExerciseType) -> [Exercise] {
        guard let realm = Database.getRealm() else {
            fatalError()
        }
        
        let exercises = Array(realm.objects(Exercise.self).filter(NSPredicate(format: "%K = %@", Fields._type.rawValue, type.rawValue))).sorted()
        return exercises
    }
    
    static func get(id: Int) -> Exercise? {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return realm.objects(Exercise.self).filter("\(Fields.id.rawValue) = \(id)").first
    }

    static func add(exercise: Exercise) {
        Database.add(object: exercise, update: true)
        UserDefaultsController.increaseExerciseId()
    }
    
    static func delete(with id: Int) {
        if let exercise = get(id: id) {
            Database.delete(object: exercise)
        }
    }
}

//@objcMembers
//class StaticExercise: Exercise {
//    override class func primaryKey() -> String? {
//        return Fields.id.rawValue
//    }
//
//    dynamic private(set) var _image: Data?
//    var image: UIImage? {
//        get {
//            guard let imageData = _image else { return nil }
//            return UIImage(data: imageData)
//        }
//
//        set {
//            _image = newValue?.pngData()
//        }
//    }
//
//    init(name: String, type: ExerciseType, restTimer: Int, notes: String = "", image: UIImage) {
//        super.init(name: name, type: type, restTimer: restTimer, notes: notes)
//
//        self.image = image
//        self.id = "\(name)_\(type)_\(restTimer)_\(notes)"
//    }
//
//    required init() {
//        fatalError("init() has not been implemented")
//    }
//
//    static func all() -> Results<StaticExercise> {
//        guard let realm = Database.getRealm() else {
//            fatalError()
//        }
//
//        return realm.objects(StaticExercise.self)
//    }
//
//    static func get(id: String) -> StaticExercise? {
//        guard let realm = Database.getRealm() else {
//            fatalError()
//        }
//
//        return realm.objects(StaticExercise.self).filter(NSPredicate(format: "%K = %@", Fields.id.rawValue, id)).first
//    }
//
//    static func add(workout: StaticExercise) {
//        Database.add(object: workout, update: true)
//    }
//
//    static func delete(with id: String) {
//        if let staticExercise = get(id: id) {
//            Database.delete(object: staticExercise)
//        }
//    }
//}
//
//@objcMembers
//class DynamicExercise: Exercise {
//    override class func primaryKey() -> String? {
//        return Fields.id.rawValue
//    }
//
//    dynamic private(set) var _sets: List<Set> = .init()
//    var sets: [Set] {
//        get {
//            _sets.map { $0 }
//        }
//
//        set {
//            _sets.wipeAll()
//            _sets.append(objectsIn: newValue)
//        }
//    }
//
//    init(staticExercise: StaticExercise, sets: [Set]) {
//        let type = staticExercise.type ?? .chest
//
//        super.init(name: staticExercise.name, type: type, restTimer: staticExercise.restTimer, notes: staticExercise.notes)
//
//        self.sets = sets
//
//        let setsId = sets.map { $0.id }.joined(separator: "-")
//        self.id = "\(name)_\(type)_\(restTimer)_\(setsId)"
//    }
//
//    required init() {
//        fatalError("init() has not been implemented")
//    }
//}
