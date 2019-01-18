//
//  ExercisesDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesDataSource: NSObject, UITableViewDataSource {
    
    var exercises : [Exercise] = []
    var category : String = ""
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            exercises.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if category == "Cardio" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exercisesCardioCell", for: indexPath) as! ExercisesCardioTableViewCell
            
            cell.exerciseName.text = exercises[indexPath.row].name
            cell.minutes.text = "\(exercises[indexPath.row].restTime / 60)" + " minutes"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "exercisesCell", for: indexPath) as! ExercisesTableViewCell
            
            cell.exerciseName.text = exercises[indexPath.row].name
            cell.restTime.text = "\(exercises[indexPath.row].restTime)" + " seconds"
            
            return cell
        }
    }
    
    func addExercise(exercise: Exercise) {
        if exercises.contains(exercise) {
            exercises.remove(at: exercises.index(of: exercise)!)
        }
        exercises.append(exercise)
        exercises.sort(by: { $0.name <= $1.name})
    }
}
