//
//  String+Extension.swift
//  NoRest
//
//  Created by Patrick Niepel on 12.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

extension String {
    static func seconds(value: Int) -> String {
        return "\(value) s"
    }
    
    static func minutes(value: Int) -> String {
        return "\(value) min"
    }
    
    static func unit(value: Double) -> String {
        return "\(value) \(UserData.sharedInstance.unit.rawValue)"
    }
}
