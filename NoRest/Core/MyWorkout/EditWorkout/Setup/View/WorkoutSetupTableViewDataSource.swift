//
//  WorkoutSettingTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension WorkoutSetupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workoutSetupCtrl.countOfCategories()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutSetupCtrl.countOfExercises(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.nrDefaultTableViewCell, for: indexPath) as? NRDefaultTableViewCell
        
        if let exercise = workoutSetupCtrl.exercise(for: indexPath.section, for: indexPath.row) {
            cell?.setup(title: exercise.name, accessoryType: .checkmark)
            if workoutSetupCtrl.selectedExercises.contains(exercise) {
                cell?.accessoryType = .checkmark
            }
            else {
                cell?.accessoryType = .none
            }
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return workoutSetupCtrl.category(for: section)?.rawValue
    }
}
