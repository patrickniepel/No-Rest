//
//  WorkoutSortingViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.02.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutSortingViewController: NRViewController {
    private lazy var workoutSortingView: WorkoutSortingView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribe()
        
        setupSaveButton()
        setupView()
    }
    
    private func setupSaveButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: workoutSortingView, action: #selector(workoutSortingView.saveExerciseTapped))
        navigationItem.rightBarButtonItem = saveButton
    }
    
    private func setupView() {
        view.addSubview(workoutSortingView)
        workoutSortingView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    func setupExerciseSorting(for workout: Workout?) {
        navigationItem.title = workout?.name
        workoutSortingView.setupExerciseSorting(for: workout)
    }
    
    deinit {
        unsubscribe()
    }
}
