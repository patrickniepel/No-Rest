//
//  HistoryTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 28.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension HistoryTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return historyCtrl.workoutsByID.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.historyTableViewCell, for: indexPath) as? HistoryTableViewCell
        let workouts = historyCtrl.workoutsByID[indexPath.section]
        cell?.setup(for: workouts)
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return historyCtrl.workoutName(for: section)
    }
}
