//
//  MyWorkoutHistoryDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 14.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutHistoryDataSource: NSObject, UITableViewDataSource {
    
    var history : WorkoutHistory = WorkoutHistory()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.workouts.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myWorkoutHistoryCell", for: indexPath) as! MyWorkoutHistoryTableViewCell
        
        let workouts = Array(history.workouts.reversed())
        cell.workoutName.text = workouts[indexPath.row].name
        cell.workoutDate.text = "\(workouts[indexPath.row].date)"
        
        return cell
    }
    
    
}
