//
//  ExerciseSelectionView.swift
//  NoRest
//
//  Created by Patrick Niepel on 07.06.20.
//  Copyright © 2020 Patrick Niepel. All rights reserved.
//

import UIKit

class ExerciseSelectionView: UIView {
    private lazy var tableView: NRTableView = .init()
    
    private let exercisesCtrl: ExercisesController
    private let exerciseSelectionCtrl: ExerciseSelectionController
    
    override init(frame: CGRect = CGRect()) {
        exercisesCtrl = ExercisesController()
        exerciseSelectionCtrl = ExerciseSelectionController()
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        subscribe()
        setupView()
        setupTableView()
    }
    
    private func setupView() {
        addSubview(tableView)
        tableView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tintColor = NRStyle.interactionColor
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 1))
        tableView.register(ExerciseSelectionTableViewCell.self, forCellReuseIdentifier: ExerciseSelectionTableViewCell.reuseIdentifier)
    }
    
    func updateView() {
        exercisesCtrl.updateExercises()
        exerciseSelectionCtrl.updateSelectedExercises()
        tableView.reloadData()
    }
    
    func selectedExercises() -> [Exercise] {
        return exerciseSelectionCtrl.selectedExercises
    }
    
    func preSelectExercises(_ exercises: [Exercise]?) {
        exerciseSelectionCtrl.selectedExercises = exercises ?? []
        tableView.reloadData()
    }
    
    deinit {
        unsubscribe()
    }
}

extension ExerciseSelectionView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return exercisesCtrl.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesCtrl.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseSelectionTableViewCell.reuseIdentifier, for: indexPath) as! ExerciseSelectionTableViewCell
        
        if let exercise = exercisesCtrl.exercise(for: indexPath) {
            cell.setup(with: exercise, accessoryType: .checkmark)
            if exerciseSelectionCtrl.selectedExercises.contains(exercise) {
                cell.accessoryType = .checkmark
            }
            else {
                cell.accessoryType = .none
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = ExerciseType.allCases[section].rawValue
        let headerView = NRTableViewSectionHeaderView(title: sectionTitle)
        return headerView
    }
}

extension ExerciseSelectionView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedExercise = exercisesCtrl.exercise(for: indexPath) else { return }
        exerciseSelectionCtrl.toggleSelectedExercise(selectedExercise)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}
