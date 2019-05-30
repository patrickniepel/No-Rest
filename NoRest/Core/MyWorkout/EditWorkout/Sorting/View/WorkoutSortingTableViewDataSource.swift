//
//  WorkoutSortingTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension WorkoutSortingTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutSortingCtrl.exercisesToSort.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell, for: indexPath) as? NRDefaultTableViewCell
        let exercise = workoutSortingCtrl.exercisesToSort[indexPath.row]
        cell?.setup(title: exercise.name)
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        workoutSortingCtrl.moveExercise(from: sourceIndexPath.row, to: destinationIndexPath.row)
        tableView.reloadData()
    }
}
