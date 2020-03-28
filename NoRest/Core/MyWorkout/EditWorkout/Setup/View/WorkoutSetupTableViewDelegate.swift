//
//  WorkoutSettingTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 21.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension WorkoutSetupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        workoutSetupCtrl.toggleSelectedExercise(section: indexPath.section, row: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .textColor
            headerView.contentView.backgroundColor = .backgroundColorUIControl
        }
    }
}
