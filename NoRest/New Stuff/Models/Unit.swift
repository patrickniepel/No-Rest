//
//  Unit.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

enum Unit: String, Codable {
    case kg = "KG"
    case lbs = "LBS"
    
    static let allCases: [Unit] = [.kg, .lbs]
}
