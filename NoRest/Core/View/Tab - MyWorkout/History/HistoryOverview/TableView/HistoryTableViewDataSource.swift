//
//  HistoryTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 28.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class HistoryTableViewDataSource: NSObject, UITableViewDataSource {
    
    let historyCtrl: HistoryController
    
    init(historyCtrl: HistoryController) {
        self.historyCtrl = historyCtrl
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return historyCtrl.workoutsByID.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.historyTableViewCell, for: indexPath) as? HistoryTableViewCell
        let workouts = historyCtrl.workoutsByID[indexPath.section]
        cell?.setup(for: workouts)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return historyCtrl.workoutName(for: section)
    }
}
