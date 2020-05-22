//
//  WorkoutSortingTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension WorkoutSortingTableViewController {
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
}
