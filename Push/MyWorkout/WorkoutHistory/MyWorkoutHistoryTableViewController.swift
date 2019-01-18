//
//  MyWorkoutHistoryTableViewController.swift
//  Push
//
//  Created by Patrick Niepel on 14.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutHistoryTableViewController: UITableViewController {
    
    var delegate : MyWorkoutHistoryDelegate!
    var dataSource : MyWorkoutHistoryDataSource!
    
    var history : WorkoutHistory = WorkoutHistory()
    
    var workoutDetails : MyWorkout!
    
    var historyCtrl : MyWorkoutHistoryController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = MyWorkoutHistoryDelegate()
        dataSource = MyWorkoutHistoryDataSource()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        historyCtrl = MyWorkoutHistoryController()
        loadHistory()
    }
    
    private func loadHistory() {
        history = historyCtrl.loadHistory()
        dataSource.history = history
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "myWorkoutHistoryTVC2myWorkoutHistoryDetailsTVC" {
            
            let destVC = segue.destination as! DetailsViewController
            destVC.workoutDetails = workoutDetails
        }
    }
}
