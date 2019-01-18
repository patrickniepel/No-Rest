//
//  EditMyWorkoutDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class EditMyWorkoutDataSource: NSObject, UITableViewDataSource{
    
    let allExercises : [String : [Exercise]] = UserData.sharedInstance.exercises
    
    let categories : [String] = UserData.sharedInstance.categories
    
    var selectedExercises : [Exercise] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let category = categories[section]
        return allExercises[category]!.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWorkoutExercisesCell", for: indexPath) as! MyWorkoutExercisesTableViewCell
        
        let category = categories[indexPath.section]
        let exercise = allExercises[category]![indexPath.row]
        cell.workoutName.text = exercise.name
        
        if selectedExercises.contains(exercise) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let category = categories[section]
        return category
    }
    
    func toggleSelectedExercise(section: Int, row: Int) {
        let category = categories[section]
        let exercise = allExercises[category]![row]
        
        if !selectedExercises.contains(exercise) {
            selectedExercises.append(exercise)
        }
        else {
            if selectedExercises.contains(exercise) {
                selectedExercises.remove(at: selectedExercises.index(of: exercise)!)
            }
        }
    }
}
