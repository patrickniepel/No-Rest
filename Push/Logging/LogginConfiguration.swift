//
//  LogginConfiguration.swift
//  Push
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import Willow

var logger: Logger?

@available(iOS 10.0, *)
struct LoggingConfiguration {
    static func configure() {
        let name = "Logger"
        
        #if DEBUG
            logger = buildDebugLogger(name: name)
        #else
            logger = buildReleaseLogger(name: name)
        #endif
        
        var enable = false
        if let config = ProcessInfo.processInfo.environment["RESWIFT_LOG"] {
            enable = config == "enable"
        }
        logger?.enabled = enable
    }
    
    /**
     Builds a logger for debug-builds. Prints all log messages to the console.
     Logging will block the main thread.
     
     - parameter name: The name of the logger.
     - returns: The configured logger.
     */
    private static func buildDebugLogger(name: String) -> Logger {
        let emojiModifier = EmojiModifier(name: name)
        
        let consoleWriter = ConsoleWriter(modifiers: [emojiModifier])
        
        return Logger(logLevels: [.all], writers: [consoleWriter], executionMethod: .synchronous(lock: NSRecursiveLock()))
    }
    
    /**
     Builds a logger for release-builds. Prints only serve messages.
     Logging will be performed asynchronously to prevent performance problems in production.
     
     - parameter name: The name of the logger.
     - returns: The configured logger.
     */
    private static func buildReleaseLogger(name: String) -> Logger {
        let osLogWriter = OSLogWriter(subsystem: "de.parickniepel.push", category: name)
        
        let appLogLevels: LogLevel = [.event, .info, .warn, .error]
        let asynchronousExecution: Logger.ExecutionMethod = .asynchronous(
            queue: DispatchQueue(label: "Push - NoRest", qos: .utility)
        )
        
        return Logger(logLevels: appLogLevels, writers: [osLogWriter], executionMethod: asynchronousExecution)
    }
}


