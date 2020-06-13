//
//  ExercisesViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 23.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExercisesViewController: NRViewController {
    private lazy var exercisesView: ExercisesView = .init()
    
    override func viewDidLoad() {
        viewControllerTitle = "exercises.title".localized
        super.viewDidLoad()
        
        setupAddButton()
        setupView()
        hideKeyboardWhenTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.isHidden = false
        exercisesView.reloadTableViewContent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        titleLabel.isHidden = true
    }
    
    private func setupAddButton() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: exercisesView, action: #selector(exercisesView.addNewExercise))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    private func setupView() {
        view.addSubview(exercisesView)
        
        exercisesView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}
