//
//  ExercisesTableViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesTableViewController: UITableViewController, EditExerciseSegueDelegate {
    
    var selectedCategory : String!
    var exercises : [Exercise] = []
    
    var delegate : ExercisesDelegate!
    var dataSource : ExercisesDataSource!
    
    var exercisesCtrl : ExercisesController!
    
    //When user edits row or wants to add a new exercise
    lazy var exerciseToEdit : Exercise = Exercise()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = selectedCategory
        
        delegate = ExercisesDelegate()
        dataSource = ExercisesDataSource()
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
        exercisesCtrl = ExercisesController()
        loadExercises()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        saveCurrentExercises()
    }
    
    /** Delegate of EditExerciseTableViewController */
    func saveFromEditExerciseScreen(ctrl: EditExerciseTableViewController, exercise: Exercise) {
        dataSource.addExercise(exercise: exercise)
        tableView.reloadData()
        
        //TODO hier eventuell nochmal saven dann auch in workout
        saveCurrentExercises()
        
        ctrl.navigationController?.popViewController(animated: true)
    }
    
    private func saveCurrentExercises() {
        exercises = dataSource.exercises
        exercisesCtrl.saveExercises(category: selectedCategory, exercises: exercises)
    }
    
    /** Starts loading exercises for the selected category */
    private func loadExercises() {
        exercises = exercisesCtrl.loadExercises(category: selectedCategory)
        dataSource.exercises = exercises
        dataSource.category = selectedCategory
    }
    
    @IBAction func addNewExercise(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "exercisesTVC2editExerciseTVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "exercisesTVC2editExerciseTVC" {
            
            let destVC = segue.destination as! EditExerciseTableViewController
            destVC.delegate = self
            destVC.exerciseToEdit = exerciseToEdit
            destVC.category = selectedCategory
            //Clear exercise
            exerciseToEdit = Exercise()
        }
    }
}
