//
//  MyWorkoutHistoryDelegate.swift
//  Push
//
//  Created by Patrick Niepel on 14.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutHistoryDelegate: NSObject, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dataSource = tableView.dataSource as? MyWorkoutHistoryDataSource
        let workouts = Array(dataSource?.history.workouts.reversed() ?? [])
        
        let workout = workouts[indexPath.row]
        
        let nav = tableView.window?.rootViewController as? UINavigationController
        let topVC = nav?.topViewController as? MyWorkoutHistoryTableViewController
        
        topVC?.workoutDetails = workout
        topVC?.performSegue(withIdentifier: "myWorkoutHistoryTVC2myWorkoutHistoryDetailsTVC", sender: nil)
    }
}
