//
//  EmojiModifier.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import Willow

struct EmojiModifier: LogModifier {
    let name: String

    func modifyMessage(_ message: String, with logLevel: LogLevel) -> String {
        switch logLevel {
        case .debug:
            return "🔬🔬🔬 [\(name)] => \(message)"
        case .info:
            return "💡💡💡 [\(name)] => \(message)"
        case .event:
            return "🔵🔵🔵 [\(name)] => \(message)"
        case .warn:
            return "⚠️⚠️⚠️ [\(name)] => \(message)"
        case .error:
            return "🚨💣💥 [\(name)] => \(message)"
        default:
            return "[\(name)] => \(message)"
        }
    }
}

