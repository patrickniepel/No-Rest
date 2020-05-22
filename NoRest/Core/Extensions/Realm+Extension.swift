//
//  Realm+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation
import RealmSwift

extension List where Element: Object {
    func wipeAll() {
        forEach {
            $0.realm?.delete(self)
        }
        removeAll()
    }
}

extension Object {
    func delete() {
        realm?.delete(self)
    }
}
