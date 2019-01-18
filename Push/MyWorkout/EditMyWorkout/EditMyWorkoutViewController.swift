//
//  EditMyWorkoutViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

protocol EditMyWorkoutSegueDelegate {
    func saveFromEditMyWorkoutScreen(ctrl: EditMyWorkoutViewController, myWorkout: MyWorkout)
}

class EditMyWorkoutViewController: UIViewController, RearrangingSegueDelegate, UITextFieldDelegate {
    
    var delegate : EditMyWorkoutSegueDelegate? = nil
    
    var myWorkoutToEdit : MyWorkout?
    
    var delegateTV : EditMyWorkoutDelegate?
    var dataSource : EditMyWorkoutDataSource?
    
    var editCtrl : EditMyWorkoutController?
    
    @IBOutlet weak var workoutNameLabel: UITextField!
    @IBOutlet weak var myWorkoutExercisesTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workoutNameLabel.delegate = self
        
        hideKeyboardWhenTapped()
        
        editCtrl = EditMyWorkoutController()
        
        delegateTV = EditMyWorkoutDelegate()
        dataSource = EditMyWorkoutDataSource()
        
        if myWorkoutToEdit?.name.isEmpty ?? false {
            self.navigationItem.title = "New Workout"
        }
        else {
            fillFields()
        }
        
        myWorkoutExercisesTV.delegate = delegateTV
        myWorkoutExercisesTV.dataSource = dataSource
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        workoutNameLabel.resignFirstResponder()
        return false
    }
    
    private func fillFields() {
        self.navigationItem.title = myWorkoutToEdit?.name ?? "My Workout"
        workoutNameLabel.text = myWorkoutToEdit?.name ?? "My Workout"
        dataSource?.selectedExercises = editCtrl?.checkIfSelectedExercisesExist(selected: myWorkoutToEdit?.exercises ?? []) ?? []
    }
    
    private func getExercisesToRearrange() -> [Exercise] {
       return dataSource?.selectedExercises ?? []
    }
    
    func saveFromRearrangingScreen(ctrl: MyWorkoutRearrangingTableViewController, myWorkout: MyWorkout) {
        ctrl.navigationController?.popViewController(animated: false)
        delegate?.saveFromEditMyWorkoutScreen(ctrl: self, myWorkout: myWorkout)
    }
    
    @IBAction func continueToRearranging(_ sender: UIBarButtonItem) {
        
        guard let name = workoutNameLabel.text else {
            showAlert()
            return
        }
        
        let selectedExercises = getExercisesToRearrange()
        
        if selectedExercises.count == 0 {
            showAlertMissingExercises()
            return
        }
        myWorkoutToEdit?.exercises = getExercisesToRearrange()
        
        let correctValue = editCtrl?.checkWorkoutName(name: name) ?? false
        
        if correctValue {
            myWorkoutToEdit?.name = name
            performSegue(withIdentifier: "myWorkoutEditTVC2myWorkoutRearrangingTVC", sender: nil)
        }
        else {
            showAlert()
        }
    }
    
    private func showAlert() {
        
        let alert = UIAlertController(title: "Invalid Name", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    private func showAlertMissingExercises() {
        
        let alert = UIAlertController(title: "No Exercises Selected", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "myWorkoutEditTVC2myWorkoutRearrangingTVC" {
            
            let destVC = segue.destination as? MyWorkoutRearrangingTableViewController
            destVC?.delegate = self
            destVC?.myWorkoutToRearrange = myWorkoutToEdit
        }
    }
}
