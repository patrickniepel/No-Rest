//
//  WorkoutsViewController.swift
//  NoRest
//
//  Created by Patrick Niepel on 25.05.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class WorkoutsViewController: NRViewController {
    private lazy var workoutsView: WorkoutsView = .init()
    
    override func viewDidLoad() {
        viewControllerTitle = "workouts.title".localized
        super.viewDidLoad()
        
        setupAddButton()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.isHidden = false
        workoutsView.reloadTableViewContent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        titleLabel.isHidden = true
    }
    
    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: workoutsView, action: #selector(workoutsView.addNewWorkout))
        navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupView() {
        view.addSubview(workoutsView)
        workoutsView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}
