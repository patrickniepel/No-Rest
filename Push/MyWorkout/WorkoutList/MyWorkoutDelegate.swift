//
//  MyWorkoutDelegate.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dataSource = tableView.dataSource as! MyWorkoutDataSource
        let myWorkouts = dataSource.myWorkouts
        
        let nav = tableView.window?.rootViewController as! UINavigationController
        let topVC = nav.topViewController as! MyWorkoutTableViewController
        topVC.myWorkoutToEdit = myWorkouts[indexPath.row]
        topVC.performSegue(withIdentifier: "myWorkoutTVC2editMyWorkoutVC", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
