//
//  CurrentWorkoutController.swift
//  Push
//
//  Created by Patrick Niepel on 19.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit
import Foundation

class CurrentWorkoutController: NSObject {
    
    
    func checkWeight(weight: String) -> Bool {
        
        if weight.isEmpty {
            return false
        }
        
        let weightCompare = weight.startIndex..<weight.endIndex
        let pattern = "(^[1-9][0-9]{1,2}|^\\d)((\\.|\\,)\\d{1,2})?"
        let res = weight.range(of: pattern, options: .regularExpression)
        
        return res == weightCompare
    }
    
    func checkReps(reps: String) -> Bool {
        
        if reps.isEmpty {
            return false
        }
        
        let repsCompare = reps.startIndex..<reps.endIndex
        let pattern = "^[1-9][0-9]{1,2}$|^\\d$"
        let res = reps.range(of: pattern, options: .regularExpression)
        
        return res == repsCompare
    }
    
    func getCurrentDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE, MM/dd/yyyy, HH:mm"
        let today = formatter.string(from: date)
        
        return today
    }
    
    func createNewExerciseArrayObject(old: [Exercise]) -> [Exercise] {
        
        var newExercises : [Exercise] = []
        
        for exercise in old {
            let newExercise : Exercise = Exercise()
            newExercise.category = exercise.category
            newExercise.explanation = exercise.explanation
            newExercise.name = exercise.name
            newExercise.notes = exercise.notes
            newExercise.restTime = exercise.restTime
            newExercise.sets = exercise.sets
            newExercise.volume = exercise.volume
            
            newExercises.append(newExercise)
        }
        return newExercises
    }
}
