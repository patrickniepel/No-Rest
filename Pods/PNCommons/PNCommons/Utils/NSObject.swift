//
//  NSObject.swift
//  PNCommons
//
//  Created by Patrick Niepel on 05.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public protocol ClassName {
    var className: String { get }
    static var className: String { get }
}

public extension ClassName {
    var className: String {
        return type(of: self).className
    }
    
    static var className: String {
        return String(describing: self)
    }
}

extension NSObject: ClassName {}
