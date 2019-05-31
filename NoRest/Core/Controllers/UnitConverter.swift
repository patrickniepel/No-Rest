//
//  UnitConverter.swift
//  NoRest
//
//  Created by Patrick Niepel on 04.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation
import ReSwift

struct UnitConverter {
    
    static func convertUnit() {
        let unitToConvertTo = UserData.sharedInstance.unit
        let factor: Double = 0.45359237
        
        let finalFactor = unitToConvertTo == .kg ? factor : 1/factor
        convert(with: finalFactor)
    }
    
    private static func convert(with factor: Double) {
        UserData.sharedInstance.myWorkouts.forEach { $0.convertWeights(with: factor) }
        UserData.sharedInstance.workoutHistory.allWorkouts().forEach { $0.convertWeights(with: factor) }
        UserData.sharedInstance.statistics.allWorkouts().forEach { $0.convertWeights(with: factor) }
    }
}
