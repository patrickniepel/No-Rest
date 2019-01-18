//
//  EditMyWorkoutController.swift
//  Push
//
//  Created by Patrick Niepel on 15.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class EditMyWorkoutController: NSObject {
    
    var userData = UserData.sharedInstance
    
    func loadAllExercises() -> [String : [Exercise]] {
        return userData.exercises
    }
    
    func checkWorkoutName(name: String) -> Bool {
        
        let trimmedName = name.trimmingCharacters(in: .whitespaces)
        
        if trimmedName.count == 0 {
            return false
        }
        return true
    }
    
    func checkIfSelectedExercisesExist(selected: [Exercise]) -> [Exercise] {
        
        var tmpExercises : [Exercise] = []
        
        var allExercises = userData.exercises
        
        for selectedExercise in selected {
            
            if (allExercises[selectedExercise.category]?.contains(selectedExercise)) ?? false {
                tmpExercises.append(selectedExercise)
            }
        }
        
        return tmpExercises
    }
}
