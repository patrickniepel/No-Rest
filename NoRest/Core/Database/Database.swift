//
//  Database.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

protocol DatabaseDelegate {
    func add(object: Object, update: Bool)
    func add<S>(objects: S, update: Bool) where S: Sequence, S.Iterator.Element: RealmSwift.Object
    func update(block: () -> Void)
    func delete(object: Object)
    func delete<S>(_ objects: S) where S: Sequence, S.Iterator.Element: RealmSwift.Object
    func reset()
}

class Database: DatabaseDelegate {
    static let schemaVersion = 0
    static let realmDirectory: String = "norest"
    static let realmFile: String = "norest.realm"
    static let realmLockFile: String = "norest.realm.lock"

    static var realmConfig: Realm.Configuration?

    static let queue = DispatchQueue(label: "norest.database", qos: .userInitiated)

    static func setup() {
        let fileManager: FileManager = .default

        guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).last else { fatalError() }

        let directory = documentsDirectory.appendingPathComponent(realmDirectory, isDirectory: true)
        let file = directory.appendingPathComponent(realmFile)

        do {
            try fileManager.createDirectory(atPath: directory.path,
                                            withIntermediateDirectories: true,
                                            attributes: [FileAttributeKey(rawValue: FileAttributeKey.protectionKey.rawValue): FileProtectionType.none])
        } catch _ {
            NSLog("[Database] Couldn't create realm database.")
            fatalError()
        }

        let migration: (RealmSwift.Migration, UInt64) -> Void = { migration, oldSchemaVersion in
        }

        realmConfig = Realm.Configuration(
            fileURL: file,
            schemaVersion: UInt64(schemaVersion),
            migrationBlock: migration,
            shouldCompactOnLaunch: { totalBytes, usedBytes in
                // totalBytes refers to the size of the file on disk in bytes (data + free space)
                // usedBytes refers to the number of bytes used by data in the file

                // Compact if the file is over 100MB in size and less than 50% 'used'
                let oneHundredMB = 100 * 1024 * 1024
                return (totalBytes > oneHundredMB) && (Double(usedBytes) / Double(totalBytes)) < 0.5
        },
            objectTypes: [Workout.self, Exercise.self, Set.self]
        )
    }

    static func getRealm() -> Realm? {
        guard let realmConfig = realmConfig else { return nil }
        var realm: Realm?
        do {
            realm = try Realm(configuration: realmConfig)
        } catch {
            fatalError(error.localizedDescription)
        }
        return realm
    }

    static func add(object: Object, update: Bool) {
        queue.sync {
            autoreleasepool {
                guard let realm = getRealm() else { return }

                realm.beginWrite()
                realm.add(object, update: update ? .all : .error)

                try? realm.commitWrite()
            }
        }
    }

    static func add<S>(objects: S, update: Bool) where S: Sequence, S.Element: Object {
        queue.sync {
            autoreleasepool {
                guard let realm = getRealm() else { return }

                realm.beginWrite()
                objects.forEach { realm.add($0, update: update ? .all : .error) }
                try? realm.commitWrite()
            }
        }
    }

    static func update(block: () -> Void) {
        queue.sync {
            autoreleasepool {
                guard let realm = getRealm() else { return }

                realm.beginWrite()
                block()
                try? realm.commitWrite()
            }
        }
    }

    static func delete(object: Object) {
        queue.sync {
            autoreleasepool {
                guard let realm = getRealm() else { return }

                realm.beginWrite()
                realm.delete(object)
                try? realm.commitWrite()
            }
        }
    }

    static func delete<S>(_ objects: S) where S: Sequence, S.Element: Object {
        queue.sync {
            autoreleasepool {
                guard let realm = getRealm() else { return }

                realm.beginWrite()
                realm.delete(objects)
                try? realm.commitWrite()
            }
        }
    }

    static func reset() {
        autoreleasepool {
            guard let realm = getRealm() else { return }

            realm.beginWrite()
            realm.deleteAll()
            try? realm.commitWrite()
        }
    }

    // MARK: - DatabaseProtocol
    func add(object: Object, update: Bool) {
        Database.add(object: object, update: update)
    }

    func add<S>(objects: S, update: Bool) where S: Sequence, S.Element: Object {
        Database.add(objects: objects, update: update)
    }

    func update(block: () -> Void) {
        Database.update(block: block)
    }

    func delete(object: Object) {
        Database.delete(object: object)
    }

    func delete<S>(_ objects: S) where S: Sequence, S.Element: Object {
        Database.delete(objects)
    }

    func reset() {
        Database.reset()
    }
}
