//
//  TimerViewController.swift
//  Push
//
//  Created by Patrick Niepel on 20.10.17.
//  Copyright © 2017 Patrick Niepel. All rights reserved.
//

import UIKit

protocol TimerSegueDelegate {
    func backFromTimerScreen(ctrl: TimerViewController)
}

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var timerTextField: UITextField!
    @IBOutlet weak var btnStart: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    var timerCtrl : TimerController?
    
    var delegate : TimerSegueDelegate? = nil
    
    var counter = 0 //Exercise muss hierher übergeben werden, dann restTime auslesen und als count speichern
    var previousCounter = 0
    var timer : Timer?
    var currentExercise : Exercise?
    
    var startPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        timerCtrl = TimerController()
        
        //If there is a restTime for the current exercise
        if let exercise = currentExercise {
            counter = exercise.restTime
        }
        timerTextField.text = "\(counter)"
    }
    
    func setupLayout() {
        
        timerView.layer.cornerRadius = 15
        timerView.layer.borderWidth = 1
        timerView.layer.borderColor = UIColor.myBlue.cgColor
        
        btnStart.layer.cornerRadius = 10
        btnStart.layer.borderWidth = 1
        btnStart.layer.borderColor = UIColor.myBlue.cgColor
        
        btnCancel.layer.cornerRadius = 10
        btnCancel.layer.borderWidth = 1
        btnCancel.layer.borderColor = UIColor.red.cgColor
        
        timerTextField.layer.cornerRadius = 15
        timerTextField.layer.borderWidth = 1
        timerTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    @objc func handleTimer() {
        
        if counter == 0 {
            stopTimer()
            delegate?.backFromTimerScreen(ctrl: self)
        }
        else {
            counter -= 1
            timerTextField.text = "\(counter)"
        }
    }
    
    func stopTimer() {
       timer?.invalidate()
    }

    @IBAction func startTimer(_ sender: UIButton) {
        
        startPressed = !startPressed
        
        if startPressed {
            actionForStart()
        }
        else {
            actionForReset()
        }
    }
    
    func actionForStart() {
        
        btnStart.setTitle("Reset", for: UIControl.State.normal)
        
        timerTextField.resignFirstResponder()
        let timerValue = timerTextField.text ?? "0"
        
        if timerCtrl?.checkTimerValue(value: timerValue) ?? false {
            counter = Int(timerValue) ?? 0
        }
        else {
            counter = 0
        }
        previousCounter = counter
        
        if counter == 0 {
            delegate?.backFromTimerScreen(ctrl: self)
        }
        else {
            startTimer()
        }
    }
    
    func actionForReset() {
        
        btnStart.setTitle("Start", for: UIControl.State.normal)
        stopTimer()
        timerTextField.text = "\(previousCounter)"
    }
    @IBAction func cancelTimer(_ sender: UIButton) {
        timerTextField.resignFirstResponder()
        stopTimer()
        delegate?.backFromTimerScreen(ctrl: self)
    }
}
