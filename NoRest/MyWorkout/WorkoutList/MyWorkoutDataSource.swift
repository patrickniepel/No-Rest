//
//  MyWorkoutDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

//class MyWorkoutDataSource: NSObject, UITableViewDataSource {
//    
//    var myWorkouts : [MyWorkout] = []
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myWorkouts.count
//    }
//    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        
//        if editingStyle == .delete {
//            
//            myWorkouts.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
//            tableView.reloadData()
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myWorkoutCell", for: indexPath) as? MyWorkoutTableViewCell
//        
//        cell?.name.text = myWorkouts[indexPath.row].name
//        cell?.setupCell(workout: myWorkouts[indexPath.row], tv: tableView)
//        
//        return cell ?? UITableViewCell()
//    }
//    
//    func addWorkout(workout: MyWorkout) {
//        
//        if myWorkouts.contains(workout) {
//            if let index = myWorkouts.index(of: workout) {
//                myWorkouts.remove(at: index)
//            }
//        }
//        myWorkouts.append(workout)
//        myWorkouts.sort(by: { $0.name <= $1.name})
//    }
//}
