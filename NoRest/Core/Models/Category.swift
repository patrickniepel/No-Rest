//
//  Category.swift
//  NoRest
//
//  Created by Patrick Niepel on 30.01.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

enum Category: String, Codable {
    case chest = "Chest"
    case back = "Back"
    case shoulders = "Shoulders"
    case biceps = "Biceps"
    case triceps = "Triceps"
    case abs = "Abs"
    case legs = "Legs"
    case cardio = "Cardio"
    case none = "General"
    
    static var allCategories: [Category] {
        return [.none, .chest, .back, .shoulders, .biceps, .triceps, .abs, .legs, .cardio]
    }
    
    static var allMuscleCategories: [Category] {
        return [.chest, .back, .shoulders, .biceps, .triceps, .abs, .legs, .cardio]
    }
    
    var exercises: [Exercise] {
        return UserData.sharedInstance.exercises.filter { $0.category == self }.sorted()
    }
    
    var defaultExercises: [Exercise] {
        return DefaultExercise.defaultExercises(for: self).sorted()
    }
    
    var exercisesType: ExerciseType {
        if self == .cardio {
            return .cardio
        }
        return .weightLifting
    }
}
