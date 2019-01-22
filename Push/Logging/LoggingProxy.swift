//
//  LoggingProxy.swift
//  Push
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import Willow

var log = Proxy(logger: logger)

struct Proxy {
    var proxLogger: Logger?
    
    init(logger: Logger?) {
        self.proxLogger = logger
    }
    
    public func route(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger.debugMessage(self.format(message: message, file: file, function: function, line: line))
    }
    
    public func reduce(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger.infoMessage(self.format(message: message, file: file, function: function, line: line))
    }
    
    public func perform(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger.eventMessage("Action: " + self.format(message: message, file: file, function: function, line: line))
    }
    
    public func process(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger.warnMessage(self.format(message: message, file: file, function: function, line: line))
    }
    
    public func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger.errorMessage(self.format(message: message, file: file, function: function, line: line))
    }
    
    public func event(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        proxLogger.eventMessage(self.format(message: message, file: file, function: function, line: line))
    }
    
    private func format(message: String, file: String, function: String, line: Int) -> String {
        #if DEBUG 
            return "[\(sourceFileName(filePath: file)) \(function):\(line)] \(message)"
        #else
            return message
        #endif
    }
    
    private func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}
