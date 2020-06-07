//
//  WorkoutSessionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSessionViewController: NRViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        setupBarButtons()
    }
    
    private func setupBarButtons() {
        let abortButton = UIBarButtonItem(title: "button.title.abort".localized, style: .plain, target: self, action: #selector(handleAbortTapped))
        navigationItem.leftBarButtonItem = abortButton
        
        let finishButton = UIBarButtonItem(title: "button.title.finish".localized, style: .plain, target: self, action: #selector(handleFinishTapped))
        navigationItem.rightBarButtonItem = finishButton
    }
    
    @objc
    private func handleAbortTapped() {
        showAlert(isFinishAlert: false) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc
    private func handleFinishTapped() {
        showAlert(isFinishAlert: false) { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
    }
    
    private func showAlert(isFinishAlert: Bool, confirmationHandler: (() -> Void)?) {
        let message: String
        let confirmationAction: UIAlertAction
        
        if isFinishAlert {
            message = "workout.session.finish.message".localized
            confirmationAction = UIAlertAction(title: "button.title.finish".localized, style: .default, handler: { action in
                confirmationHandler?()
            })
        } else {
            message = "workout.session.abort.message".localized
            confirmationAction = UIAlertAction(title: "button.title.abort".localized, style: .destructive, handler: { action in
                confirmationHandler?()
            })
        }
        
        let alert = UIAlertController(title: "alert.message.sure".localized, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "button.title.cancel".localized, style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(confirmationAction)
        
        self.present(alert, animated: true)
    }
    
    func setupWorkoutSession(_ workout: Workout) {
        let workoutSessionView = WorkoutSessionView(workout: workout)
        view.addSubview(workoutSessionView)
        workoutSessionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        
        navigationItem.title = workout.name
    }
    
    deinit {
        unsubscribe()
    }
}
