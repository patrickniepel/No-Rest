//
//  WorkoutSettingTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSettingTableViewDataSource: NSObject, UITableViewDataSource {
    
    let workoutSettingCtrl = WorkoutSettingController()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return workoutSettingCtrl.countOfCategories()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutSettingCtrl.countOfExercises(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.workoutSettingTableViewCell, for: indexPath) as? NRDefaultTableViewCell
        let exercise = workoutSettingCtrl.exercise(for: indexPath.section, for: indexPath.row)
        cell?.setup(title: exercise.name, accessoryType: .checkmark)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return workoutSettingCtrl.category(for: section).rawValue
    }
}
