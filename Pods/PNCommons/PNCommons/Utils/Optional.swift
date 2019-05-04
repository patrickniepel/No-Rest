//
//  Optional.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension Optional where Wrapped == String {
    var isBlank: Bool {
        return self?.trimmed().isEmpty ?? true
    }
}
