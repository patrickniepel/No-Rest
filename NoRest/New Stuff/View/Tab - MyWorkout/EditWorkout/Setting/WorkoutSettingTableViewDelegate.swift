//
//  WorkoutSettingTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSettingTableViewDelegate: NSObject, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataSource = tableView.dataSource as? WorkoutSettingTableViewDataSource
        //dataSource?.toggleSelectedExercise(section: indexPath.section, row: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            headerView.backgroundView?.backgroundColor = .mainColor
        }
    }
}
