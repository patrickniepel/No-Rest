//
//  CurrentWorkoutCardioCollectionViewCell.swift
//  Push
//
//  Created by Patrick Niepel on 22.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

enum TimerState {
    case started
    case paused
}

class CurrentWorkoutCardioCollectionViewCell: UICollectionViewCell {
    
    var collectionView : UICollectionView!
    var currentExercise : Exercise!
    var currentWorkoutCtrl : CurrentWorkoutController!
    
    var timerCtrl : TimerController!
    
    var timer : Timer!
    var counter = 0
    var counterToReset = 0
    
    var timerState : TimerState = .paused
    
    var saved = false
    
    @IBOutlet weak var underlayingView: UIView!
    @IBOutlet weak var timerTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var startPauseButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var explanationButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(collectView: UICollectionView, exercise: Exercise) {
        collectionView = collectView
        currentExercise = exercise
        
        currentWorkoutCtrl = CurrentWorkoutController()
        timerCtrl = TimerController()
        
        counter = currentExercise.restTime / 60
        counterToReset = counter
        
        setupLayout()
    }
    
    private func setupLayout() {
        
        underlayingView.layer.cornerRadius = 10
        underlayingView.layer.borderColor = UIColor.myBlue.cgColor
        underlayingView.layer.borderWidth = 1
        
        timerTextField.layer.cornerRadius = 10
        timerTextField.layer.borderColor = UIColor.black.cgColor
        timerTextField.layer.borderWidth = 1
        
        resetButton.layer.cornerRadius = 10
        startPauseButton.layer.cornerRadius = 10
        
        notesButton.layer.cornerRadius = 10
        notesButton.layer.borderWidth = 1
        notesButton.layer.borderColor = UIColor.myBlue.cgColor
        
        explanationButton.layer.cornerRadius = 10
        explanationButton.layer.borderWidth = 1
        explanationButton.layer.borderColor = UIColor.myBlue.cgColor
        
        timerTextField.text = "\(counter)"
    }
    
    @IBAction func startPauseTimer(_ sender: UIButton) {
        
        if !saved {
            saved = true
            let nc = NotificationCenter.default
            nc.post(name: NSNotification.Name("saveWorkout"), object: nil)
        }
        
        if timerState == .paused {
            timerState = .started
            
            let timerValue = timerTextField.text!
            
            //Contains ":" when timer was started once -> there is no need to get the textfiel value, the timer just continues ticking
            if !timerValue.contains(":") {
                
                //Check if unser input was correct
                if timerCtrl.checkTimerValue(value: timerValue) {
                    
                    //Convert minutes to seconds
                    counter = Int(timerValue)! * 60
                    
                    sender.setTitle("Pause", for: .normal)
                }
                else {
                    timerTextField.text = "0"
                    counter = 0
                }
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
        }
        else if timerState == .started {
            timerState = .paused
            timer.invalidate()
            sender.setTitle("Start", for: .normal)
        }
        
    }
    
    func stopTimer() {
        if timer != nil {
            timer.invalidate()
        }
    }
    
    @objc func handleTimer() {
        
        counter -= 1
        
        if counter == 0 {
            timer.invalidate()
            timerState = .paused
            startPauseButton.setTitle("Start", for: .normal)
        }
        
        let minutes = counter / 60
        let seconds = counter % 60
        
        timerTextField.text = "\(minutes):\(seconds)"
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        
        if timer != nil {
            timer.invalidate()
            timerTextField.text = "\(counterToReset)"
            startPauseButton.setTitle("Start", for: .normal)
            timerState = .paused
        }
    }
    
    @IBAction func showNotes(_ sender: UIButton) {
        let nav = collectionView.window?.rootViewController as! UINavigationController
        let topVC = nav.topViewController as! CurrentWorkoutViewController
        topVC.performSegue(withIdentifier: "currentWorkoutVC2notesExplanationVC", sender: 0)
    }
    
    @IBAction func showExplanation(_ sender: UIButton) {
        let nav = collectionView.window?.rootViewController as! UINavigationController
        let topVC = nav.topViewController as! CurrentWorkoutViewController
        topVC.performSegue(withIdentifier: "currentWorkoutVC2notesExplanationVC", sender: 1)
    }
}
