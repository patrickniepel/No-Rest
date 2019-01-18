//
//  ExercisesDelegate.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dataSource = tableView.dataSource as! ExercisesDataSource
        let exercises = dataSource.exercises
        
        let nav = tableView.window?.rootViewController as! UINavigationController
        let topVC = nav.topViewController as! ExercisesTableViewController
        topVC.exerciseToEdit = exercises[indexPath.row]
        topVC.performSegue(withIdentifier: "exercisesTVC2editExerciseTVC", sender: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
