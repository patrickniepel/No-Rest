//
//  ExerciseSelectionViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseSelectionViewController: NRViewController {
    private lazy var exerciseSelectionView: ExerciseSelectionView = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        exerciseSelectionView.updateView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
        let selectedExercises = exerciseSelectionView.selectedExercises()
        let workoutExercisesAction = WorkoutExercisesAction(exercises: selectedExercises)
        store.dispatch(workoutExercisesAction)
    }
    
    private func setupView() {
        navigationItem.title = "exercise.selection.title".localized
        
        view.addSubview(exerciseSelectionView)
        exerciseSelectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}
