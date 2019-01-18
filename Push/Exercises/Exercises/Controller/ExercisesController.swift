//
//  ExercisesController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesController: NSObject {
    
    var userData = UserData.sharedInstance
    
    func loadExercises(category: String) -> [Exercise] {
        
        if category == "Error" {
            return DefaultExercises().exercises["Chest"] ?? []
        }
        
        if let loadedExercises = userData.exercises[category] {
            return loadedExercises
        }
        else {
            return DefaultExercises().exercises[category] ?? []
        }
    }
    
    func saveExercises(category: String, exercises: [Exercise]) {
        
        userData.exercises[category] = exercises
        DataObjectPersistency().saveDataObject(items: UserData.sharedInstance)
    }

}
