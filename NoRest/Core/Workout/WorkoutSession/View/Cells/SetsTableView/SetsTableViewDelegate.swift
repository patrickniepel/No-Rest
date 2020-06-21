//
//  SetsTableViewDelegate.swift
//  NoRest
//
//  Created by Patrick Niepel on 29.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension CurrentWorkoutCollectionViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let cell = tableView.cellForRow(at: indexPath), cell.isSelected {
            tableView.deselectRow(at: indexPath, animated: true)
            changeActionButtonMode(to: .add)
            clearTextFields()
            return nil
        }
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedSet = exercise?.sets[safe: indexPath.row] {
            changeActionButtonMode(to: .update)
            fillTextFields(with: selectedSet)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10
    }
}
