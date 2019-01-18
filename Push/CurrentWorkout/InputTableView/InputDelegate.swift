//
//  InputDelegate.swift
//  Push
//
//  Created by Patrick Niepel on 19.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class InputDelegate: NSObject, UITableViewDelegate {
    
    var selected : [IndexPath] = []
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.superview?.superview as? CurrentWorkoutCollectionViewCell
        let dataSource = tableView.dataSource as? InputDataSource
        
        if selected.count > 1 {
            selected.remove(at: 0)
        }
        
        if selected.contains(indexPath) {
            
            if let index = selected.index(of: indexPath) {
                selected.remove(at: index)
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
            cell?.changeButtonToAdd()
        }
        else {
            selected.append(indexPath)
            if let set = dataSource?.sets[indexPath.row] {
                cell?.changeButtonToUpdate(for: indexPath, set: set)
            }
        }
    }
}
