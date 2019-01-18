//
//  CurrentWorkoutCollectionViewCell.swift
//  Push
//
//  Created by Patrick Niepel on 18.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

enum ButtonState {
    case add
    case update
}

class CurrentWorkoutCollectionViewCell: UICollectionViewCell {
    
    var currentWorkoutCtrl : CurrentWorkoutController!
    var userData = UserData.sharedInstance
    
    lazy var currentExercise : Exercise = Exercise()
    var collectionView : UICollectionView!
    
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var explanationButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var repsTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var inputTableView: UITableView!
    
    var buttonState : ButtonState = .add
    var setNumberToUpdate : Int!
    
    var dataSource : InputDataSource!
    var delegate : InputDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        repsTextField.text = nil
        weightTextField.text = nil
        inputTableView.reloadData()
        super.prepareForReuse()
    }
    
    func setup(collectView: UICollectionView, exercise: Exercise) {
        collectionView = collectView
        currentExercise = exercise
        
        dataSource = InputDataSource()
        delegate = InputDelegate()
        
        inputTableView.dataSource = dataSource
        inputTableView.delegate = delegate
        
        currentWorkoutCtrl = CurrentWorkoutController()
        setupLayout()
        fillTableView()
    }
    
    private func setupLayout() {
        addButton.layer.cornerRadius = 10
        notesButton.layer.borderColor = UIColor.myBlue.cgColor
        notesButton.layer.borderWidth = 1
        notesButton.layer.cornerRadius = 10
        explanationButton.layer.borderWidth = 1
        explanationButton.layer.borderColor = UIColor.myBlue.cgColor
        explanationButton.layer.cornerRadius = 10
    }
    
    private func fillTableView() {
        
        if !currentExercise.sets.isEmpty {
            dataSource.sets = currentExercise.sets
        }
    }
    
    func changePage(page: Int) {
        saveWorkout()
        resetTextFields()
    }
    
    private func saveWorkout() {
        
        //If nothing was added yet, there is no need to save the workout
        if !dataSource.sets.isEmpty {
            currentExercise.sets = dataSource.sets
            let nc = NotificationCenter.default
            nc.post(name: NSNotification.Name("saveWorkout"), object: nil)
        }
    }
    
    func changeButtonToUpdate(for indexPath: IndexPath, set: [String : String]) {
        addButton.setTitle("Update", for: .normal)
        setNumberToUpdate = indexPath.row
        buttonState = .update
        
        repsTextField.text = set["reps"]
        weightTextField.text = set["weight"]
    }
    
    func changeButtonToAdd() {
        addButton.setTitle("Add", for: .normal)
        buttonState = .add
    }
    
    private func resetTextFields() {
        weightTextField.text = ""
        repsTextField.text = ""
    }
    
    @IBAction func addSet(_ sender: UIButton) {
        
        if buttonState == .add {
            let reps = repsTextField.text!
            let weight = weightTextField.text!
            
            //Correct input
            if currentWorkoutCtrl.checkReps(reps: reps) && currentWorkoutCtrl.checkWeight(weight: weight) {
                
                repsTextField.textColor = .myBlue
                weightTextField.textColor = .myBlue
                
                let repsString = repsTextField.text!
                let weightString = weightTextField.text!
                dataSource.addSet(set: ["reps" : repsString, "weight" : weightString])
                inputTableView.reloadData()
                
                saveWorkout()
                resetTextFields()
            }
                //Error
            else {
                repsTextField.textColor = .red
                weightTextField.textColor = .red
            }
        }
        if buttonState == .update {
            changeButtonToAdd()
            
            let reps = repsTextField.text!
            let weight = weightTextField.text!
            
            //Correct input
            if currentWorkoutCtrl.checkReps(reps: reps) && currentWorkoutCtrl.checkWeight(weight: weight) {
                
                repsTextField.textColor = .myBlue
                weightTextField.textColor = .myBlue
                
                let repsString = repsTextField.text!
                let weightString = weightTextField.text!
                dataSource.updateSet(row: setNumberToUpdate, set: ["reps" : repsString, "weight" : weightString])
                inputTableView.reloadData()
                
                saveWorkout()
                resetTextFields()
            }
                //Error
            else {
                repsTextField.textColor = .red
                weightTextField.textColor = .red
            }
        }
    }
    
    @IBAction func showNotes(_ sender: UIButton) {
        let nav = inputTableView.window?.rootViewController as! UINavigationController
        let topVC = nav.topViewController as! CurrentWorkoutViewController
        topVC.performSegue(withIdentifier: "currentWorkoutVC2notesExplanationVC", sender: 0)
    }
    
    @IBAction func showExplanation(_ sender: UIButton) {
        let nav = inputTableView.window?.rootViewController as! UINavigationController
        let topVC = nav.topViewController as! CurrentWorkoutViewController
        topVC.performSegue(withIdentifier: "currentWorkoutVC2notesExplanationVC", sender: 1)
    }
}
