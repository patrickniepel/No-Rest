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
//        toggleTableStackViewVisibility(isHidden: count == 0)
        return count
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteSet(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateExercise()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "")
//        if let set = exercise?.sets[safe: indexPath.row] {
//            cell?.setup(with: set)
//        }

        return cell ?? UITableViewCell()
    }

    func addSet(_ set: Set) {
        exercise?.sets.append(set)
        updateExercise()
        tableView.reloadData()
    }

    func updateSet(_ set: Set) {
        if let index = tableView.indexPathForSelectedRow?.row {
            exercise?.sets[index] = set
            updateExercise()
            tableView.reloadData()
        }
    }

    func deleteSet(at index: Int) {
        exercise?.sets.remove(at: index)
        updateExercise()
    }
}
