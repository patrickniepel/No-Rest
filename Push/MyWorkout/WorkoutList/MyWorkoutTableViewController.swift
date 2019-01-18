//
//  MyWorkoutTableViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class MyWorkoutTableViewController: UITableViewController, EditMyWorkoutSegueDelegate {
    
    var delegate : MyWorkoutDelegate!
    var dataSource : MyWorkoutDataSource!
    
    var myWorkoutCtrl : MyWorkoutController!
    
    var myWorkouts : [MyWorkout] = []
    
    var myWorkoutToEdit : MyWorkout = MyWorkout()
    var currentWorkout : MyWorkout = MyWorkout()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = MyWorkoutDelegate()
        dataSource = MyWorkoutDataSource()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        myWorkoutCtrl = MyWorkoutController()
        loadWorkouts()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        saveCurrentWorkouts()
    }
    
    /** Delegate of EditExerciseTableViewController */
    func saveFromEditMyWorkoutScreen(ctrl: EditMyWorkoutViewController, myWorkout: MyWorkout) {
        dataSource.addWorkout(workout: myWorkout)
        tableView.reloadData()
        
        saveCurrentWorkouts()
        
        ctrl.navigationController?.popViewController(animated: false)
    }
    
    private func saveCurrentWorkouts() {
        myWorkouts = dataSource.myWorkouts
        myWorkoutCtrl.saveWorkouts(workouts: myWorkouts)
    }
    
    /** Starts loading exercises for the selected category */
    private func loadWorkouts() {
        myWorkouts = myWorkoutCtrl.loadWorkouts()
        dataSource.myWorkouts = myWorkouts
    }
    
    @IBAction func addNewWorkout(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "myWorkoutTVC2editMyWorkoutVC", sender: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "myWorkoutTVC2editMyWorkoutVC" {
            
            let destVC = segue.destination as! EditMyWorkoutViewController
            destVC.delegate = self
            destVC.myWorkoutToEdit = myWorkoutToEdit
            myWorkoutToEdit = MyWorkout()
        }
        
        if segue.identifier == "myWorkoutTVC2currentWorkoutVC" {
            
            let destVC = segue.destination as! CurrentWorkoutViewController
            destVC.currentWorkout = currentWorkout
        }
    }

}
