//
//  PopUpViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    var type: PopUpType = .unitialized
    var exercise: Exercise?
    private var tapGesture: UITapGestureRecognizer!
    
    private var timerView: TimerView?
    private var notesView: NotesView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissViewController))
        view.addGestureRecognizer(tapGesture)
        subscribe()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
    }
    
    func setupTimer() {
        timerView = TimerView(seconds: exercise?.timer ?? 0)
        view.addSubview(timerView!)
        let length = view.bounds.width * 0.8
        timerView?.centerInSuperview(size: CGSize(width: length, height: length))
    }
    
    func setupNotes() {
        notesView = NotesView(notes: exercise?.notes ?? "")
        view.addSubview(notesView!)
        let length = view.bounds.width * 0.8
        notesView?.centerInSuperview(size: CGSize(width: length, height: length))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if type == .timer {
            timerView?.startTimer()
        }
    }
    
    @objc private func dismissViewController() {
        if type == .timer {
            timerView?.stopTimer()
        }
        
        if type == .notes {
            let notes = notesView?.currentNotes() ?? ""
            exercise?.notes = notes
            let updateAction = UpdateCurrentWorkoutCellAction(exercise: exercise)
            store.dispatch(updateAction)
            
            //Invalidate
            let invalidateAction = UpdateCurrentWorkoutCellAction(exercise: nil)
            store.dispatch(invalidateAction)
        }
        
        dismiss(animated: true)
    }
    
    deinit {
        unsubscribe()
        view.removeGestureRecognizer(tapGesture)
        print("Deinit")
    }
}
