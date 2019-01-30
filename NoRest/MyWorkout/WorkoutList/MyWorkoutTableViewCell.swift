//
//  MyWorkoutTableViewCell.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

//class MyWorkoutTableViewCell: UITableViewCell {
//
//    @IBOutlet weak var name: UILabel!
//    @IBOutlet weak var startButton: UIButton!
//    
//    var currentTableView : UITableView?
//    var currentWorkout : MyWorkout = MyWorkout()
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        startButton.layer.cornerRadius = 10
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
//    
//    func setupCell(workout: MyWorkout, tv: UITableView) {
//        currentWorkout = workout
//        currentTableView = tv
//    }
//
//    @IBAction func startWorkout(_ sender: UIButton) {
//        guard let tableView = currentTableView else { return }
//
//        let nav = tableView.window?.rootViewController as? UINavigationController
//        let topVC = nav?.topViewController as? MyWorkoutTableViewController
//        
//        topVC?.currentWorkout = currentWorkout
//        topVC?.performSegue(withIdentifier: "myWorkoutTVC2currentWorkoutVC", sender: nil)
//    }
//}
