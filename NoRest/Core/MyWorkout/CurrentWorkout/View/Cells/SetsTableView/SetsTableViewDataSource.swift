//
//  SetsTableViewDataSource.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension CurrentWorkoutCollectionViewCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = exercise?.sets.count ?? 0
        toggleTableStackViewVisibility(isHidden: count == 0)
        return count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            exercise?.sets.remove(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NRConstants.CellIdentifiers.setsTableViewCell) as? SetsTableViewCell
        if let set = exercise?.sets[safe: indexPath.row] {
            cell?.setup(with: set)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SetsTableViewHeader(backgroundColor: .uiControl)
    }
    
    func addSet(_ set: Set) {
        exercise?.sets.append(set)
        tableView.reloadData()
    }
    
    func updateSet(_ set: Set) {
        if let index = tableView.indexPathForSelectedRow?.row {
            exercise?.sets[index] = set
            tableView.reloadData()
        }
    }
}
