//
//  RearrangingDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 15.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class RearrangingDataSource: NSObject, UITableViewDataSource {
    
    var workout : MyWorkout = MyWorkout()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workout.exercises.count
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "rearrangingCell", for: indexPath) as? RearrangingTableViewCell
        cell?.workoutName.text = workout.exercises[indexPath.row].name
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedObject = workout.exercises[sourceIndexPath.row]
        workout.exercises.remove(at: sourceIndexPath.row)
        workout.exercises.insert(movedObject, at: destinationIndexPath.row)
        
        tableView.reloadData()
    }
    
    
    
}
