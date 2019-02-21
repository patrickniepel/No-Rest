//
//  WorkoutSettingController.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

struct WorkoutSettingController {
    
    func countOfCategories() -> Int {
        return Category.allCategories.count
    }
    
    func countOfExercises(for categoryIndex: Int) -> Int {
        return Category.allCategories[categoryIndex].exercises.count
    }
    
    func exercise(for categoryIndex: Int, for exerciseIndex: Int) -> Exercise {
        return Category.allCategories[categoryIndex].exercises[exerciseIndex]
    }
    
    func category(for categoryIndex: Int) -> Category {
        return Category.allCategories[categoryIndex]
    }
}
