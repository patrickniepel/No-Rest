//
//  InputDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 19.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class InputDataSource: NSObject, UITableViewDataSource {
    
    var sets : [[String : String]] = []
    let unit = UserData.sharedInstance.unit
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "currentInputCell", for: indexPath) as! InputTableViewCell

        cell.reps.text = sets[indexPath.row]["reps"]! + "x"
        cell.weight.text = sets[indexPath.row]["weight"]! + unit
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            sets.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            tableView.reloadData()
        }
    }
    
    func addSet(set: [String : String]) {
        sets.append(set)
    }
    
    func updateSet(row: Int, set: [String : String]) {
        sets.remove(at: row)
        sets.insert(set, at: row)
    }
}
