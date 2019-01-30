//
//  EditExerciseTableViewController.swift
//  Push
//
//  Created by Patrick Niepel on 13.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

//protocol EditExerciseSegueDelegate {
//    func saveFromEditExerciseScreen(ctrl: EditExerciseTableViewController, exercise: Exercise)
//}

//class EditExerciseTableViewController: UITableViewController {
//    
//    var delegate : EditExerciseSegueDelegate? = nil
//    
//    var exerciseToEdit : Exercise?
//    var category : String?
//    
//    @IBOutlet weak var nameTextField: UITextField!
//    @IBOutlet weak var restTimeTextField: UITextField!
//    @IBOutlet weak var notesField: UITextView!
//    @IBOutlet weak var explanationField: UITextView!
//    @IBOutlet weak var restTimerDurationCell: UITableViewCell!
//    
//    var editCtrl : EditController?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        hideKeyboardWhenTappedAround()
//        
//        if exerciseToEdit?.name.isEmpty ?? false {
//            self.navigationItem.title = "New Exercise"
//            
//            if category == "Cardio" {
//                restTimeTextField.text = nil
//                restTimeTextField.placeholder = "Minutes"
//            }
//            else {
//                restTimeTextField.text = nil
//                restTimeTextField.placeholder = "Seconds"
//            }
//        }
//        else {
//            fillFields()
//        }
//        
//        editCtrl = EditController()
//    }
//    
//    private func fillFields() {
//        self.navigationItem.title = exerciseToEdit?.name
//        nameTextField.text = exerciseToEdit?.name
//        
//        if category == "Cardio" {
//            restTimeTextField.text = "\(exerciseToEdit?.restTime ?? 0 / 60)"
//        }
//        else {
//            restTimeTextField.text = "\(exerciseToEdit?.restTime ?? 0)"
//        }
//        notesField.text = exerciseToEdit?.notes
//        explanationField.text = exerciseToEdit?.explanation
//    }
//    
//    @IBAction func saveExercise(_ sender: UIBarButtonItem) {
//        
//        guard let name = nameTextField.text, let restTime = restTimeTextField.text, let notes = notesField.text, let explanation = explanationField.text  else {
//            showAlert()
//            return
//        }
//        
//        let inputCorrect = editCtrl?.checkUserInput(name: name, restTime: restTime) ?? false
//        
//        if inputCorrect {
//            exerciseToEdit?.name = name
//            exerciseToEdit?.category = category ?? ""
//            
//            if category == "Cardio" {
//                exerciseToEdit?.restTime = Int(restTime) ?? 0 * 60
//            }
//            else {
//                exerciseToEdit?.restTime = Int(restTime) ?? 0
//            }
//            
//            exerciseToEdit?.notes = notes
//            exerciseToEdit?.explanation = explanation
//            delegate?.saveFromEditExerciseScreen(ctrl: self, exercise: exerciseToEdit ?? Exercise(aName: "My Exercise"))
//        }
//        else {
//            showAlert()
//        }
//    }
//    
//    private func showAlert() {
//        let alert = UIAlertController(title: "Incorrect Input", message: "", preferredStyle: .alert)
//        
//        let okAction = UIAlertAction(title: "OK", style: .default) { action -> Void in
//        }
//        
//        alert.addAction(okAction)
//        present(alert, animated: true)
//    }
//    
//    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        if let headerTitle = view as? UITableViewHeaderFooterView {
//            headerTitle.textLabel?.textColor = .myBlue
//        }
//    }
//}
