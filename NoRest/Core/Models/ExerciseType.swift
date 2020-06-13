//
//  ExerciseType.swift
//  NoRest
//
//  Created by Patrick Niepel on 22.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import Foundation

enum ExerciseType: String, CaseIterable {
    case chest
    case back
    case shoulders
    case biceps
    case triceps
    case abs
    case legs
    case cardio
    
    var displayName: String {
        switch self {
        case .chest:
            return "chest.title".localized
        
        case .back:
            return "back.title".localized
        
        case .shoulders:
            return "shoulders.title".localized
        
        case .biceps:
            return "biceps.title".localized
        
        case .triceps:
            return "triceps.title".localized
        
        case .abs:
            return "abs.title".localized
        
        case .legs:
            return "legs.title".localized
        
        case .cardio:
            return "cardio.title".localized
        }
    }
    
    static func type(for stringValue: String) -> ExerciseType {
        switch stringValue {
        case "chest.title".localized:
            return .chest
            
        case "back.title".localized:
            return .back
            
        case "shoulders.title".localized:
            return .shoulders
            
        case "biceps.title".localized:
            return .biceps
            
        case "triceps.title".localized:
            return .triceps
            
        case "abs.title".localized:
            return .abs
            
        case "legs.title".localized:
            return .legs
            
        case "cardio.title".localized:
            return .cardio
        
        default:
            return .chest
        }
    }
}
