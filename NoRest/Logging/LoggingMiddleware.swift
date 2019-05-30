//
//  LoggingMiddleware.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import ReSwift

let loggingMiddleware: Middleware<Any> = { _, _ in { next in
    return { action in
        
        let mirror = Mirror(reflecting: action)
        
        log.perform("\(mirror.subjectType)")
        
        // call next middleware
        return next(action)
    }
} }

