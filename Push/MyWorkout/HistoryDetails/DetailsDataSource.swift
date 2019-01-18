//
//  DetailsDataSource.swift
//  Push
//
//  Created by Patrick Niepel on 15.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class DetailsDataSource: NSObject, UITableViewDataSource {
    
    var exercises : [Exercise] = []
    var userData = UserData.sharedInstance
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if exercises[section].category == "Cardio" {
            return 1
        }
        return exercises[section].sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if exercises[indexPath.section].category == "Cardio" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCardioCell", for: indexPath) as! DetailsCardioTableViewCell

            let exercise = exercises[indexPath.section]
            cell.minutes.text = "\(exercise.restTime / 60)" + " minutes"
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
            
            let exercise = exercises[indexPath.section]
            cell.setNumber.text = exercise.sets[indexPath.row]["reps"]! + "x"
            cell.weight.text = (exercise.sets[indexPath.row]["weight"]! + " " + userData.unit)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return exercises[section].name
    }
    
//    private func getNumberOfSections() -> Int {
//        var count = 0
//
//        for exercise in exercises {
//            if !exercise.sets.isEmpty {
//                count += 1
//            }
//        }
//        return count
//    }
}
