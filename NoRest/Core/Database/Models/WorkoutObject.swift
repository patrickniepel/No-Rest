//
//  WorkoutObject.swift
//  NoRest
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class WorkoutObject: Object, Comparable {
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

    dynamic private(set) var _exercises: List<ExerciseObject> = .init()
    var exercises: [ExerciseObject] {
        get {
            _exercises.map { $0 }
        }

        set {
            _exercises.removeAll()
            _exercises.append(objectsIn: newValue)
        }
    }

    convenience init(from workout: Workout) {
        self.init()

        self.id = workout.id
        self.name = workout.name
        self.exercises = workout.exercises.map { ExerciseObject(from: $0) }
        self.createdAt = workout.createdAt
    }

    func update(with workout: Workout) {
        let exercises = ExerciseObject.exerciseObjects(for: workout.exercises)

        Database.update {
            self.name = workout.name
            self.exercises = exercises
        }
    }

    static func all() -> [WorkoutObject] {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return Array(realm.objects(WorkoutObject.self)).sorted()
    }

    static func get(id: Int) -> WorkoutObject? {
        guard let realm = Database.getRealm() else {
            fatalError()
        }

        return realm.objects(WorkoutObject.self).first(where: { $0.id == id })
    }

    static func add(workout: Workout) {
        let workoutObject: WorkoutObject
        if let object = WorkoutObject.get(id: workout.id) {
            object.update(with: workout)
            workoutObject = object
        } else {
            workoutObject = WorkoutObject(from: workout)
        }

        Database.add(object: workoutObject, update: true)
    }

    static func delete(with id: Int) {
        if let workout = get(id: id) {
            Database.delete(object: workout)
        }
    }

    static func < (lhs: WorkoutObject, rhs: WorkoutObject) -> Bool {
        return lhs.name < rhs.name
    }
}
